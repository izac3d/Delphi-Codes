unit uCust;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Buttons, db, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxContainer, cxTextEdit, cxDBEdit, cxMaskEdit, cxDropDownEdit;

type
  TfrmCust = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1CUST_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1CUST_OB: TcxGridDBColumn;
    cxGrid1DBTableView1CUST_CURBAL: TcxGridDBColumn;
    cxGrid1DBTableView1netBal_calc: TcxGridDBColumn;
    cxDBTextEdit1: TcxDBTextEdit;
    Label3: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    Label7: TLabel;
    cxDBComboBox1: TcxDBComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure cxDBTextEdit1Editing(Sender: TObject; var CanEdit: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCust: TfrmCust;

implementation

uses udm, uStyleDM;

{$R *.dfm}

procedure TfrmCust.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmCust.FormDestroy(Sender: TObject);
begin
  frmCust := nil;
end;

procedure TfrmCust.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmCust.BitBtn2Click(Sender: TObject);
begin
  dbdm.tblCustomer.Append;
end;

procedure TfrmCust.BitBtn3Click(Sender: TObject);
begin
  with dbdm do begin
    if tblCustomer.FieldByName('CUST_ID').AsInteger = 1 then
      raise exception.Create('·« Ì„ﬂ‰ Õ–› «·„»Ì⁄«  «·ÌÊ„Ì…');

    if messagebox(handle, 'Â· √‰  „ √ﬂœ ø','Õ–›', mb_yesno+mb_iconquestion) = idyes then begin
      tblCustomer.Delete;
    end;

  end;
end;

procedure TfrmCust.BitBtn4Click(Sender: TObject);
begin
  with dbdm do begin
    if tblCustomer.State in dseditmodes then
      tblCustomer.Post;
  end;
end;

procedure TfrmCust.BitBtn5Click(Sender: TObject);
begin
  dbdm.tblCustomer.CancelUpdates;
end;

procedure TfrmCust.cxDBTextEdit1Editing(Sender: TObject;
  var CanEdit: Boolean);
begin
  with dbdm do begin
    if (tblCustomer.FieldByName('CUST_NAME').AsString = '„»Ì⁄«  ÌÊ„Ì…')
      and (tblCustomer.FieldByName('CUST_ID').AsInteger = 1) then begin

      CanEdit := false;

      //tblCustomerCUST_ID.ReadOnly := true;
      //tblCustomerCUST_NAME.ReadOnly := true;
    end
    else begin
      //tblCustomerCUST_ID.ReadOnly := false;
      //tblCustomerCUST_NAME.ReadOnly := false;

      CanEdit := true;
    end;

  end;
end;

end.
