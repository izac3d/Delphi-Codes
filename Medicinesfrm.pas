unit Medicinesfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters, cxDBLookupComboBox, cxDBExtLookupComboBox,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, StdCtrls, cxButtons, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls,
  cxLookAndFeels, dxSkinsForm, Sharp2;

type
  TfrmMedicines = class(TForm)
    Label1: TLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxButton1: TcxButton;
    cxLookupComboBox1: TcxLookupComboBox;
    cxButton2: TcxButton;
    cxGrid1DBTableView1MED_NAME: TcxGridDBColumn;
    Bevel1: TBevel;
    cxButton3: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMedicines: TfrmMedicines;

implementation

uses DM;

{$R *.dfm}

procedure TfrmMedicines.cxButton1Click(Sender: TObject);
begin
  with MainDM do begin
    tblALL_MEDS.Append;
    tblALL_MEDS.FieldByName('MED_NAME').AsString := cxLookupComboBox1.Text;
    tblALL_MEDS.Post;


  end;
end;

procedure TfrmMedicines.cxButton2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMedicines.cxButton3Click(Sender: TObject);
begin
  with MainDM do begin
    tblALL_MEDS.Delete;
  end;
end;

procedure TfrmMedicines.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmMedicines.FormDestroy(Sender: TObject);
begin
  frmMedicines := nil;
end;

procedure TfrmMedicines.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if key = 113 then cxButton1.OnClick(sender); //f2
  if key = 116 then cxButton3.OnClick(sender); //f5
  
  if key = 121 then cxButton2.OnClick(sender); //f10
end;

end.
