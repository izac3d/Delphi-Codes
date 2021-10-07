unit frmFrames;

interface

uses
  Windows, Messages, SysUtils, System.UITypes, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxPC,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  StdCtrls, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxContainer, cxTextEdit, cxGridExportLink,
  cxMaskEdit, cxDropDownEdit, cxDBEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DBCtrls, cxCalc, cxProgressBar, cxSpinEdit, Grids, Menus,
  cxButtons, cxGroupBox, cxCurrencyEdit, cxCheckBox, cxLabel, ExtCtrls, cxMemo, cxColorComboBox,
  cxHint, cxImage, cxDBLabel, cxPCdxBarPopupMenu, cxNavigator, dxSkinsCore, dxSkinLondonLiquidSky, dxSkinscxPCPainter, dxSpellChecker,
  dxBarBuiltInMenu;

type
  TFramesfrm = class(TForm)
    pgcFrames: TcxPageControl;
    tsColors: TcxTabSheet;
    tsNailfins: TcxTabSheet;
    tsHanding: TcxTabSheet;
    btnAddAllHanding: TcxButton;
    btnAddHanding: TcxButton;
    tsModels: TcxTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    gridLookupModels: TcxGrid;
    viewModels: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btnAddColor: TcxButton;
    btnAddAllColors: TcxButton;
    Label8: TLabel;
    Label9: TLabel;
    btnAddNailfin: TcxButton;
    btnAddAllNailfins: TcxButton;
    Label5: TLabel;
    gridSeriesModel: TcxGrid;
    viewSeriesModels: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    gridHanding: TcxGrid;
    vwHanding: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    tsCallouts: TcxTabSheet;
    gridCallout: TcxGrid;
    vwCallouts: TcxGridDBTableView;
    vwCalloutsCALLOUTS: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    btnCopyModelCallouts: TcxButton;
    btnCopySeriesCallouts: TcxButton;
    gridModelColors: TcxGrid;
    vwColors: TcxGridDBTableView;
    lvlColors: TcxGridLevel;
    gridNailfins: TcxGrid;
    vwNailfin: TcxGridDBTableView;
    cxGridLevel6: TcxGridLevel;
    gridSColors: TcxGrid;
    vwSMColors: TcxGridDBTableView;
    lvlSColors: TcxGridLevel;
    gridSeriesNailfins: TcxGrid;
    vwSMNailfin: TcxGridDBTableView;
    lvlSNailfin: TcxGridLevel;
    gridModelHanding: TcxGrid;
    vwSMHanding: TcxGridDBTableView;
    cxGridLevel10: TcxGridLevel;
    Label12: TLabel;
    cbSeriesCallouts: TcxLookupComboBox;
    cbNewModel_Callouts: TcxLookupComboBox;
    viewModelsMODEL_NAME: TcxGridDBColumn;
    viewModelsMODEL_DESCRIPTION: TcxGridDBColumn;
    viewSeriesModelsMODEL_NAME: TcxGridDBColumn;
    viewSeriesModelsMODEL_DESCRIPTION: TcxGridDBColumn;
    viewModelsMODEL_ID: TcxGridDBColumn;
    vwColorsCOLOR_NAME: TcxGridDBColumn;
    vwColorsCOLOR_DESCRIPTION: TcxGridDBColumn;
    vwSMColorsCOLOR_NAME: TcxGridDBColumn;
    vwSMColorsCOLOR_DESCRIPTION: TcxGridDBColumn;
    vwNailfinNAILFIN_ID: TcxGridDBColumn;
    vwNailfinNAILFIN_NAME: TcxGridDBColumn;
    vwNailfinNAILFIN_DESCRIPTION: TcxGridDBColumn;
    vwSMNailfinNAILFIN_NAME: TcxGridDBColumn;
    vwSMNailfinNAILFIN_DESCRIPTION: TcxGridDBColumn;
    vwHandingHANDING_ID: TcxGridDBColumn;
    vwSMHandingHANDING_NAME: TcxGridDBColumn;
    vwSMHandingHANDING_DESCRIPTION: TcxGridDBColumn;
    vwSMHandingHANDING_ID: TcxGridDBColumn;
    viewModelsGUISequence: TcxGridDBColumn;
    vwColorsGUI_SEQUENCE: TcxGridDBColumn;
    vwNailfinGUI_SEQUENCE: TcxGridDBColumn;
    viewSeriesModelsMIN_WIDTH: TcxGridDBColumn;
    viewSeriesModelsMAX_WIDTH: TcxGridDBColumn;
    viewSeriesModelsMIN_HEIGHT: TcxGridDBColumn;
    viewSeriesModelsMAX_HEIGHT: TcxGridDBColumn;
    viewSeriesModelsMAX_AREA: TcxGridDBColumn;
    viewSeriesModelsMIN_WIDTH_HEIGHT: TcxGridDBColumn;
    viewSeriesModelsMAX_WIDTH_HEIGHT: TcxGridDBColumn;
    viewSeriesModelsNFS_WIDTH_DEDUCT: TcxGridDBColumn;
    viewSeriesModelsNFS_HEIGHT_DEDUCT: TcxGridDBColumn;
    viewSeriesModelsOPERATOR: TcxGridDBColumn;
    viewSeriesModelsDATE_SAVED: TcxGridDBColumn;
    viewSeriesModelsOPERATOR_LAST_MODIFIED: TcxGridDBColumn;
    viewSeriesModelsDATE_LAST_MODIFIED: TcxGridDBColumn;
    viewSeriesModelsSERIES_NAME: TcxGridDBColumn;
    viewSeriesModelsSERIES_DESCRIPTION: TcxGridDBColumn;
    viewSeriesModelsTEMPERED: TcxGridDBColumn;
    viewSeriesModelsVERT_HORZ: TcxGridDBColumn;
    cxGroupBox1: TcxGroupBox;
    Label15: TLabel;
    edtNFSWidth: TcxSpinEdit;
    edtNFSHeight: TcxSpinEdit;
    Label16: TLabel;
    btnCopyNFS: TcxButton;
    viewSeriesModelsGLASS_EDGE_ID: TcxGridDBColumn;
    vwCalloutsNFS_WIDTH: TcxGridDBColumn;
    vwCalloutsNFS_HEIGHT: TcxGridDBColumn;
    tbScreens: TcxTabSheet;
    gridScreens: TcxGrid;
    vwScreens: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    btnAddScreen: TcxButton;
    btnAddAllScreens: TcxButton;
    gridModelScreens: TcxGrid;
    vwSMScreens: TcxGridDBTableView;
    cxGridLevel11: TcxGridLevel;
    Label10: TLabel;
    Label11: TLabel;
    vwScreensSCREEN_NAME: TcxGridDBColumn;
    vwScreensSCREEN_DESCRIPTION: TcxGridDBColumn;
    vwScreensGUI_SEQUENCE: TcxGridDBColumn;
    vwSMScreensSCREEN_NAME: TcxGridDBColumn;
    vwSMScreensSCREEN_DESCRIPTION: TcxGridDBColumn;
    vwSMScreensMODEL_NAME: TcxGridDBColumn;
    vwScreensSCREEN_ID: TcxGridDBColumn;
    viewModelsIGU_NO: TcxGridDBColumn;
    viewSeriesModelsColumn3: TcxGridDBColumn;
    viewSeriesModelsColumn4: TcxGridDBColumn;
    viewSeriesModelsColumn5: TcxGridDBColumn;
    viewSeriesModelsColumn6: TcxGridDBColumn;
    vwSMHandingGUI_SEQUENCE: TcxGridDBColumn;
    vwSMNailfinNAILFIN_ID: TcxGridDBColumn;
    vwSMNailfinGUI_SEQUENCE: TcxGridDBColumn;
    vwColorsCOLOR_ID: TcxGridDBColumn;
    vwSMColorsGUI_SEQUENCE: TcxGridDBColumn;
    vwSMColorsCOLOR_ID: TcxGridDBColumn;
    vwHandingGUI_SEQUENCE: TcxGridDBColumn;
    vwHandingVIEWED_FROM: TcxGridDBColumn;
    vwHandingHANDING_DESCRIPTION: TcxGridDBColumn;
    vwHandingHANDING_NAME: TcxGridDBColumn;
    vwSMScreensGUI_SEQUENCE: TcxGridDBColumn;
    vwSMScreensCOST: TcxGridDBColumn;
    viewModelsVERT_HORZ: TcxGridDBColumn;
    viewSeriesModelsColumn7: TcxGridDBColumn;
    cxTabSheet1: TcxTabSheet;
    Label13: TLabel;
    cxGrid1: TcxGrid;
    vwStrucPerf: TcxGridDBTableView;
    grdStrucPerformance: TcxGridLevel;
    vwStrucPerfSTRUC_PERF_ID: TcxGridDBColumn;
    vwStrucPerfPERFORMANCE: TcxGridDBColumn;
    vwStrucPerfDESCRIPTION: TcxGridDBColumn;
    vwStrucPerfGUI_SEQUENCE: TcxGridDBColumn;
    Button1: TcxButton;
    Button2: TcxButton;
    cxGrid2: TcxGrid;
    vwSMStrucPerf: TcxGridDBTableView;
    grdStrucPerf_SM: TcxGridLevel;
    vwSMStrucPerfSTRUC_PERF_SM_ID: TcxGridDBColumn;
    vwSMStrucPerfSM_ID: TcxGridDBColumn;
    vwSMStrucPerfSTRUC_PERF_ID: TcxGridDBColumn;
    vwSMStrucPerfIS_DEFAULT: TcxGridDBColumn;
    vwSMStrucPerfGUI_SEQUENCE: TcxGridDBColumn;
    vwSMStrucPerfPERFORMANCE: TcxGridDBColumn;
    vwSMStrucPerfDESCRIPTION: TcxGridDBColumn;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    gridLock: TcxGrid;
    vwLock: TcxGridDBTableView;
    vwLockWINLOCK_NAME: TcxGridDBColumn;
    vwLockWINLOCK_DESCRIPTION: TcxGridDBColumn;
    vwLockCost: TcxGridDBColumn;
    vwLockIS_VISIBLE: TcxGridDBColumn;
    vwLockGUI_SEQUENCE: TcxGridDBColumn;
    vwLockIS_DEFAULT: TcxGridDBColumn;
    cxGridLevel12: TcxGridLevel;
    cxGrid10: TcxGrid;
    cxGridDBTableView12: TcxGridDBTableView;
    cxGridDBTableView11STC: TcxGridDBColumn;
    cxGridDBTableView11GT_INNER: TcxGridDBColumn;
    cxGridDBTableView11GT_MIDDLE: TcxGridDBColumn;
    cxGridDBTableView11GT_OUTER: TcxGridDBColumn;
    cxGridDBTableView11TYPE_INNER: TcxGridDBColumn;
    cxGridDBTableView11TYPE_MIDDLE: TcxGridDBColumn;
    cxGridDBTableView11TYPE_OUTER: TcxGridDBColumn;
    cxGridDBTableView11IS_VISIBLE: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBTableView11OPERATOR: TcxGridDBColumn;
    cxGridDBTableView11DATE_SAVED: TcxGridDBColumn;
    cxGridDBTableView11OPERATOR_LAST_MODIFIED: TcxGridDBColumn;
    cxGridDBTableView11DATE_LAST_MODIFIED: TcxGridDBColumn;
    cxGridLevel14: TcxGridLevel;
    cxGroupBox2: TcxGroupBox;
    vwSMNailfinIS_VISIBLE: TcxGridDBColumn;
    vwSMColorsIS_VISIBLE: TcxGridDBColumn;
    viewSeriesModelsIS_VISIBLE: TcxGridDBColumn;
    vwSMHandingIS_VISIBLE: TcxGridDBColumn;
    vwSMScreensIS_VISIBLE: TcxGridDBColumn;
    vwSMStrucPerfIS_VISIBLE: TcxGridDBColumn;
    Label18: TLabel;
    Label19: TLabel;
    btnAddPaint: TcxButton;
    btnAddAllPaint: TcxButton;
    cxGroupBox3: TcxGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    cbModelCallout: TcxLookupComboBox;
    btnCopyCallouts: TcxButton;
    Label22: TLabel;
    Label23: TLabel;
    btnPasteCallouts: TcxButton;
    lblCalloutMem: TLabel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    vwPaint: TcxGridDBTableView;
    gridPaintLevel1: TcxGridLevel;
    gridPaint: TcxGrid;
    vwPaintPAINT_ID: TcxGridDBColumn;
    vwPaintPAINT_NAME: TcxGridDBColumn;
    vwPaintPAINT_DESCRIPTION: TcxGridDBColumn;
    vwPaintGUI_SEQUENCE: TcxGridDBColumn;
    viewSPaint: TcxGridDBTableView;
    gridPaintModelLevel1: TcxGridLevel;
    gridPaintModel: TcxGrid;
    viewSPaintPAINT_NAME: TcxGridDBColumn;
    viewSPaintPAINT_DESCRIPTION: TcxGridDBColumn;
    viewSPaintCOST: TcxGridDBColumn;
    viewSPaintGUI_SEQUENCE: TcxGridDBColumn;
    viewSPaintIS_DEFAULT: TcxGridDBColumn;
    viewSPaintIS_VISIBLE: TcxGridDBColumn;
    btnAllCopy: TcxButton;
    btnSelectedCopy: TcxButton;
    tsLog: TcxTabSheet;
    mlog: TMemo;
    cxGroupBox4: TcxGroupBox;
    cbSeriesSize: TcxLookupComboBox;
    btnCopyToSeries: TcxButton;
    cxGroupBox5: TcxGroupBox;
    cbSizeModels: TcxLookupComboBox;
    btnCopyToModel: TcxButton;
    Label14: TLabel;
    Bevel3: TBevel;
    vwCalloutsIS_VISIBLE: TcxGridDBColumn;
    tsCopySM: TcxTabSheet;
    cxGroupBox6: TcxGroupBox;
    btnCopySeries: TcxButton;
    luTarget_Series: TcxLookupComboBox;
    luTarget_SModel: TcxLookupComboBox;
    Label24: TLabel;
    Label25: TLabel;
    viewModelsGED_CODE: TcxGridDBColumn;
    vwSMScreensIS_DEFAULT: TcxGridDBColumn;
    cxGroupBox7: TcxGroupBox;
    btnClose: TcxButton;
    Label1: TLabel;
    Label17: TLabel;
    luSeries: TcxLookupComboBox;
    MProgBar: TcxProgressBar;
    luSerModel: TcxLookupComboBox;
    btnAddSeries: TcxButton;
    btnDeleteSeries: TcxButton;
    cxTabSheet5: TcxTabSheet;
    grdTractColors: TcxGrid;
    vwTractColors: TcxGridDBTableView;
    grdlvlgrdTractColors: TcxGridLevel;
    vwTractColorsGRID_COLOR_STATUS_ID: TcxGridDBColumn;
    vwTractColorsCOLOR: TcxGridDBColumn;
    vwTractColorsDESCRIPTION: TcxGridDBColumn;
    vwSMScreensQUANTITY: TcxGridDBColumn;
    vwSMScreensWIDTH_DEDUCT: TcxGridDBColumn;
    vwSMScreensWIDTH_DIVISOR: TcxGridDBColumn;
    vwSMScreensHEIGHT_DEDUCT: TcxGridDBColumn;
    vwSMScreensHEIGHT_DIVISOR: TcxGridDBColumn;
    viewModelsMODEL_TYPE_ID: TcxGridDBColumn;
    vwScreensIS_NO_DIM: TcxGridDBColumn;
    viewModelsTEMPERED: TcxGridDBColumn;
    imgModel: TcxDBImage;
    vwSMScreensSM_ID: TcxGridDBColumn;
    cxTabSheet6: TcxTabSheet;
    grdIGU: TcxGrid;
    vwIGULites: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    vwIGULitesIGU_SM_LITES_ID: TcxGridDBColumn;
    vwIGULitesSM_ID: TcxGridDBColumn;
    vwIGULitesIGU_POSITION: TcxGridDBColumn;
    vwIGULitesLITE_GED_CODE: TcxGridDBColumn;
    vwIGULitesLITE_H_DEDUCT: TcxGridDBColumn;
    vwIGULitesLITE_V_DEDUCT: TcxGridDBColumn;
    vwIGULitesLITE_H_GRID: TcxGridDBColumn;
    vwIGULitesLITE_V_GRID: TcxGridDBColumn;
    vwIGULitesLITE_GLASS_EDGE_ID: TcxGridDBColumn;
    viewSeriesModelsSM_ID: TcxGridDBColumn;
    vwSMScreensSCREEN_ID: TcxGridDBColumn;
    vwSMScreensColumn1: TcxGridDBColumn;
    cxDBLabel1: TcxDBLabel;
    viewModelsIS_SPECIAL_MODEL: TcxGridDBColumn;
    vwIGULitesLITE_H: TcxGridDBColumn;
    vwIGULitesLITE_V: TcxGridDBColumn;
    gbSpecDims: TcxGroupBox;
    grdSpecDimCallout: TcxGrid;
    vwSP_Callout: TcxGridDBTableView;
    vwSP_CalloutSP_CALLOUT_ID: TcxGridDBColumn;
    vwSP_CalloutSM_ID: TcxGridDBColumn;
    vwSP_CalloutSP_CALLOUT_NAME: TcxGridDBColumn;
    glvlSP_Callout: TcxGridLevel;
    grdSpecDimXY: TcxGrid;
    vwSP_DIM: TcxGridDBTableView;
    vwSP_DIMSP_DIM_ID: TcxGridDBColumn;
    vwSP_DIMSP_CALLOUT_ID: TcxGridDBColumn;
    vwSP_DIMIGU_POSITION: TcxGridDBColumn;
    glvlSP_DIM: TcxGridLevel;
    vwSP_CalloutSP_DIM_AXIS: TcxGridDBColumn;
    vwSP_DIMSP_DIM_VAL: TcxGridDBColumn;
    cxDBCheckBox1: TcxDBCheckBox;
    btnXLSExport: TcxButton;
    viewSeriesModelsColumn1: TcxGridDBColumn;
    vwCalloutsGUI_SEQUENCE: TcxGridDBColumn;
    viewModelsXPANEL_NO: TcxGridDBColumn;
    viewModelsDPANEL_NO: TcxGridDBColumn;
    tsXpanel_Lites: TcxTabSheet;
    grdXPanel: TcxGrid;
    vwXPanel_SM: TcxGridDBTableView;
    cxGridLevel8: TcxGridLevel;
    vwXPanel_SMXPANEL_SM_LITES_ID: TcxGridDBColumn;
    vwXPanel_SMSM_ID: TcxGridDBColumn;
    vwXPanel_SMXP_POSITION: TcxGridDBColumn;
    vwXPanel_SMXP_LITE_V: TcxGridDBColumn;
    vwXPanel_SMXP_LITE_H: TcxGridDBColumn;
    vwXPanel_SMXP_LITE_V_DEDUCT: TcxGridDBColumn;
    vwXPanel_SMXP_LITE_H_DEDUCT: TcxGridDBColumn;
    cxTabSheet7: TcxTabSheet;
    grdBCT: TcxGrid;
    vwBCT: TcxGridDBTableView;
    cxGridLevel9: TcxGridLevel;
    vwBCTBCT_NAME: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    procedure btnAddNailfinClick(Sender: TObject);
    procedure btnAddAllNailfinsClick(Sender: TObject);
    procedure btnAddColorClick(Sender: TObject);
    procedure btnAddAllColorsClick(Sender: TObject);
    procedure btnCopyModelCalloutsClick(Sender: TObject);
    procedure btnCopySeriesCalloutsClick(Sender: TObject);
    procedure btnAddHandingClick(Sender: TObject);
    procedure btnAddAllHandingClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCopyNFSClick(Sender: TObject);
    procedure btnAddScreenClick(Sender: TObject);
    procedure btnAddAllScreensClick(Sender: TObject);
    procedure btnCopyCalloutsClick(Sender: TObject);
    procedure btnPasteCalloutsClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnAddPaintClick(Sender: TObject);
    procedure btnAddAllPaintClick(Sender: TObject);
    procedure btnAllCopyClick(Sender: TObject);
    procedure btnSelectedCopyClick(Sender: TObject);
    procedure btnOpenBOMClick(Sender: TObject);
    procedure btnDeleteSeriesClick(Sender: TObject);
    procedure btnCopySeriesClick(Sender: TObject);
    procedure btnAddSeriesClick(Sender: TObject);
    procedure btnCopyToSeriesClick(Sender: TObject);
    procedure btnCopyToModelClick(Sender: TObject);
    procedure cbSeriesPropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupComboBox1PropertiesEditValueChanged(Sender: TObject);
    procedure pgcFramesChange(Sender: TObject);
    procedure vwLockIS_DEFAULTPropertiesEditValueChanged(Sender: TObject);
    procedure viewSScreensIS_DEFAULTPropertiesEditValueChanged(Sender: TObject);
    procedure viewSPaintIS_DEFAULTPropertiesEditValueChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnXLSExportClick(Sender: TObject);
  private
    mem_sm_id: integer;

  public
    { Public declarations }
  end;

