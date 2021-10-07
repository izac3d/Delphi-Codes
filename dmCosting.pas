unit dmCosting;

interface

uses
  SysUtils, StrUtils, DB, System.UITypes, MemDS, DBAccess, IBC, windows, Controls, Generics.collections,  dxmdaset, cxContainer, cxEdit, cxStyles, vARIANTS, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxImage, cxTextEdit, cxButtonEdit, cxCalendar, cxCurrencyEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxColorComboBox, inifiles, Dialogs, Classes, DAAlerter, IBCAlerter, DateUtils,
  cxSchedulerHolidays, cxSchedulerStorage, cxEditRepositoryItems, cxNavigator, DAScript, IBCScript;

  type
    PTokenUser = ^TTokenUser;
    TTokenUser = packed record
    User: SID_AND_ATTRIBUTES;
  end;

  //must be in that order 0,1,2,3,4 to match values in combobox
  TAPPUGroup = (APP_UG_USERS, APP_UG_SUPER_USERS, APP_UG_ADMINS, APP_UG_BIDDERS, APP_UG_ACCOUNTING, APP_UG_MAINTENANCE, APP_UG_ASSOCIATE,
                APP_UG_PRODUCTION, APP_UG_OBSOLETE);
  TAPPUGroups = set of TAPPUGroup;

  TAppUser = record
    UID: integer;
    UName: string;
    UGroup: TAPPUGroups;

  end;

  TApp = (APP_SALES, APP_COSTING, APP_PRODUCTION, APP_SHOP, APP_SHIFT);
  TApps = set of TApp;

  TGridForm = (NA, Customer, Tract, Phase, Quote, Window, IGU);

  THostInfo = record
    username: PWideChar;
    logon_domain: PWideChar;
    other_domains: PWideChar;
    logon_server: PWideChar;
  end;

  Ttwilio = record
    SMSFrom: string;
    AccountSID: string;
    AuthToken: string;
    APIVersion: string;
    Version: string;
  end;


  WKSTA_USER_INFO_0 = packed record
    wkui0_username: PWideChar;
  end;
  PWKSTA_USER_INFO_0 = ^WKSTA_USER_INFO_0;

  TCostingDM = class(TDataModule)
    MainDB: TIBCConnection;
    TransRead: TIBCTransaction;
    dsSeries: TIBCDataSource;
    tblSeries: TIBCQuery;
    dsSeriesHanding: TIBCDataSource;
    dsSeriesModel: TIBCDataSource;
    dsSeriesNailfin: TIBCDataSource;
    dsSeriesColor: TIBCDataSource;
    tblSeriesHanding: TIBCQuery;
    tblSeriesModel: TIBCQuery;
    tblSeriesColor: TIBCQuery;
    tblSeriesNailfin: TIBCQuery;
    tblCallouts: TIBCQuery;
    dsCallouts: TIBCDataSource;
    transWrite: TIBCTransaction;
    MainSQL: TIBCQuery;
    ExecSQL: TIBCSQL;
    tblModels: TIBCQuery;
    dsModels: TIBCDataSource;
    tblColors: TIBCQuery;
    dsColors: TIBCDataSource;
    tblNailfin: TIBCQuery;
    dsNailfin: TIBCDataSource;
    tblHanding: TIBCQuery;
    dsHanding: TIBCDataSource;
    dsInvShadow: TIBCDataSource;
    tblInvShadow: TIBCQuery;
    dsInvShadowArch: TIBCDataSource;
    tblInvShadowArch: TIBCQuery;
    tblBOM: TIBCQuery;
    dsBOM: TIBCDataSource;
    tblWindows: TIBCQuery;
    dsWindows: TIBCDataSource;
    tblIGU: TIBCQuery;
    dsIGU: TIBCDataSource;
    tblCountries: TIBCQuery;
    dsCountries: TIBCDataSource;
    tblZipnTax: TIBCQuery;
    dsZipnTax: TIBCDataSource;
    tblCustomers: TIBCQuery;
    dsCustomers: TIBCDataSource;
    tblQuotes: TIBCQuery;
    dsQuotes: TIBCDataSource;
    dsMainSQL: TIBCDataSource;
    tblCustContacts: TIBCQuery;
    dsCustContacts: TIBCDataSource;
    tblGroups: TIBCQuery;
    dsGroups: TIBCDataSource;
    gridStyles: TcxStyleRepository;
    gridBackground: TcxStyle;
    tblUsers: TIBCQuery;
    dsUsers: TIBCDataSource;
    dsWinQuote_lookup: TIBCDataSource;
    tblWinLock_SM: TIBCQuery;
    dsWinLock_SM: TIBCDataSource;
    tblScreen: TIBCQuery;
    dsScreen: TIBCDataSource;
    tblGridPattern: TIBCQuery;
    dsGridPattern: TIBCDataSource;
    tblGridKind: TIBCQuery;
    dsGridKind: TIBCDataSource;
    dsGlazing: TIBCDataSource;
    tblGlazing: TIBCQuery;
    sqlSum: TIBCQuery;
    tblWindowStock: TIBCQuery;
    dsWindowStock: TIBCDataSource;
    dsSerMod_Lookup: TIBCDataSource;
    tblSerMod_Lookup: TIBCQuery;
    dsSerColor_lookup: TIBCDataSource;
    tblSerColor_lookup: TIBCQuery;
    dsSerNailfin_lookup: TIBCDataSource;
    tblSerNailfin_lookup: TIBCQuery;
    tblLocationStock: TIBCQuery;
    dsLocationStock: TIBCDataSource;
    tblAccessories: TIBCQuery;
    dsAccessories: TIBCDataSource;
    tblCallouts_lookup: TIBCQuery;
    dsCallouts_lookup: TIBCDataSource;
    tblQAccessories: TIBCQuery;
    dsQAccessories: TIBCDataSource;
    mStoredProc: TIBCStoredProc;
    sqlGen: TIBCQuery;
    tblUserSettings: TIBCQuery;
    dsUserSettings: TIBCDataSource;
    mdDBSettings: TdxMemData;
    mdDBSettingsdb_ip: TStringField;
    mdDBSettingsdb_path: TStringField;
    dsmdDBSettings: TIBCDataSource;
    tblGlassType: TIBCQuery;
    dsGlassType: TIBCDataSource;
    dsGlassKOuter: TIBCDataSource;
    tblGlassKOuter: TIBCQuery;
    dsPricing: TIBCDataSource;
    tblPricing: TIBCQuery;
    dsGlassKMiddle: TIBCDataSource;
    tblGlassKMiddle: TIBCQuery;
    dsGlassKInner: TIBCDataSource;
    tblGlassKInner: TIBCQuery;
    dsGlassEdge: TIBCDataSource;
    tblGlassEdge: TIBCQuery;
    tblGridCost: TIBCQuery;
    dsGridCost: TIBCDataSource;
    tblPaint: TIBCQuery;
    dsPaint: TIBCDataSource;
    tblPaint_SM: TIBCQuery;
    dsPaint_SM: TIBCDataSource;
    tblScreen_SM: TIBCQuery;
    dsScreen_SM: TIBCDataSource;
    tblSTC_SM: TIBCQuery;
    dsSTC_SM: TIBCDataSource;
    dsSeriesHanding_lookup: TIBCDataSource;
    tblSeriesHanding_lookup: TIBCQuery;
    tblPaint_SM_lookup: TIBCQuery;
    dsPaint_SM_lookup: TIBCDataSource;
    tblEnergy: TIBCQuery;
    dsEnergy: TIBCDataSource;
    stylelblEgressSt: TcxEditStyleController;
    tblTract: TIBCQuery;
    dsTract: TIBCDataSource;
    tblTractPhase: TIBCQuery;
    dsTractPhase: TIBCDataSource;
    gridBackgroundDetail: TcxStyle;
    gridBackgroundWhite: TcxStyle;
    tblPhaseQuotes: TIBCQuery;
    dsPhaseQuotes: TIBCDataSource;
    MainGVR: TcxGridViewRepository;
    WindowImgView: TcxGridDBTableView;
    WindowImgViewWIN_IMG_ID: TcxGridDBColumn;
    WindowImgViewWIN_IMG: TcxGridDBColumn;
    WindowImgViewWIN_IMG_BIG: TcxGridDBColumn;
    WindowImgViewIMG_DESC: TcxGridDBColumn;
    MainGVR_vwQuotes: TcxGridDBTableView;
    MainGVR_vwQuotes_btnBrowse: TcxGridDBColumn;
    MainGVR_vwQuotes_btnPrint: TcxGridDBColumn;
    MainGVR_vwQuotesQUOTE_ID: TcxGridDBColumn;
    MainGVR_vwQuotesQUOTE_DATE: TcxGridDBColumn;
    MainGVR_vwQuotesCUST_NAME: TcxGridDBColumn;
    MainGVR_vwQuotesQUOTE_NO: TcxGridDBColumn;
    MainGVR_vwQuotesJOB_NAME: TcxGridDBColumn;
    MainGVR_vwQuotesCustomer_ID: TcxGridDBColumn;
    MainGVR_vwTracts: TcxGridDBTableView;
    MainGVR_vwTracts_btnBrowse: TcxGridDBColumn;
    MainGVR_vwTracts_btnPrint: TcxGridDBColumn;
    MainGVR_vwTractsTRACT_ID: TcxGridDBColumn;
    MainGVR_vwTractsCUSTOMER_ID: TcxGridDBColumn;
    MainGVR_vwTractsTRACT_NUMBER: TcxGridDBColumn;
    MainGVR_vwTractsTRACT_NAME: TcxGridDBColumn;
    MainGVR_vwTractsCUST_NAME: TcxGridDBColumn;
    tblGStatusColor: TIBCQuery;
    dsGStatusColor: TIBCDataSource;
    MainGVR_Grid_Status: TcxGridDBTableView;
    MainGVR_Grid_StatusGRID_COLOR_STATUS_ID: TcxGridDBColumn;
    MainGVR_Grid_StatusCOLOR: TcxGridDBColumn;
    MainGVR_Grid_StatusDESCRIPTION: TcxGridDBColumn;
    dsWin_Mull: TIBCDataSource;
    tblWinQuote_lookup: TIBCQuery;
    tblWin_Mull: TIBCQuery;
    grdTract_Grid_Status: TcxStyle;
    tblStruc_Perf: TIBCQuery;
    dsStruc_Perf: TIBCDataSource;
    tblStruc_Perf_SM: TIBCQuery;
    dsStruc_Perf_SM: TIBCDataSource;
    tblJobBatches: TIBCQuery;
    dsJobBatches: TIBCDataSource;
    ActiveHeader14: TcxStyle;
    MainGVR_vwTractsCITY: TcxGridDBColumn;
    DBAlerter: TIBCAlerter;
    grdWindows_Stock_Status: TcxStyle;
    tblGas: TIBCQuery;
    dsGas: TIBCDataSource;
    dsGlassKind: TIBCDataSource;
    tblGlassKind: TIBCQuery;
    SchedulerStorage: TcxSchedulerStorage;
    SchedulerHolidays: TcxSchedulerHolidays;
    sDisabled: TcxStyle;
    sYellowBK: TcxStyle;
    sGreenBK: TcxStyle;
    tblWorkCell: TIBCQuery;
    dsWorkCell: TIBCDataSource;
    tblModelTypes: TIBCQuery;
    dsModelTypes: TIBCDataSource;
    genRepository: TcxEditRepository;
    repoitemCheckBox: TcxEditRepositoryCheckBoxItem;
    tblQuoteOpt: TIBCQuery;
    dsQuoteOpt: TIBCDataSource;
    tblIGU_SM_Lites: TIBCQuery;
    dsIGU_SM_Lites: TIBCDataSource;
    tblSalesZone: TIBCQuery;
    dsSalesZone: TIBCDataSource;
    MainGVR_vwQuotesJOB_BATCH_ID: TcxGridDBColumn;
    tblTempGlass: TIBCQuery;
    dsTempGlass: TIBCDataSource;
    tblTractType: TIBCQuery;
    dsTractType: TIBCDataSource;
    tblTractContact: TIBCQuery;
    dsTractContact: TIBCDataSource;
    tblSPCallout: TIBCQuery;
    dsSPCallout: TIBCDataSource;
    tblSPDIM: TIBCQuery;
    dsSPDIM: TIBCDataSource;
    tblTractHistory: TIBCQuery;
    dsTractHistory: TIBCDataSource;
    GenScript: TIBCScript;
    sMagenta: TcxStyle;
    tblScanIGU: TIBCQuery;
    dsScanIGU: TIBCDataSource;
    tblWorkCell_Type: TIBCQuery;
    dsWorkCell_Type: TIBCDataSource;
    tblShift: TIBCQuery;
    dsShift: TIBCDataSource;
    tblPerformanceHistory: TIBCQuery;
    dsPerformanceHistory: TIBCDataSource;
    tblAccessories_Type: TIBCQuery;
    dsAccessories_Type: TIBCDataSource;
    sRed: TcxStyle;
    sBlue: TcxStyle;
    tblTempGlassOrders: TIBCQuery;
    dsTempGlassOrders: TIBCDataSource;
    tblXPanel_SM_Lites: TIBCQuery;
    dsXPanel_SM_Lites: TIBCDataSource;
    TractPhaseSQL: TIBCQuery;
    tblQuotePrices: TIBCQuery;
    dsQuotePrices: TIBCDataSource;
    tblBOMCostType: TIBCQuery;
    dsBomCostType: TIBCDataSource;
    mdBookmark: TdxMemData;
    mdBookmarkbook_no: TSmallintField;
    mdBookmarkbook_name: TStringField;
    mdBookmarkbook_type: TStringField;
    mdBookmarkcust_id: TIntegerField;
    mdBookmarkquote_id: TIntegerField;
    mdBookmarktract_id: TIntegerField;
    mdBookmarkphase_id: TIntegerField;
    tblAccessories_lookup: TIBCQuery;
    dsAccessories_lookup: TIBCDataSource;
    tblGridsStd: TIBCQuery;
    dsGridsStd: TIBCDataSource;
    tblScanWin: TIBCQuery;
    dsScanWin: TIBCDataSource;
    ActiveHeader8: TcxStyle;
    tblBatchWC: TIBCQuery;
    dsBatchWC: TIBCDataSource;
    tblBookmarks: TIBCQuery;
    dsBookmarks: TIBCDataSource;
    procedure tblCalloutsAfterInsert(DataSet: TDataSet);
    procedure tblInvShadowBeforePost(DataSet: TDataSet);
    procedure tblInvShadowBeforeEdit(DataSet: TDataSet);
    procedure tblCustContactsBeforePost(DataSet: TDataSet);
    procedure tblCustContactsAfterInsert(DataSet: TDataSet);
    procedure tblUsersBeforePost(DataSet: TDataSet);
    procedure tblWindowsAfterInsert(DataSet: TDataSet);
    procedure tblWindowsBeforePost(DataSet: TDataSet);
    procedure tblSeriesModelAfterInsert(DataSet: TDataSet);
    procedure tblWindowStockAfterInsert(DataSet: TDataSet);
    procedure tblAccessoriesAfterInsert(DataSet: TDataSet);
    procedure tblQAccessoriesAfterInsert(DataSet: TDataSet);
    procedure tblCustContactsAfterPost(DataSet: TDataSet);
    procedure tblUserSettingsAfterInsert(DataSet: TDataSet);
    procedure tblCustomersAfterInsert(DataSet: TDataSet);
    procedure tblIGUAfterInsert(DataSet: TDataSet);
    procedure tblSTC_SMAfterInsert(DataSet: TDataSet);
    procedure tblTractAfterInsert(DataSet: TDataSet);
    procedure tblTractPhaseAfterInsert(DataSet: TDataSet);
    procedure tblQuotesAfterInsert(DataSet: TDataSet);
    procedure tblQuotesBeforePost(DataSet: TDataSet);
    procedure tblQuotesAfterPost(DataSet: TDataSet);
    procedure tblWindowsAfterPost(DataSet: TDataSet);
    procedure tblBOMAfterPost(DataSet: TDataSet);
    procedure tblGlassTypeAfterPost(DataSet: TDataSet);
    procedure tblWindowsAfterEdit(DataSet: TDataSet);
    procedure tblQuotesAfterEdit(DataSet: TDataSet);
    procedure tblIGU_SM_LitesAfterInsert(DataSet: TDataSet);
    procedure tblIGU_SM_LitesAfterPost(DataSet: TDataSet);
    procedure tblIGU_SM_LitesAfterDelete(DataSet: TDataSet);
    procedure tblTractContactAfterInsert(DataSet: TDataSet);
    procedure tblTractContactAfterPost(DataSet: TDataSet);
    procedure tblWinLock_SMAfterInsert(DataSet: TDataSet);
    procedure tblSPCalloutAfterInsert(DataSet: TDataSet);
    procedure tblSPDIMAfterInsert(DataSet: TDataSet);
    procedure tblTempGlassOrdersAfterInsert(DataSet: TDataSet);
    procedure tblTempGlassAfterPost(DataSet: TDataSet);
    procedure tblTempGlassOrdersAfterPost(DataSet: TDataSet);
    procedure tblTempGlassOrdersAfterDelete(DataSet: TDataSet);
    procedure tblXPanel_SM_LitesAfterInsert(DataSet: TDataSet);
    procedure tblQuotePricesAfterInsert(DataSet: TDataSet);
    procedure tblTractBeforePost(DataSet: TDataSet);
    procedure DBAlerterEvent(Sender: TObject; EventName: string;
      EventCount: Integer);
    procedure tblWin_MullAfterInsert(DataSet: TDataSet);
    procedure tblWin_MullAfterPost(DataSet: TDataSet);
    procedure tblBookmarksAfterInsert(DataSet: TDataSet);
  private
    hist_pkeys: array[0..2] of boolean;

    DESCRIPTION, UOM_METHOD, UOM_BOM: string;
    PRICE_BOM, UOM_CONVERSION: currency;

    function get_quote_no: integer;

    function EnDeCrypt(const Value : String) : String;
  public
    App_Dir, FRepDirPath, lsReportFile: string;

    procedure lookup_tables(open: boolean);
    procedure CopyFromGlobal(table: TIBCQuery);
    procedure SaveCryptedConfig;

    Procedure CopyQuote(pQUOTE_ID: integer);
    Procedure CopyToExistingQuote(p_org_QUOTE_ID, p_trg_QUOTE_ID: integer);

    function db_connect: boolean;

    function is_email_correct(email_txt: string): boolean;

    function varIsNullR0(value: variant):variant;
    //procedure copy_windows(qwin_id: integer);
    function LoadCryptedConfig: Ttwilio;

    function IsKeyDown(const PKey: Byte): Boolean;
    function IsKeyCombinationDown(const PKeys: array of Byte): Boolean;

    procedure Gen_Bin_No;
  end;

