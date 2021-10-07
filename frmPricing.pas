unit frmPricing;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Menus, cxButtons, ExtCtrls,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, cxGridExportLink,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,  dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, cxCheckBox, cxGroupBox, cxCurrencyEdit, cxNavigator, dxPSPDFExportCore, dxPSPDFExport, dxPSPrVwRibbon, dxPScxGridLnk, dxPScxGridLayoutViewLnk, cxPropertiesStore,
  dxSkinsCore, dxSkinLondonLiquidSky, dxSkinscxPCPainter, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, dxSpellChecker,
  cxLabel, cxDBLabel;

type
  TPricingfrm = class(TForm)
    gridPricing: TcxGrid;
    vwPricing: TcxGridDBTableView;
    glvlPricing: TcxGridLevel;
    vwPricingPRICING_ID: TcxGridDBColumn;
    vwPricingSM_ID: TcxGridDBColumn;
    vwPricingSC_ID: TcxGridDBColumn;
    vwPricingSNF_ID: TcxGridDBColumn;
    vwPricingFRAME_HORIZ: TcxGridDBColumn;
    vwPricingFRAME_VERT: TcxGridDBColumn;
    vwPricingFRAME_PARTS: TcxGridDBColumn;
    vwPricingFRAME_LABOR_RATE: TcxGridDBColumn;
    vwPricingFRAME_MIN_LABOR: TcxGridDBColumn;
    vwPricingMULTIPLIER_1: TcxGridDBColumn;
    vwPricingMULTIPLIER_2: TcxGridDBColumn;
    vwPricingSERIES_DESCRIPTION: TcxGridDBColumn;
    vwPricingSERIES_NAME: TcxGridDBColumn;
    vwPricingSERIES_ID: TcxGridDBColumn;
    dxComponentPrinter1: TdxComponentPrinter;
    PricingPrinterLink: TdxGridReportLink;
    grpOptions: TcxGroupBox;
    Label1: TLabel;
    luSeries: TcxLookupComboBox;
    luSModels: TcxLookupComboBox;
    luSNailfin: TcxLookupComboBox;
    luSColor: TcxLookupComboBox;
    cbSModels: TcxCheckBox;
    cbSColor: TcxCheckBox;
    cbSNailfin: TcxCheckBox;
    cxButton6: TcxButton;
    btnCopy: TcxButton;
    cxButton1: TcxButton;
    btnClose: TcxButton;
    vwPricingINSTALL_COST_FACTOR: TcxGridDBColumn;
    vwPricingNFS_COST: TcxGridDBColumn;
    dxSpellChecker1: TdxSpellChecker;
    btnXLSExport: TcxButton;
    procedure Button2Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton6Click(Sender: TObject);
    procedure luSeriesPropertiesEditValueChanged(Sender: TObject);
    procedure cbModelsPropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnXLSExportClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  Pricingfrm: TPricingfrm;

implementation

uses dmCosting, cxVariants, cxLookupDBGrid, strutils, myFunc;

{$R *.dfm}

procedure TPricingfrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TPricingfrm.btnXLSExportClick(Sender: TObject);
var
export_dir: string;
begin
  with CostingDM do begin
    if LoggedUser.UGroup * [APP_UG_SUPER_USERS, APP_UG_ADMINS] = [] then
      raise Exception.Create('You dont have permission for this feature');

  end;

  export_dir := 'c:\costing export\';
  SysUtils.ForceDirectories(export_dir);

  ExportGridToXLSX(export_dir+gridPricing.Name, gridPricing, true, true, true, 'xlsx');
end;

procedure TPricingfrm.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TPricingfrm.cbModelsPropertiesEditValueChanged(Sender: TObject);
var
gen_lookup: TcxLookupComboBox;
begin
  gen_lookup := TcxLookupComboBox(grpOptions.FindChildControl('lu'+ copy((Sender as TcxCheckBox).Name, 3, 60)));

  if (Sender as TcxCheckBox).Checked then
    gen_lookup.Style.Color := clYellow
  else if (Sender as TcxCheckBox).Checked = false then
    gen_lookup.Style.Color := clWhite
end;

procedure TPricingfrm.cxButton1Click(Sender: TObject);
begin
  dxComponentPrinter1.Preview(true, PricingPrinterLink);
end;

