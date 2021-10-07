unit frmBOM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, system.UITypes,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Menus, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxBlobEdit, cxDropDownEdit, cxCurrencyEdit, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPScxEditorProducers, cxGridExportLink,
  dxPScxExtEditorProducers, dxPScxPageControlProducer, dxPSCore, dxPScxCommon, StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxButtons, cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox,
  ExtCtrls, cxSplitter, cxNavigator, dxPSPDFExportCore, dxPSPDFExport, dxPSPrVwRibbon, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxSkinsCore, dxSkinLondonLiquidSky, dxSkinscxPCPainter,
  dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, dxSpellChecker, cxLabel,
  cxDBLabel;

type
  TBOMfrm = class(TForm)
    PopupMenu1: TPopupMenu;
    CopyAll: TMenuItem;
    PasteSeries1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    dxComponentPrinter1: TdxComponentPrinter;
    BOMPrinterLink: TdxGridReportLink;
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    cbSeries: TcxLookupComboBox;
    cbModel: TcxLookupComboBox;
    cbColor: TcxLookupComboBox;
    btnFilter: TcxButton;
    cbNailfin: TcxLookupComboBox;
    btnTools: TcxButton;
    btnClose: TcxButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGroupBox1: TcxGroupBox;
    btnAdd: TcxButton;
    gridInvShadow: TcxGrid;
    vwInvShadow: TcxGridDBTableView;
    vwInvShadowINV_SHADOW_ID: TcxGridDBColumn;
    vwInvShadowPART_NUMBER: TcxGridDBColumn;
    vwInvShadowDESCRIPTION: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGroupBox3: TcxGroupBox;
    gridBOM: TcxGrid;
    viewBOM: TcxGridDBTableView;
    viewBOMBOM_ID: TcxGridDBColumn;
    viewBOMBOM_NAME: TcxGridDBColumn;
    viewBOMBOM_DESCRIPTION: TcxGridDBColumn;
    viewBOMSERIES_NAME: TcxGridDBColumn;
    viewBOMMODEL_NAME: TcxGridDBColumn;
    viewBOMCOLOR_NAME: TcxGridDBColumn;
    viewBOMNAILFIN_NAME: TcxGridDBColumn;
    viewBOMSERIES_ID: TcxGridDBColumn;
    viewBOMMODEL_ID: TcxGridDBColumn;
    viewBOMCOLOR_ID: TcxGridDBColumn;
    viewBOMNAILFIN_ID: TcxGridDBColumn;
    viewBOMSUBASSEMBLY: TcxGridDBColumn;
    viewBOMBCT_ID: TcxGridDBColumn;
    viewBOMPART_NUMBER: TcxGridDBColumn;
    viewBOMDESCRIPTION: TcxGridDBColumn;
    viewBOMINV_SHADOW_ID: TcxGridDBColumn;
    viewBOMQUANTITY: TcxGridDBColumn;
    viewBOMDIMENSION_TYPE: TcxGridDBColumn;
    viewBOMWIDTH_DIVISOR: TcxGridDBColumn;
    viewBOMWIDTH_DEDUCT: TcxGridDBColumn;
    viewBOMHEIGHT_DIVISOR: TcxGridDBColumn;
    viewBOMHEIGHT_DEDUCT: TcxGridDBColumn;
    viewBOMWASTE: TcxGridDBColumn;
    viewBOMBASE_COST: TcxGridDBColumn;
    viewBOMSELECTED_COPY: TcxGridDBColumn;
    viewBOMWIN_COST: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    viewBOMWORKCELL_TYPE_ID: TcxGridDBColumn;
    dxSpellChecker1: TdxSpellChecker;
    btnXLSExport: TcxButton;
    cxDBLabel1: TcxDBLabel;
    Label4: TLabel;
    btnUpdatePrices: TcxButton;
    CopySelected: TMenuItem;
    procedure cbSeriesPropertiesEditValueChanged(Sender: TObject);
    procedure SetFilter1Click(Sender: TObject);
    procedure CopyAllClick(Sender: TObject);
    procedure PasteSeries1Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnXLSExportClick(Sender: TObject);
    procedure btnUpdatePricesClick(Sender: TObject);
  private
    old_SM_ID, old_SC_ID, old_SNF_ID: integer;

  public
    { Public declarations }
  end;

var
  BOMfrm: TBOMfrm;

implementation

uses dmCosting, frmInventory, DMReports, myFunc;

{$R *.dfm}

procedure TBOMfrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TBOMfrm.btnUpdatePricesClick(Sender: TObject);
begin
  with CostingDM do begin
    if messagedlg('Update pricing ?', mtConfirmation, [mbYes, mbNo],0) <> mryes then exit;

    mStoredProc.StoredProcName := 'NATIVE_BOM_UPDATE_PRICING';
    mStoredProc.PrepareSQL(false);
    mStoredProc.ParamByName('P_SC_ID').AsInteger := cbColor.EditValue;
    mStoredProc.ParamByName('P_SNF_ID').AsInteger := cbNailfin.EditValue;
    mStoredProc.ParamByName('P_SM_ID').AsInteger := cbModel.EditValue;

    mStoredProc.ExecProc;
    TransRead.CommitRetaining;

    tblPricing.DisableControls;
    tblPricing.Refresh;
    tblPricing.EnableControls;
  end;