var
  CostingDM: TCostingDM;

  ConnectedApp: TApps;

  SelGrid: TGridForm;

  LoggedUser: TAppUser;
  WIN_DOMAIN, WIN_USERNAME: string;
  function GetCurrentUserName(out DomainName, UserName: string): Boolean;
  function EnumNetUsers(HostName: WideString {; Users: TStrings}): THostInfo;

implementation

{$R *.dfm}

procedure TCostingDM.tblAccessoriesAfterInsert(DataSet: TDataSet);
begin
  tblAccessories.FieldByName('LOCATION_ID').AsInteger := tblLocationStock.FieldByName('LOCATION_ID').AsInteger;

end;

procedure TCostingDM.tblBOMAfterPost(DataSet: TDataSet);
begin
  tblBOM.RefreshRecord; //to update computed field win_cost
end;

procedure TCostingDM.tblBookmarksAfterInsert(DataSet: TDataSet);
begin
  tblBookmarks.FieldByName('uid').AsInteger := loggeduser.UID;
end;

procedure TCostingDM.tblCalloutsAfterInsert(DataSet: TDataSet);
begin
  tblCallouts.FieldByName('SM_ID').AsInteger := tblSeriesModel.FieldByName('SM_ID').AsInteger;

end;

procedure TCostingDM.tblCustContactsAfterInsert(DataSet: TDataSet);
begin
  tblCustContacts.FieldByName('CUSTOMER_ID').AsInteger := tblCustomers.FieldByName('CUSTOMER_ID').AsInteger;