var
  Framesfrm: TFramesfrm;

implementation

uses dmCosting, frmSeries, frmBOM, cxVariants, cxLookupGrid, myFunc;

{$R *.dfm}

procedure TFramesfrm.btnAddSeriesClick(Sender: TObject);
Var
  BM: TBookMark;
begin
  with CostingDM do begin
    try
      BM := tblSeries.GetBookmark;
      tblSeriesModel.DisableControls;

      Seriesfrm := tSeriesfrm.Create(nil);
      if Seriesfrm.ShowModal = mrok then begin
        if tblSeries.State in dseditmodes then
          tblSeries.Post;

      end
      else
        tblSeries.Cancel;

    finally
      tblSeries.GoToBookMark(BM);
      tblSeries.FreeBookmark(BM);

      tblSeriesModel.EnableControls;
    end;

  end;

end;

procedure TFramesfrm.btnDeleteSeriesClick(Sender: TObject);
var
warn_msg: string;
begin
  with CostingDM do begin
    warn_msg := 'Are you sure delete series: '+ luSeries.Text+' ?';
    if messagebox(handle, PWideChar(warn_msg),'Delete Series', mb_yesno+mb_iconquestion) <> idyes then exit;
    tblSeries.Delete;

  end;

end;

procedure TFramesfrm.btnAddNailfinClick(Sender: TObject);
begin
  with CostingDM, vwNailfin.DataController do begin
    tblSeriesNAILFIN.Insert;
    tblSeriesNAILFIN.FieldByName('SERIES_ID').AsInteger := tblSeries.FieldByName('SERIES_ID').AsInteger;
    tblSeriesNAILFIN.FieldByName('NAILFIN_ID').AsInteger :=
      Values[GetSelectedRowIndex(0), vwNailfinNAILFIN_ID.Index];

    tblSeriesNAILFIN.Post;
    tblSeriesNAILFIN.Refresh;

  end;
