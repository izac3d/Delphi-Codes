unit frmInventory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, System.UITypes,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxDBLookupComboBox, StdCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxContainer, cxGroupBox, cxRadioGroup, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalc, cxCurrencyEdit, cxDBEdit, cxLookupEdit, cxDBLookupEdit, Menus,
  cxButtons, cxPC, cxButtonEdit, cxLabel, cxDBLabel, ExtCtrls, cxBlobEdit,
  cxMemo, cxPCdxBarPopupMenu, cxNavigator, dxSkinsCore, dxSkinLondonLiquidSky, dxSkinscxPCPainter, dxSpellChecker, dxBarBuiltInMenu,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter,
  dxSkinsdxRibbonPainter, dxPSCore, dxPScxDBEditorLnks, dxPSTextLnk,
  dxPSContainerLnk, dxPScxCommon;

type
  TBOMInventoryfrm = class(TForm)
    pcBOM: TcxPageControl;
    tsBOM: TcxTabSheet;
    tsEdit: TcxTabSheet;
    Label8: TLabel;
    gridBOMInventory: TcxGrid;
    vwInvBOM: TcxGridDBTableView;
    vwInvBOMPART_NUMBER: TcxGridDBColumn;
    vwInvBOMDESCRIPTION: TcxGridDBColumn;
    vwInvBOMPO_UNIT_PRICE: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Label7: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    cbInvShadow: TcxLookupComboBox;
    clcConversion: TcxDBCalcEdit;
    Label1: TLabel;
    cxDBLabel2: TcxDBLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblConversion: TLabel;
    vwInvBOMPriceBOM: TcxGridDBColumn;
    vwInvBOMUOM_BOM: TcxGridDBColumn;
    cxDBMemo1: TcxDBMemo;
    cxDBLabel1: TcxDBLabel;
    Bevel2: TBevel;
    edtUOMBOM: TcxDBTextEdit;
    cxDBMemo2: TcxDBMemo;
    tsHistory: TcxTabSheet;
    grdHistory: TcxGrid;
    vwInvHistory: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    vwInvHistoryColumn1: TcxGridDBColumn;
    vwInvHistoryColumn2: TcxGridDBColumn;
    cxDBLabel4: TcxDBLabel;
    vwInvHistoryColumn3: TcxGridDBColumn;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    btnAdjustPrice: TcxButton;
    cxButton1: TcxButton;
    btnSave: TcxButton;
    btnDelete: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    Bevel3: TBevel;
    cxDBRadioGroup1: TcxDBRadioGroup;
    cxButton4: TcxButton;
    btnSingleBom: TcxButton;
    btnAllBom: TcxButton;
    vwInvBOMColumn1: TcxGridDBColumn;
    cxButton5: TcxButton;
    ComponentPrinter: TdxComponentPrinter;
    btnPrint: TcxButton;
    PopupMenu1: TPopupMenu;
    ComponentPrinterEdit: TdxCustomContainerReportLink;
    BOM1: TMenuItem;
    Edit1: TMenuItem;
    History1: TMenuItem;
    ComponentPrinterBOM: TdxGridReportLink;
    ComponentPrinterHistory: TdxGridReportLink;
    procedure btnSaveClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure clcConversionPropertiesEditValueChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnAdjustPriceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure btnSingleBomClick(Sender: TObject);
    procedure BOM1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure History1Click(Sender: TObject);
  private
    procedure calc_price_bom;
  public
    { Public declarations }
  end;

var
  BOMInventoryfrm: TBOMInventoryfrm;

implementation

uses dmCosting, myFunc;

{$R *.dfm}

procedure TBOMInventoryfrm.btnDeleteClick(Sender: TObject);
begin
  with CostingDM do begin
    if pcBOM.ActivePage = tsHistory then begin
      if messagebox(handle, 'Delete current record from history table ?','Delete', mb_yesno+mb_iconquestion) <> idyes then exit;
      tblInvShadowArch.Delete;
    end
    else begin
      if messagebox(handle, 'Delete current record from shadow table ?','Delete', mb_yesno+mb_iconquestion) <> idyes then exit;
      tblInvShadow.Delete;
    end;

  end;

end;

procedure TBOMInventoryfrm.btnSaveClick(Sender: TObject);
begin
  with CostingDM do begin
    if tblInvShadow.State in dseditmodes then
      tblInvShadow.Post;

  end;
end;