end;

procedure TCostingDM.tblCustContactsAfterPost(DataSet: TDataSet);
begin
  tblCustContacts.Refresh;
end;

procedure TCostingDM.tblCustContactsBeforePost(DataSet: TDataSet);
begin
  if tblCustContacts.FieldByName('CONTACT_EMAIL').AsString <> '' then
    if not is_email_correct(tblCustContacts.FieldByName('CONTACT_EMAIL').AsString) then
      raise Exception.Create('email format not correct');
end;

procedure TCostingDM.tblCustomersAfterInsert(DataSet: TDataSet);
begin
  tblCustomers.FieldByName('DATE_CREATED').AsDateTime := now;
  tblCustomers.FieldByName('OPERATOR').AsString := LoggedUser.UName;
end;

procedure TCostingDM.tblGlassTypeAfterPost(DataSet: TDataSet);
begin
  tblGlassType.RefreshRecord; //display computed field "cost" value
end;

procedure TCostingDM.tblIGUAfterInsert(DataSet: TDataSet);
begin
  tblIGU.FieldByName('QUOTE_WIN_ID').AsInteger := tblWindows.FieldByName('QUOTE_WIN_ID').AsInteger;
  //tblIGU.MasterSource.DataSet.FieldByName('QUOTE_WIN_ID').AsInteger;
end;

procedure TCostingDM.tblIGU_SM_LitesAfterDelete(DataSet: TDataSet);
begin
  tblIGU_SM_Lites.Refresh;
end;

procedure TCostingDM.tblIGU_SM_LitesAfterInsert(DataSet: TDataSet);
begin
  tblIGU_SM_Lites.FieldByName('SM_ID').AsInteger := tblSeriesModel.FieldByName('SM_ID').AsInteger;

end;

procedure TCostingDM.tblIGU_SM_LitesAfterPost(DataSet: TDataSet);
begin
  tblIGU_SM_Lites.RefreshRecord;
end;

procedure TCostingDM.tblInvShadowBeforeEdit(DataSet: TDataSet);
begin
  DESCRIPTION := tblInvShadow.FieldByName('DESCRIPTION').AsString;

  UOM_METHOD := tblInvShadow.FieldByName('UOM_METHOD').AsString;
  UOM_CONVERSION := tblInvShadow.FieldByName('UOM_CONVERSION').AsCurrency;
  UOM_BOM := tblInvShadow.FieldByName('UOM_BOM').AsString;
  PRICE_BOM := tblInvShadow.FieldByName('PRICE_BOM').AsCurrency;

  //USER_OPERATOR := win user
end;

procedure TCostingDM.tblInvShadowBeforePost(DataSet: TDataSet);
begin
  if tblInvShadow.state <> dsedit then exit;
  //store archive data
  tblInvShadowArch.Insert;
  tblInvShadowArch.FieldByName('INV_SHADOW_ID').AsInteger := tblInvShadow.FieldByName('INV_SHADOW_ID').AsInteger;

  tblInvShadowArch.FieldByName('PART_NUMBER').AsString := tblInvShadow.FieldByName('PART_NUMBER').AsString;

  if tblInvShadow.FieldByName('DESCRIPTION').AsString <> DESCRIPTION then
    tblInvShadowArch.FieldByName('DESCRIPTION').AsString := DESCRIPTION;

  if tblInvShadow.FieldByName('UOM_METHOD').AsString <> UOM_METHOD then
    tblInvShadowArch.FieldByName('UOM_METHOD').AsString := UOM_METHOD;

  if tblInvShadow.FieldByName('UOM_CONVERSION').AsCurrency <> UOM_CONVERSION then
    tblInvShadowArch.FieldByName('UOM_CONVERSION').AsCurrency := UOM_CONVERSION;

  if tblInvShadow.FieldByName('UOM_BOM').AsString <> UOM_BOM then
    tblInvShadowArch.FieldByName('UOM_BOM').AsString := UOM_BOM;

  if tblInvShadow.FieldByName('PRICE_BOM').AsCurrency <> PRICE_BOM then
    tblInvShadowArch.FieldByName('PRICE_BOM').AsCurrency := PRICE_BOM;

  tblInvShadowArch.FieldByName('USER_OPERATOR').AsString := WIN_USERNAME;

  tblInvShadowArch.FieldByName('DATE_SAVED').AsDateTime := now;

  tblInvShadowArch.Post;

end;

procedure TCostingDM.tblQAccessoriesAfterInsert(DataSet: TDataSet);
begin
  tblQAccessories.FieldByName('QUOTE_ID').AsInteger := tblQuotes.FieldByName('QUOTE_ID').AsInteger;
  tblQAccessories.FieldByName('OPERATOR_SAVED').AsString := WIN_USERNAME;
  tblQAccessories.FieldByName('DATE_SAVED').AsDateTime := now;

end;

procedure TCostingDM.tblQuotePricesAfterInsert(DataSet: TDataSet);
begin
  tblQuotePrices.FieldByName('QUOTE_ID').AsInteger := tblQuotes.FieldByName('QUOTE_ID').AsInteger;
end;

