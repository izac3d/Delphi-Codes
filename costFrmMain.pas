unit costFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, System.UITypes,
  Dialogs, StdCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxButtons, DB, dxSkinsCore, dxSkinLondonLiquidSky, cxClasses, dxSkinsForm;

type
  msgPtr = ^TMsgRecord;
  TMsgRecord = record
    thread : Integer;
    is_working   : Boolean;
    mhandle: HWnd;
  end;

  TMainfrm = class(TForm)
    btnFrames: TcxButton;
    btnBOM: TcxButton;
    btnInventory: TcxButton;
    btnExit: TcxButton;
    btnPricing: TcxButton;
    btnGlass: TcxButton;
    btnReference: TcxButton;
    cxButton1: TcxButton;
    dxSkinController1: TdxSkinController;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton6: TcxButton;
    procedure btnFramesClick(Sender: TObject);
    procedure btnInventoryClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure btnPricingClick(Sender: TObject);
    procedure btnGlassClick(Sender: TObject);
    procedure btnReferenceClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure btnBOMClick(Sender: TObject);
  private
    FThread1: THandle;
    FThread1ID: DWORD;
    function GetVersion(sFileName:string): string;
  public
    { Public declarations }
  end;

var
  Mainfrm: TMainfrm;

implementation

uses frmBOM, frmInventory, dmCosting, frmlookup, frmSMPrices, frmPricing, frmGlass, frmFrames, dbconnect, sfrmSettings, dsplashfrm, myFunc, frmSalesZones;

{$R *.dfm}

function TMainfrm.GetVersion(sFileName:string): string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(sFileName), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(sFileName), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

procedure TMainfrm.btnGlassClick(Sender: TObject);
begin
  Glassfrm := TGlassfrm.Create(self);
  Glassfrm.Show
end;

procedure TMainfrm.btnFramesClick(Sender: TObject);
begin
  Framesfrm := TFramesfrm.Create(self);
  Framesfrm.Show;
end;

procedure TMainfrm.btnInventoryClick(Sender: TObject);
begin
  BOMInventoryfrm := TBOMInventoryfrm.Create(self);
  BOMInventoryfrm.Show;

end;

procedure TMainfrm.btnBOMClick(Sender: TObject);
begin
  BOMfrm := TBOMfrm.Create(self);
  BOMfrm.Show;
end;

procedure TMainfrm.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TMainfrm.cxButton1Click(Sender: TObject);
begin
  HtmlHelp(0, Application.HelpFile, HH_DISPLAY_TOC, 0);
end;

