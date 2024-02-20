unit uCollect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmCollect = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCollect: TfrmCollect;

implementation

uses udm, uStyleDM;

{$R *.dfm}

procedure TfrmCollect.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmCollect.FormDestroy(Sender: TObject);
begin
  frmCollect := nil;
end;

procedure TfrmCollect.FormShow(Sender: TObject);
begin
  //dxDateEdit1.Date := date;

  with dbdm do begin

    //dxLookupEdit8.Text := tblInventory.fieldbyname('INV_NAME').AsString;
    //dxLookupEdit1.Text := tblCustomer.fieldbyname('cust_name').AsString;
  end;
    
end;

end.