end;

procedure TFramesfrm.btnAddPaintClick(Sender: TObject);
begin
  with CostingDM, vwPaint.DataController do begin
    if varIsSoftNull(luSerModel.EditValue) then
      raise Exception.Create('Select a Model first');

    tblPaint_SM.Insert;
    tblPaint_SM.FieldByName('SM_ID').AsInteger := luSerModel.EditValue;
    tblPaint_SM.FieldByName('PAINT_ID').AsInteger :=
      Values[GetSelectedRowIndex(0), vwPaintPAINT_ID.Index];

    tblPaint_SM.Post;
    tblPaint_SM.Refresh;

  end;
end;

procedure TFramesfrm.btnAddAllNailfinsClick(Sender: TObject);
begin
  with CostingDM do begin
    if messagebox(handle, 'Are you sure you want to add all data ?','Add All', mb_yesno+mb_iconquestion) <> idyes then exit;

    tblNAILFIN.DisableControls;
    MProgBar.Position := 0;
    MProgBar.Visible := true;
    try
      tblNAILFIN.First;
      while not tblNAILFIN.Eof do begin
        tblSeriesNAILFIN.Append;
        tblSeriesNAILFIN.FieldByName('SERIES_ID').AsInteger := tblSeries.FieldByName('SERIES_ID').AsInteger;
        tblSeriesNAILFIN.FieldByName('NAILFIN_ID').AsInteger :=
          tblNAILFIN.FieldByName('NAILFIN_ID').AsInteger;
        tblSeriesNAILFIN.Post;

        tblNAILFIN.Next;
        MProgBar.Position := tblNAILFIN.RecNo * 100 div tblNAILFIN.RecordCount;
        application.ProcessMessages;
      end;
    finally
      MProgBar.Visible := false;
      tblNAILFIN.EnableControls;
      tblSeriesNAILFIN.Refresh;
    end;

  end;
