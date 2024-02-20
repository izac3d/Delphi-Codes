unit DM;

interface

uses
  SysUtils, Classes, DB, FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, Controls, dxSkinsCore,
  dxSkinsDefaultPainters, cxLookAndFeels, dxSkinsForm, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppDB, ppDBPipe, ppCtrls, ppPrnabl, ppBands, ppCache, ppParameter,
  ppStrtch, ppRegion, dxmdaset, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinSilver, dxSkinStardust, dxSkinValentine, dxSkinXmas2008Blue, dxSkinDarkSide, dxSkinPumpkin, dxSkinSpringTime,
  dxSkinSummer2008, Sharp2;

type
  TMainDM = class(TDataModule)
    fibMainDB: TpFIBDatabase;
    tblALL_EXAMS: TpFIBDataSet;
    fibMainTrans: TpFIBTransaction;
    Query_PK: TpFIBQuery;
    tblALL_MEDS: TpFIBDataSet;
    tblMPNTINFO: TpFIBDataSet;
    tblPVISITS: TpFIBDataSet;
    dsALL_EXAMS: TDataSource;
    dsALL_MEDS: TDataSource;
    dsMPNTINFO: TDataSource;
    dsPVISITS: TDataSource;
    dsPEXAMINATION: TDataSource;
    tblPEXAMINATION: TpFIBDataSet;
    tblOPTIONS: TpFIBDataSet;
    dsOPTIONS: TDataSource;
    dsVMeds: TDataSource;
    tblVMeds: TpFIBDataSet;
    QrySQL: TpFIBQuery;
    dxSkinController1: TdxSkinController;
    MReport: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ibRepds: TpFIBDataSet;
    dsibRepds: TDataSource;
    ppParameterList1: TppParameterList;
    fibUpdateTrans: TpFIBTransaction;
    ppDetailBand1: TppDetailBand;
    ppDBText13: TppDBText;
    ppPageStyle1: TppPageStyle;
    ppShape1: TppShape;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel1: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLine1: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape2: TppShape;
    ppLabel9: TppLabel;
    ppDBText10: TppDBText;
    ppLabel10: TppLabel;
    ppDBText11: TppDBText;
    ppLabel11: TppLabel;
    ppDBText12: TppDBText;
    ppLabel12: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine2: TppLine;
    mdSerials: TdxMemData;
    mdSerialsSerial: TStringField;
    mdSerialsNotes: TStringField;
    procedure tblALL_EXAMSAfterInsert(DataSet: TDataSet);
    procedure tblALL_MEDSAfterInsert(DataSet: TDataSet);
    procedure tblMPNTINFOAfterInsert(DataSet: TDataSet);
    procedure tblPVISITSAfterInsert(DataSet: TDataSet);
    procedure tblPEXAMINATIONAfterInsert(DataSet: TDataSet);
    procedure tblVMedsAfterInsert(DataSet: TDataSet);
    procedure tblPVISITSAfterPost(DataSet: TDataSet);
    procedure tblPVISITSBeforePost(DataSet: TDataSet);
    procedure tblMPNTINFOBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainDM: TMainDM;

implementation

{$R *.dfm}

procedure TMainDM.tblALL_EXAMSAfterInsert(DataSet: TDataSet);
begin
  Query_PK.Close;
  Query_PK.SQL.Clear;
  Query_PK.SQL.Add('select max(EXAM_AUTONO) from ALL_EXAMS');
  Query_PK.ExecQuery;

  tblALL_EXAMS.FieldByName('EXAM_AUTONO').AsInteger := Query_PK.Fields[0].AsInteger+1;


end;

procedure TMainDM.tblALL_MEDSAfterInsert(DataSet: TDataSet);
begin
  Query_PK.Close;
  Query_PK.SQL.Clear;
  Query_PK.SQL.Add('select max(MED_NO) from all_meds');
  Query_PK.ExecQuery;

  tblALL_MEDS.FieldByName('MED_NO').AsInteger := Query_PK.Fields[0].AsInteger+1;
end;

