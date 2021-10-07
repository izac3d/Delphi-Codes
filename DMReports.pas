unit DMReports;

interface

uses
  SysUtils, Classes, DB, frxClass, MemDS, DBAccess, IBC, frxDBSet, frxRich, frxChBox, frxExportMail, frxGradient, frxBarcode,
  dxmdaset, frxExportImage, frxExportXLS, frxExportPDF, Dialogs;

type
  TReportsDM = class(TDataModule)
    frxReport: TfrxReport;
    frdsMain: TfrxDBDataset;
    RepSQL: TIBCQuery;
    RepSet: TIBCQuery;
    frdsRepSet: TfrxDBDataset;
    frxRichObject1: TfrxRichObject;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    dsRepSet: TDataSource;
    SubRepSQL: TIBCQuery;
    frdsSubRep: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxJPEGExport1: TfrxJPEGExport;
    MemData: TdxMemData;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxGradientObject1: TfrxGradientObject;
    frxMailExport1: TfrxMailExport;
    dsRepSQL: TDataSource;
    RepHF: TIBCQuery;
    frdsRepHF: TfrxDBDataset;
    SubRepSQL2: TIBCQuery;
    frdsSubRep2: TfrxDBDataset;
  private
    { Private declarations }
  public
    procedure print_quote(rep: integer);
    Procedure print_quote_cover;

    Procedure Print_prod_labels(rep, nSkip, model_type_id: integer);
    Procedure print_cities(p_date_from, p_date_to: tdate);
  end;

var
  ReportsDM: TReportsDM;

implementation

uses dmCosting;

{$R *.dfm}

{ TReportsDM }

procedure TReportsDM.print_cities(p_date_from, p_date_to: tdate);
var
mDateFrom, mDateTo: TfrxMemoView;
begin
  with CostingDM do begin
    RepSQL.Close;
    RepSQL.SQL.Text := 'select so_quote_hdr.quote_id, so_quote_hdr.quote_no, so_quote_hdr.phase_id, so_quote_hdr.tract_id, so_quote_hdr.customer_id,'
      +' customers.cust_name, tract.zipntax_id, tract.tract_name, zipntax.zipcode, zipntax.city, zipntax.state, tract.tract_id, tract_phase.phase_name,'
      +' tract.tract_type_id, tract_type.tract_type, so_quote_hdr.order_date from so_quote_hdr'
      +' left outer join customers on (so_quote_hdr.customer_id = customers.customer_id)'
      +' left outer join tract on (so_quote_hdr.tract_id = tract.tract_id)'
      +' left outer join zipntax on (tract.zipntax_id = zipntax.zipntax_id)'
      +' left outer join tract_phase on (tract.tract_id = tract_phase.tract_id)'
      +' left outer join tract_type on (tract.tract_type_id = tract_type.tract_type_id)'

      +' where (so_quote_hdr.is_tract = 1) And (so_quote_hdr.quote_status = 1)'
      +' And (so_quote_hdr.order_date between :date_from and :date_to)';


    RepSQL.ParamByName('date_from').AsDate := p_date_from;
    RepSQL.ParamByName('date_to').AsDate := p_date_to;

    RepSQL.Open;

    //==================================== Preview
    frdsMain.FieldAliases.Clear;
    frdsMain.DataSet := RepSQL;

    lsReportFile := 'cities.fr3';
    frxReport.LoadFromFile(FRepDirPath + lsReportFile);

    mDateFrom := frxReport.FindObject('mDateFrom') as TfrxMemoView;
    mDateFrom.Text := datetostr(p_date_from);

    mDateTo:= frxReport.FindObject('mDateTo') as TfrxMemoView;
    mDateTo.Text := datetostr(p_date_to);

    frxReport.ShowReport(true);
  end;

end;