procedure TBOMInventoryfrm.calc_price_bom;
begin
  with CostingDM do begin
   // if not (tblInvShadow.State = dsedit) then exit;

    case cxDBRadioGroup1.ItemIndex of
      0: begin
           tblInvShadow.FieldByName('PRICE_BOM').AsSingle :=
           tblInvShadow.FieldByName('PO_UNIT_PRICE').AsSingle * tblInvShadow.FieldByName('UOM_CONVERSION').AsSingle;
           lblConversion.Caption := FloatToStr(clcConversion.Value) + ' ' + tblInvShadow.FieldByName('UOM_INV').AsString
                                      +  ' = ' + '1 ' + ' '
                                      + tblInvShadow.FieldByName('UOM_BOM').AsString ;
         end;
      1: begin
           tblInvShadow.FieldByName('PRICE_BOM').AsSingle :=
           tblInvShadow.FieldByName('PO_UNIT_PRICE').AsSingle / tblInvShadow.FieldByName('UOM_CONVERSION').AsSingle;
           lblConversion.Caption := '1 ' +  tblInvShadow.FieldByName('UOM_INV').AsString
                                      +  ' = ' + FloatToStr(clcConversion.Value) + ' '
                                      + tblInvShadow.FieldByName('UOM_BOM').AsString ;
         end;
      end;

  end;
end;

procedure TBOMInventoryfrm.clcConversionPropertiesEditValueChanged(
  Sender: TObject);
begin
  with CostingDM do begin
    if (clcConversion.Value = 0) and (cxDBRadioGroup1.ItemIndex = 1) then begin
      tblInvShadow.Cancel;
      raise exception.Create('Can not divide by zero');
    end;

    //calc_price_bom;
  end;

end;

procedure TBOMInventoryfrm.cxButton1Click(Sender: TObject);
begin
  with CostingDM do begin
    tblInvShadow.Cancel;
  end;
end;

procedure TBOMInventoryfrm.cxButton2Click(Sender: TObject);
begin
  close;
end;

procedure TBOMInventoryfrm.cxButton3Click(Sender: TObject);
begin
  with CostingDM do begin
    tblInvShadow.Append;
  end;
end;

procedure TBOMInventoryfrm.cxButton4Click(Sender: TObject);
begin
  winexec('calc.exe', sw_normal);
end;

procedure TBOMInventoryfrm.Edit1Click(Sender: TObject);
begin
  ComponentPrinter.Preview(true, ComponentPrinterEdit);
end;

procedure TBOMInventoryfrm.btnSingleBomClick(Sender: TObject);
begin

  with CostingDM do begin

    if (sender as tcxbutton).Name = 'btnSingleBom' then begin

      if messagedlg('Update SINGLE BOM Base Cost ?', mtConfirmation, [mbYes, mbNo], 0, mbNo) <> mryes then exit;

      ExecSQL.SQL.Text := 'Update BOM set BASE_COST = :pPRICE_BOM where INV_SHADOW_ID = :pINV_SHADOW_ID';

      ExecSQL.ParamByName('pPRICE_BOM').AsCurrency := tblInvShadow.FieldByName('PRICE_BOM').AsCurrency;
      ExecSQL.ParamByName('pINV_SHADOW_ID').AsInteger := tblInvShadow.FieldByName('INV_SHADOW_ID').AsInteger;
    end
    else if (sender as tcxbutton).Name = 'btnAllBom' then begin
      if messagedlg('Update ALL BOM Base Cost ?', mtConfirmation, [mbYes, mbNo], 0, mbNo) <> mryes then exit;

      ExecSQL.SQL.Text := ' Update BOM b1 set'
        +' BASE_COST = (select PRICE_BOM from inv_shadow i2 where i2.inv_shadow_id = b1.inv_shadow_id)'
        +' where exists (select 1 from inv_shadow i2 where i2.inv_shadow_id = b1.inv_shadow_id)';
    end;

    ExecSQL.Execute;

    TransRead.CommitRetaining;
    tblBOM.Refresh;

    messagedlg('Prices updated', mtInformation, [mbok], 0, mbok);

  end;
end;

procedure TBOMInventoryfrm.BOM1Click(Sender: TObject);
begin
  ComponentPrinter.Preview(true, ComponentPrinterBOM);
end;

procedure TBOMInventoryfrm.btnAdjustPriceClick(Sender: TObject);
begin
  calc_price_bom;
end;

procedure TBOMInventoryfrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GridSettings(self, 'costing', true);

end;

procedure TBOMInventoryfrm.FormCreate(Sender: TObject);
begin
  GridSettings(self, 'costing', false);

  try
    pcBOM.ActivePageIndex := 0;
    cbInvShadow.ItemIndex := 0;
  except
  end;
end;

procedure TBOMInventoryfrm.FormDestroy(Sender: TObject);
begin
  //BOMInventoryfrm := nil;
end;

procedure TBOMInventoryfrm.History1Click(Sender: TObject);
begin
  ComponentPrinter.Preview(true, ComponentPrinterHistory);
end;

end.
