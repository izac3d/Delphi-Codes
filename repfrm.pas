unit repfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, cxLookAndFeelPainters, dxSkinsCore,
  cxGraphics, cxMaskEdit, cxDropDownEdit, cxDBEdit, cxTextEdit, cxCheckBox, cxControls, cxContainer, cxEdit, cxGroupBox,
  cxButtons, cxLabel, cxRadioGroup, cxCalendar, dxSkinsDefaultPainters;

type
  TfrmReport = class(TForm)
    cxButton2: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxRadioButton1: TcxRadioButton;
    cxLabel1: TcxLabel;
    cxRadioButton2: TcxRadioButton;
    cxGroupBox2: TcxGroupBox;
    cxRadioButton3: TcxRadioButton;
    cxLabel2: TcxLabel;
    cxRadioButton4: TcxRadioButton;
    cxButton1: TcxButton;
    cxComboBox1: TcxComboBox;
    cxComboBox2: TcxComboBox;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    cxCheckBox1: TcxCheckBox;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FRepDirPath: string;
  public
    { Public declarations }
  end;

var
  frmReport: TfrmReport;

implementation

uses DM;

{$R *.dfm}

procedure TfrmReport.cxButton1Click(Sender: TObject);
const
order_by: string = ' order by mpntinfo.patient_name, pvisits.visit_date';
var
sqlcom: string;
lsReportFile: string;
begin
  sqlcom := 'select distinct mpntinfo.patient_no, mpntinfo.patient_name, '
    + ' mpntinfo.gender, mpntinfo.birth_date, mpntinfo.marital_status, '
    + ' mpntinfo.profession, mpntinfo.address, mpntinfo.phones, '
    + ' mpntinfo.medical_alert, pvisits.visit_date, pvisits.complaints, '
    + ' pvisits.diagnosis, visit_meds.med_name, pvisits.visitno'
    + ' from pvisits left outer join visit_meds on (pvisits.visitno = visit_meds.visitno) '
    + ' right outer join mpntinfo on (pvisits.patient_no = mpntinfo.patient_no) ';

  if cxRadioButton2.Checked then //current patient
    sqlcom := sqlcom + ' Where mpntinfo.patient_no = :pno'
  else
    sqlcom := sqlcom + ' Where ( mpntinfo.PATIENT_NO between :f1 and :f2 ) ';

  if cxRadioButton3.Checked then
    sqlcom := sqlcom + ' And ( pvisits.visit_date between :vd1 and :vd2 )';

  sqlcom := sqlcom + order_by;

  with MainDM do begin
    ibRepds.Close;
    ibRepds.SelectSQL.Clear;
    ibRepds.SelectSQL.Add(sqlcom);

    if cxRadioButton2.Checked then //current patient
      ibRepds.ParamByName('pno').AsFloat := tblMPNTINFO.FieldByName('patient_no').AsFloat
    else begin
      ibRepds.ParamByName('f1').AsFloat := strtofloat(cxTextEdit1.Text);
      ibRepds.ParamByName('f2').AsFloat := strtofloat(cxTextEdit2.Text);
    end;

   if cxRadioButton3.Checked then begin
     ibRepds.ParamByName('vd1').AsDate := cxDateEdit1.Date;
     ibRepds.ParamByName('vd2').AsDate := cxDateEdit2.Date;
   end;

    ibRepds.Open;

    if cxCheckBox1.Checked  then
      lsReportFile := 'patientprofile.rtm'
    else
      lsReportFile := 'patientvisits.rtm';

    ppDBPipeline1.DataSource := MainDM.dsibRepds;
    MReport.Template.FileName := FRepDirPath + lsReportFile;
    MReport.Template.LoadFromFile;

    MReport.OutlineSettings.Visible := false;
    MReport.Print;

  end;

end;

procedure TfrmReport.cxButton2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmReport.FormShow(Sender: TObject);
begin
  FRepDirPath := extractfiledir(application.ExeName)+'\rep\';
  cxDateEdit1.Date := date;
  cxDateEdit2.Date := date;

end;

end.