procedure TCostingDM.tblQuotesAfterEdit(DataSet: TDataSet);
begin
  tblQuotes.FieldByName('OPERATOR_LAST_MODIFIED').AsString := WIN_USERNAME;
  tblQuotes.FieldByName('DATE_LAST_MODIFIED').AsDateTime := now;
end;

procedure TCostingDM.tblQuotesAfterInsert(DataSet: TDataSet);
begin
  tblQuotes.FieldByName('CUSTOMER_ID').AsInteger := tblCustomers.FieldByName('CUSTOMER_ID').AsInteger;
  tblQuotes.FieldByName('TAX_EXEMPT').AsInteger := tblCustomers.FieldByName('TAX_EXEMPT').AsInteger;

  tblQuotes.FieldByName('QUOTE_DATE').AsDateTime := now;
  tblQuotes.FieldByName('OPERATOR_SAVED').AsString := LoggedUser.UName;
  tblQuotes.FieldByName('DATE_SAVED').AsDateTime := now;

  tblQuotes.FieldByName('QUOTE_NO').AsInteger := get_quote_no;

  tblQuotes.FieldByName('GRID_COLOR_STATUS_ID').AsInteger := 2;  //Bidding
end;

procedure TCostingDM.tblQuotesAfterPost(DataSet: TDataSet);
begin
  tblQuotes.RefreshRecord;

end;

procedure TCostingDM.tblQuotesBeforePost(DataSet: TDataSet);
begin
  if tblQuotes.FieldByName('IS_TRACT').AsInteger = 1 then begin

    if tblQuotes.FieldByName('TRACT_ID').IsNull
      Or tblQuotes.FieldByName('PHASE_ID').IsNull then raise Exception.Create('You Must Enter Tract/Phase Data');

  end;

end;

procedure TCostingDM.tblSeriesModelAfterInsert(DataSet: TDataSet);
begin
  tblSeriesModel.FieldByName('SERIES_ID').AsInteger := tblSeries.FieldByName('SERIES_ID').AsInteger;

end;

procedure TCostingDM.tblSPCalloutAfterInsert(DataSet: TDataSet);
begin
  if tblSeriesModel.FieldByName('is_special_model').AsInteger <> 1 then begin
    tblSPCallout.Cancel;
    raise Exception.Create('Not a special model');
  end;
  tblSPCallout.FieldByName('SM_ID').AsInteger := tblSeriesModel.FieldByName('SM_ID').AsInteger;
end;

procedure TCostingDM.tblSPDIMAfterInsert(DataSet: TDataSet);
begin
  if tblSPCallout.State in dseditmodes then tblSPCallout.Post;

  tblSPDIM.FieldByName('SP_CALLOUT_ID').AsInteger := tblSPCallout.FieldByName('SP_CALLOUT_ID').AsInteger;
end;

procedure TCostingDM.tblSTC_SMAfterInsert(DataSet: TDataSet);
begin
  tblSTC_SM.FieldByName('SM_ID').AsInteger := tblSeriesModel.FieldByName('SM_ID').AsInteger;
end;

procedure TCostingDM.tblTempGlassAfterPost(DataSet: TDataSet);
begin
  tblTempGlass.RefreshRecord;
end;

procedure TCostingDM.tblTempGlassOrdersAfterDelete(DataSet: TDataSet);
begin
  tblTempGlass.RefreshRecord;
end;

procedure TCostingDM.tblTempGlassOrdersAfterInsert(DataSet: TDataSet);
begin
  tblTempGlassOrders.FieldByName('TEMPERED_GLASS_ID').AsInteger := tblTempGlass.FieldByName('TEMPERED_GLASS_ID').AsInteger;
end;

procedure TCostingDM.tblTempGlassOrdersAfterPost(DataSet: TDataSet);
begin
  tblTempGlass.Refresh;
end;

procedure TCostingDM.tblTractAfterInsert(DataSet: TDataSet);
begin
  tblTract.FieldByName('CUSTOMER_ID').AsInteger := tblCustomers.FieldByName('CUSTOMER_ID').AsInteger;
  tblTract.FieldByName('GRID_COLOR_STATUS_ID').AsInteger := 2; //Bidding

end;

procedure TCostingDM.tblTractBeforePost(DataSet: TDataSet);
begin
  tblTract.FieldByName('UID_OPERATOR').AsInteger := LoggedUser.UID;
end;

procedure TCostingDM.tblTractContactAfterInsert(DataSet: TDataSet);
begin
  tblTractContact.FieldByName('TRACT_ID').AsInteger := tblTract.FieldByName('TRACT_ID').AsInteger;
end;

procedure TCostingDM.tblTractContactAfterPost(DataSet: TDataSet);
begin
  tblTractContact.RefreshRecord; //to display lookup records
end;

procedure TCostingDM.tblTractPhaseAfterInsert(DataSet: TDataSet);
begin
  tblTractPhase.FieldByName('TRACT_ID').AsInteger := tblTract.FieldByName('TRACT_ID').AsInteger;
  tblTractPhase.FieldByName('SALESTAX_PERCENT').AsCurrency := tblZipnTax.FieldByName('SALES_TAX_RATE').AsCurrency;
end;

procedure TCostingDM.tblUsersBeforePost(DataSet: TDataSet);
begin
  if tblUsers.FieldByName('uid').AsInteger = 1 then begin
    if TAPPUGroup(tblUsers.FieldByName('ugroup').AsInteger) <> APP_UG_ADMINS then begin
      tblUsers.Cancel;
      raise exception.Create('This user can not be changed to any other group');

    end;
  end;

end;

procedure TCostingDM.tblUserSettingsAfterInsert(DataSet: TDataSet);
begin
  tblUserSettings.FieldByName('UID').AsInteger := LoggedUser.UID;
end;

procedure TCostingDM.tblWindowsAfterEdit(DataSet: TDataSet);
begin
  tblWindows.FieldByName('OPERATOR_LAST_MODIFIED').AsString := loggeduser.UName;
  tblWindows.FieldByName('DATE_LAST_MODIFIED').AsDateTime := now;
end;

procedure TCostingDM.tblWindowsAfterInsert(DataSet: TDataSet);
begin
  tblWindows.FieldByName('QUOTE_ID').AsInteger := tblQuotes.FieldByName('QUOTE_ID').AsInteger;

  tblWindows.FieldByName('is_tract').AsInteger := tblQuotes.FieldByName('is_tract').AsInteger;
  tblWindows.FieldByName('IS_SERVICE').AsInteger := tblQuotes.FieldByName('IS_SERVICE').AsInteger;

  tblWindows.FieldByName('NFS').AsInteger := tblQuotes.FieldByName('NFS').AsInteger;
  tblWindows.FieldByName('UFZ').AsInteger := tblQuotes.FieldByName('UFZ').AsInteger;

  if not tblQuotes.FieldByName('SERIES_ID').IsNull then
    tblWindows.FieldByName('SERIES_ID').AsInteger := tblQuotes.FieldByName('SERIES_ID').AsInteger;

  if not tblQuotes.FieldByName('SC_ID').IsNull then
    tblWindows.FieldByName('SC_ID').AsInteger := tblQuotes.FieldByName('SC_ID').AsInteger;

  if not tblQuotes.FieldByName('SNF_ID').IsNull then
    tblWindows.FieldByName('SNF_ID').AsInteger := tblQuotes.FieldByName('SNF_ID').AsInteger;

  if not tblQuotes.FieldByName('GLAZING_ID').IsNull then
    tblWindows.FieldByName('GLAZING_ID').AsInteger := tblQuotes.FieldByName('GLAZING_ID').AsInteger;

  tblWindows.FieldByName('GRIDS_ID').AsVariant := tblQuotes.FieldByName('GRIDS_ID').AsVariant;

  if not tblQuotes.FieldByName('GLASS_KIND_ID_OUTER').IsNull then
    tblWindows.FieldByName('GLASS_KIND_ID_OUTER').AsInteger := tblQuotes.FieldByName('GLASS_KIND_ID_OUTER').AsInteger;

  if not tblQuotes.FieldByName('GLASS_KIND_ID_INNER').IsNull then
    tblWindows.FieldByName('GLASS_KIND_ID_INNER').AsInteger := tblQuotes.FieldByName('GLASS_KIND_ID_INNER').AsInteger;

  if not tblQuotes.FieldByName('GAS_ID').IsNull then
    tblWindows.FieldByName('GAS_ID').AsInteger := tblQuotes.FieldByName('GAS_ID').AsInteger;

  tblWindows.FieldByName('W_OPERATOR').AsString := WIN_USERNAME;
  tblWindows.FieldByName('DATE_SAVED').AsDateTime := now;

end;