end;

procedure TFramesfrm.btnCopyNFSClick(Sender: TObject);
begin
  with CostingDM do begin
    if tblSeriesModel.IsEmpty then
      raise Exception.Create('No Models to update');

    ExecSQL.SQL.Text := 'update SERIES_MODEL set NFS_WIDTH_DEDUCT = :nfs_width, NFS_HEIGHT_DEDUCT = :nfs_height where SERIES_ID = :SERIES_ID';
    ExecSQL.ParamByName('SERIES_ID').AsInteger := luSeries.EditValue;
    ExecSQL.ParamByName('nfs_width').AsFloat := edtNFSWidth.Value;
    ExecSQL.ParamByName('nfs_height').AsFloat := edtNFSHeight.Value;
    ExecSQL.Execute;

    TransRead.CommitRetaining;
    tblSeriesModel.Refresh;

  end;

end;

procedure TFramesfrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 GridSettings(self, 'costing', true);

end;

procedure TFramesfrm.FormCreate(Sender: TObject);
begin
  GridSettings(self, 'costing', false);
end;

procedure TFramesfrm.FormShow(Sender: TObject);
begin
  try
  luSeries.ItemIndex := 0;
  pgcFrames.ActivePageIndex := 0;
  luSerModel.ItemIndex := 0;
  cbModelCallout.ItemIndex := 0;
  except //suppress any exception for empty list: list index out of bounds
  end;

end;

procedure TFramesfrm.pgcFramesChange(Sender: TObject);
begin
  with CostingDM do begin
    if not (pgcFrames.ActivePage = tsCopySM) then begin

      if tblSerMod_Lookup.Active then begin
          tblSerMod_Lookup.RestoreSQL;
          tblSerMod_Lookup.Close;
      end;

    end
    else begin
      luTarget_Series.EditValue := null;
      luTarget_SModel.EditValue := null;
    end;

     gbSpecDims.Enabled := tblSeriesModel.FieldByName('is_special_model').AsInteger = 1;
     gbSpecDims.Refresh;

  end;
end;

procedure TFramesfrm.viewSPaintIS_DEFAULTPropertiesEditValueChanged(Sender: TObject);
begin
  CostingDM.tblPaint_SM.Refresh;
end;

procedure TFramesfrm.viewSScreensIS_DEFAULTPropertiesEditValueChanged(Sender: TObject);
begin
  CostingDM.tblScreen_SM.Refresh;
end;

procedure TFramesfrm.vwLockIS_DEFAULTPropertiesEditValueChanged(Sender: TObject);
//var
  //AIndex, ACurrentIndex, AStartIndex: Integer;
begin
  with CostingDM do begin
    tblWinLock_SM.Refresh;

  {this can not work because I use 0,1 for field value
  with TcxRadioGroup(Sender) do begin

    Properties.OnEditValueChanged := nil;

    with vwLock.DataController do begin
      BeginUpdate;
      try
        ACurrentIndex := FocusedRecordIndex;
        if ACurrentIndex = RecordCount - 1 then
          AStartIndex := 0
        else
          AStartIndex := ACurrentIndex + 1;

        AIndex := FindRecordIndexByText(AStartIndex, 10, inttostr(1), False, True, True);

        FocusedRecordIndex := AIndex;

        DataSet.Edit;
        DataSet.FieldValues['IS_DEFAULT'] := 0;
        DataSet.Post;

        FocusedRecordIndex := ACurrentIndex;
      finally
        EndUpdate;
      end;
    end;
    Properties.OnEditValueChanged := vwLockIS_DEFAULT1PropertiesEditValueChanged;
  end;
  vwLock.Controller.EditingController.ShowEdit();}

  end;


end;

procedure TFramesfrm.btnAddColorClick(Sender: TObject);
begin
  with CostingDM, vwColors.DataController do begin
    tblSeriesColor.Insert;
    tblSeriesColor.FieldByName('SERIES_ID').AsInteger := tblSeries.FieldByName('SERIES_ID').AsInteger;
    tblSeriesColor.FieldByName('COLOR_ID').AsInteger :=
      Values[GetSelectedRowIndex(0), vwColorsCOLOR_ID.Index];

    tblSeriesColor.Post;
    tblSeriesColor.Refresh;

  end;
end;

procedure TFramesfrm.btnAddHandingClick(Sender: TObject);
begin
  with CostingDM, vwHanding.DataController do begin
    if varIsSoftNull(luSerModel.EditValue) then
      raise Exception.Create('Select a Model first');

    tblSeriesHanding.Insert;
    tblSeriesHanding.FieldByName('SM_ID').AsInteger := luSerModel.EditValue;
    tblSeriesHanding.FieldByName('HANDING_ID').AsInteger :=
      Values[GetSelectedRowIndex(0), vwHandingHANDING_ID.Index];

    tblSeriesHanding.Post;
    tblSeriesHanding.Refresh;

  end;
