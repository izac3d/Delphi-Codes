unit frmSeries;
//Done -cBUG  : still cannot edit or add to SeriesGrid
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Menus, StdCtrls, cxButtons,
  cxCheckBox, cxNavigator, dxSkinsCore, dxSkinLondonLiquidSky, dxSkinscxPCPainter, dxSpellChecker;

type
  TSeriesfrm = class(TForm)
    vwSeries: TcxGridDBTableView;
    SeriesGridLevel1: TcxGridLevel;
    SeriesGrid: TcxGrid;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    vwSeriesSERIES_ID: TcxGridDBColumn;
    vwSeriesSERIES_NAME: TcxGridDBColumn;
    vwSeriesSERIES_DESCRIPTION: TcxGridDBColumn;
    vwSeriesGUI_SEQUENCE: TcxGridDBColumn;
    vwSeriesColumn1: TcxGridDBColumn;
    btnClose: TcxButton;
    dxSpellChecker1: TdxSpellChecker;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Seriesfrm: TSeriesfrm;

implementation

uses dmCosting;

{$R *.dfm}

procedure TSeriesfrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

end.
