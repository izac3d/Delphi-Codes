unit frmSMPrices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Menus, StdCtrls, cxButtons,
  cxGroupBox, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TPricesfrm = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    gridPrices: TcxGrid;
    gridPricesDBTableView1: TcxGridDBTableView;
    gridPricesLevel1: TcxGridLevel;
    gridPricesDBTableView1MIN_WIDTH: TcxGridDBColumn;
    gridPricesDBTableView1MAX_WIDTH: TcxGridDBColumn;
    gridPricesDBTableView1MIN_HEIGHT: TcxGridDBColumn;
    gridPricesDBTableView1MAX_HEIGHT: TcxGridDBColumn;
    gridPricesDBTableView1BASE_PRICE: TcxGridDBColumn;
    gridPricesDBTableView1THIRD_PANELS_XOX: TcxGridDBColumn;
    gridPricesDBTableView1BEIGE: TcxGridDBColumn;
    gridPricesDBTableView1DESERT_SAND: TcxGridDBColumn;
    gridPricesDBTableView1BL_NAILFIN: TcxGridDBColumn;
    gridPricesDBTableView1FF1_NAILFIN: TcxGridDBColumn;
    gridPricesDBTableView1FF2_NAILFIN: TcxGridDBColumn;
    gridPricesDBTableView1WIDTH_ADD: TcxGridDBColumn;
    gridPricesDBTableView1HEIGHT_ADD: TcxGridDBColumn;
    gridPricesDBTableView1LE2: TcxGridDBColumn;
    gridPricesDBTableView1LE3: TcxGridDBColumn;
    gridPricesDBTableView1OBS: TcxGridDBColumn;
    gridPricesDBTableView1RAIN: TcxGridDBColumn;
    gridPricesDBTableView1GLUECHIP: TcxGridDBColumn;
    gridPricesDBTableView1TEMP: TcxGridDBColumn;
    gridPricesDBTableView1FLAT_GRIDS: TcxGridDBColumn;
    gridPricesDBTableView1SCULPT_GRIDS: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cbSM: TcxLookupComboBox;
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pricesfrm: TPricesfrm;

implementation

uses dmCosting;

{$R *.dfm}

procedure TPricesfrm.cxButton1Click(Sender: TObject);
begin
  close;
end;

procedure TPricesfrm.FormShow(Sender: TObject);
begin
  cbSM.ItemIndex := 0;
end;

end.