end;

procedure TFramesfrm.btnAddAllColorsClick(Sender: TObject);
begin
  with CostingDM do begin
    if messagebox(handle, 'Are you sure you want to add all colors ?','Add All', mb_yesno+mb_iconquestion) <> idyes then exit;

    tblColors.DisableControls;
    MProgBar.Position := 0;
    MProgBar.Visible := true;
    try
      tblColors.First;
      while not tblColors.Eof do begin
        tblSeriesColor.Append;
        tblSeriesColor.FieldByName('SERIES_ID').AsInteger := tblSeries.FieldByName('SERIES_ID').AsInteger;
        tblSeriesColor.FieldByName('COLOR_ID').AsInteger :=
          tblColors.FieldByName('COLOR_ID').AsInteger;
        tblSeriesColor.Post;

        tblColors.Next;
        MProgBar.Position := tblColors.RecNo * 100 div tblColors.RecordCount;
        application.ProcessMessages;
      end;
    finally
      MProgBar.Visible := false;
      tblColors.EnableControls;
      tblSeriesColor.Refresh;
    end;

  end;
end;

procedure TFramesfrm.btnAddAllHandingClick(Sender: TObject);
begin
  with CostingDM do begin
    if VarIsSoftNull(luSerModel.EditValue) then
      raise Exception.Create('Select a Model first');

    if tblHanding.IsEmpty then raise exception.Create('Handing Table is empty');
    if messagebox(handle, 'Are you sure you want to add all data ?','Add All', mb_yesno+mb_iconquestion) <> idyes then exit;

    tblHanding.DisableControls;
    MProgBar.Position := 0;
    MProgBar.Visible := true;
    try
      tblHanding.First;
      while not tblHanding.Eof do begin
        tblSeriesHanding.Insert;
        tblSeriesHanding.FieldByName('HANDING_ID').AsInteger :=
          tblHanding.FieldByName('HANDING_ID').AsInteger;
        tblSeriesHanding.FieldByName('SM_ID').AsInteger := luSerModel.EditValue;

        tblSeriesHanding.Post;

        tblHanding.Next;
        MProgBar.Position := tblHanding.RecNo * 100 div tblHanding.RecordCount;
        application.ProcessMessages;
      end;
    finally
      MProgBar.Visible := false;
      tblHanding.EnableControls;
      tblSeriesHanding.Refresh;
    end;

  end;
end;

procedure TFramesfrm.btnOpenBOMClick(Sender: TObject);
begin
  BOMfrm := TBOMfrm.Create(nil);
  BOMfrm.ShowModal;
end;

procedure TFramesfrm.btnCopyToModelClick(Sender: TObject);
var
ser_id, GLASS_EDGE_ID: integer;
MIN_WIDTH, MAX_WIDTH, MIN_HEIGHT,
MAX_HEIGHT, MAX_AREA, MIN_WIDTH_HEIGHT,
MAX_WIDTH_HEIGHT, NFS_WIDTH_DEDUCT, NFS_HEIGHT_DEDUCT,
OPEN_WIDTH_DIVISOR, OPEN_HEIGHT_DIVISOR: single;
begin
  with CostingDM do begin
    if cbSizeModels.Text = '' then
      raise Exception.Create('Select Model to copy to first');

    if tblSeriesModel.IsEmpty then
      raise Exception.Create('No data to copy!');

    if cbSizeModels.EditValue = tblSeriesModel.FieldByName('MODEL_ID').AsInteger then
      raise Exception.Create('Can not copy to same model');

    ser_id := tblSeriesModel.FieldByName('SERIES_ID').AsInteger;

    MIN_WIDTH := tblSeriesModel.FieldByName('MIN_WIDTH').AsSingle;
    MAX_WIDTH := tblSeriesModel.FieldByName('MAX_WIDTH').AsSingle;
    MIN_HEIGHT := tblSeriesModel.FieldByName('MIN_HEIGHT').AsSingle;
    MAX_HEIGHT := tblSeriesModel.FieldByName('MAX_HEIGHT').AsSingle;
    MAX_AREA := tblSeriesModel.FieldByName('MAX_AREA').AsSingle;

    NFS_WIDTH_DEDUCT := tblSeriesModel.FieldByName('NFS_WIDTH_DEDUCT').AsSingle;
    NFS_HEIGHT_DEDUCT := tblSeriesModel.FieldByName('NFS_HEIGHT_DEDUCT').AsSingle;

    OPEN_WIDTH_DIVISOR := tblSeriesModel.FieldByName('OPEN_WIDTH_DIVISOR').AsSingle;
    OPEN_HEIGHT_DIVISOR := tblSeriesModel.FieldByName('OPEN_HEIGHT_DIVISOR').AsSingle;

    MIN_WIDTH_HEIGHT := tblSeriesModel.FieldByName('MIN_WIDTH_HEIGHT').AsSingle;
    MAX_WIDTH_HEIGHT := tblSeriesModel.FieldByName('MAX_WIDTH_HEIGHT').AsSingle;

    GLASS_EDGE_ID := tblSeriesModel.FieldByName('GLASS_EDGE_ID').AsInteger;

    tblSeriesModel.Append;

    tblSeriesModel.FieldByName('SERIES_ID').AsInteger := ser_id;
    tblSeriesModel.FieldByName('MODEL_ID').AsInteger := cbSizeModels.EditValue;

    tblSeriesModel.FieldByName('MIN_WIDTH').AsSingle := MIN_WIDTH;
    tblSeriesModel.FieldByName('MAX_WIDTH').AsSingle := MAX_WIDTH;
    tblSeriesModel.FieldByName('MIN_HEIGHT').AsSingle := MIN_HEIGHT;
    tblSeriesModel.FieldByName('MAX_HEIGHT').AsSingle := MAX_HEIGHT;
    tblSeriesModel.FieldByName('MAX_AREA').AsSingle := MAX_AREA;

    tblSeriesModel.FieldByName('NFS_WIDTH_DEDUCT').AsSingle := NFS_WIDTH_DEDUCT;
    tblSeriesModel.FieldByName('NFS_HEIGHT_DEDUCT').AsSingle := NFS_HEIGHT_DEDUCT;

    tblSeriesModel.FieldByName('OPEN_WIDTH_DIVISOR').AsSingle := OPEN_WIDTH_DIVISOR;
    tblSeriesModel.FieldByName('OPEN_HEIGHT_DIVISOR').AsSingle := OPEN_HEIGHT_DIVISOR;

    tblSeriesModel.FieldByName('MIN_WIDTH_HEIGHT').AsSingle := MIN_WIDTH_HEIGHT;
    tblSeriesModel.FieldByName('MAX_WIDTH_HEIGHT').AsSingle := MAX_WIDTH_HEIGHT;

    tblSeriesModel.FieldByName('GLASS_EDGE_ID').AsInteger := GLASS_EDGE_ID;

    tblSeriesModel.Post;
    tblSeriesModel.Refresh;
  end;
end;