procedure TPricingfrm.btnCopyClick(Sender: TObject);
begin
  if VarIsSoftNull(luSeries.EditValue) then raise Exception.Create('You must select a Series')
  else if cbSModels.Checked and VarIsSoftNull(luSModels.EditValue) then raise Exception.Create('You must select a Model')
  else if cbSColor.Checked and VarIsSoftNull(luSColor.EditValue) then raise Exception.Create('You must select a Color')
  else if cbSNailfin.Checked and VarIsSoftNull(luSNailfin.EditValue) then raise Exception.Create('You must select a Nailfin');
  {else if (not cbModels.Checked) and (not cbColors.Checked) and (not cbNailfin.Checked) then
    raise Exception.Create('You must select at least one option to copy');}

  with CostingDM do begin

    if tblPricing.IsEmpty then raise Exception.Create('Nothing to copy from !!!');

    ExecSQL.SQL.Text := 'Insert into PRICING (SM_ID, SC_ID, SNF_ID, IGUS, EDGES_HORIZ, EDGES_VERT,'
      +'GLASS_LABOR, FRAME_HORIZ, FRAME_VERT, FRAME_PARTS, FRAME_LABOR_RATE, FRAME_MIN_LABOR,'
      +'SCREENS, SCREEN_HORIZ, SCREEN_VERT, SCREEN_AREA_COST, SCREEN_AREA_FACTOR, SCREEN_PARTS, SCREEN_LABOR_RATE,'
      +'SCREEN_MIN_LABOR, MULTIPLIER_1, MULTIPLIER_2) '

      +' Select :pSM_ID, :pSC_ID, :pSNF_ID, IGUS, EDGES_HORIZ, EDGES_VERT,'
      +'GLASS_LABOR, FRAME_HORIZ, FRAME_VERT, FRAME_PARTS, FRAME_LABOR_RATE, FRAME_MIN_LABOR,'
      +'SCREENS, SCREEN_HORIZ, SCREEN_VERT, SCREEN_AREA_COST, SCREEN_AREA_FACTOR, SCREEN_PARTS, SCREEN_LABOR_RATE,'
      +'SCREEN_MIN_LABOR, MULTIPLIER_1, MULTIPLIER_2 '
      +' From PRICING where PRICING_ID = :p_PRICING_ID';


    //---- Models
    if cbSModels.Checked then
      ExecSQL.ParamByName('pSM_ID').AsInteger := luSModels.EditValue
    else begin
      MainSQL.Close;
      MainSQL.SQL.Text := 'select sm_id from series_model where model_id = :pModel_ID and series_id = :pSeries_ID';
      MainSQL.ParamByName('pSeries_ID').AsInteger := luSeries.EditValue;
      MainSQL.ParamByName('pModel_ID').AsInteger := tblPricing.FieldByName('Model_ID').AsInteger;
      MainSQL.Open;

      if MainSQL.Fields[0].IsNull then raise Exception.Create('This model does not exists in that series');

      ExecSQL.ParamByName('pSM_ID').AsInteger := MainSQL.Fields[0].AsInteger;
    end;

    //---- Colors
    if cbSColor.Checked then
      ExecSQL.ParamByName('pSC_ID').AsInteger := luSColor.EditValue
    else begin
      MainSQL.Close;
      MainSQL.SQL.Text := 'select SC_ID from SERIES_COLOR where COLOR_ID = :pCOLOR_ID and Series_ID = :pSeries_ID';
      MainSQL.ParamByName('pSeries_ID').AsInteger := luSeries.EditValue;
      MainSQL.ParamByName('pCOLOR_ID').AsInteger := tblPricing.FieldByName('COLOR_ID').AsInteger;
      MainSQL.Open;

      if MainSQL.Fields[0].IsNull then raise Exception.Create('This color does not exists in that series');

      ExecSQL.ParamByName('pSC_ID').AsInteger := MainSQL.Fields[0].AsInteger;
    end;

    //---- Nailfin
    if cbSNailfin.Checked then
      ExecSQL.ParamByName('pSNF_ID').AsInteger := luSNailfin.EditValue
    else begin
      MainSQL.Close;
      MainSQL.SQL.Text := 'select SNF_ID from SERIES_NAILFIN where NAILFIN_ID = :pNAILFIN_ID and Series_ID = :pSeries_ID';
      MainSQL.ParamByName('pSeries_ID').AsInteger := luSeries.EditValue;
      MainSQL.ParamByName('pNAILFIN_ID').AsInteger := tblPricing.FieldByName('NAILFIN_ID').AsInteger;
      MainSQL.Open;

      if MainSQL.Fields[0].IsNull then raise Exception.Create('This nailfin does not exists in that series');

      ExecSQL.ParamByName('pSNF_ID').AsInteger := MainSQL.Fields[0].AsInteger;
    end;

    //if ContainsText(copy_fields, ':pSM_ID') then

    ExecSQL.ParamByName('p_PRICING_ID').AsInteger := tblPricing.FieldByName('PRICING_ID').AsInteger;

    ExecSQL.Execute;
    TransRead.CommitRetaining;

    tblPricing.Refresh;


  end;

