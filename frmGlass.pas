unit frmGlass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView,
  cxGrid, cxPC, cxContainer, Menus, StdCtrls, cxButtons, cxGroupBox, cxDBLookupComboBox, cxSpinEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxCheckBox, Grids, DBGrids, cxCurrencyEdit, cxLabel, cxButtonEdit,
  cxMemo, cxPCdxBarPopupMenu, cxNavigator, dxSkinsCore, dxSkinLondonLiquidSky, dxSkinscxPCPainter, dxSpellChecker,
  dxBarBuiltInMenu, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, dxPSCore, dxPScxCommon,
  dxPScxDBEditorLnks, dxPSTextLnk, cxCalc;

type
  TGlassfrm = class(TForm)
    pgcGlass: TcxPageControl;
    tsGlazing: TcxTabSheet;
    tsGridKind: TcxTabSheet;
    tsGridPattern: TcxTabSheet;
    grdGlazing: TcxGrid;
    vwGlazing: TcxGridDBTableView;
    grdlvlGlazing: TcxGridLevel;
    vwGlazingGLAZING_NAME: TcxGridDBColumn;
    vwGlazingGLAZING_DESCRIPTION: TcxGridDBColumn;
    vwGlazingIS_VISIBLE: TcxGridDBColumn;
    vwGlazingGUI_SEQUENCE: TcxGridDBColumn;
    gridKind: TcxGrid;
    vwGridKind: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    vwGridKindGKIND_NAME: TcxGridDBColumn;
    vwGridKindGKIND_DESCRIPTION: TcxGridDBColumn;
    vwGridKindIS_VISIBLE: TcxGridDBColumn;
    vwGridKindGUI_SEQUENCE: TcxGridDBColumn;
    vwGridKindOPERATOR: TcxGridDBColumn;
    vwGridKindDATE_SAVED: TcxGridDBColumn;
    vwGridKindOPERATOR_LAST_MODIFIED: TcxGridDBColumn;
    vwGridKindDATE_LAST_MODIFIED: TcxGridDBColumn;
    cxGrid3: TcxGrid;
    vwGridPat: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    vwGridPatGPATTERN_NAME: TcxGridDBColumn;
    vwGridPatGPATTERN_DESCRIPTION: TcxGridDBColumn;
    vwGridPatIS_VISIBLE: TcxGridDBColumn;
    vwGridPatGUI_SEQUENCE: TcxGridDBColumn;
    tsGlassType: TcxTabSheet;
    tsGlassKind: TcxTabSheet;
    grdGlassType: TcxGrid;
    vwGlassType: TcxGridDBTableView;
    glvlGlassType: TcxGridLevel;
    vwGlassTypeGLASS_TYPE_ID: TcxGridDBColumn;
    vwGlassTypeGLASS_KIND_ID: TcxGridDBColumn;
    vwGlassTypeGLASS_NAME: TcxGridDBColumn;
    vwGlassTypeTEMPERED: TcxGridDBColumn;
    vwGlassTypeDESCRIPTION: TcxGridDBColumn;
    vwGlassTypeTHICKNESS: TcxGridDBColumn;
    vwGlassTypeAREA: TcxGridDBColumn;
    vwGlassTypeCOST: TcxGridDBColumn;
    vwGlassTypeGUI_SEQUENCE: TcxGridDBColumn;
    vwGlassTypeIS_VISIBLE: TcxGridDBColumn;
    grdGlassKind: TcxGrid;
    vwGlassKind: TcxGridDBTableView;
    lvlGlassKind: TcxGridLevel;
    btnClose: TcxButton;
    vwGridKindColumn1: TcxGridDBColumn;
    tsGridCost: TcxTabSheet;
    gridCost: TcxGrid;
    vwGridCost: TcxGridDBTableView;
    vwGridCostGKIND_ID: TcxGridDBColumn;
    vwGridCostGPAT_ID: TcxGridDBColumn;
    vwGridCostCOST: TcxGridDBColumn;
    gridCostLevel1: TcxGridLevel;
    tsSpacer: TcxTabSheet;
    tsGas: TcxTabSheet;
    vwGlassEdge: TcxGridDBTableView;
    gridGlassEdgeLevel1: TcxGridLevel;
    gridGlassEdge: TcxGrid;
    vwGas: TcxGridDBTableView;
    gridGasLevel1: TcxGridLevel;
    gridGas: TcxGrid;
    vwGasGAS_NAME: TcxGridDBColumn;
    vwGasDescription: TcxGridDBColumn;
    vwGasCOST: TcxGridDBColumn;
    vwGasGED_CODE: TcxGridDBColumn;
    vwGlassEdgeEDGE: TcxGridDBColumn;
    vwGlassEdgeDESCRIPTION: TcxGridDBColumn;
    vwGlassEdgeGED_CODE: TcxGridDBColumn;
    vwGlassEdgeBASE_COST: TcxGridDBColumn;
    vwGlassEdgeWASTE: TcxGridDBColumn;
    vwGlassEdgeCOST: TcxGridDBColumn;
    vwGridCostBASE_COST: TcxGridDBColumn;
    vwGridCostWASTE: TcxGridDBColumn;
    vwGlassTypeBASE_COST: TcxGridDBColumn;
    vwGlassTypeWASTE: TcxGridDBColumn;
    vwGlassTypeGED_CODE: TcxGridDBColumn;
    vwGridKindGED_CODE: TcxGridDBColumn;
    vwGasGUI_SEQUENCE: TcxGridDBColumn;
    vwGasIS_VISIBLE: TcxGridDBColumn;
    vwGlassKindGLASS_KIND_ID: TcxGridDBColumn;
    vwGlassKindGLASS_KIND: TcxGridDBColumn;
    vwGlassKindDESCRIPTION: TcxGridDBColumn;
    vwGlassKindGUI_SEQUENCE_OUTER: TcxGridDBColumn;
    vwGlassKindGUI_SEQUENCE_MIDDLE: TcxGridDBColumn;
    vwGlassKindGUI_SEQUENCE_INNER: TcxGridDBColumn;
    vwGlassKindIS_VISIBLE_OUTER: TcxGridDBColumn;
    vwGlassKindIS_VISIBLE_MIDDLE: TcxGridDBColumn;
    vwGlassKindIS_VISIBLE_INNER: TcxGridDBColumn;
    vwGlazingNLITES: TcxGridDBColumn;
    vwGlazingGLASS_LABOR: TcxGridDBColumn;
    vwGridPatGPAT_ID: TcxGridDBColumn;
    vwGridPatGPAT_WIDTH_DIVISOR: TcxGridDBColumn;
    vwGridPatGPAT_WIDTH_OFFSET: TcxGridDBColumn;
    vwGridPatGPAT_HEIGHT_DIVISOR: TcxGridDBColumn;
    vwGridPatGPAT_HEIGHT_OFFSET: TcxGridDBColumn;
    vwGridPatGPAT_GED: TcxGridDBColumn;
    vwGridPatGPAT_HEIGHT_MULT: TcxGridDBColumn;
    vwGridPatGPAT_WIDTH_MULT: TcxGridDBColumn;
    ComponentPrinter: TdxComponentPrinter;
    ComponentPrinterGlassType: TdxGridReportLink;
    ComponentPrinterGlazing: TdxGridReportLink;
    ComponentPrinterGridCost: TdxGridReportLink;
    ComponentPrinterGlassEdge: TdxGridReportLink;
    ComponentPrinterGas: TdxGridReportLink;
    btnPrint: TcxButton;
    vwGlassEdgeLABOR: TcxGridDBColumn;
    vwGasColumn1: TcxGridDBColumn;
    vwGlassEdgeColumn1: TcxGridDBColumn;
    vwGridCostColumn3: TcxGridDBColumn;
    vwGlazingColumn1: TcxGridDBColumn;
    vwGlassTypeColumn1: TcxGridDBColumn;
    cxTabSheet1: TcxTabSheet;
    gridStandardGrids: TcxGrid;
    vwGridsStd: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    vwGridsStdMODEL_ID: TcxGridDBColumn;
    vwGridsStdGPAT_ID: TcxGridDBColumn;
    vwGridsStdGRIDS_STD_DIM: TcxGridDBColumn;
    vwGridsStdGRIDS_ACROSS: TcxGridDBColumn;
    vwGridsStdGRIDS_UPDOWN: TcxGridDBColumn;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrintClick(Sender: TObject);
    procedure pgcGlassChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Glassfrm: TGlassfrm;