procedure TFramesfrm.btnCopyToSeriesClick(Sender: TObject);
var
model_id, GLASS_EDGE_ID: integer;
MIN_WIDTH, MAX_WIDTH, MIN_HEIGHT,
MAX_HEIGHT, MAX_AREA, MIN_WIDTH_HEIGHT,
MAX_WIDTH_HEIGHT, NFS_WIDTH_DEDUCT, NFS_HEIGHT_DEDUCT,
OPEN_WIDTH_DIVISOR, OPEN_HEIGHT_DIVISOR, PROD_HOURS: single;
msg_txt: string;
old_size_serid, new_size_serid: integer;
begin
//I could use a stored procedure here but I preferd to do it at dataset level
// because the db still in development phase, small db and no need for more performance
//This procedure is used during the setup phase and then VERY rarely thereafter
  if cbSeriesSize.Text = '' then //use is empty
    raise Exception.Create('Select New Series First');

  with CostingDM do begin
    if tblSeriesModel.IsEmpty then
      raise Exception.Create('No data to copy!');

    new_size_serid := luSeries.EditValue;
    old_size_serid := cbSeriesSize.EditValue;

    if old_size_serid = new_size_serid then
      raise exception.Create('You can not copy to same series');

    msg_txt := 'Copy all Models From: '+luSeries.Text+' To: '+cbSeriesSize.Text+' ?';
    if messagebox(handle, PWideChar(msg_txt),'Copy Series', mb_yesno+mb_iconquestion) <> idyes then exit;

    //----------------------begin copy
    MainSQL.Close;
    MainSQL.SQL.Text := 'Select * from SERIES_MODEL where SERIES_ID = :SERIES_ID';
    MainSQL.ParamByName('SERIES_ID').AsInteger := luSeries.EditValue;
    MainSQL.Open;

    MainSQL.First;
    tblSeriesModel.DisableControls;
    MProgBar.Position := 0;
    MProgBar.Visible := true;
    try
      while not MainSQL.Eof do begin
        model_id := MainSQL.FieldByName('MODEL_ID').AsInteger;

        MIN_WIDTH := MainSQL.FieldByName('MIN_WIDTH').AsSingle;
        MAX_WIDTH := MainSQL.FieldByName('MAX_WIDTH').AsSingle;
        MIN_HEIGHT := MainSQL.FieldByName('MIN_HEIGHT').AsSingle;
        MAX_HEIGHT := MainSQL.FieldByName('MAX_HEIGHT').AsSingle;
        MAX_AREA := MainSQL.FieldByName('MAX_AREA').AsSingle;

        NFS_WIDTH_DEDUCT := MainSQL.FieldByName('NFS_WIDTH_DEDUCT').AsSingle;
        NFS_HEIGHT_DEDUCT := MainSQL.FieldByName('NFS_HEIGHT_DEDUCT').AsSingle;

        OPEN_WIDTH_DIVISOR := tblSeriesModel.FieldByName('OPEN_WIDTH_DIVISOR').AsSingle;
        OPEN_HEIGHT_DIVISOR := tblSeriesModel.FieldByName('OPEN_HEIGHT_DIVISOR').AsSingle;

        MIN_WIDTH_HEIGHT := MainSQL.FieldByName('MIN_WIDTH_HEIGHT').AsSingle;
        MAX_WIDTH_HEIGHT := MainSQL.FieldByName('MAX_WIDTH_HEIGHT').AsSingle;

        GLASS_EDGE_ID := MainSQL.FieldByName('GLASS_EDGE_ID').AsInteger;
        PROD_HOURS := MainSQL.FieldByName('PROD_HOURS').AsSingle;

        tblSeriesModel.Insert;

        tblSeriesModel.FieldByName('SERIES_ID').AsInteger := cbSeriesSize.EditValue;
        tblSeriesModel.FieldByName('MODEL_ID').AsInteger := model_id;

        tblSeriesModel.FieldByName('MIN_WIDTH').AsSingle := MIN_WIDTH;
        tblSeriesModel.FieldByName('MAX_WIDTH').AsSingle := MAX_WIDTH;
        tblSeriesModel.FieldByName('MIN_HEIGHT').AsSingle := MIN_HEIGHT;
        tblSeriesModel.FieldByName('MAX_HEIGHT').AsSingle := MAX_HEIGHT;
        tblSeriesModel.FieldByName('MAX_AREA').AsSingle := MAX_AREA;

        tblSeriesModel.FieldByName('NFS_WIDTH_DEDUCT').AsSingle := NFS_WIDTH_DEDUCT;
        tblSeriesModel.FieldByName('NFS_HEIGHT_DEDUCT').AsSingle := NFS_HEIGHT_DEDUCT;

        tblSeriesModel.FieldByName('OPEN_WIDTH_DIVISOR').AsSingle := OPEN_WIDTH_DIVISOR;
        tblSeriesModel.FieldByName('OPEN_HEIGHT_DIVISOR').AsSingle := OPEN_HEIGHT_DIVISOR;

        tblSeriesModel.FieldByName('MIN_WIDTH_HEIGHT').AsSingle := MIN_WIDTH_HEIGHT;
        tblSeriesModel.FieldByName('MAX_WIDTH_HEIGHT').AsSingle := MAX_WIDTH_HEIGHT;

        tblSeriesModel.FieldByName('GLASS_EDGE_ID').AsInteger := GLASS_EDGE_ID;
        tblSeriesModel.FieldByName('PROD_HOURS').AsSingle := PROD_HOURS;

        tblSeriesModel.Post;

        MainSQL.Next;
        MProgBar.Position := MainSQL.RecNo * 100 div MainSQL.RecordCount;
        application.ProcessMessages;
      end;

    finally
      MProgBar.Visible := false;
      tblSeriesModel.EnableControls;
      tblSeriesModel.Refresh; //make records appear under correct series
    end;

    msg_txt := PWideChar('All records copied to series: "'+ cbSeriesSize.Text +'" successfully');
    messagebox(handle, PWideChar(msg_txt) ,'Series copied', mb_ok+mb_iconinformation);
  end;

end;

procedure TFramesfrm.btnAddScreenClick(Sender: TObject);
begin
  with CostingDM, vwScreens.DataController do begin
    if varIsSoftNull(luSerModel.EditValue) then
      raise Exception.Create('Select a Model first');

    tblScreen_SM.Insert;
    tblScreen_SM.FieldByName('SM_ID').AsInteger := luSerModel.EditValue;
    tblScreen_SM.FieldByName('SCREEN_ID').AsInteger :=
      Values[GetSelectedRowIndex(0), vwScreensSCREEN_ID.Index];

    tblScreen_SM.Post;
    tblScreen_SM.Refresh;

  end;
end;

procedure TFramesfrm.btnAddAllScreensClick(Sender: TObject);
begin
  with CostingDM do begin
    if varIsSoftNull(luSerModel.EditValue) then
      raise Exception.Create('Select a Model first');

    if tblScreen.IsEmpty then raise exception.Create('Screen Table is empty');
    if messagebox(handle, 'Are you sure you want to add all data ?','Add All', mb_yesno+mb_iconquestion) <> idyes then exit;

    tblScreen.DisableControls;
    MProgBar.Position := 0;
    MProgBar.Visible := true;
    try
      tblScreen.First;
      while not tblScreen.Eof do begin
        tblScreen_SM.Insert;
        tblScreen_SM.FieldByName('SCREEN_ID').AsInteger :=
          tblScreen.FieldByName('SCREEN_ID').AsInteger;
        tblScreen_SM.FieldByName('SM_ID').AsInteger := luSerModel.EditValue;

        tblScreen_SM.Post;

        tblScreen.Next;
        MProgBar.Position := tblScreen.RecNo * 100 div tblScreen.RecordCount;
        application.ProcessMessages;
      end;
    finally
      MProgBar.Visible := false;
      tblScreen.EnableControls;
      tblScreen_SM.Refresh;
    end;

  end;
end;