end;

procedure TPricingfrm.cxButton6Click(Sender: TObject);
var
varFields: array of variant;
keyFields: string;
cp_idx, array_idx: integer;
gen_lookup: TcxLookupComboBox;
begin
  with CostingDM do begin
    if varIsSoftNull(luSeries.EditValue) then exit;

    if not tblSeries.Locate('series_id', luSeries.EditValue, []) then raise Exception.Create('could not find this series to view');

    tblPricing.Close;
    tblPricing.ParamByName('series_id').AsInteger := luSeries.EditValue;
    tblPricing.Open;

    array_idx := 0;
    for cp_idx := 0 to pred(grpOptions.ControlCount) do begin

      if (grpOptions.Controls[cp_idx] is TcxLookupComboBox) then begin
        gen_lookup := TcxLookupComboBox(grpOptions.Controls[cp_idx]);

        if gen_lookup.Style.Color = clYellow then begin
          keyFields := keyFields + gen_lookup.Properties.KeyFieldNames+';';

          array_idx := array_idx + 1;
          setlength(varFields, array_idx);
          varFields[array_idx - 1] := gen_lookup.EditValue;
        end;


      end; //lookups

    end;

    if array_idx > 0 then
      tblPricing.Locate(keyFields, varFields, []); //varArrayof([luSModels.EditValue, luSColor.EditValue, luSNailfin.EditValue])

  end;
end;

procedure TPricingfrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with CostingDM do begin
    tblSerMod_Lookup.Close;
    tblSerColor_lookup.Close;
    tblSerNailfin_lookup.Close;
  end;

  GridSettings(self, 'costing', true);
end;

procedure TPricingfrm.FormCreate(Sender: TObject);
begin
  luSeries.ItemIndex := 0;

  with CostingDM do begin
    tblSerMod_Lookup.Open;
    tblSerColor_lookup.open;
    tblSerNailfin_lookup.open;
  end;

  GridSettings(self, 'costing', false);
end;

procedure TPricingfrm.luSeriesPropertiesEditValueChanged(Sender: TObject);
var
LGrid: TcxCustomLookupDBGrid;
col_Series_ID: TcxLookupDBGridColumn;
begin
  with CostingDM do begin
    if VarIsSoftNull(luSeries.EditValue) then exit;

    luSModels.EditValue := null;
    luSColor.EditValue := null;
    luSNailfin.EditValue := null;

    //Filter lookup's Grids
    //----- Models
    LGrid := luSModels.ActiveProperties.Grid;
    col_Series_ID := LGrid.Columns.ColumnByFieldName('SERIES_ID');

    with LGrid.DataController.Filter do begin
      Clear;
      Root.AddItem(col_SERIES_ID, foEqual, luSeries.EditValue, VarToStr(luSeries.EditValue));
      Active := True;
    end;

    //----- Colors
    LGrid := luSColor.ActiveProperties.Grid;
    col_Series_ID := LGrid.Columns.ColumnByFieldName('SERIES_ID');

    with LGrid.DataController.Filter do begin
      Clear;
      Root.AddItem(col_SERIES_ID, foEqual, luSeries.EditValue, VarToStr(luSeries.EditValue));
      Active := True;
    end;

    //----- Nailfin
    LGrid := luSNailfin.ActiveProperties.Grid;
    col_Series_ID := LGrid.Columns.ColumnByFieldName('SERIES_ID');

    with LGrid.DataController.Filter do begin
      Clear;
      Root.AddItem(col_SERIES_ID, foEqual, luSeries.EditValue, VarToStr(luSeries.EditValue));
      Active := True;
    end;

  end;
end;

end.