procedure TCostingDM.tblWindowsAfterPost(DataSet: TDataSet);
begin
  tblWindows.RefreshRecord;

  tblIGU.DisableControls;
  tblIGU.Refresh;
  tblIGU.EnableControls;

end;

procedure TCostingDM.tblWindowsBeforePost(DataSet: TDataSet);
var
w_width, w_height: real;
sm_min_width, sm_max_width,
sm_min_height, sm_max_height,
sm_max_area, sm_max_width_div_height,
sm_min_width_div_height: real;
//w_grids_updown, w_grids_across: integer; //w_gkind, w_gpat
//m_vert_horz: string;
begin
  //Validate before post
  //Size Validations for NFS windows only, not for Callout windows which are
  //limited by CALLOUTS table

  w_width := tblWindows.FieldByName('WIN_WIDTH').AsSingle;
  w_height := tblWindows.FieldByName('WIN_HEIGHT').AsSingle;

  if tblWindows.FieldByName('SM_ID').IsNull then
    raise Exception.Create('You must select a model');

  if tblWindows.FieldByName('NFS').AsInteger = 1 then begin

    if (tblWindows.FieldByName('WIN_WIDTH').IsNull) or (tblWindows.FieldByName('WIN_HEIGHT').IsNull)
      Or (w_width <= 0) or (w_height <= 0) then
      raise Exception.Create('You must enter a value for window width and height');

    sm_min_width := tblSeriesModel.FieldByName('MIN_WIDTH').AsSingle;
    sm_max_width := tblSeriesModel.FieldByName('MAX_WIDTH').AsSingle;

    sm_min_height := tblSeriesModel.FieldByName('MIN_HEIGHT').AsSingle;
    sm_max_height := tblSeriesModel.FieldByName('MAX_HEIGHT').AsSingle;

    sm_max_area := tblSeriesModel.FieldByName('MAX_AREA').AsSingle;

    sm_max_width_div_height := tblSeriesModel.FieldByName('MAX_WIDTH_HEIGHT').AsSingle;

    sm_min_width_div_height := tblSeriesModel.FieldByName('MIN_WIDTH_HEIGHT').AsSingle;


    if (w_width < sm_min_width) then
      raise Exception.Create('Window width can not be less than '+floattostr(sm_min_width));

    if (w_width > sm_max_width) then
      raise Exception.Create('Window width can not be more than '+floattostr(sm_max_width));

    if (w_height < sm_min_height) then
      raise Exception.Create('Window height can not be less than '+floattostr(sm_min_height));

    if (w_height > sm_max_height) then
      raise Exception.Create('Window height can not be more than '+floattostr(sm_max_height));

    if ((w_width/12 * w_height/12) > sm_max_area) then
      raise Exception.Create('Window area can not be more than '+ formatfloat('#,0',sm_max_area) +' square feet');

    if (w_width / w_height > sm_max_width_div_height) then
      raise Exception.Create('Window is too wide or not tall enough');

    if (w_width / w_height <  sm_min_width_div_height) then
      raise Exception.Create('Window is too narrow or too tall');

  end
  else if tblWindows.FieldByName('CALLOUTS_ID').IsNull then
    raise Exception.Create('You must enter a Callout Size');

  //---------------------------------------------------------------------------------------
 {this is giving us input problems and needs more study before implementation
  w_grids_updown := tblWindows.FieldByName('GRIDS_UPDOWN').AsInteger;
  w_grids_across := tblWindows.FieldByName('GRIDS_ACROSS').AsInteger;
  m_vert_horz := tblSeriesModel.FieldByName('VERT_HORZ').AsString;

  if (m_vert_horz = 'V') and (w_grids_updown AND 1 = 1) then
    raise Exception.Create('The grid pattern vertically will not work');

  if (m_vert_horz = 'H') and (w_grids_across AND 1 = 1) then
    raise Exception.Create('The grid pattern horizontally will not work');

  if (tblGridCost.FieldByName('GKIND_NAME').AsString <> 'NOGRID') and ((tblWindows.FieldByName('GRIDS_UPDOWN').AsInteger < 1)
    or (tblWindows.FieldByName('GRIDS_ACROSS').AsInteger < 1)) then
    raise Exception.Create('You must enter grids horizontal and vertical values'); }


  if tblWindows.FieldByName('IS_SPECIAL_WINDOW').AsInteger = 1 then
    if tblWindows.FieldByName('SP_CALLOUT_ID').IsNull then
      raise Exception.Create('You must select special callout');
    
    
end;

procedure TCostingDM.tblWindowStockAfterInsert(DataSet: TDataSet);
begin
  tblWindowStock.FieldByName('LOCATION_ID').AsInteger := tblLocationStock.FieldByName('LOCATION_ID').AsInteger;

  tblWindowStock.FieldByName('OPERATOR_SAVED').AsString := WIN_USERNAME;
  tblWindowStock.FieldByName('DATE_SAVED').AsDateTime := now;
end;

procedure TCostingDM.tblWinLock_SMAfterInsert(DataSet: TDataSet);
begin
  tblWinLock_SM.FieldByName('SM_ID').AsInteger := tblSeriesModel.FieldByName('SM_ID').AsInteger;
end;

procedure TCostingDM.tblWin_MullAfterInsert(DataSet: TDataSet);
begin
  tblWin_Mull.FieldByName('QUOTE_WIN_ID').AsInteger := tblWindows.FieldByName('QUOTE_WIN_ID').AsInteger;
end;

procedure TCostingDM.tblWin_MullAfterPost(DataSet: TDataSet);
begin
  tblWin_Mull.RefreshRecord; // to display lookup fields data
end;

procedure TCostingDM.tblXPanel_SM_LitesAfterInsert(DataSet: TDataSet);
begin
  tblXPanel_SM_Lites.FieldByName('SM_ID').AsInteger := tblSeriesModel.FieldByName('SM_ID').AsInteger;
end;

function TCostingDM.varIsNullR0(value: variant): variant;
begin
  if varisnull(value) then
    result := 0
  else
    result := value;

end;

procedure TCostingDM.CopyFromGlobal(table: TIBCQuery);
begin
  // This code is used with two forms window and window quick edit and quotes

  if table.State = dsbrowse then table.Edit;

  table.FieldByName('SERIES_ID').AsInteger := tblUserSettings.FieldByName('SERIES_ID').AsInteger;
  table.FieldByName('SC_ID').AsInteger := tblUserSettings.FieldByName('SC_ID').AsInteger;
  table.FieldByName('SNF_ID').AsInteger := tblUserSettings.FieldByName('SNF_ID').AsInteger;
  table.FieldByName('GRIDS_ID').AsInteger := tblUserSettings.FieldByName('GRIDS_ID').AsInteger;
  table.FieldByName('GLAZING_ID').AsInteger := tblUserSettings.FieldByName('GLAZING_ID').AsInteger;
  table.FieldByName('GLASS_KIND_ID_OUTER').AsInteger := tblUserSettings.FieldByName('GLASS_KIND_ID_OUTER').AsInteger;
  table.FieldByName('GLASS_KIND_ID_MIDDLE').AsInteger := tblUserSettings.FieldByName('GLASS_KIND_ID_MIDDLE').AsInteger;
  table.FieldByName('GLASS_KIND_ID_INNER').AsInteger := tblUserSettings.FieldByName('GLASS_KIND_ID_INNER').AsInteger;
  table.FieldByName('GAS_ID').AsInteger := tblUserSettings.FieldByName('GAS_ID').AsInteger;
  table.FieldByName('UFZ').AsInteger := tblUserSettings.FieldByName('UFZ').AsInteger;
  table.FieldByName('NFS').AsInteger := tblUserSettings.FieldByName('NFS').AsInteger;

end;

function GetCurrentUserName(out DomainName, UserName: string): Boolean;
var
  Token: THandle;
  InfoSize, UserNameSize, DomainNameSize: Cardinal;
  User: PTokenUser;
  Use: SID_NAME_USE;
  _DomainName, _UserName: array[0..255] of Char;