end;

procedure TBOMfrm.btnXLSExportClick(Sender: TObject);
var
export_dir: string;
begin
  with CostingDM do begin
    if LoggedUser.UGroup * [APP_UG_SUPER_USERS, APP_UG_ADMINS] = [] then
      raise Exception.Create('You dont have permission for this feature');

  end;

  export_dir := 'c:\costing export\';
  SysUtils.ForceDirectories(export_dir);

  ExportGridToXLSX(export_dir+gridBOM.Name, gridBOM, true, true, true, 'xlsx');

end;

procedure TBOMfrm.cbSeriesPropertiesEditValueChanged(Sender: TObject);
begin
  try
    cbColor.ItemIndex := 0;
    cbModel.ItemIndex := 0;
    cbNailfin.ItemIndex := 0;
  except
  end;
end;

procedure TBOMfrm.CopyAllClick(Sender: TObject);
begin
  if (cbModel.EditText = '') or (cbColor.EditText = '') then
    raise exception.Create('Model and Color must have a value');

  with CostingDM do begin
    ExecSQL.SQL.Text := 'Update BOM set SELECTED_COPY = 0';
    ExecSQL.Execute;

    MainSQL.Close;
    if sender = CopyAll then begin
      MainSQL.SQL.Text := 'update BOM set SELECTED_COPY = 1 where (SM_ID = :SM_ID) AND (SC_ID = :SC_ID) AND (SNF_ID = :SNF_ID)';
      MainSQL.ParamByName('SM_ID').AsInteger := cbModel.EditValue;
      MainSQL.ParamByName('SC_ID').AsInteger := cbColor.EditValue;
      MainSQL.ParamByName('SNF_ID').AsInteger := cbNailfin.EditValue;
    end
    else if sender = CopySelected then begin
      MainSQL.SQL.Text := 'update BOM set SELECTED_COPY = 1 where (BOM_ID = :pBOM_ID)';
      MainSQL.ParamByName('pBOM_ID').AsInteger := tblBOM.FieldByName('BOM_ID').AsInteger;
    end;
    MainSQL.ExecSQL;

    if MainSQL.RowsAffected = 0 then begin
      btnTools.Caption := 'Copy [0]';
      exit;
    end;

    old_SM_ID := cbModel.EditValue;
    old_SC_ID := cbColor.EditValue;
    old_SNF_ID := cbNailfin.EditValue;

    btnTools.Caption := 'Paste ['+inttostr(MainSQL.RowsAffected)+']';
    PasteSeries1.Enabled := true;

  end;
end;

procedure TBOMfrm.cxButton1Click(Sender: TObject);
var
series, model, color, nailfin: string;
begin
  series := cbSeries.Text;
  model := cbModel.Text;
  color := cbColor.Text;
  nailfin := cbNailfin.Text;

  BOMPrinterLink.ReportTitle.Text := series +'  '+ model +'  '+ color +'  '+nailfin;
  dxComponentPrinter1.Preview(true, BOMPrinterLink);

  with CostingDM, ReportsDM do begin
    {RepSQL.Close;
    RepSQL.SQL.Clear;
    RepSQL.SQL.Add('select * from vw_window left outer join locations_stock on (vw_window.location_id = locations_stock.location_id)');
    RepSQL.SQL.Add('left outer join so_quote_hdr on (vw_window.quote_id = so_quote_hdr.quote_id)');
    RepSQL.SQL.Add(' where (vw_window.QUOTE_ID = :qid) order by QUOTE_WIN_ID');
    RepSQL.ParamByName('qid').AsInteger := tblQuotes.FieldByName('QUOTE_ID').AsInteger;
    RepSQL.Open;

    SubRepSQL.Close;
    SubRepSQL.SQL.Clear;
    SubRepSQL.SQL.Add('select * from accessory right outer join quote_accessory on (accessory.accessory_id = quote_accessory.accessory_id) ');
    SubRepSQL.SQL.Add(' left outer join locations_stock on (quote_accessory.location_id = locations_stock.location_id)');
    SubRepSQL.SQL.Add(' where QUOTE_ID = :qid order by QACCESS_ID');
    SubRepSQL.ParamByName('qid').AsInteger := tblQuotes.FieldByName('QUOTE_ID').AsInteger;
    SubRepSQL.Open;

    //============ Preview
    frdsMain.FieldAliases.Clear;
    frdsMain.DataSet := CostingDM.tblBOM;

    //ship_zip := frxReport.FindObject('mmZip') as TfrxMemoView;
    //ship_zip.Text := tblQuotes.FieldByName('').AsString

    lsReportFile := 'bom.fr3';
    frxReport.LoadFromFile(FRepDirPath + lsReportFile);
    frxReport.ShowReport(true);}
  end;
