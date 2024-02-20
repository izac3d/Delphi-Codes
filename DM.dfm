object MainDM: TMainDM
  OldCreateOrder = False
  Left = 112
  Top = 114
  Height = 385
  Width = 641
  object fibMainDB: TpFIBDatabase
    DBParams.Strings = (
      'password=masterke'
      'user_name=SYSDBA'
      'lc_ctype=WIN1252')
    DefaultTransaction = fibMainTrans
    DefaultUpdateTransaction = fibUpdateTrans
    SQLDialect = 3
    Timeout = 0
    AliasName = 'clinicx2'
    WaitForRestoreConnect = 0
    Left = 40
    Top = 16
  end
  object tblALL_EXAMS: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE ALL_EXAMS'
      'SET '
      '    EXAM_AUTONO = :EXAM_AUTONO,'
      '    EXAM_NAME = :EXAM_NAME'
      'WHERE'
      '    EXAM_AUTONO = :OLD_EXAM_AUTONO'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    ALL_EXAMS'
      'WHERE'
      '        EXAM_AUTONO = :OLD_EXAM_AUTONO'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO ALL_EXAMS('
      '    EXAM_AUTONO,'
      '    EXAM_NAME'
      ')'
      'VALUES('
      '    :EXAM_AUTONO,'
      '    :EXAM_NAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    EXAM_AUTONO,'
      '    EXAM_NAME'
      'FROM'
      '    ALL_EXAMS '
      ''
      ' WHERE '
      '        ALL_EXAMS.EXAM_AUTONO = :OLD_EXAM_AUTONO'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    EXAM_AUTONO,'
      '    EXAM_NAME'
      'FROM'
      '    ALL_EXAMS ')
    AfterInsert = tblALL_EXAMSAfterInsert
    Transaction = fibMainTrans
    Database = fibMainDB
    UpdateTransaction = fibUpdateTrans
    AutoCommit = True
    Left = 32
    Top = 112
    poSetRequiredFields = True
    poSetReadOnlyFields = True
  end
  object fibMainTrans: TpFIBTransaction
    DefaultDatabase = fibMainDB
    TimeoutAction = TACommitRetaining
    Left = 112
    Top = 16
  end
  object Query_PK: TpFIBQuery
    Transaction = fibMainTrans
    Database = fibMainDB
    Left = 280
    Top = 16
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object tblALL_MEDS: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE ALL_MEDS'
      'SET '
      '    MED_NO = :MED_NO,'
      '    MED_NAME = :MED_NAME,'
      '    MED_DOSAGE = :MED_DOSAGE'
      'WHERE'
      '    MED_NO = :OLD_MED_NO'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    ALL_MEDS'
      'WHERE'
      '        MED_NO = :OLD_MED_NO'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO ALL_MEDS('
      '    MED_NO,'
      '    MED_NAME,'
      '    MED_DOSAGE'
      ')'
      'VALUES('
      '    :MED_NO,'
      '    :MED_NAME,'
      '    :MED_DOSAGE'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    MED_NO,'
      '    MED_NAME,'
      '    MED_DOSAGE'
      'FROM'
      '    ALL_MEDS '
      ''
      ' WHERE '
      '        ALL_MEDS.MED_NO = :OLD_MED_NO'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    MED_NO,'
      '    MED_NAME,'
      '    MED_DOSAGE'
      'FROM'
      '    ALL_MEDS ')
    AfterInsert = tblALL_MEDSAfterInsert
    Transaction = fibMainTrans
    Database = fibMainDB
    UpdateTransaction = fibUpdateTrans
    AutoCommit = True
    Left = 106
    Top = 112
    poSetRequiredFields = True
    poSetReadOnlyFields = True
  end
  object tblMPNTINFO: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE MPNTINFO'
      'SET '
      ' PATIENT_NO = :PATIENT_NO,'
      ' PATIENT_NAME = :PATIENT_NAME,'
      ' GENDER = :GENDER,'
      ' ID_NO = :ID_NO,'
      ' PATIENT_AGE = :PATIENT_AGE,'
      ' BIRTH_DATE = :BIRTH_DATE,'
      ' MARITAL_STATUS = :MARITAL_STATUS,'
      ' PROFESSION = :PROFESSION,'
      ' FIRST_VISITDATE = :FIRST_VISITDATE,'
      ' LAST_VISITDATE = :LAST_VISITDATE,'
      ' NEXT_VISITDATE = :NEXT_VISITDATE,'
      ' ADDRESS = :ADDRESS,'
      ' PHONES = :PHONES,'
      ' EMAIL = :EMAIL,'
      ' VISITS_COUNT = :VISITS_COUNT,'
      ' MEDICAL_ALERT = :MEDICAL_ALERT,'
      ' PATIENT_PICTURE = :PATIENT_PICTURE,'
      ' PIC_CLASS = :PIC_CLASS'
      'WHERE'
      ' PATIENT_NO = :OLD_PATIENT_NO'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' MPNTINFO'
      'WHERE'
      '  PATIENT_NO = :OLD_PATIENT_NO'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO MPNTINFO('
      ' PATIENT_NO,'
      ' PATIENT_NAME,'
      ' GENDER,'
      ' ID_NO,'
      ' PATIENT_AGE,'
      ' BIRTH_DATE,'
      ' MARITAL_STATUS,'
      ' PROFESSION,'
      ' FIRST_VISITDATE,'
      ' LAST_VISITDATE,'
      ' NEXT_VISITDATE,'
      ' ADDRESS,'
      ' PHONES,'
      ' EMAIL,'
      ' VISITS_COUNT,'
      ' MEDICAL_ALERT,'
      ' PATIENT_PICTURE,'
      ' PIC_CLASS'
      ')'
      'VALUES('
      ' :PATIENT_NO,'
      ' :PATIENT_NAME,'
      ' :GENDER,'
      ' :ID_NO,'
      ' :PATIENT_AGE,'
      ' :BIRTH_DATE,'
      ' :MARITAL_STATUS,'
      ' :PROFESSION,'
      ' :FIRST_VISITDATE,'
      ' :LAST_VISITDATE,'
      ' :NEXT_VISITDATE,'
      ' :ADDRESS,'
      ' :PHONES,'
      ' :EMAIL,'
      ' :VISITS_COUNT,'
      ' :MEDICAL_ALERT,'
      ' :PATIENT_PICTURE,'
      ' :PIC_CLASS'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' PATIENT_NO,'
      ' PATIENT_NAME,'
      ' GENDER,'
      ' ID_NO,'
      ' PATIENT_AGE,'
      ' BIRTH_DATE,'
      ' MARITAL_STATUS,'
      ' PROFESSION,'
      ' FIRST_VISITDATE,'
      ' LAST_VISITDATE,'
      ' NEXT_VISITDATE,'
      ' ADDRESS,'
      ' PHONES,'
      ' EMAIL,'
      ' VISITS_COUNT,'
      ' MEDICAL_ALERT,'
      ' PATIENT_PICTURE,'
      ' PIC_CLASS'
      'FROM'
      ' MPNTINFO '
      ''
      ' WHERE '
      '  MPNTINFO.PATIENT_NO = :OLD_PATIENT_NO'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' PATIENT_NO,'
      ' PATIENT_NAME,'
      ' GENDER,'
      ' ID_NO,'
      ' PATIENT_AGE,'
      ' BIRTH_DATE,'
      ' MARITAL_STATUS,'
      ' PROFESSION,'
      ' FIRST_VISITDATE,'
      ' LAST_VISITDATE,'
      ' NEXT_VISITDATE,'
      ' ADDRESS,'
      ' PHONES,'
      ' EMAIL,'
      ' VISITS_COUNT,'
      ' MEDICAL_ALERT,'
      ' PATIENT_PICTURE,'
      ' PIC_CLASS'
      'FROM'
      ' MPNTINFO '
      'Order by '
      '  PATIENT_NAME')
    AfterInsert = tblMPNTINFOAfterInsert
    BeforePost = tblMPNTINFOBeforePost
    Transaction = fibMainTrans
    Database = fibMainDB
    UpdateTransaction = fibUpdateTrans
    AutoCommit = True
    DefaultFormats.DateTimeDisplayFormat = 'dd/mm/yyyy hh:mm AMPM'
    DefaultFormats.DisplayFormatDate = 'dd/mm/yyyy'
    Left = 181
    Top = 112
    poSetRequiredFields = True
    poSetReadOnlyFields = True
    poAskRecordCount = True
  end
  object tblPVISITS: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PVISITS'
      'SET '
      '    VISITNO = :VISITNO,'
      '    PATIENT_NO = :PATIENT_NO,'
      '    VISIT_DATE = :VISIT_DATE,'
      '    COMPLAINTS = :COMPLAINTS,'
      '    MED_NAME = :MED_NAME,'
      '    MED_DOSAGE = :MED_DOSAGE,'
      '    DIAGNOSIS = :DIAGNOSIS'
      'WHERE'
      '    VISITNO = :OLD_VISITNO'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PVISITS'
      'WHERE'
      '        VISITNO = :OLD_VISITNO'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PVISITS('
      '    VISITNO,'
      '    PATIENT_NO,'
      '    VISIT_DATE,'
      '    COMPLAINTS,'
      '    MED_NAME,'
      '    MED_DOSAGE,'
      '    DIAGNOSIS'
      ')'
      'VALUES('
      '    :VISITNO,'
      '    :PATIENT_NO,'
      '    :VISIT_DATE,'
      '    :COMPLAINTS,'
      '    :MED_NAME,'
      '    :MED_DOSAGE,'
      '    :DIAGNOSIS'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    VISITNO,'
      '    PATIENT_NO,'
      '    VISIT_DATE,'
      '    COMPLAINTS,'
      '    MED_NAME,'
      '    MED_DOSAGE,'
      '    DIAGNOSIS'
      'FROM'
      '    PVISITS '
      'Where(  '
      '  PATIENT_NO = :PATIENT_NO'
      '     ) and (     PVISITS.VISITNO = :OLD_VISITNO'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    VISITNO,'
      '    PATIENT_NO,'
      '    VISIT_DATE,'
      '    COMPLAINTS,'
      '    MED_NAME,'
      '    MED_DOSAGE,'
      '    DIAGNOSIS'
      'FROM'
      '    PVISITS '
      'Where '
      '  PATIENT_NO = :PATIENT_NO'
      'Order by '
      '  PATIENT_NO, VISIT_DATE')
    AutoUpdateOptions.ParamsToFieldsLinks.Strings = (
      'PATIENT_NO=PATIENT_NO')
    AfterInsert = tblPVISITSAfterInsert
    AfterPost = tblPVISITSAfterPost
    BeforePost = tblPVISITSBeforePost
    Transaction = fibMainTrans
    Database = fibMainDB
    UpdateTransaction = fibUpdateTrans
    AutoCommit = True
    DataSource = dsMPNTINFO
    DefaultFormats.DateTimeDisplayFormat = 'dd/mm/yyyy hh:mm AMPM'
    DefaultFormats.DisplayFormatDate = 'dd/mm/yyyy'
    Left = 251
    Top = 112
    poSetRequiredFields = True
    poSetReadOnlyFields = True
    poAskRecordCount = True
  end
  object dsALL_EXAMS: TDataSource
    DataSet = tblALL_EXAMS
    Left = 32
    Top = 164
  end
  object dsALL_MEDS: TDataSource
    DataSet = tblALL_MEDS
    Left = 106
    Top = 164
  end
  object dsMPNTINFO: TDataSource
    DataSet = tblMPNTINFO
    Left = 181
    Top = 164
  end
  object dsPVISITS: TDataSource
    DataSet = tblPVISITS
    Left = 251
    Top = 164
  end
  object dsPEXAMINATION: TDataSource
    DataSet = tblPEXAMINATION
    Left = 123
    Top = 287
  end
  object tblPEXAMINATION: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE EXAMINATION'
      'SET '
      ' EXAMINATION_NO = :EXAMINATION_NO,'
      ' PATIENT_NO = :PATIENT_NO,'
      ' REQUEST_DATE = :REQUEST_DATE,'
      ' EXAM_DATE = :EXAM_DATE,'
      ' EXAM_NAME = :EXAM_NAME,'
      ' EXAM_VALUE = :EXAM_VALUE,'
      ' SCAN_PIC = :SCAN_PIC,'
      ' SCAN_CLASS = :SCAN_CLASS,'
      ' NOTES = :NOTES'
      'WHERE'
      ' EXAMINATION_NO = :OLD_EXAMINATION_NO'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' EXAMINATION'
      'WHERE'
      '  EXAMINATION_NO = :OLD_EXAMINATION_NO'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO EXAMINATION('
      ' EXAMINATION_NO,'
      ' PATIENT_NO,'
      ' REQUEST_DATE,'
      ' EXAM_DATE,'
      ' EXAM_NAME,'
      ' EXAM_VALUE,'
      ' SCAN_PIC,'
      ' SCAN_CLASS,'
      ' NOTES'
      ')'
      'VALUES('
      ' :EXAMINATION_NO,'
      ' :PATIENT_NO,'
      ' :REQUEST_DATE,'
      ' :EXAM_DATE,'
      ' :EXAM_NAME,'
      ' :EXAM_VALUE,'
      ' :SCAN_PIC,'
      ' :SCAN_CLASS,'
      ' :NOTES'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    EXAMINATION_NO,'
      '    PATIENT_NO,'
      '    REQUEST_DATE,'
      '    EXAM_DATE,'
      '    EXAM_NAME,'
      '    EXAM_VALUE,'
      '    SCAN_PIC,'
      '    SCAN_CLASS,'
      '    NOTES'
      'FROM'
      '    EXAMINATION '
      'Where(  '
      '    PATIENT_NO = :PATIENT_NO'
      '  ) and (  EXAMINATION.EXAMINATION_NO = :OLD_EXAMINATION_NO'
      '  )'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      '    EXAMINATION_NO,'
      '    PATIENT_NO,'
      '    REQUEST_DATE,'
      '    EXAM_DATE,'
      '    EXAM_NAME,'
      '    EXAM_VALUE,'
      '    SCAN_PIC,'
      '    SCAN_CLASS,'
      '    NOTES'
      'FROM'
      '    EXAMINATION '
      'Where '
      '    PATIENT_NO = :PATIENT_NO'
      'Order by'
      '    PATIENT_NO, EXAM_NAME')
    AfterInsert = tblPEXAMINATIONAfterInsert
    Transaction = fibMainTrans
    Database = fibMainDB
    UpdateTransaction = fibUpdateTrans
    AutoCommit = True
    DataSource = dsMPNTINFO
    DefaultFormats.DateTimeDisplayFormat = 'dd/mm/yyyy hh:mm AMPM'
    DefaultFormats.DisplayFormatDate = 'dd/mm/yyyy'
    Left = 125
    Top = 240
    poSetRequiredFields = True
    poSetReadOnlyFields = True
    WaitEndMasterScroll = True
  end
  object tblOPTIONS: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OPTIONS'
      'SET '
      ' PK = :PK,'
      ' "PASSWORD" = :"PASSWORD",'
      ' IS_PASS_LOGIN = :IS_PASS_LOGIN,'
      ' IS_NETWORK_ENABLED = :IS_NETWORK_ENABLED,'
      ' ENABLE_REFRESH = :ENABLE_REFRESH,'
      ' NETWORK_PATH = :NETWORK_PATH,'
      ' SKIN = :SKIN,'
      ' SAVE_BACKUP_ONRUN = :SAVE_BACKUP_ONRUN'
      'WHERE'
      ' PK = :OLD_PK'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' OPTIONS'
      'WHERE'
      '  PK = :OLD_PK'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO OPTIONS('
      ' PK,'
      ' "PASSWORD",'
      ' IS_PASS_LOGIN,'
      ' IS_NETWORK_ENABLED,'
      ' ENABLE_REFRESH,'
      ' NETWORK_PATH,'
      ' SKIN,'
      ' SAVE_BACKUP_ONRUN'
      ')'
      'VALUES('
      ' :PK,'
      ' :"PASSWORD",'
      ' :IS_PASS_LOGIN,'
      ' :IS_NETWORK_ENABLED,'
      ' :ENABLE_REFRESH,'
      ' :NETWORK_PATH,'
      ' :SKIN,'
      ' :SAVE_BACKUP_ONRUN'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' PK,'
      ' "PASSWORD",'
      ' IS_PASS_LOGIN,'
      ' IS_NETWORK_ENABLED,'
      ' ENABLE_REFRESH,'
      ' NETWORK_PATH,'
      ' SKIN,'
      ' SAVE_BACKUP_ONRUN'
      'FROM'
      ' OPTIONS '
      ''
      ' WHERE '
      '  OPTIONS.PK = :OLD_PK'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' PK,'
      ' "PASSWORD",'
      ' IS_PASS_LOGIN,'
      ' IS_NETWORK_ENABLED,'
      ' ENABLE_REFRESH,'
      ' NETWORK_PATH,'
      ' SKIN,'
      ' SAVE_BACKUP_ONRUN'
      'FROM'
      ' OPTIONS ')
    Transaction = fibMainTrans
    Database = fibMainDB
    UpdateTransaction = fibUpdateTrans
    AutoCommit = True
    Left = 32
    Top = 240
    poSetRequiredFields = True
    poSetReadOnlyFields = True
  end
  object dsOPTIONS: TDataSource
    DataSet = tblOPTIONS
    Left = 32
    Top = 288
  end
  object dsVMeds: TDataSource
    DataSet = tblVMeds
    Left = 312
    Top = 164
  end
  object tblVMeds: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE VISIT_MEDS'
      'SET '
      '    MED_NO = :MED_NO,'
      '    VISITNO = :VISITNO,'
      '    MED_NAME = :MED_NAME'
      'WHERE'
      '    MED_NO = :OLD_MED_NO'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    VISIT_MEDS'
      'WHERE'
      '        MED_NO = :OLD_MED_NO'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO VISIT_MEDS('
      '    MED_NO,'
      '    VISITNO,'
      '    MED_NAME'
      ')'
      'VALUES('
      '    :MED_NO,'
      '    :VISITNO,'
      '    :MED_NAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    MED_NO,'
      '    VISITNO,'
      '    MED_NAME'
      'FROM'
      '    VISIT_MEDS '
      'Where(  '
      '    VISITNO = :VISITNO'
      '     ) and (     VISIT_MEDS.MED_NO = :OLD_MED_NO'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    MED_NO,'
      '    VISITNO,'
      '    MED_NAME'
      'FROM'
      '    VISIT_MEDS '
      'Where '
      '    VISITNO = :VISITNO'
      'Order by'
      '    VISITNO, MED_NAME')
    AutoUpdateOptions.ParamsToFieldsLinks.Strings = (
      'VISITNO=VISITNO')
    AutoUpdateOptions.AutoParamsToFields = True
    AfterInsert = tblVMedsAfterInsert
    Transaction = fibMainTrans
    Database = fibMainDB
    UpdateTransaction = fibUpdateTrans
    AutoCommit = True
    DataSource = dsPVISITS
    Left = 312
    Top = 112
    poSetRequiredFields = True
    poSetReadOnlyFields = True
    WaitEndMasterScroll = True
  end
  object QrySQL: TpFIBQuery
    Transaction = fibMainTrans
    Database = fibMainDB
    Left = 344
    Top = 16
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object dxSkinController1: TdxSkinController
    Left = 251
    Top = 240
  end
  object MReport: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'I:\CMWin32\Cyber Man\Clinic WorX 2\rep\patientvisits.rtm'
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = False
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PDFSettings.EmbedFontOptions = []
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 544
    Top = 88
    Version = '11.06'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        HyperlinkColor = clBlue
        Border.BorderPositions = [bpBottom]
        Border.Color = clBlack
        Border.Style = psDot
        Border.Visible = True
        DataField = 'MED_NAME'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4498
        mmLeft = 7144
        mmTop = 1852
        mmWidth = 187590
        BandType = 4
      end
    end
    object ppPageStyle1: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 264584
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        mmHeight = 264584
        mmLeft = 265
        mmTop = 0
        mmWidth = 202142
        BandType = 9
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'PATIENT_NO'
      DataPipeline = ppDBPipeline1
      OutlineSettings.CreateNode = True
      NewPage = True
      NewFile = False
      StartOnOddPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline1'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
        object ppLabel1: TppLabel
          UserName = 'Label1'
          HyperlinkColor = clBlue
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Caption = 'Patient:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 1058
          mmTop = 795
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          HyperlinkColor = clBlue
          Border.BorderPositions = [bpBottom]
          Border.Color = clBlack
          Border.Style = psDot
          Border.Visible = True
          DataField = 'PATIENT_NAME'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 5027
          mmLeft = 27781
          mmTop = 795
          mmWidth = 90223
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          HyperlinkColor = clBlue
          Border.BorderPositions = [bpBottom]
          Border.Color = clBlack
          Border.Style = psDot
          Border.Visible = True
          DataField = 'PATIENT_NO'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 5027
          mmLeft = 15081
          mmTop = 795
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 0
          mmTop = 6879
          mmWidth = 202142
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'VISITNO'
      DataPipeline = ppDBPipeline1
      KeepTogether = True
      OutlineSettings.CreateNode = True
      NewFile = False
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 25400
      DataPipelineName = 'ppDBPipeline1'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 26988
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 26458
          mmLeft = 529
          mmTop = 265
          mmWidth = 28575
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          HyperlinkColor = clBlue
          AutoSize = False
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Caption = 'Visit Date:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 3704
          mmTop = 2646
          mmWidth = 24606
          BandType = 3
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          HyperlinkColor = clBlue
          Border.BorderPositions = [bpBottom]
          Border.Color = clBlack
          Border.Style = psDot
          Border.Visible = True
          DataField = 'VISIT_DATE'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4498
          mmLeft = 29369
          mmTop = 2381
          mmWidth = 32808
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          HyperlinkColor = clBlue
          AutoSize = False
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Caption = 'Complaints:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4191
          mmLeft = 265
          mmTop = 8467
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          HyperlinkColor = clBlue
          Border.BorderPositions = [bpBottom]
          Border.Color = clBlack
          Border.Style = psDot
          Border.Visible = True
          DataField = 'COMPLAINTS'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4498
          mmLeft = 29369
          mmTop = 8467
          mmWidth = 165100
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          HyperlinkColor = clBlue
          AutoSize = False
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Caption = 'Diagnosis:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4191
          mmLeft = 4498
          mmTop = 14817
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          HyperlinkColor = clBlue
          Border.BorderPositions = [bpBottom]
          Border.Color = clBlack
          Border.Style = psDot
          Border.Visible = True
          DataField = 'DIAGNOSIS'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4498
          mmLeft = 29369
          mmTop = 14552
          mmWidth = 165100
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          HyperlinkColor = clBlue
          AutoSize = False
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Caption = 'Medicines:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4191
          mmLeft = 3175
          mmTop = 21431
          mmWidth = 25135
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 3440
        mmPrintPosition = 0
        object ppLine2: TppLine
          UserName = 'Line2'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 265
          mmTop = 1058
          mmWidth = 201877
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsibRepds
    UserName = 'DBPipeline1'
    Left = 544
    Top = 136
  end
  object ibRepds: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select distinct mpntinfo.patient_no, mpntinfo.patient_name, mpnt' +
        'info.gender, mpntinfo.birth_date, mpntinfo.marital_status, mpnti' +
        'nfo.profession, mpntinfo.address, mpntinfo.phones, mpntinfo.medi' +
        'cal_alert, pvisits.visit_date, pvisits.complaints, pvisits.diagn' +
        'osis, visit_meds.med_name, pvisits.visitno'
      'from pvisits'
      
        '   left outer join visit_meds on (pvisits.visitno = visit_meds.v' +
        'isitno)'
      
        '   right outer join mpntinfo on (pvisits.patient_no = mpntinfo.p' +
        'atient_no)'
      'order by mpntinfo.patient_name')
    Transaction = fibMainTrans
    Database = fibMainDB
    Left = 576
    Top = 192
    poSetRequiredFields = True
    poSetReadOnlyFields = True
  end
  object dsibRepds: TDataSource
    DataSet = ibRepds
    Left = 504
    Top = 192
  end
  object fibUpdateTrans: TpFIBTransaction
    DefaultDatabase = fibMainDB
    TimeoutAction = TACommitRetaining
    TRParams.Strings = (
      'isc_tpb_write'
      'isc_tpb_read_committed'
      'isc_tpb_wait'
      'isc_tpb_no_rec_version')
    TPBMode = tpbDefault
    Left = 192
    Top = 16
  end
  object mdSerials: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F02000000320000000100070053657269616C009600
      0000010006004E6F74657300010C000000354236433133303030343046010500
      0000656D65616C010E0000003038303332373532366365356132010800000063
      6C696E69632035010E0000003038303332373532653563373732010800000063
      6C696E69632034010E0000003038303332373031613734333930010800000063
      6C696E69632033010E0000003038303332373531336666313031010800000063
      6C696E69632032010E0000003038303332373032316161373330010800000063
      6C696E69632031010C00000035373531313430303242374101080000006D7920
      666C617368}
    ReadOnly = True
    SortOptions = []
    Left = 536
    Top = 16
    object mdSerialsSerial: TStringField
      FieldName = 'Serial'
      Size = 50
    end
    object mdSerialsNotes: TStringField
      FieldName = 'Notes'
      Size = 150
    end
  end
end