procedure TMainfrm.cxButton2Click(Sender: TObject);
var
zip_csv_file: TextFile;
csv_file, csv_line, sql_line: string;
openCSVDlg: TOpenDialog;
f_ZIPCODE, f_SALES_TAX_RATE, f_JURISDICTION, f_SALES_TAX_REPCODE,
f_CITY, f_STATE, f_COUNTY, f_IS_DELIVERY_TAXABLE: string;
total_inserted, total_updated, no_of_lines: integer;
exec_start_time, exec_finish_time, freq, overhead: int64;
exec_time: extended;
msg1: msgPtr;
begin
  with CostingDM do begin

    openCSVDlg := TSaveDialog.Create(nil);
    openCSVDlg.Title := 'Import Zip Codes as CSV file';
    openCSVDlg.Filter := 'CSV file|*.csv';
    openCSVDlg.DefaultExt := 'csv';

    if not openCSVDlg.Execute then exit;

    //---------------------------------------- performance timer
    QueryPerformanceFrequency(Freq);
    QueryPerformanceCounter(exec_start_time);
    QueryPerformanceCounter(exec_finish_time);
    Overhead := exec_finish_time - exec_start_time; // determine API overhead
    QueryPerformanceCounter(exec_start_time);
    //---------------------------------------------------------------------------------
    //Display wait animation
    new(msg1);
    msg1.thread := 1;
    //msg1.is_working := true;

    msg1.mhandle := handle;

    FThread1 := CreateThread(nil, 0, @tpStart, msg1, CREATE_SUSPENDED, FThread1ID);
    if FThread1 = 0 then
      RaiseLastOSError;

    ResumeThread(FThread1);
    //-------------------------------------------------------------------------------------

    csv_file := openCSVDlg.FileName;

    MainSQL.SQL.Text := 'select count(*) from zipntax';
    MainSQL.ExecSQL;
    total_inserted := MainSQL.Fields[0].AsInteger;

    no_of_lines := 0;
    GenScript.SQL.Clear;
    try
      AssignFile(zip_csv_file, csv_file);
      Reset(zip_csv_file);

      ReadLn(zip_csv_file, csv_line); //skip first line with column names
      while not Eof(zip_csv_file) do begin
        ReadLn(zip_csv_file, csv_line);

        Delete(csv_line, 1, pos(',', csv_line)); // z2t_ID

        f_ZIPCODE := QuotedStr(copy(csv_line, 1, pos(',', csv_line)-1));
        Delete(csv_line, 1, pos(',', csv_line));

        f_SALES_TAX_RATE := copy(csv_line, 1, pos(',', csv_line)-1);
        Delete(csv_line, 1, pos(',', csv_line));

        f_JURISDICTION := QuotedStr(copy(csv_line, 1, pos(',', csv_line)-1));
        Delete(csv_line, 1, pos(',', csv_line));

        f_SALES_TAX_REPCODE := copy(csv_line, 1, pos(',', csv_line)-1);
        Delete(csv_line, 1, pos(',', csv_line));

        f_CITY := QuotedStr(copy(csv_line, 1, pos(',', csv_line)-1));
        Delete(csv_line, 1, pos(',', csv_line));
        Delete(csv_line, 1, pos(',', csv_line)); //delete PostOffice

        f_STATE := QuotedStr(copy(csv_line, 1, pos(',', csv_line)-1));
        Delete(csv_line, 1, pos(',', csv_line));

        f_COUNTY := QuotedStr(copy(csv_line, 1, pos(',', csv_line)-1));
        Delete(csv_line, 1, pos(',', csv_line));

        f_IS_DELIVERY_TAXABLE := copy(csv_line, 1, 1);

        sql_line := 'UPDATE OR INSERT INTO ZIPNTAX (ZIPCODE, SALES_TAX_RATE, JURISDICTION, SALES_TAX_REPCODE, CITY, STATE, COUNTY, IS_DELIVERY_TAXABLE)'

          + ' VALUES (' +f_ZIPCODE+','+f_SALES_TAX_RATE+','+f_JURISDICTION+','+f_SALES_TAX_REPCODE+','+f_CITY+','
          +f_STATE+','+f_COUNTY+','+f_IS_DELIVERY_TAXABLE+')'
          +' MATCHING (ZIPCODE);';

        GenScript.SQL.Add(sql_line);

        inc(no_of_lines);

      end;

      application.ProcessMessages;
      GenScript.SQL.Add('COMMIT WORK;');
      GenScript.ExecuteScript;

      MainSQL.SQL.Text := 'select count(*) from zipntax';
      MainSQL.ExecSQL;
      total_inserted := MainSQL.Fields[0].AsInteger - total_inserted;
      total_updated := no_of_lines - total_inserted;

    finally
      CloseFile(zip_csv_file);
      openCSVDlg.Free;
    end;

    //-------------------- Close wait message
    CloseSplash;
    TerminateThread(FThread1ID, 0);
    //-----------------------------------------
    //count performance

    QueryPerformanceCounter(exec_finish_time);
    exec_time := ((exec_finish_time - exec_start_time) - Overhead) / Freq;
    //--------------------------------------------------------------------------

    //no inserted and no updated
    Messagedlg('File Successfully Imported'#13#10'Total Inserted: '+inttostr(total_inserted)+#13#10'Total Updated: '+inttostr(total_updated)
      +#13#10'Execution Time (Seconds): '+formatfloat('#.00',exec_time), mtinformation, [mbOK], 0);

  end;

end;

procedure TMainfrm.cxButton3Click(Sender: TObject);
begin
  with CostingDM do begin
    frmDBConnect := tfrmDBConnect.Create(self);
    if frmDBConnect.ShowModal = mrOk then begin

      if mdDBSettings.State = dsedit then
        mdDBSettings.Post;
      mdDBSettings.SaveToBinaryFile(App_Dir+'settings.dat');

      include(ConnectedApp, APP_COSTING);
      db_connect;
    end;
  end;
end;

procedure TMainfrm.cxButton4Click(Sender: TObject);
var
lSearchRec:TSearchRec;
lFind:integer;
lPath, AFileSpec: string;
begin
  if messagedlg('Close all windows first', mtConfirmation, [mbOK, mbCancel],0, mbCancel) <> mrok then exit;

  //-------------------------------------------------------------------------------------------
  lPath := 'C:\usettings\';
  AFileSpec := 'costing*.*';

  lFind := FindFirst(lPath+AFileSpec,faAnyFile,lSearchRec);

  while lFind = 0 do begin
    DeleteFile(lPath+lSearchRec.Name);

    lFind := FindNext(lSearchRec);
  end;
  FindClose(lSearchRec);

end;

procedure TMainfrm.cxButton5Click(Sender: TObject);
begin
  lookupfrm := Tlookupfrm.Create(self);
  lookupfrm.Show;
end;

procedure TMainfrm.cxButton6Click(Sender: TObject);
begin
   with CostingDM do begin
    SalesZonesfrm := TSalesZonesfrm.Create(self);
    if SalesZonesfrm.ShowModal = mrok then begin
      try
        if tblSalesZone.State in dseditmodes then
          tblSalesZone.Post;
      except
        tblSalesZone.Cancel;
        raise;
      end;

    end
    else tblSalesZone.Cancel;

  end;
end;

procedure TMainfrm.btnPricingClick(Sender: TObject);
begin
  Pricingfrm := TPricingfrm.Create(self);
  Pricingfrm.Show;
end;

procedure TMainfrm.btnReferenceClick(Sender: TObject);
begin
  Settingsfrm := TSettingsfrm.Create(nil);
  Settingsfrm.ShowModal;
end;

procedure TMainfrm.FormCreate(Sender: TObject);
begin
  with CostingDM do begin
    App_Dir := ExpandFileName(extractfiledir(application.ExeName)) + '\'; //+ '\..'

    include(ConnectedApp, APP_COSTING);
    if not db_connect then begin
      frmDBConnect := tfrmDBConnect.Create(nil);

      if frmDBConnect.ShowModal = mrOk then begin

        if mdDBSettings.State = dsedit then
          mdDBSettings.Post;
        mdDBSettings.SaveToBinaryFile(App_Dir+'settings.dat');

        db_connect;

      end;
    end;

  {  LoggedUser.UID := 1;
    Include(LoggedUser.UGroup, APP_UG_ADMINS);
    LoggedUser.UName := 'Isaac'; }

    //------------------------------ Get current logged in user from windows
    if not GetCurrentUserName(WIN_DOMAIN, WIN_USERNAME) then begin  //RaiseLastOSError;
      WIN_DOMAIN := 'domain error';
      WIN_USERNAME := 'user name error';
    end;

    caption := caption + ' v' + GetVersion('Costing.exe') + ' - Logged in as "' + WIN_USERNAME+'"';


    // ------------------------------------------------------------------------------------------ Check user
    try
      sqlGen.Close;
      sqlGen.SQL.Text := 'Select UID, UNAME, UGROUP from USERS where (upper(UNAME) = :pUName)';
      sqlGen.ParamByName('pUName').AsString := uppercase(WIN_USERNAME);
      sqlGen.Open;

      if sqlGen.RecordCount = 1 then begin

        LoggedUser.UID := sqlGen.FieldByName('UID').AsInteger;
        Include(LoggedUser.UGroup, TAPPUGroup(sqlGen.FieldByName('UGROUP').AsInteger));
        LoggedUser.UName := sqlGen.FieldByName('UNAME').AsString;

        if APP_UG_USERS in LoggedUser.UGroup then
          raise Exception.Create('Users group do not have permission to open this application');

      end
      else
        raise Exception.Create('User: '+WIN_USERNAME +' can not open this application');

    except
      on E: Exception do begin
        MessageDlg(E.Message, mtError, [mbOk], 0);
        Application.ShowMainForm := false;
        Application.Terminate;

      end;

    end;

    //----end------------------------------------------------------------------------------------------------------------------------

    FRepDirPath := App_Dir + 'reports\';
  end;

  //make sure directory for grid settings exists
  ForceDirectories('c:\usettings');
end;

end.



