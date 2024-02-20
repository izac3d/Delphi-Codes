unit ExpPro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Buttons, ExtCtrls, DBCtrls, StdCtrls, DB, registry;

type
  TForm1 = class(TForm)
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure DBGrid2Enter(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  ExpDM, MExpFrm, dexpfrm, repfrm;


procedure TForm1.DBGrid2Enter(Sender: TObject);
begin
  DBNavigator1.DataSource := edm.dsDExp;
end;

procedure TForm1.DBGrid1Enter(Sender: TObject);
begin
  DBNavigator1.DataSource := edm.dsMEXp;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  application.Terminate;
end;



procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Mexp.showmodal;  
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
dexp.showmodal;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0: edm.tblMEXp.IndexName := '';
    1: edm.tblMEXp.IndexName := 'idx_mexpname';
  end;

end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
try

  case ComboBox1.ItemIndex of
    0: edm.tblMEXp.Locate('Exp_Code', strtofloat(edit1.text), [lopartialkey]);
    1: edm.tblMEXp.Locate('Exp_Name', edit1.text, [lopartialkey]);
  end;
except

end;  

end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
{  case ComboBox2.ItemIndex of
    0: edm.tblDExp.IndexName := 'idx_dexpno';
    1: edm.tblDExp.IndexName := 'idx_date';
    2: edm.tblDExp.IndexName := 'idx_expname';

  end;}

end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
try
  case ComboBox2.ItemIndex of
    0: edm.tblDExp.Locate('DExp_No', strtoint(edit2.text), [lopartialkey]);
    1: edm.tblDExp.Locate('Exp_Name', edit2.text, [lopartialkey]);
    2: edm.tblDExp.Locate('Exp_Date', strtodate(edit2.text), []);
  end;
except

end;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
ExpRep.showmodal;
end;

procedure TForm1.FormShow(Sender: TObject);
//var
//phkResult: integer;
begin
{    if regopenkeyex(HKEY_LOCAL_MACHINE,
      'Software\system\control\cm',
      0, KEY_ALL_ACCESS, phkResult) <> ERROR_SUCCESS then begin

    messagebox(application.handle, 'license not found, program will close', 'Error',
      mb_ok + mb_iconinformation);

    Application.Terminate;
  end}

end;

end.
