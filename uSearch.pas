unit uSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxGraphics,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxStyles,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxClasses, cxGrid, cxGroupBox, cxCalendar, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxCustomData,
  cxLookAndFeels, dxSkinsCore, Summer2008_proj, dxSkinscxPCPainter, jpeg,
  cxImage;

type
  TfrmSearch = class(TForm)
    cxButton5: TcxButton;
    cxButton1: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1heat_no: TcxGridDBColumn;
    cxGrid1DBTableView1job_date: TcxGridDBColumn;
    cxGrid1DBTableView1serial_from: TcxGridDBColumn;
    cxGrid1DBTableView1serial_to: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Label1: TLabel;
    cxLookupComboBox1: TcxLookupComboBox;
    cxGroupBox2: TcxGroupBox;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxImage1: TcxImage;
    procedure cxLookupComboBox1PropertiesCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    frmno: integer;
  end;

var
  frmSearch: TfrmSearch;

implementation

uses mdm;

{$R *.dfm}

procedure TfrmSearch.cxLookupComboBox1PropertiesCloseUp(Sender: TObject);
//var
//usa_date_format: TFormatSettings;
begin
  with dm do begin
    if cxLookupComboBox1.text = '' then exit;
    qrySearch.Close;
    qrySearch.SQL.Clear;
    if (frmno = 1) then begin
      qrySearch.SQL.Add('select * FROM items ');
      qrySearch.SQL.Add(' where (heat_no = :hn);');
      qrySearch.ParamByName('hn').Value := cxLookupComboBox1.Text;
    end
    else if (frmno = 2) then begin
      //GetLocaleFormatSettings(0, usa_date_format);
      //usa_date_format.DateSeparator := '/';
      //usa_date_format.ShortDateFormat := 'mm/dd/yyyy';

      qrySearch.SQL.Text := 'SELECT * FROM items  '
        + ' WHERE (items.job_date = :job_date);';
      qrySearch.ParamByName('job_date').AsDate := cxLookupComboBox1.EditValue;
    end;

    qrySearch.Open;
  end;
end;

procedure TfrmSearch.FormShow(Sender: TObject);
begin
  with dm do begin
    qryItems_Dist.Close;
    case frmno of
      1: begin
        cxGroupBox2.Visible := false;
        Label1.Caption := 'Search By Heat';
        cxLookupComboBox1.Properties.ListFieldNames := 'HEAT_NO';
        cxLookupComboBox1.Properties.KeyFieldNames := 'HEAT_NO';

        qryItems_Dist.SQL.Clear;
        qryItems_Dist.SQL.Add('select distinct HEAT_NO from items');
        qryItems_Dist.Open;
      end;
      2: begin
        cxGroupBox2.Visible := false;
        Label1.Caption := 'Search By Date';
        cxLookupComboBox1.Properties.ListFieldNames := 'JOB_DATE';
        cxLookupComboBox1.Properties.KeyFieldNames := 'JOB_DATE';

        qryItems_Dist.SQL.Clear;
        qryItems_Dist.SQL.Add('select distinct JOB_DATE from items');
        qryItems_Dist.Open;
      end;
      3: begin //export by date
        cxGroupBox1.Visible := false;
        //cxGroupBox2.BringToFront;
      end;
    end;
  end; //dm

end;

end.