end;

procedure TBOMfrm.cxButton2Click(Sender: TObject);
begin
  BOMInventoryfrm := TBOMInventoryfrm.Create(self);
  BOMInventoryfrm.Show;
end;

procedure TBOMfrm.btnAddClick(Sender: TObject);
begin
  with CostingDM do begin
    if (cbModel.EditText = '') or (cbColor.EditText = '') then
      raise exception.Create('Model and Color must have a value');

    tblBOM.Append;
    tblBOM.FieldByName('BASE_COST').AsSingle := tblInvShadow.FieldByName('PRICE_BOM').AsSingle;
    tblBOM.FieldByName('INV_SHADOW_ID').AsInteger := tblInvShadow.FieldByName('INV_SHADOW_ID').AsInteger;
    tblBOM.FieldByName('SM_ID').AsInteger := cbModel.EditValue;
    tblBOM.FieldByName('SC_ID').AsInteger := cbColor.EditValue;
    tblBOM.FieldByName('SNF_ID').AsInteger := cbNailfin.EditValue;

    tblBOM.Post;
    tblBOM.RefreshRecord; //to display lookup values
  end;
end;

procedure TBOMfrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GridSettings(self, 'costing', true);
end;

procedure TBOMfrm.FormCreate(Sender: TObject);
begin
  GridSettings(self, 'costing', false);

  try
    cbSeries.ItemIndex := 0;
    cbModel.ItemIndex := 0;
    cbColor.ItemIndex := 0;
  except
  end;
end;

procedure TBOMfrm.PasteSeries1Click(Sender: TObject);
begin

  if (cbModel.EditText = '') or (cbColor.EditText = '') then
    raise exception.Create('Model and Color must have a value');

  with CostingDM do begin

    if (old_SM_ID = cbModel.EditValue) AND (old_SC_ID = cbColor.EditValue) And (old_SNF_ID = cbNailfin.EditValue) then
      raise Exception.Create('Can not paste into same series/model/color/nailfin');

    ExecSQL.SQL.Text := 'INSERT INTO BOM (SM_ID, SC_ID, SNF_ID, BOM_NAME, BOM_DESCRIPTION, SUBASSEMBLY, WORKCELL_TYPE_ID, '
      + 'INV_SHADOW_ID, QUANTITY, WIDTH_DEDUCT, WIDTH_DIVISOR, HEIGHT_DEDUCT, HEIGHT_DIVISOR, BCT_ID, DIMENSION_TYPE, WASTE, BASE_COST) '
      + 'Select :SM_ID, :SC_ID, :SNF_ID, BOM_NAME, BOM_DESCRIPTION, SUBASSEMBLY, WORKCELL_TYPE_ID, INV_SHADOW_ID, QUANTITY, '
      + 'WIDTH_DEDUCT, WIDTH_DIVISOR, HEIGHT_DEDUCT, HEIGHT_DIVISOR, BCT_ID, DIMENSION_TYPE, WASTE, BASE_COST '
      + 'From BOM Where SELECTED_COPY = 1';

    ExecSQL.ParamByName('SM_ID').AsInteger := cbModel.EditValue;
    ExecSQL.ParamByName('SC_ID').AsInteger := cbColor.EditValue;
    ExecSQL.ParamByName('SNF_ID').AsInteger := cbNailfin.EditValue;

    ExecSQL.Execute;

    TransRead.CommitRetaining;
    PasteSeries1.Enabled := false;
    btnTools.Caption := 'Copy >';
    tblBOM.Refresh;
  end;

end;

procedure TBOMfrm.SetFilter1Click(Sender: TObject);
//var
//AItemList: TcxFilterCriteriaItemList;
Begin
  with viewBOM do begin
    DataController.Filter.BeginUpdate;
    try
      DataController.Filter.Root.Clear;
      DataController.Filter.Root.AddItem(viewBOMSERIES_NAME, foEqual, cbSeries.Text, cbSeries.Text);
      DataController.Filter.Root.AddItem(viewBOMMODEL_NAME, foEqual, cbModel.Text, cbModel.Text);
      DataController.Filter.Root.AddItem(viewBOMCOLOR_NAME, foEqual, cbColor.Text, cbColor.Text);
      DataController.Filter.Root.AddItem(viewBOMNAILFIN_NAME, foEqual, cbNailfin.Text, cbNailfin.Text);

      {AItemList := DataController.Filter.Root.AddItemList(fboAND);
      AItemList.AddItem(viewBOMMODEL_NAME, foEqual, cbModel.Text, cbModel.Text);
      AItemList.AddItem(viewBOMCOLOR_NAME, foEqual, cbColor.Text, cbColor.Text);}
    finally
      DataController.Filter.EndUpdate;
      DataController.Filter.Active := true;
    end;
  end;
end;

end.
