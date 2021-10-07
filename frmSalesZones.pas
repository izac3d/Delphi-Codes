unit frmSalesZones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  ExtCtrls, cxNavigator, cxDBNavigator, StdCtrls,
  cxButtons, cxStyles,  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxDropDownEdit, cxContainer,
  cxLabel, cxGroupBox, cxHyperLinkEdit, cxImageComboBox, dxSkinsCore,
  dxSkinLondonLiquidSky, dxSkinscxPCPainter, cxDBLookupComboBox, cxBlobEdit;

type
  TSalesZonesfrm = class(TForm)
    btnCancel: TcxButton;
    btnSave: TcxButton;
    vwSZones: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    btnDelete: TcxButton;
    btnAdd: TcxButton;
    vwSZonesZONE_NO: TcxGridDBColumn;
    vwSZonesZONE_DESCRIPTION: TcxGridDBColumn;
    procedure btnDeleteClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SalesZonesfrm: TSalesZonesfrm;

implementation

uses dmCosting;

{$R *.dfm}

procedure TSalesZonesfrm.btnDeleteClick(Sender: TObject);
begin
  with CostingDM do begin
    if messagebox(handle, 'Delete selected user ?','Delete', mb_yesno+mb_iconquestion) <> idyes then exit;
    tblSalesZone.Delete;
  end;
end;

procedure TSalesZonesfrm.btnAddClick(Sender: TObject);
begin
  with CostingDM do begin
    tblSalesZone.Append;
  end;
end;

end.
