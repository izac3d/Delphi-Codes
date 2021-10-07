unit sfrmSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Vcl.ComCtrls,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Menus, StdCtrls, cxButtons,
  cxGroupBox, cxPC, cxTextEdit, cxMemo, cxDBEdit, cxLabel, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, dxSkinsCore, dxSkinLondonLiquidSky, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxNavigator, cxDBLookupComboBox,  dxSpellChecker, cxGrid, cxRichEdit, cxDBRichEdit,
  cxCheckBox;



type
  TSettingsfrm = class(TForm)
    pgcSettings: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    cxTabSheet2: TcxTabSheet;
    gridLocations: TcxGrid;
    vwLocation: TcxGridDBTableView;
    vwLocationLOCATION_ID: TcxGridDBColumn;
    vwLocationLOCATIONS_NAME: TcxGridDBColumn;
    gridLocationsLevel1: TcxGridLevel;
    vwLocationADDRESS: TcxGridDBColumn;
    cxTabSheet3: TcxTabSheet;
    cxGrid1: TcxGrid;
    vwCells: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    vwCellsWORKCELL_ID: TcxGridDBColumn;
    vwCellsWORKCELL_NAME: TcxGridDBColumn;
    vwCellsLOCATION_ID: TcxGridDBColumn;
    dxSpellChecker1: TdxSpellChecker;
    btnCheckSpelling: TcxButton;
    vwCellsWORKCELL_TYPE_ID: TcxGridDBColumn;
    cxTabSheet4: TcxTabSheet;
    grdWCT: TcxGrid;
    vwWCT: TcxGridDBTableView;
    vwWCTWORKCELL_TYPE: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    reDisc2: TcxDBRichEdit;
    reBranches: TcxDBRichEdit;
    reDisc1: TcxDBRichEdit;
    gbFontFormat: TcxGroupBox;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    cxButton9: TcxButton;
    cxButton10: TcxButton;
    cxButton11: TcxButton;
    cxTabSheet5: TcxTabSheet;
    cxGrid2: TcxGrid;
    vwZipCodes: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    vwZipCodesZIPCODE: TcxGridDBColumn;
    vwZipCodesCITY: TcxGridDBColumn;
    vwZipCodesSTATE: TcxGridDBColumn;
    vwZipCodesSALES_TAX_RATE: TcxGridDBColumn;
    vwZipCodesJURISDICTION: TcxGridDBColumn;
    vwZipCodesSALES_TAX_REPCODE: TcxGridDBColumn;
    vwZipCodesCOUNTY: TcxGridDBColumn;
    vwZipCodesDELIVERY_COST: TcxGridDBColumn;
    vwZipCodesIS_DELIVERY_TAXABLE: TcxGridDBColumn;
    vwZipCodesZIP_MULTI_WINPRICE: TcxGridDBColumn;
    vwCellsGUI_SEQUENCE: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCheckSpellingClick(Sender: TObject);
    procedure reBranchesEnter(Sender: TObject);
    procedure reDisc1Enter(Sender: TObject);
    procedure reDisc2Enter(Sender: TObject);
    procedure actUnderLineExecute(Sender: TObject);
    procedure cxTabSheet1Show(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton9Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton10Click(Sender: TObject);
    procedure cxButton11Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    curEditor: TcxDBRichEdit;
  public
    { Public declarations }
  end;

var
  Settingsfrm: TSettingsfrm;

implementation

uses DMReports, dmCosting;

{$R *.dfm}

procedure TSettingsfrm.actUnderLineExecute(Sender: TObject);
begin
  if fsUnderline in curEditor.SelAttributes.Style then
    curEditor.SelAttributes.Style := curEditor.SelAttributes.Style - [fsUnderline]
  else
    curEditor.SelAttributes.Style := curEditor.SelAttributes.Style + [fsUnderline];
end;

procedure TSettingsfrm.btnCheckSpellingClick(Sender: TObject);
begin
  dxSpellChecker1.CheckContainer(pgcSettings.ActivePage, true);
end;

procedure TSettingsfrm.cxButton10Click(Sender: TObject);
begin
  curEditor.SelAttributes.Size := curEditor.SelAttributes.Size + 1;
end;

procedure TSettingsfrm.cxButton11Click(Sender: TObject);
begin
  curEditor.SelAttributes.Size := curEditor.SelAttributes.Size - 1;
end;

procedure TSettingsfrm.cxButton1Click(Sender: TObject);
begin
  with ReportsDM, CostingDM do begin
    RepSet.Cancel;

    tblLocationStock.Cancel;

  end;

  Close;

end;

procedure TSettingsfrm.cxButton2Click(Sender: TObject);
begin
  with ReportsDM, CostingDM do begin

    if RepSet.State in dseditmodes then
      RepSet.post;

    if tblLocationStock.State in dseditmodes then
      tblLocationStock.Post;

  end;

  Close;

end;

procedure TSettingsfrm.cxButton3Click(Sender: TObject);
begin
  if fsBold in curEditor.SelAttributes.Style then
    curEditor.SelAttributes.Style := curEditor.SelAttributes.Style - [fsBold]
  else
    curEditor.SelAttributes.Style := curEditor.SelAttributes.Style + [fsBold];
end;

procedure TSettingsfrm.cxButton4Click(Sender: TObject);
begin
  if fsItalic in curEditor.SelAttributes.Style then
    curEditor.SelAttributes.Style := curEditor.SelAttributes.Style - [fsItalic]
  else
    curEditor.SelAttributes.Style := curEditor.SelAttributes.Style + [fsItalic];
end;

procedure TSettingsfrm.cxButton5Click(Sender: TObject);
begin
  if fsUnderLine in curEditor.SelAttributes.Style then
    curEditor.SelAttributes.Style := curEditor.SelAttributes.Style - [fsUnderLine]
  else
    curEditor.SelAttributes.Style := curEditor.SelAttributes.Style + [fsUnderLine];

end;

procedure TSettingsfrm.cxButton6Click(Sender: TObject);
begin
  curEditor.Paragraph.Numbering := nsBullet;
end;

procedure TSettingsfrm.cxButton7Click(Sender: TObject);
begin
  curEditor.Paragraph.Alignment := taLeftJustify;
end;

procedure TSettingsfrm.cxButton8Click(Sender: TObject);
begin
  curEditor.Paragraph.Alignment := taCenter;
end;

procedure TSettingsfrm.cxButton9Click(Sender: TObject);
begin
  curEditor.Paragraph.Alignment := taRightJustify;
end;

procedure TSettingsfrm.cxTabSheet1Show(Sender: TObject);
begin
  with CostingDM do begin
    //richBranches

  end;

end;

procedure TSettingsfrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  vwLocation.StoreToIniFile('c:\costingapp\vwLocation.ini', true, [], 'vwLocation');
  vwCells.StoreToIniFile('c:\costingapp\vwCells.ini', true, [], 'vwCells');

  action := cafree;
end;

procedure TSettingsfrm.FormDestroy(Sender: TObject);
begin
  Settingsfrm := nil;
end;

procedure TSettingsfrm.FormShow(Sender: TObject);
begin
  //cxPageControl1.HideTabs := true;

  with ReportsDM do begin
    RepSet.open;

  end;

  forcedirectories('c:\costingapp');
  vwLocation.RestoreFromIniFile('c:\costingapp\vwLocation.ini', false, false, [], 'vwLocation');
  vwCells.RestoreFromIniFile('c:\costingapp\vwCells.ini', false, false, [], 'vwCells');
end;

procedure TSettingsfrm.reBranchesEnter(Sender: TObject);
begin
  curEditor := reBranches;

  gbFontFormat.Top := curEditor.Top - gbFontFormat.Height;
  gbFontFormat.Visible := true;
end;

procedure TSettingsfrm.reDisc1Enter(Sender: TObject);
begin
  curEditor := reDisc1;

  gbFontFormat.Top := curEditor.Top - gbFontFormat.Height;
  gbFontFormat.Visible := true;
end;

procedure TSettingsfrm.reDisc2Enter(Sender: TObject);
begin
  curEditor := reDisc2;

  gbFontFormat.Top := curEditor.Top - gbFontFormat.Height;
  gbFontFormat.Visible := true;
end;

end.