procedure TFramesfrm.btnCopyModelCalloutsClick(Sender: TObject);
var
ser_id, callout_size: integer;
begin
  if cbNewModel_Callouts.Text = '' then
    raise Exception.Create('Select Model to copy to first');

  with CostingDM do begin
    if tblCallouts.IsEmpty then
      raise Exception.Create('No Callouts to copy!');

    if cbNewModel_Callouts.EditValue = tblCallouts.FieldByName('MODEL_ID').AsInteger then
      raise Exception.Create('Can not copy to same model');

    ser_id := tblCallouts.FieldByName('SERIES_ID').AsInteger;
    callout_size := tblCallouts.FieldByName('CALLOUTS').AsInteger;

    tblCallouts.Insert;
    tblCallouts.FieldByName('SERIES_ID').AsInteger := ser_id;
    tblCallouts.FieldByName('MODEL_ID').AsInteger := cbNewModel_Callouts.EditValue;
    tblCallouts.FieldByName('CALLOUTS').AsInteger := callout_size;

    tblCallouts.Post;
    tblCallouts.Refresh;
    //messagebox(handle, 'Copied to new model','Copy callouts', mb_ok+mb_iconinformation);
  end;

end;

procedure TFramesfrm.btnCopySeriesCalloutsClick(Sender: TObject);
var
new_ser_id, old_ser_id: integer;
qst_msg: string;
begin
  if cbSeriesCallouts.Text = '' then //use is empty
    raise Exception.Create('Select New Series First');

  with CostingDM do begin
    if tblCallouts.IsEmpty then
      raise Exception.Create('No Callouts to copy!');

    old_ser_id := luSeries.EditValue;
    new_ser_id := cbSeriesCallouts.EditValue;

    if old_ser_id = new_ser_id then
      raise Exception.Create('You can not copy to same series');

    qst_msg := 'Copy all callouts From: '+luSeries.Text+' To: '+cbSeriesCallouts.Text+' ?';
    if messagebox(handle, PWideChar(qst_msg),'Copy Series', mb_yesno+mb_iconquestion) <> idyes then exit;

    //------- copy all callouts to new series
    MainSQL.Close;
    MainSQL.SQL.Text := 'select * from CALLOUTS where (SERIES_ID = :old_callout_serid)'
      + ' And (MODEL_ID IN (select MODEL_ID from SERIES_MODEL' //<<--models must exists in new series or skip it
      + ' Where (SERIES_MODEL.SERIES_ID = :new_callout_serid)   ))';
    MainSQL.ParamByName('old_callout_serid').AsInteger := old_ser_id;
    MainSQL.ParamByName('new_callout_serid').AsInteger := new_ser_id;
    MainSQL.Open;

    MainSQL.First;
    try
      while not MainSQL.Eof do begin
        ExecSQL.SQL.Text := 'INSERT INTO CALLOUTS (SERIES_ID, MODEL_ID, CALLOUTS)'
          + ' VALUES (:SERIES_ID, :MODEL_ID, :CALLOUTS)';

        ExecSQL.Params[0].AsInteger := new_ser_id;
        ExecSQL.Params[1].AsInteger := MainSQL.FieldByName('MODEL_ID').AsInteger;
        ExecSQL.Params[2].AsInteger := MainSQL.FieldByName('CALLOUTS').AsInteger;

        ExecSQL.Execute;

        MainSQL.Next;
      end;

      TransRead.CommitRetaining;
      messagebox(handle, 'Callouts copied to new series','Copy Series', mb_ok+mb_iconinformation);
    Except
      TransRead.RollbackRetaining;
      raise;
    end;
    tblSeries.Refresh;
    tblCallouts.Refresh;

  end;
end;

procedure TFramesfrm.btnCopySeriesClick(Sender: TObject);
var
warn_msg: string;
org_sm_id, org_ser_id: integer;
new_sm_id, new_ser_id: integer;
org_ser_name, new_ser_name: string;
begin
  with CostingDM do begin

    if VarIsSoftNull(luTarget_Series.EditValue) or VarIsSoftNull(luTarget_SModel.EditValue) then
      raise Exception.Create('You must select target Series and Model to copy!');


    // Series Model we copy from
    org_sm_id := luSerModel.EditValue;
    org_ser_id := luSeries.EditValue;

    //with luSerModel.Properties.Grid.DataController do
      //org_model_id := Values[FocusedRecordIndex, 2]; //Model_id

    // Series Model we copy to
    new_sm_id := luTarget_SModel.EditValue;
    new_ser_id := luTarget_Series.EditValue;

    //with luTarget_SModel.Properties.Grid.DataController do
      //new_model_id := Values[FocusedRecordIndex, 2]; //Model_id


    if new_sm_id = org_sm_id then
      raise Exception.Create('Can not copy to same series and model');

    org_ser_name := luSeries.Text+'/'+luSerModel.Text;
    new_ser_name := luTarget_Series.Text+'/'+luTarget_SModel.Text;

    warn_msg := 'This will copy Series Model''s Callouts, BOM and Prices from: "'+ org_ser_name +'" To series Model: "' + new_ser_name+'"';
    warn_msg := warn_msg + #13 + 'Are You Sure ?';
    if messagebox(handle, PWideChar(warn_msg),'Copy Series Model', mb_yesno+mb_iconquestion) <> idyes then exit;

    mStoredProc.StoredProcName := 'NATIVE_COPY_SERIES';
    mStoredProc.PrepareSQL(False);

    mStoredProc.ParamByName('P_ORG_SM_ID').AsInteger := org_sm_id;
    mStoredProc.ParamByName('P_ORG_SERIES_ID').AsInteger := org_ser_id;

    mStoredProc.ParamByName('P_NEW_SM_ID').AsInteger := new_sm_id;
    mStoredProc.ParamByName('P_NEW_SERIES_ID').AsInteger := new_ser_id;

    mStoredProc.ExecProc;

    TransRead.CommitRetaining;

    tblBOM.Refresh;
    tblSeriesModel.Refresh;
    tblCallouts.Refresh;
    tblSeriesColor.Refresh;
    tblSeriesNailfin.Refresh;

    pgcFrames.ActivePage := tsLog;
    mlog.Lines.Add(mStoredProc.ParamByName('O_LOG').AsString);

    messagedlg('Copy was Successful', mtInformation, [mbok],0);

  end;

end;

procedure TFramesfrm.btnCloseClick(Sender: TObject);
begin
  close
end;

procedure TFramesfrm.btnCopyCalloutsClick(Sender: TObject);
begin
  with CostingDM do begin
    mem_sm_id := cbModelCallout.EditValue;

    lblCalloutMem.Caption := 'Copied: '+inttostr(tblCallouts.RecordCount)+' Records'+#10#13
      + 'Series: '+luSeries.Text+', Model: '+cbModelCallout.Text;
  end;
end;

procedure TFramesfrm.btnPasteCalloutsClick(Sender: TObject);
begin
  with CostingDM do begin
    if mem_sm_id = cbModelCallout.EditValue then raise Exception.Create('Can not copy callouts to same location');

    mStoredProc.StoredProcName := 'COPY_CALLOUTS_PROC';
    mStoredProc.PrepareSQL(false);

    mStoredProc.ParamByName('p_org_sm_id').AsInteger := mem_sm_id;
    mStoredProc.ParamByName('p_new_sm_id').AsInteger := cbModelCallout.EditValue;

    mStoredProc.ExecProc;
    TransRead.CommitRetaining;

    tblCallouts.Refresh;

    mem_sm_id := 0;
    lblCalloutMem.Caption := 'Record Copy Finish';

  end;

end;

