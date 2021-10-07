//TODO -cdbCHANGE :I added field IS_DEFAULT to tables WINLOCK_SM, SCREEN_SM and PAINT_SM
//need to show IS_DEFAULT field in gridLock and gridPaint

unit frmlookup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView,
  cxGrid, cxPC, cxContainer, Menus, StdCtrls, cxButtons, cxGroupBox, cxDBLookupComboBox, cxSpinEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxCheckBox, Grids, DBGrids, cxCurrencyEdit, cxLabel, cxButtonEdit;

type
  Tlookupfrm = class(TForm)
    MainTabs: TcxPageControl;
    tsGlazing: TcxTabSheet;
    tsGridKind: TcxTabSheet;
    tsGridPattern: TcxTabSheet;
    tsLock: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1GLAZING_NAME: TcxGridDBColumn;
    cxGridDBTableView1GLAZING_DESCRIPTION: TcxGridDBColumn;
    cxGridDBTableView1IS_VISIBLE: TcxGridDBColumn;
    cxGridDBTableView1GUI_SEQUENCE: TcxGridDBColumn;
    cxGridDBTableView1OPERATOR: TcxGridDBColumn;
    cxGridDBTableView1DATE_SAVED: TcxGridDBColumn;
    cxGridDBTableView1OPERATOR_LAST_MODIFIED: TcxGridDBColumn;
    cxGridDBTableView1DATE_LAST_MODIFIED: TcxGridDBColumn;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableView2GKIND_NAME: TcxGridDBColumn;
    cxGridDBTableView2GKIND_DESCRIPTION: TcxGridDBColumn;
    cxGridDBTableView2IS_VISIBLE: TcxGridDBColumn;
    cxGridDBTableView2GUI_SEQUENCE: TcxGridDBColumn;
    cxGridDBTableView2OPERATOR: TcxGridDBColumn;
    cxGridDBTableView2DATE_SAVED: TcxGridDBColumn;
    cxGridDBTableView2OPERATOR_LAST_MODIFIED: TcxGridDBColumn;
    cxGridDBTableView2DATE_LAST_MODIFIED: TcxGridDBColumn;
    cxGrid3: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    cxGridDBTableView3GPATTERN_NAME: TcxGridDBColumn;
    cxGridDBTableView3GPATTERN_DESCRIPTION: TcxGridDBColumn;
    cxGridDBTableView3IS_VISIBLE: TcxGridDBColumn;
    cxGridDBTableView3GUI_SEQUENCE: TcxGridDBColumn;
    cxGridDBTableView3OPERATOR: TcxGridDBColumn;
    cxGridDBTableView3DATE_SAVED: TcxGridDBColumn;
    cxGridDBTableView3OPERATOR_LAST_MODIFIED: TcxGridDBColumn;
    cxGridDBTableView3DATE_LAST_MODIFIED: TcxGridDBColumn;
    gridLock: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    cxGridDBTableView4WINLOCK_NAME: TcxGridDBColumn;
    cxGridDBTableView4WINLOCK_DESCRIPTION: TcxGridDBColumn;
    cxGridDBTableView4IS_VISIBLE: TcxGridDBColumn;
    cxGridDBTableView4GUI_SEQUENCE: TcxGridDBColumn;
    cxGridDBTableView4OPERATOR: TcxGridDBColumn;
    cxGridDBTableView4DATE_SAVED: TcxGridDBColumn;
    cxGridDBTableView4OPERATOR_LAST_MODIFIED: TcxGridDBColumn;
    cxGridDBTableView4DATE_LAST_MODIFIED: TcxGridDBColumn;
    tsGlassType: TcxTabSheet;
    tsGlassKind: TcxTabSheet;
    cxGrid6: TcxGrid;
    cxGridDBTableView6: TcxGridDBTableView;
    cxGridLevel6: TcxGridLevel;
    cxGridDBTableView6GLASS_TYPE_ID: TcxGridDBColumn;
    cxGridDBTableView6GLASS_KIND_ID: TcxGridDBColumn;
    cxGridDBTableView6GLASS_NAME: TcxGridDBColumn;
    cxGridDBTableView6TEMPERED: TcxGridDBColumn;
    cxGridDBTableView6DESCRIPTION: TcxGridDBColumn;
    cxGridDBTableView6THICKNESS: TcxGridDBColumn;
    cxGridDBTableView6AREA: TcxGridDBColumn;
    cxGridDBTableView6COST: TcxGridDBColumn;
    cxGridDBTableView6GUI_SEQUENCE: TcxGridDBColumn;
    cxGridDBTableView6IS_VISIBLE: TcxGridDBColumn;
    cxGrid7: TcxGrid;
    cxGridDBTableView7: TcxGridDBTableView;
    cxGridLevel7: TcxGridLevel;
    cxGridDBTableView7GLASS_KIND_ID: TcxGridDBColumn;
    cxGridDBTableView7GLASS_KIND: TcxGridDBColumn;
    cxGridDBTableView7DESCRIPTION: TcxGridDBColumn;
    Label1: TLabel;
    cxGrid8: TcxGrid;
    cxGridDBTableView8: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel8: TcxGridLevel;
    cxGrid9: TcxGrid;
    cxGridDBTableView9: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridLevel9: TcxGridLevel;
    Label2: TLabel;
    Label3: TLabel;
    cxGridDBTableView7Column1: TcxGridDBColumn;
    cxGridDBTableView7Column2: TcxGridDBColumn;
    cxGridDBTableView8Column1: TcxGridDBColumn;
    cxGridDBTableView8Column2: TcxGridDBColumn;
    cxGridDBTableView9Column1: TcxGridDBColumn;
    cxGridDBTableView9Column2: TcxGridDBColumn;
    tsSTC: TcxTabSheet;
    cxGrid10: TcxGrid;
    cxGridDBTableView11: TcxGridDBTableView;
    cxGridLevel11: TcxGridLevel;
    cxGridDBTableView11STC: TcxGridDBColumn;
    cxGridDBTableView11GT_INNER: TcxGridDBColumn;
    cxGridDBTableView11GT_MIDDLE: TcxGridDBColumn;
    cxGridDBTableView11GT_OUTER: TcxGridDBColumn;
    cxGridDBTableView11TYPE_INNER: TcxGridDBColumn;
    cxGridDBTableView11TYPE_MIDDLE: TcxGridDBColumn;
    cxGridDBTableView11TYPE_OUTER: TcxGridDBColumn;
    cxGridDBTableView11IS_VISIBLE: TcxGridDBColumn;
    cxGridDBTableView11GUI_SEQUENCE: TcxGridDBColumn;
    cxGridDBTableView11OPERATOR: TcxGridDBColumn;
    cxGridDBTableView11DATE_SAVED: TcxGridDBColumn;
    cxGridDBTableView11OPERATOR_LAST_MODIFIED: TcxGridDBColumn;
    cxGridDBTableView11DATE_LAST_MODIFIED: TcxGridDBColumn;
    cxGridDBTableView4Cost: TcxGridDBColumn;
    btnClose: TcxButton;
    tsPaint: TcxTabSheet;
    gridPaint: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    grpSerModel: TcxGroupBox;
    cbSeries: TcxLookupComboBox;
    Label7: TLabel;
    luSerModel: TcxLookupComboBox;
    Label8: TLabel;
    cxGridDBTableView5PAINT_SM_ID: TcxGridDBColumn;
    cxGridDBTableView5SM_ID: TcxGridDBColumn;
    cxGridDBTableView5PAINT_ID: TcxGridDBColumn;
    cxGridDBTableView5COST: TcxGridDBColumn;
    cxGridDBTableView5IS_VISIBLE: TcxGridDBColumn;
    cxGridDBTableView5GUI_SEQUENCE: TcxGridDBColumn;
    cxGridDBTableView5OPERATOR: TcxGridDBColumn;
    cxGridDBTableView5DATE_SAVED: TcxGridDBColumn;
    cxGridDBTableView5OPERATOR_LAST_MODIFIED: TcxGridDBColumn;
    cxGridDBTableView5DATE_LAST_MODIFIED: TcxGridDBColumn;
    cxGridDBTableView5SERIES_ID: TcxGridDBColumn;
    cxGridDBTableView5MODEL_ID: TcxGridDBColumn;
    cxGridDBTableView5PAINT_NAME: TcxGridDBColumn;
    cxGridDBTableView5PAINT_DESCRIPTION: TcxGridDBColumn;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    cxGridDBTableView5Column1: TcxGridDBColumn;
    cxGridDBTableView4Column1: TcxGridDBColumn;
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure MainTabsChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lookupfrm: Tlookupfrm;

implementation

uses dmCosting;

{$R *.dfm}

procedure Tlookupfrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure Tlookupfrm.cxButton2Click(Sender: TObject);
begin
  close;
end;

procedure Tlookupfrm.FormShow(Sender: TObject);
begin
  cbSeries.ItemIndex := 0;
  luSerModel.ItemIndex := 0;
  MainTabs.ActivePageIndex := 0;
  //luSeries_ESL.ItemIndex := 0;
end;

procedure Tlookupfrm.MainTabsChange(Sender: TObject);
begin
  grpSerModel.Visible := (MainTabs.ActivePage = tsLock) or (MainTabs.ActivePage = tsPaint) or (MainTabs.ActivePage = tsSTC);
end;

end.