begin
  Result := False;
  DomainName := '';
  UserName := '';
  Token := 0;

  if not OpenThreadToken(GetCurrentThread, TOKEN_QUERY, True, Token) then begin

    if GetLastError = ERROR_NO_TOKEN then begin // current thread is not impersonating, try process token
      if not OpenProcessToken(GetCurrentProcess, TOKEN_QUERY, Token) then Exit;
    end
    else Exit;

  end;

  try
    GetTokenInformation(Token, TokenUser, nil, 0, InfoSize);
    User := AllocMem(InfoSize * 2);

    try
      if GetTokenInformation(Token, TokenUser, User, InfoSize * 2, InfoSize) then begin

        DomainNameSize := SizeOf(_DomainName);
        UserNameSize := SizeOf(_UserName);

        Result := LookupAccountSid(nil, User^.User.Sid, _UserName, UserNameSize, _DomainName, DomainNameSize, Use);

        if Result then begin
          SetString(DomainName, _DomainName, StrLen(_DomainName));
          SetString(UserName, _UserName, StrLen(_UserName));
        end;
      end;
    finally
      FreeMem(User);
    end;

  finally
    CloseHandle(Token);
  end;

  {---------- Use
  var
DomainName, UserName: string;

begin
  if not GetCurrentUserName(DomainName, UserName) then RaiseLastOSError;
  caption := (Format('%s\%s', [DomainName, UserName]));}

end;

//------------------------------------------------------------------------------

function NetWkstaUserEnum(servername: PWideChar;
  // Pointer to a string that specifies the DNS or NetBIOS name of the
  // remote server on which the function is to execute.
  // If this parameter is nil, the local computer is used.
  level: DWORD;
  // Level = 0 : Return the names of users currently logged on to the workstation.
  var bufptr: Pointer;   // Pointer to the buffer that receives the data
  prefmaxlen: DWORD;
  // Specifies the preferred maximum length of returned data, in bytes.
  var entriesread: PDWord;
  // Pointer to a value that receives the count of elements actually enumerated.
  var totalentries: PDWord;  // total number of entries
  var resumehandle: PDWord)
  // contains a resume handle which is used to continue an existing search
  : Longint;
  stdcall; external 'netapi32.dll' Name 'NetWkstaUserEnum';


function EnumNetUsers(HostName: WideString {; Users: TStrings}): THostInfo;
const
  STR_ERROR_ACCESS_DENIED = 'The user does not have access to the requested information.';
  STR_ERROR_MORE_DATA = 'Specify a large enough buffer to receive all entries.';
  STR_ERROR_INVALID_LEVEL = 'The level parameter is invalid.';
var
  Info: Pointer;
  ElTotal: PDWord;
  ElCount: PDWord;
  Resume: PDWord;
  Error: Longint;
  // UI : PWKSTA_USER_INFO_0;
  // i : Integer;
begin
  Resume := NIL; //0
  NetWkstaUserEnum(PWideChar(HostName),
    1,
    Info,
    0,
    ElCount,
    ElTotal,
    Resume);

  Error := NetWkstaUserEnum(PWideChar(HostName),
    1,
    Info,
    256 * Integer(ElTotal),
    ElCount,
    ElTotal,
    Resume);

  case Error of
    ERROR_ACCESS_DENIED: Result.UserName := STR_ERROR_ACCESS_DENIED;
    ERROR_MORE_DATA: Result.UserName     := STR_ERROR_MORE_DATA;
    ERROR_INVALID_LEVEL: Result.UserName := STR_ERROR_INVALID_LEVEL
  else
    if Info <> nil then begin
      Result := THostInfo(info^);
      {
      To retrieve all users:
      UI := PWKSTA_USER_INFO_0(Info);
      for i := 1 to DWord(ElCount) do
      begin
        Users.Add(UI^.wkui0_username);
        inc(UI);
      end;
      }
    end
    else begin
      Result.UserName      := 'N/A';
      Result.logon_domain  := 'N/A';
      Result.other_domains := 'N/A';
      Result.logon_server  := 'N/A';
    end;
  end;

  {--------- use
  var
  HostInfo: THostInfo;
begin
  // Specify target machine as argument (with or without preceding \\)
  HostInfo := EnumNetUsers('WORKSTATION');
  with HostInfo do
  begin
    Memo1.Lines.Add(username + #13#10 +
      logon_domain + #13#10 +
      other_domains + #13#10 +
      logon_server);
  end;
  }

end;

function TCostingDM.is_email_correct(email_txt: string): boolean;
var
at_pos: integer;
begin
  at_pos := pos('@', email_txt);

  result := False;
  if (at_pos > 0) then
    result := (pos('.',copy(email_txt, at_pos+1, 80)) > 0);
end;

procedure TCostingDM.lookup_tables(open: boolean);
begin
  tblCallouts_lookup.Active := open;
  tblSerMod_Lookup.Active := open;
  tblSeriesHanding_lookup.Active := open;
  tblPaint_SM_lookup.Active := open;
end;

function TCostingDM.get_quote_no: integer;
begin
  MainSQL.Close;
  MainSQL.SQL.Clear;
  //MainSQL.SQL.Add('SELECT GEN_ID(GEN_SO_QUOTE_HDR_QUOTE_NO, 0) FROM RDB$DATABASE');
  MainSQL.SQL.Add('SELECT NEXT VALUE FOR GEN_SO_QUOTE_HDR_QUOTE_NO from RDB$DATABASE');
  MainSQL.Open;

  result := MainSQL.Fields[0].AsInteger;

end;

procedure TCostingDM.SaveCryptedConfig;
var
fname: string;
mini : TMemIniFile;
sl : TStrings;
cnt : integer;
begin
  fname := App_Dir + 'appconfig.dat';

  sl := TStringList.Create;
  mini := TMemIniFile.Create(fname);
  try
    mini.WriteString('twilio', 'AccountSID', 'AC40ace0356898aa26232a79e532258a3d');
    mini.WriteString('twilio', 'AuthToken', 'ee189e8b99256e5c0aa3a38efcafd280');
    mini.WriteString('twilio', 'APIVersion', '2010-04-01');
    mini.WriteString('twilio', 'SMSFrom', '213-290-9123');
    mini.WriteString('twilio', 'Version', 'Sales1');

    mini.GetStrings(sl);

    for cnt := 0 to -1 + sl.Count do
      sl[cnt] := EnDeCrypt(sl[cnt]);

    //SetStrings and UpdateFile would mess up the thing so directly
    //saving using TStringList (SetStrings tries to read as ini file cryptig is not)
    sl.SaveToFile(fname);
  finally
    FreeAndNil(sl);
    FreeAndNil(mini);
  end;
end;

function TCostingDM.EnDeCrypt(const Value : String) : String;
var
  CharIndex : integer;
begin
  Result := Value;
  for CharIndex := 1 to Length(Value) do
    Result[CharIndex] := chr(ord(Value[CharIndex]) xor 8); //chr(not(ord(Value[CharIndex])));

end;

function TCostingDM.LoadCryptedConfig: Ttwilio;
var
fname: string;
mini: TMemIniFile;
sl: TStrings;
cnt: integer;
begin
  fname := App_Dir + 'appconfig.dat';
  sl := TStringList.Create;

  //loading this file makes no sense as it is hashed
  mini := TMemIniFile.Create(fname);
  try
    sl.LoadFromFile(fname); //crypted one

    for cnt := 0 to -1 + sl.Count do
      sl[cnt] := EnDeCrypt(sl[cnt]);

    mini.SetStrings(sl);

    result.SMSFrom := mini.ReadString('twilio', 'SMSFrom', 'From ATI & ABC Windows');
    result.AccountSID := mini.ReadString('twilio', 'AccountSID', '');
    result.AuthToken := mini.ReadString('twilio', 'AuthToken', '');
    result.APIVersion := mini.ReadString('twilio', 'APIVersion', '');
    result.Version := mini.ReadString('twilio', 'Version', '');

  finally
    FreeAndNil(sl);
    FreeAndNil(mini);
  end;

end;

function TCostingDM.IsKeyDown(const PKey: Byte): Boolean;
begin
Result := ( ( GetAsyncKeyState( PKey ) and $80 ) = $80 );
end; //IsKeyDown

function TCostingDM.IsKeyCombinationDown(const PKeys: array of Byte): Boolean;
var
key_idx : Integer;
LKeyState : TKeyboardState;


  function KeyIsDown(const PKey: Byte): Boolean;
  begin
    Result := ((LKeyState[PKey] and $80) = $80);
  end; //KeyIsDown