procedure TFramesfrm.Button1Click(Sender: TObject);
begin
  with CostingDM, vwStrucPerf.DataController do begin
    if varIsSoftNull(luSerModel.EditValue) then
      raise Exception.Create('Select a Model first');

    tblStruc_Perf_SM.Insert;
    tblStruc_Perf_SM.FieldByName('SM_ID').AsInteger := luSerModel.EditValue;
    tblStruc_Perf_SM.FieldByName('STRUC_PERF_ID').AsInteger :=
      Values[GetSelectedRowIndex(0), vwStrucPerfSTRUC_PERF_ID.Index];

    tblStruc_Perf_SM.Post;
    tblStruc_Perf_SM.Refresh;

  end;
end;

procedure TFramesfrm.Button2Click(Sender: TObject);
begin
  with CostingDM do begin
    if varIsSoftNull(luSerModel.EditValue) then
      raise Exception.Create('Select a Model first');

    ExecSQL.SQL.Text := 'Insert into STRUC_PERF_SM (SM_ID, STRUC_PERF_ID)'
      + ' Select :sm_id, STRUC_PERF_ID'
      + ' From STRUC_PERF';

    ExecSQL.ParamByName('sm_id').AsInteger := luSerModel.EditValue;

    ExecSQL.Execute;
    TransRead.CommitRetaining;

    tblStruc_Perf_SM.Refresh;

  end;

end;

procedure TFramesfrm.cbSeriesPropertiesEditValueChanged(Sender: TObject);
begin
  with CostingDM do begin
    if luSerModel.Properties.DataController.RecordCount > 0 then
      luSerModel.ItemIndex := 0
    else
      luSerModel.Clear;

  end;
end;

procedure TFramesfrm.btnAllCopyClick(Sender: TObject);
begin
  with CostingDM do begin
    if messagebox(handle, 'Are you sure you wish to Add All Models?','Add All', mb_yesno+mb_iconquestion) <> idyes then exit;

    tblmodels.DisableControls;
    MProgBar.Position := 0;
    MProgBar.Visible := true;
    try
      tblmodels.First;
      while not tblmodels.Eof do begin
        tblSeriesModel.Append;
        tblSeriesModel.FieldByName('SERIES_ID').AsInteger := tblSeries.FieldByName('SERIES_ID').AsInteger;
        tblSeriesModel.FieldByName('MODEL_ID').AsInteger :=
          tblmodels.FieldByName('MODEL_ID').AsInteger;

        tblSeriesModel.FieldByName('GLASS_EDGE_ID').AsInteger := tblUserSettings.FieldByName('GLASS_EDGE_ID').AsInteger;

        tblSeriesModel.Post;

        tblmodels.Next;
        MProgBar.Position := tblmodels.RecNo * 100 div tblmodels.RecordCount;
        application.ProcessMessages;
      end;
    finally
      MProgBar.Visible := false;
      tblSeriesModel.Refresh;
      tblmodels.EnableControls;
    end;

  end;
end;

procedure TFramesfrm.btnSelectedCopyClick(Sender: TObject);
var
sel_idx: integer;
begin
  with CostingDM, viewModels.Controller do begin
    if SelectedRecordCount < 1 then
      raise Exception.Create('Select Model(s) first');

    tblmodels.DisableControls;
    try
      for sel_idx := 0 to SelectedRecordCount -1 do begin
        tblSeriesModel.Append;
        tblSeriesModel.FieldByName('SERIES_ID').AsInteger := tblSeries.FieldByName('SERIES_ID').AsInteger;
        tblSeriesModel.FieldByName('MODEL_ID').AsInteger := SelectedRecords[sel_idx].Values[viewModelsMODEL_ID.Index];
          //Values[GetSelectedRowIndex(sel_idx), viewModelsMODEL_ID.Index];

        tblSeriesModel.FieldByName('GLASS_EDGE_ID').AsInteger := tblUserSettings.FieldByName('GLASS_EDGE_ID').AsInteger;

        tblSeriesModel.Post;
      end;

    finally
      tblSeriesModel.Refresh;
      tblmodels.EnableControls;
    end;

  end;

end;

procedure TFramesfrm.btnXLSExportClick(Sender: TObject);
var
grd_idx: integer;
export_dir: string;
begin
  with CostingDM do begin
    if LoggedUser.UGroup * [APP_UG_SUPER_USERS, APP_UG_ADMINS] = [] then
      raise Exception.Create('You dont have permission for this feature');

  end;


  export_dir := 'c:\costing export\';
  SysUtils.ForceDirectories(export_dir);

  for grd_idx := 0 to pred(pgcFrames.ActivePage.ControlCount) do begin

    if (pgcFrames.ActivePage.Controls[grd_idx] is TcxGrid) then
      ExportGridToXLSX(export_dir+(pgcFrames.ActivePage.Controls[grd_idx] as TcxGrid).Name, (pgcFrames.ActivePage.Controls[grd_idx] as TcxGrid),
        true, true, true, 'xlsx');

  end;


end;

procedure TFramesfrm.cxLookupComboBox1PropertiesEditValueChanged(Sender: TObject);
//var
//LGrid: TcxCustomLookupGrid;
//col_Series_ID: TcxLookupGridColumn;
begin
  with CostingDM do begin
    if VarIsSoftNull(luTarget_Series.EditValue) then exit;

    tblSerMod_Lookup.Close;
    tblSerMod_Lookup.SaveSQL;
    tblSerMod_Lookup.AddWhere('series_model.series_id = :sid');
    tblSerMod_Lookup.ParamByName('sid').AsInteger := luTarget_Series.EditValue;
    tblSerMod_Lookup.Open;

    {if VarIsSoftNull(luTarget_Series.EditValue) then exit;

    luTarget_SModel.EditValue := null;

    LGrid := luTarget_SModel.ActiveProperties.Grid;

    //to use ColumnByFieldName you must declare the column as TcxLookupDBGridColumn and to add cxLookupDBGrid to uses clause
    col_Series_ID := LGrid.Columns[2]; //.ColumnByFieldName('SERIES_ID');

    with LGrid.DataController.Filter do begin
      Clear;
      Root.AddItem(col_SERIES_ID, foEqual, luTarget_Series.EditValue, VarToStr(luTarget_Series.EditValue));
      Active := True;
    end;}


  end;

end;

procedure TFramesfrm.btnAddAllPaintClick(Sender: TObject);
begin
  with CostingDM do begin
    if varIsSoftNull(luSerModel.EditValue) then
      raise Exception.Create('Select a Model first');

    if tblPaint.IsEmpty then raise exception.Create('Paint Table is empty');
    if messagebox(handle, 'Are you sure add all visible data ?','Add All', mb_yesno+mb_iconquestion) <> idyes then exit;

    tblPaint.DisableControls;
    MProgBar.Position := 0;
    MProgBar.Visible := true;
    try
      tblPaint.First;
      while not tblPaint.Eof do begin
        tblPaint_SM.Insert;
        tblPaint_SM.FieldByName('PAINT_ID').AsInteger :=
          tblPaint.FieldByName('PAINT_ID').AsInteger;
        tblPaint_SM.FieldByName('SM_ID').AsInteger := luSerModel.EditValue;

        tblPaint_SM.Post;

        tblPaint.Next;
        MProgBar.Position := tblPaint.RecNo * 100 div tblPaint.RecordCount;
        application.ProcessMessages;
      end;
    finally
      MProgBar.Visible := false;
      tblPaint.EnableControls;
      tblPaint_SM.Refresh;
    end;

  end;
end;

end.