implementation

uses dmCosting, myFunc;

{$R *.dfm}

procedure TGlassfrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TGlassfrm.btnPrintClick(Sender: TObject);
begin
  if pgcGlass.Properties.ActivePage = tsGlassType then
    ComponentPrinter.Preview(true, ComponentPrinterGlassType);
  if pgcGlass.Properties.ActivePage = tsGlazing then
    ComponentPrinter.Preview(true, ComponentPrinterGlazing);
  if pgcGlass.Properties.ActivePage = tsGridCost then
    ComponentPrinter.Preview(true, ComponentPrinterGridCost);
  if pgcGlass.Properties.ActivePage = tsSpacer then
    ComponentPrinter.Preview(true, ComponentPrinterGlassEdge);
  if pgcGlass.Properties.ActivePage = tsGas then
    ComponentPrinter.Preview(true, ComponentPrinterGas);
end;

procedure TGlassfrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GridSettings(self, 'costing', true);

end;

procedure TGlassfrm.FormShow(Sender: TObject);
begin
  with CostingDM do begin
    tblGridCost.open;
  end;

  pgcGlass.ActivePageIndex := 0;

  GridSettings(self, 'costing', false);

  btnPrint.Enabled := false;

end;

procedure TGlassfrm.pgcGlassChange(Sender: TObject);
begin
  if (pgcGlass.Properties.ActivePage = tsGlassKind)
        or (pgcGlass.Properties.ActivePage = tsGridKind)
          or (pgcGlass.Properties.ActivePage = tsGridPattern) then
    btnPrint.Enabled := false
  else
    btnPrint.Enabled := true;
end;

end.