begin

  result := (Length(PKeys) > 0) and GetKeyBoardState(LKeyState);

  if result then begin

    // check history 0 and 1 boolean when they up then boolean = false
    //showmessage(pkeys[0]);

    for key_idx := Low(PKeys) to High(PKeys) do begin

      hist_pkeys[key_idx] := not hist_pkeys[key_idx];

      hist_pkeys[key_idx] := hist_pkeys[key_idx] and KeyIsDown(PKeys[key_idx]);

      {if result and key_idx = 0 then
        //key 1 = not key 1;

      else if result and key_idx = 1 then
        //key 2 = not key 2;
      else if result and key_idx = 2 then
        //result = (key 1 and key 2)
        // key 1 = F; Key 2 = F;}

      result := hist_pkeys[key_idx];

      if not result then Break;

    end; //for


  end;

  //usage: if IsKeyCombinationDown([VK_CONTROL, Ord('C'), Ord('N')]) then showmessage('Pressed');

end;

procedure TCostingDM.CopyQuote(pQUOTE_ID: integer);
begin
  if messagedlg('Copy quote ?', mtConfirmation, [mbYes, mbNo],0) <> mryes then exit;

  mStoredProc.StoredProcName := 'NATIVE_COPY_QUOTE_PROC';
  mStoredProc.PrepareSQL(false);
  mStoredProc.ParamByName('P_QUOTE_ID').AsInteger := pQUOTE_ID;
  mStoredProc.ParamByName('P_OPERATOR_SAVED').AsString := LoggedUser.UName;

  mStoredProc.ExecProc;
  TransRead.CommitRetaining;

  tblPhaseQuotes.DisableControls;

  tblQuotes.DisableControls;
  tblWindows.DisableControls;
  tblIGU.DisableControls;

  tblPhaseQuotes.Refresh;

  tblQuotes.Refresh;
  tblWindows.Refresh;
  tblIGU.Refresh;

  tblIGU.EnableControls;
  tblWindows.EnableControls;
  tblPhaseQuotes.EnableControls;

  tblQuotes.Locate('QUOTE_ID', pQUOTE_ID, []);
  tblQuotes.EnableControls;

end;

procedure TCostingDM.CopyToExistingQuote(p_org_QUOTE_ID, p_trg_QUOTE_ID: integer);
begin

  mStoredProc.StoredProcName := 'NATIVE_COPY_WINDOWS_QUOTE_PROC';
  mStoredProc.PrepareSQL(false);
  mStoredProc.ParamByName('P_SOURCE_QUOTE_ID').AsInteger := p_org_QUOTE_ID;
  mStoredProc.ParamByName('P_TARGET_QUOTE_ID').AsInteger := p_trg_QUOTE_ID;
  mStoredProc.ParamByName('P_OPERATOR_SAVED').AsString := LoggedUser.UName;

  mStoredProc.ExecProc;
  TransRead.CommitRetaining;

  tblPhaseQuotes.DisableControls;

  tblQuotes.DisableControls;
  tblWindows.DisableControls;
  tblIGU.DisableControls;

  tblPhaseQuotes.Refresh;

  tblQuotes.Refresh;
  tblWindows.Refresh;
  tblIGU.Refresh;

  tblIGU.EnableControls;
  tblWindows.EnableControls;
  tblPhaseQuotes.EnableControls;

  tblQuotes.EnableControls;

  //insert a record into quote option table
  if tblQuotes.FieldByName('IS_OPTION').AsInteger = 1 then begin
    tblQuoteOpt.Insert;
    tblQuoteOpt.FieldByName('QUOTE_ID_FROM').AsInteger := p_org_QUOTE_ID;
    tblQuoteOpt.FieldByName('QUOTE_ID_TO').AsInteger := p_trg_QUOTE_ID;

    tblQuoteOpt.FieldByName('DESCRIPTION').AsString := tblQuotes.FieldByName('JOB_NAME').AsString;

    tblQuoteOpt.FieldByName('USER_NAME').AsString := LoggedUser.UName;
    tblQuoteOpt.Post;
  end;

end;

procedure TCostingDM.DBAlerterEvent(Sender: TObject; EventName: string;
  EventCount: Integer);
begin
  if APP_SHOP in ConnectedApp then begin
    if CompareText(EventName, 'job_batch_day_seq_updated') = 0 then
      if not (tblJobBatches.State in dseditmodes) then
        tblJobBatches.Refresh;

  end;
end;

function TCostingDM.db_connect: boolean;
var
add_where: string;
begin
  //***************** Important Notes **********************************************************************************
  //*
  //* using two level details grid and the built in devexpress master/detail raise error that field not found due to bug
  //* in synchronization when one dataset is opened and then the other. two possible solutions: use grid mode or
  //* use master/detail at the dataset level - I also managed to avoid this by change open dataset order at the startup
  //--------------------------------------------------------------------------------------------------------------------


  //db_folder := ExpandFileName(extractfiledir(application.ExeName)+ '\..')+'\DB';
  result := false;
  try
    mdDBSettings.Close;
    mdDBSettings.LoadFromBinaryFile(App_Dir+'settings.dat');
    mdDBSettings.Open;

    // open windows db ---------------------------

    MainDB.Database := mdDBSettings.FieldByName('db_ip').AsString+':'+mdDBSettings.FieldByName('db_path').AsString; //db_folder+'\WINDOZ.GDB';
    MainDB.ClientLibrary := 'fbclient.dll';
    MainDB.Connected := true;

    TransRead.Active := true;
    TransWrite.Active := true;

    tblUsers.Active := APP_SALES in ConnectedApp;
    tblUserSettings.Active := (ConnectedApp * [APP_SALES, APP_COSTING] <> []);

    tblTractType.Active := APP_SALES in ConnectedApp;
    tblSalesZone.Active := (ConnectedApp * [APP_SALES, APP_COSTING] <> []);

    tblGroups.Active := APP_SALES in ConnectedApp;
    tblGStatusColor.Active := (ConnectedApp * [APP_SALES, APP_COSTING] <> []);

    tblCountries.Active := APP_SALES in ConnectedApp;
    tblZipnTax.Active := (ConnectedApp * [APP_SALES, APP_COSTING] <> []);

    tblCustomers.Active := APP_SALES in ConnectedApp;
    tblCustContacts.Active := APP_SALES in ConnectedApp;

    // Series Models -------------------------------------------------------------------------------
    if APP_COSTING in ConnectedApp then
      tblSeries.ParamByName('vp').AsString := '%'
    else
      tblSeries.ParamByName('vp').AsString := '1';
    tblSeries.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);

    tblModels.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);
    tblModelTypes.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);
    //----------------------------------------------------------------------------------------------
    if APP_COSTING in ConnectedApp then
      tblSeriesModel.ParamByName('vp').AsString := '%'
    else
      tblSeriesModel.ParamByName('vp').AsString := '1';
    tblSeriesModel.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);
    //-----------------------------------------------------------------------------------------------
    tblSPCallout.Active := (ConnectedApp * [APP_SALES, APP_COSTING] <> []);
    tblSPDIM.Active := (ConnectedApp * [APP_SALES, APP_COSTING] <> []);
    //----------------------------------------------------------------------------------------------

    // Gas ---------------------------------------------------
    if APP_COSTING in ConnectedApp then
      tblGas.ParamByName('vp').AsString := '%'
    else
      tblGas.ParamByName('vp').AsString := '1';
    tblGas.Active := ConnectedApp * [APP_SALES, APP_COSTING] <> [];

    //--------------------------------------------------------

    // Glazing ------------------------------------------
    if APP_COSTING in ConnectedApp then
      tblGlazing.ParamByName('vp').AsString := '%'
    else
      tblGlazing.ParamByName('vp').AsString := '1';
    tblGlazing.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);
    //---------------------------------------------------

    // Glass Type ---------------------------------------
    if APP_COSTING in ConnectedApp then
      tblGlassType.ParamByName('vp').AsString := '%'
    else
      tblGlassType.ParamByName('vp').AsString := '1';
    tblGlassType.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);
    //---------------------------------------------------

    tblGlassEdge.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);

    tblTempGlass.Active := APP_PRODUCTION in ConnectedApp;;
    tblTempGlassOrders.Active := APP_PRODUCTION in ConnectedApp;;

    // Colors --------------------------------------------
    tblColors.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);

    if APP_COSTING in ConnectedApp then
      tblSeriesColor.ParamByName('vp').AsString := '%'
    else
      tblSeriesColor.ParamByName('vp').AsString := '1';
    tblSeriesColor.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);
    //----------------------------------------------------

    // Paint --------------------------------------------
    tblPaint.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);

    if APP_COSTING in ConnectedApp then
      tblPaint_SM.ParamByName('vp').AsString := '%'
    else
      tblPaint_SM.ParamByName('vp').AsString := '1';
    tblPaint_SM.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);
    //---------------------------------------------------

    // Win Lock -----------------------------------------
    if APP_COSTING in ConnectedApp then
      tblWinLock_SM.ParamByName('vp').AsString := '%'
    else
      tblWinLock_SM.ParamByName('vp').AsString := '1';
    tblWinLock_SM.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);
    //---------------------------------------------------

    // Screen -------------------------------------------
    tblScreen.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);

    if APP_COSTING in ConnectedApp then
      tblScreen_SM.ParamByName('vp').AsString := '%'
    else
      tblScreen_SM.ParamByName('vp').AsString := '1';
    tblScreen_SM.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);
    //------------------------------------------------------


    // Callouts --------------------------------------------
    if APP_COSTING in ConnectedApp then
      tblCallouts.ParamByName('vp').AsString := '%'
    else
      tblCallouts.ParamByName('vp').AsString := '1';
    tblCallouts.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);
    //-----------------------------------------------------

    // Handing ---------------------------------------------
    tblHanding.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);

    if APP_COSTING in ConnectedApp then
      tblSeriesHanding.ParamByName('vp').AsString := '%'
    else
      tblSeriesHanding.ParamByName('vp').AsString := '1';
    tblSeriesHanding.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);
    //------------------------------------------------------
    tblLocationStock.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);

    tblGridPattern.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);
    tblGridKind.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);

    tblGridsStd.Active := (ConnectedApp * [APP_SALES, APP_COSTING] <> []);

    tblGridCost.Active := (ConnectedApp * [APP_SALES, APP_PRODUCTION] <> []);

    tblWindowStock.Active := APP_SALES in ConnectedApp;

    tblAccessories_Type.Active := APP_SALES in ConnectedApp;
    tblAccessories.Active := APP_SALES in ConnectedApp;
    tblAccessories_lookup.Active := APP_SALES in ConnectedApp;

    // Quotes ------------------------------------------------------
    //if pos('Where', tblQuotes.SQL.Text) = 0 then begin

    if APP_PRODUCTION in ConnectedApp then begin
      tblQuotes.MasterSource := dsJobBatches;
      tblQuotes.SQL.Text := tblQuotes.SQL.Text + ' Where (SO_QUOTE_HDR.JOB_BATCH_ID = :JOB_BATCH_ID)';
      tblQuotes.SetOrderBy('SO_QUOTE_HDR.QUOTE_DATE');
    end
    else if APP_SALES in ConnectedApp then begin
      tblQuotes.MasterSource := dsCustomers;
      tblQuotes.SQL.Text := tblQuotes.SQL.Text + ' Where (SO_QUOTE_HDR.CUSTOMER_ID = :CUSTOMER_ID)';
      tblQuotes.SetOrderBy('SO_QUOTE_HDR.CUSTOMER_ID, GRID_COLOR_STATUS.DESCRIPTION, SO_QUOTE_HDR.QUOTE_NO DESC');
    end;
    tblQuotes.Active := (ConnectedApp * [APP_SALES, APP_PRODUCTION] <> []);

    tblQuoteOpt.Active := APP_SALES in ConnectedApp;
    tblQuotePrices.Active := APP_SALES in ConnectedApp;
    //--------------------------------------------------------------

    tblTract.Active := APP_SALES in ConnectedApp;
    tblTractPhase.Active := APP_SALES in ConnectedApp;
    tblPhaseQuotes.Active := APP_SALES in ConnectedApp;
    tblTractContact.Active := APP_SALES in ConnectedApp;

    //---------------------------------------------------------------------------------------------------

    if (ConnectedApp * [APP_SALES, APP_PRODUCTION] <> []) then begin
      tblWindows.SQL.Text := tblWindows.SQL.Text + ' where window.quote_id = :quote_id';
      tblWindows.MasterSource := dsQuotes;

      tblIGU.SQL.Text := tblIGU.SQL.Text + ' where igu.quote_win_id = :quote_win_id';
      tblIGU.MasterSource := dsWindows;
    end
    else if APP_SHOP in ConnectedApp then begin
      add_where := ' where exists (select quote_win_id from scan_window where (scan_window.quote_win_id = window.quote_win_id)'
        +' and (scan_window.scan_date >= current_Date -1) and (scan_window.scan_date <= current_Date +1))';
      tblWindows.SQL.Text := tblWindows.SQL.Text + add_where;
      tblWindows.MasterSource := nil;

      add_where := ' where exists (select igu_id from scan_igu where (scan_igu.igu_id = igu.igu_id)'
        +'and (scan_igu.scan_date >= current_Date -1) and (scan_igu.scan_date <= current_Date +1))';
      tblIGU.SQL.Text := tblIGU.SQL.Text + add_where;
      tblIGU.MasterSource := nil;
    end;
    tblWindows.Active := (ConnectedApp * [APP_SALES, APP_PRODUCTION, APP_SHOP] <> []);
    tblIGU.Active := (ConnectedApp * [APP_SALES, APP_PRODUCTION, APP_SHOP] <> []);
    tblWin_Mull.Active := (ConnectedApp * [APP_SALES] <> []);
    //tblScanIGU.ParamByName('prev_day').AsDateTime := incday(now, -7); //one week view
    tblScanIGU.Active := (ConnectedApp * [APP_PRODUCTION, APP_SHOP] <> []);
    tblScanWin.Active := (ConnectedApp * [APP_PRODUCTION, APP_SHOP] <> []);

    //----------------------------------------------------------------------------------------------------

    tblIGU_SM_Lites.Active := APP_COSTING in ConnectedApp;
    tblQAccessories.Active := (ConnectedApp * [APP_SALES, APP_PRODUCTION] <> []);

    //------------------------------------------------------------------------------------------------------
    tblXPanel_SM_Lites.Active := APP_COSTING in ConnectedApp;

    // Glass Outer, Middle and Inner ----------------------------------------------------------------------
    if APP_COSTING in ConnectedApp then begin
      tblGlassKind.Open;
    end
    else if (ConnectedApp * [APP_SALES, APP_PRODUCTION] <> []) then begin
      tblGlassKOuter.ParamByName('vp').AsString := '1';
      tblGlassKMiddle.ParamByName('vp').AsString := '1';
      tblGlassKInner.ParamByName('vp').AsString := '1';

      tblGlassKOuter.Open;
      tblGlassKMiddle.Open;
      tblGlassKInner.Open;
    end;

    // NAILFIN ----------------------------------------------
    if APP_COSTING in ConnectedApp then begin
      tblNAILFIN.Open;
      tblSeriesNAILFIN.ParamByName('vp').AsString := '%';
    end
    else
      tblSeriesNAILFIN.ParamByName('vp').AsString := '1';
    tblSeriesNAILFIN.Active := (ConnectedApp * [APP_SALES, APP_COSTING, APP_PRODUCTION] <> []);
    //-------------------------------------------------------
    tblWorkCell_Type.Active := (ConnectedApp * [APP_COSTING, APP_PRODUCTION] <> []);

    tblWorkCell.Active := (ConnectedApp * [APP_COSTING, APP_PRODUCTION, APP_SHOP] <> []);

    //----------------------->>> Batches
    if APP_PRODUCTION in ConnectedApp then
      tblJobBatches.SQL.Add(' order by JOB_BATCH_ID desc')
    else if APP_SHOP in ConnectedApp then
      tblJobBatches.SQL.Add(' order by DAY_SEQ');

    tblJobBatches.Active := ConnectedApp * [APP_PRODUCTION, APP_SHOP] <> [];
    tblBatchWC.Active := ConnectedApp * [APP_SHOP] <> [];
    DBAlerter.Active := ConnectedApp * [APP_SHOP] <> [];

    //--------------->>> Costing specific
    if APP_COSTING in ConnectedApp then begin
      tblSTC_SM.ParamByName('vp').AsString := '%';
      tblSTC_SM.Open;

      tblStruc_Perf.Open;
      tblStruc_Perf_SM.ParamByName('vp').AsString := '%';
      tblStruc_Perf_SM.Open;

      tblInvShadow.Open;
      tblInvShadowArch.Open;

      tblBomCostType.Open;
      tblBOM.Open;

    end;

    //-------------------------------------------------------------------- Shift app
    tblShift.Active := ConnectedApp * [APP_SHIFT, APP_SHOP] <> [];

    tblPerformanceHistory.Active := APP_SHOP in ConnectedApp;


    result := true;
  except
    on e: exception do begin
      messagedlg(e.Message, mtError, [mbOK], 0);
    end;
  end;

end;


procedure TCostingDM.Gen_Bin_No;
begin

    mStoredProc.StoredProcName := 'PROC_GEN_SERIAL_BIN';
    mStoredProc.PrepareSQL(false);
    mStoredProc.ParamByName('pbatch_id').AsInteger := tblJobBatches.FieldByName('JOB_BATCH_ID').AsInteger;

    mStoredProc.ExecProc;
    TransRead.CommitRetaining;

    tblWindows.Refresh;

end;

end.

