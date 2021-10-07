unit frmBOMold;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxPC,
  cxContainer, cxEdit, StdCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxProgressBar;

type
  TBOMfrmold = class(TForm)
    cxPageControl2: TcxPageControl;
    cxTabSheet6: TcxTabSheet;
    cxTabSheet7: TcxTabSheet;
    cxTabSheet8: TcxTabSheet;
    Label1: TLabel;
    Button2: TButton;
    Label2: TLabel;
    Label4: TLabel;
    gridLookupModels: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    cxGridDBTableView2Column2: TcxGridDBColumn;
    colLOOKUP_ID: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    Label5: TLabel;
    gridSeriesModel: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBTableView3Column1: TcxGridDBColumn;
    cxGridDBTableView3Column2: TcxGridDBColumn;
    colModel: TcxGridDBColumn;
    colDesc: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    btnAddModel: TButton;
    Label3: TLabel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    Button1: TButton;
    Label7: TLabel;
    cxGrid3: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    cxGrid4: TcxGrid;
    cxGridDBTableView6: TcxGridDBTableView;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    Button4: TButton;
    Label9: TLabel;
    btnCopySeries: TButton;
    Button3: TButton;
    Button5: TButton;
    cbSeries: TcxLookupComboBox;
    MProgBar: TcxProgressBar;
    cxGridDBTableView3Column3: TcxGridDBColumn;
    Button6: TButton;
    cxGridDBTableView3Column4: TcxGridDBColumn;
    cxTabSheet1: TcxTabSheet;
    cxGrid5: TcxGrid;
    cxGridDBTableView7: TcxGridDBTableView;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    cxGridDBTableView7Column1: TcxGridDBColumn;
    cxGridDBTableView7Column2: TcxGridDBColumn;
    cxGridDBTableView7Column3: TcxGridDBColumn;
    cxGridDBTableView7Column4: TcxGridDBColumn;
    cxGridDBTableView7Column5: TcxGridDBColumn;
    cxLookupComboBox1: TcxLookupComboBox;
    cxLookupComboBox2: TcxLookupComboBox;
    cxProgressBar1: TcxProgressBar;
    cxProgressBar2: TcxProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BOMfrmold: TBOMfrmold;

implementation

{$R *.dfm}

end.