procedure TMainDM.tblMPNTINFOAfterInsert(DataSet: TDataSet);
begin
  Query_PK.Close;
  Query_PK.SQL.Clear;
  Query_PK.SQL.Add('select max(PATIENT_NO) from MPNTINFO ');
  Query_PK.ExecQuery;

  tblMPNTINFO.FieldByName('PATIENT_NO').AsFloat := Query_PK.Fields[0].AsFloat+1;

  tblMPNTINFO.FieldByName('FIRST_VISITDATE').AsDateTime := date;
  tblMPNTINFO.FieldByName('LAST_VISITDATE').AsDateTime := date;
end;

procedure TMainDM.tblMPNTINFOBeforePost(DataSet: TDataSet);
begin
  //if tblMPNTINFO.RecordCount > 2 then raise exception.Create('This is a demo version, please buy a full version clinic.worx@gmail.com');
  
end;

procedure TMainDM.tblPEXAMINATIONAfterInsert(DataSet: TDataSet);
begin
  Query_PK.Close;
  Query_PK.SQL.Clear;
  Query_PK.SQL.Add('select max(EXAMINATION_NO) from EXAMINATION');
  Query_PK.ExecQuery;

  tblPEXAMINATION.FieldByName('EXAMINATION_NO').AsFloat := Query_PK.Fields[0].AsFloat+1;
  tblPEXAMINATION.FieldByName('PATIENT_NO').AsFloat := tblMPNTINFO.FieldByName('PATIENT_NO').AsFloat;
  tblPEXAMINATION.FieldByName('EXAM_DATE').AsDateTime := date;
end;

procedure TMainDM.tblPVISITSAfterInsert(DataSet: TDataSet);
begin
  Query_PK.Close;
  Query_PK.SQL.Clear;
  Query_PK.SQL.Add('select max(VISITNO) from PVISITS');
  Query_PK.ExecQuery;

  tblPVISITS.FieldByName('VISITNO').AsFloat := Query_PK.Fields[0].AsFloat+1;
  tblPVISITS.FieldByName('PATIENT_NO').AsFloat := tblMPNTINFO.FieldByName('PATIENT_NO').AsFloat;
  tblPVISITS.FieldByName('VISIT_DATE').AsDateTime := date;
end;

procedure TMainDM.tblPVISITSAfterPost(DataSet: TDataSet);
var
lvd: tdate;
begin
  QrySQL.Close;
  QrySQL.SQL.Clear;
  QrySQL.SQL.Add('select max(visit_date) from PVISITS where PATIENT_NO = :pno');
  QrySQL.ParamByName('pno').AsFloat := tblMPNTINFO.FieldByName('PATIENT_NO').AsFloat;
  QrySQL.ExecQuery;

  lvd := QrySQL.Fields[0].AsDate;

  tblMPNTINFO.Edit;
  tblMPNTINFO.FieldByName('last_visitdate').AsDateTime := lvd;
  tblMPNTINFO.FieldByName('VISITS_COUNT').AsInteger := tblPVISITS.RecordCountFromSrv;
  tblMPNTINFO.Post;

{*  QrySQL.Close;
  QrySQL.SQL.Clear;
  QrySQL.SQL.Add('update MPNTINFO set last_visitdate = :lvd where PATIENT_NO = :pno');
  QrySQL.ParamByName('lvd').AsDateTime := lvd;
  QrySQL.ParamByName('pno').AsFloat := tblMPNTINFO.FieldByName('PATIENT_NO').AsFloat;
  QrySQL.ExecQuery;*}


end;

procedure TMainDM.tblPVISITSBeforePost(DataSet: TDataSet);
begin
  {if tblPVISITS.RecordCount > 2 then begin
    tblPVISITS.Cancel;
    raise exception.Create('This is a demo version please buy a full version clinic.worx@gmail.com');

  end;}
end;

procedure TMainDM.tblVMedsAfterInsert(DataSet: TDataSet);
begin
  Query_PK.Close;
  Query_PK.SQL.Clear;
  Query_PK.SQL.Add('select max(MED_NO) from VISIT_MEDS');
  Query_PK.ExecQuery;

  tblVMeds.FieldByName('MED_NO').AsFloat := Query_PK.Fields[0].AsFloat+1;
  tblVMeds.FieldByName('VISITNO').AsFloat := tblPVISITS.FieldByName('VISITNO').AsFloat; 
end;

end.