procedure TReportsDM.Print_prod_labels(rep, nSkip, model_type_id: integer);
var
p_job_batch_id: string;
begin
  with CostingDM do begin
    p_job_batch_id := inttostr(tblJobBatches.FieldByName('job_batch_id').AsInteger);

    RepSQL.Close;
    RepSQL.SQL.Text := 'select * from VW_REP_WIN_SERIALS';
    RepSQL.SQL.Add('where (job_batch_id = '+p_job_batch_id+')');

    if rep = 3 then
      RepSQL.SQL.Add(' And (model_type_id = '+inttostr(model_type_id)+')');

    //RepSQL.SQL.Add('Order by (win_width * win_height) desc, quote_no');
    RepSQL.SQL.Add('Order by bin_no');
    RepSQL.Open;

    if (RepSQL.IsEmpty) then raise Exception.Create('No data to print');

    //==================================== Preview
    frdsMain.FieldAliases.Clear;
    frdsMain.DataSet := RepSQL;

    case rep of
      0: lsReportFile := 'lbl_win_serial_zibra_3_1.fr3';
      1: lsReportFile := 'lbl_win_serial_zibra_4_1.fr3';
      2: lsReportFile := 'lbl_XPanel_laser_Avery6466.fr3';
      3: lsReportFile := 'lbl_win_serial_laser_Avery8163.fr3';
      4: lsReportFile := 'lbl_win_serial_zebra_4_2.fr3';

    end;

    frxReport.LoadFromFile(FRepDirPath + lsReportFile);

    if pos('laser', lsReportFile) > 0 then
      frxReport.Script.Variables['native_skip_n'] := nSkip;

    {frPage := TfrxReportPage(frxReport.Pages[1]);
    frPage.PaperSize := DMPAPER_USER;
    frPage.PaperWidth := 101.6;
    //frPage.PaperHeight := 1;}

    frxReport.ShowReport(true);

  end;

end;

procedure TReportsDM.print_quote(rep: integer);
begin
  //0 = normal quote // 1 = shipper w/o prices
  //desc1, desc2: TfrxMemoView;

  with CostingDM do begin

    //set header and footer data
    RepHF.Close;
    RepHF.SQL.Text := 'select customers.cust_name, customers.bill_phone, customers.bill_fax, so_quote_hdr.ship_note,'
      +' so_quote_hdr.ship_address_1, so_quote_hdr.ship_address_2, zipntax.zipcode, zipntax.city,'
      +' so_quote_hdr.quote_no, so_quote_hdr.prod_cost, so_quote_hdr.j_disc, so_quote_hdr.sales_tax,'
      +' so_quote_hdr.delivery_cost, so_quote_hdr.job_name, so_quote_hdr.quote_date from zipntax'
      +' inner join so_quote_hdr on (zipntax.zipntax_id = so_quote_hdr.ship_zipntax_id)'
      +' inner join customers on (so_quote_hdr.customer_id = customers.customer_id)'
      +' where so_quote_hdr.QUOTE_ID = :qid';

    RepHF.ParamByName('qid').AsInteger := tblQuotes.FieldByName('QUOTE_ID').AsInteger;
    RepHF.Open;

    //-----------------------------------------------------------------------------------------------------------------
    //get windows data
    RepSQL.Close;
    RepSQL.SQL.Text := 'select * from vw_window';

    if rep = 2 then begin //special window
      RepSQL.SQL.Add(' where (vw_window.QUOTE_ID = :qid) And (vw_window.quote_win_id = :wid) order by QUOTE_WIN_ID');
      RepSQL.ParamByName('wid').AsInteger := tblWindows.FieldByName('quote_win_id').AsInteger;
    end
    else
      RepSQL.SQL.Add(' where (vw_window.QUOTE_ID = :qid) order by QUOTE_WIN_ID');

    RepSQL.ParamByName('qid').AsInteger := tblQuotes.FieldByName('QUOTE_ID').AsInteger;

    if not (tblwindows.IsEmpty) then
      RepSQL.Open;

    //------------------------------------------------------------------------------------------------------
    SubRepSQL.Close;
    SubRepSQL.SQL.Clear;
    SubRepSQL.SQL.Text := 'select quote_accessory.acc_ns_width, quote_accessory.acc_ns_height, quote_accessory.notes,'
      +' quote_accessory.quantity, quote_accessory.price, accessory.acc_sku, accessory.acc_name, accessory.acc_description,'
      +' accessory.quantity acc_quantity, locations_stock.locations_name from locations_stock'
      +' inner join accessory on (locations_stock.location_id = accessory.location_id)'
      +' right outer join quote_accessory on (accessory.accessory_id = quote_accessory.accessory_id)'
      +' where quote_accessory.quote_id = :qid order by accessory.ACCESSORY_ID';

    SubRepSQL.ParamByName('qid').AsInteger := tblQuotes.FieldByName('QUOTE_ID').AsInteger;

    if not (tblQAccessories.IsEmpty) then
      SubRepSQL.Open;

    if (tblwindows.IsEmpty) and (tblQAccessories.IsEmpty) then raise Exception.Create('This quote is empty');

    //----------------------------------------------------------------------------------------------------------
    // Mull Info
    SubRepSQL2.Close;
    SubRepSQL2.SQL.Clear;

    if ((rep = 0) or (rep = 1)) and not (tblwindows.IsEmpty) then begin //Quotes report quotes.fr3 OR Shipper ShipQuotes.fr3
      SubRepSQL2.SQL.Text := 'select * from VW_MULL Where (quote_win_id = :quote_win_id)';
      SubRepSQL2.MasterSource := dsRepSQL;
      SubRepSQL2.Open;
    end;

    //==================================== Preview
    frdsMain.FieldAliases.Clear;
    frdsMain.DataSet := RepSQL;

    frdsSubRep.FieldAliases.Clear;
    frdsSubRep.DataSet := SubRepSQL;

    frdsSubRep2.FieldAliases.Clear;
    frdsSubRep2.DataSet := SubRepSQL2;

    case rep of
      0: lsReportFile := 'quotes.fr3';
      1: lsReportFile := 'ShipQuotes.fr3';
      2: lsReportFile := 'SpecialWindow.fr3';
    end;

    try
      frxReport.LoadFromFile(FRepDirPath + lsReportFile);
      frxReport.ShowReport(true);

    finally
      SubRepSQL2.MasterSource := nil;
    end;

   //TfrxMasterData(frxReport.FindObject('MasterData1')).DataSet.Clear;
   //TfrxMemoView(frxReport.FindObject('mCustName')).Text := MainSQL.FieldByName('cust_name').AsString;

  end;

end;

procedure TReportsDM.print_quote_cover;
var
mmuser: TfrxMemoView;
begin

  with CostingDM do begin

    RepSQL.Close;
    RepSQL.SQL.Clear;
    RepSQL.SQL.Add('select * from VW_WINDOW where QUOTE_ID = :qid order by QUOTE_WIN_ID');
    RepSQL.ParamByName('qid').AsInteger := tblQuotes.FieldByName('QUOTE_ID').AsInteger;
    RepSQL.Open;

    if RepSQL.IsEmpty then raise Exception.Create('No windows exists for that quote');
    //==================== Preview
    frdsMain.FieldAliases.Clear;
    frdsMain.DataSet := RepSQL;

    lsReportFile := 'qcover.fr3';
    frxReport.LoadFromFile(FRepDirPath + lsReportFile);
    mmuser := frxReport.FindObject('mmuser') as TfrxMemoView;
    mmuser.Text := WIN_USERNAME;

    frxReport.ShowReport(true);

  end;

end;

end.
