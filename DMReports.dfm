object ReportsDM: TReportsDM
  OldCreateOrder = False
  Height = 309
  Width = 739
  object frxReport: TfrxReport
    Version = '5.3.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39688.987568715300000000
    ReportOptions.LastChange = 42309.110482013890000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    Left = 35
    Top = 15
  end
  object frdsMain: TfrxDBDataset
    UserName = 'frdsMain'
    CloseDataSource = True
    FieldAliases.Strings = (
      'SUM_OF_QUANTITY=SUM_OF_QUANTITY'
      'SM_ID=SM_ID'
      'COLOR_ID=COLOR_ID'
      'NAILFIN_ID=NAILFIN_ID'
      'CALLOUTS_ID=CALLOUTS_ID'
      'GPAT_ID=GPAT_ID'
      'WIN_WIDTH=WIN_WIDTH'
      'WIN_HEIGHT=WIN_HEIGHT'
      'GRIDS_ACROSS=GRIDS_ACROSS'
      'GRIDS_UPDOWN=GRIDS_UPDOWN'
      'TEMPERED=TEMPERED'
      'IGU_SELECTED=IGU_SELECTED'
      'CUST_NAME=CUST_NAME'
      'TRACT_NAME=TRACT_NAME'
      'PHASE_ID=PHASE_ID'
      'PHASE_NAME=PHASE_NAME'
      'SERIES_NAME=SERIES_NAME'
      'COLOR_NAME=COLOR_NAME'
      'NAILFIN_NAME=NAILFIN_NAME'
      'MODEL_NAME=MODEL_NAME'
      'CALLOUTS=CALLOUTS'
      'GPATTERN_NAME=GPATTERN_NAME'
      'IGU_POSITION=IGU_POSITION'
      'IGU_GRIDS_ACROSS=IGU_GRIDS_ACROSS'
      'IGU_GRIDS_UPDOWN=IGU_GRIDS_UPDOWN'
      'IGU_HEIGHT=IGU_HEIGHT'
      'IGU_WIDTH=IGU_WIDTH'
      'GLASS_NAME_INNER=GLASS_NAME_INNER'
      'GLASS_NAME_MIDDLE=GLASS_NAME_MIDDLE'
      'GLASS_NAME_OUTER=GLASS_NAME_OUTER')
    OpenDataSource = False
    DataSet = RepSQL
    BCDToCurrency = False
    Left = 153
    Top = 79
  end
  object RepSQL: TIBCQuery
    Connection = CostingDM.MainDB
    Transaction = CostingDM.TransRead
    UpdateTransaction = CostingDM.TransRead
    SQL.Strings = (
      'select * from VW_REP_WIN_IGU_GROUPED where phase_id = 1008'
      '')
    ReadOnly = True
    Options.AutoPrepare = True
    Left = 153
    Top = 17
  end
  object RepSet: TIBCQuery
    SQLInsert.Strings = (
      'INSERT INTO REPORT_SETTINGS'
      '  (GENPK_ID, BRANCHES, DISCLAIMER1, DISCLAIMER2)'
      'VALUES'
      '  (:GENPK_ID, :BRANCHES, :DISCLAIMER1, :DISCLAIMER2)')
    SQLDelete.Strings = (
      'DELETE FROM REPORT_SETTINGS'
      'WHERE'
      '  GENPK_ID = :Old_GENPK_ID')
    SQLUpdate.Strings = (
      'UPDATE REPORT_SETTINGS'
      'SET'
      
        '  GENPK_ID = :GENPK_ID, BRANCHES = :BRANCHES, DISCLAIMER1 = :DIS' +
        'CLAIMER1, DISCLAIMER2 = :DISCLAIMER2'
      'WHERE'
      '  GENPK_ID = :Old_GENPK_ID')
    SQLRefresh.Strings = (
      
        'SELECT GENPK_ID, BRANCHES, DISCLAIMER1, DISCLAIMER2 FROM REPORT_' +
        'SETTINGS'
      'WHERE'
      '  GENPK_ID = :GENPK_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM REPORT_SETTINGS'
      'WHERE'
      'GENPK_ID = :Old_GENPK_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM REPORT_SETTINGS'
      ''
      ') q')
    Connection = CostingDM.MainDB
    Transaction = CostingDM.TransRead
    UpdateTransaction = CostingDM.TransRead
    SQL.Strings = (
      'select * from REPORT_SETTINGS')
    Left = 355
    Top = 17
  end
  object frdsRepSet: TfrxDBDataset
    UserName = 'frdsRepSet'
    CloseDataSource = False
    DataSet = RepSet
    BCDToCurrency = False
    Left = 355
    Top = 79
  end
  object frxRichObject1: TfrxRichObject
    Left = 662
    Top = 16
  end
  object frxCheckBoxObject1: TfrxCheckBoxObject
    Left = 528
    Top = 71
  end
  object dsRepSet: TDataSource
    DataSet = RepSet
    Left = 355
    Top = 141
  end
  object SubRepSQL: TIBCQuery
    Connection = CostingDM.MainDB
    Transaction = CostingDM.TransRead
    UpdateTransaction = CostingDM.TransRead
    SQL.Strings = (
      'select * from so_quote_hdr'
      
        '       right outer join quote_accessory on (so_quote_hdr.quote_i' +
        'd = quote_accessory.quote_id)'
      
        '       right outer join accessory on (quote_accessory.accessory_' +
        'id = accessory.accessory_id)'
      '       where so_quote_hdr.job_batch_id = 40256'
      '       Order by so_quote_hdr.QUOTE_NO')
    ReadOnly = True
    UniDirectional = True
    Left = 213
    Top = 17
  end
  object frdsSubRep: TfrxDBDataset
    UserName = 'frdsSubRep'
    CloseDataSource = True
    FieldAliases.Strings = (
      'QUOTE_ID=QUOTE_ID'
      'QUOTE_NO=QUOTE_NO'
      'PHASE_ID=PHASE_ID'
      'TRACT_ID=TRACT_ID'
      'CUSTOMER_ID=CUSTOMER_ID'
      'JOB_BATCH_ID=JOB_BATCH_ID'
      'IS_TRACT=IS_TRACT'
      'JOB_NAME=JOB_NAME'
      'QUOTE_DATE=QUOTE_DATE'
      'FOLLOWUP_DATE=FOLLOWUP_DATE'
      'OPERATOR_SAVED=OPERATOR_SAVED'
      'DATE_SAVED=DATE_SAVED'
      'OPERATOR_LAST_MODIFIED=OPERATOR_LAST_MODIFIED'
      'OPERATOR_ORDERED=OPERATOR_ORDERED'
      'DATE_LAST_MODIFIED=DATE_LAST_MODIFIED'
      'TAX_EXEMPT=TAX_EXEMPT'
      'BILLING_ADDR_ID=BILLING_ADDR_ID'
      'BILL_NAME=BILL_NAME'
      'BILL_ADDRESS_1=BILL_ADDRESS_1'
      'BILL_ADDRESS_2=BILL_ADDRESS_2'
      'BILL_ADDRESS_3=BILL_ADDRESS_3'
      'BILL_CITY=BILL_CITY'
      'BILL_STATE=BILL_STATE'
      'BILL_ZIP=BILL_ZIP'
      'BILL_COUNTRY_ID=BILL_COUNTRY_ID'
      'BILL_COUNTRY_CODE=BILL_COUNTRY_CODE'
      'CONTACT_ID=CONTACT_ID'
      'TERMS_ID=TERMS_ID'
      'COD=COD'
      'SHIP_NOTE=SHIP_NOTE'
      'CONTACT_TELEPHONE=CONTACT_TELEPHONE'
      'CUST_SHIP_ID=CUST_SHIP_ID'
      'SHIP_NAME=SHIP_NAME'
      'SHIP_ADDRESS_1=SHIP_ADDRESS_1'
      'SHIP_ADDRESS_2=SHIP_ADDRESS_2'
      'SHIP_ADDRESS_3=SHIP_ADDRESS_3'
      'SHIP_ZIPNTAX_ID=SHIP_ZIPNTAX_ID'
      'SHIP_COUNTRY_ID=SHIP_COUNTRY_ID'
      'SHIP_COUNTRY_CODE=SHIP_COUNTRY_CODE'
      'SALES_TAX=SALES_TAX'
      'SHIP_COMMENT=SHIP_COMMENT'
      'SLS_ID=SLS_ID'
      'SALES_TAX_RATE=SALES_TAX_RATE'
      'PROD_COST=PROD_COST'
      'DELIVERY_COST=DELIVERY_COST'
      'DELIVERY_COST_MODIFIED=DELIVERY_COST_MODIFIED'
      'TOTAL_COST=TOTAL_COST'
      'CONTACT_FAX=CONTACT_FAX'
      'SHIPPING_TYPE=SHIPPING_TYPE'
      'J_DISC_PCT=J_DISC_PCT'
      'J_DISC=J_DISC'
      'QUOTE_STATUS=QUOTE_STATUS'
      'ORDER_DATE=ORDER_DATE'
      'ORDER_DUEDATE=ORDER_DUEDATE'
      'NFS=NFS'
      'UFZ=UFZ'
      'SERIES_ID=SERIES_ID'
      'SC_ID=SC_ID'
      'SNF_ID=SNF_ID'
      'GLAZING_ID=GLAZING_ID'
      'GRIDS_ID=GRIDS_ID'
      'GLASS_KIND_ID_OUTER=GLASS_KIND_ID_OUTER'
      'GLASS_KIND_ID_MIDDLE=GLASS_KIND_ID_MIDDLE'
      'GLASS_KIND_ID_INNER=GLASS_KIND_ID_INNER'
      'GAS_ID=GAS_ID'
      'TOTAL_IGU_QTY=TOTAL_IGU_QTY'
      'TOTAL_XPANEL_QTY=TOTAL_XPANEL_QTY'
      'TOTAL_DPANEL_QTY=TOTAL_DPANEL_QTY'
      'MODEL_W_WIN_QTY=MODEL_W_WIN_QTY'
      'MODEL_G_SPECIALS_QTY=MODEL_G_SPECIALS_QTY'
      'MODEL_PD_PATIO_DOORS_QTY=MODEL_PD_PATIO_DOORS_QTY'
      'MODEL_E_EURO_STYLE_QTY=MODEL_E_EURO_STYLE_QTY'
      'MODEL_M_MULLED_QTY=MODEL_M_MULLED_QTY'
      'MODEL_CF_COMMON_FRAME_QTY=MODEL_CF_COMMON_FRAME_QTY'
      'TRACT_LOT=TRACT_LOT'
      'TRACT_PLAN=TRACT_PLAN'
      'TRACT_DELIVERY=TRACT_DELIVERY'
      'TRACT_LOT_REVERSE=TRACT_LOT_REVERSE'
      'EXPECTED_DATE=EXPECTED_DATE'
      'IS_OPTION=IS_OPTION'
      'COMPLETED_DATE=COMPLETED_DATE'
      'DELIVERED_DATE=DELIVERED_DATE'
      'GRID_COLOR_STATUS_ID=GRID_COLOR_STATUS_ID'
      'IS_SERVICE=IS_SERVICE'
      'QACCESS_ID=QACCESS_ID'
      'QUOTE_ID_1=QUOTE_ID_1'
      'ACCESSORY_ID=ACCESSORY_ID'
      'LOCATION_ID=LOCATION_ID'
      'QUANTITY=QUANTITY'
      'PRICE=PRICE'
      'OPERATOR_SAVED_1=OPERATOR_SAVED_1'
      'DATE_SAVED_1=DATE_SAVED_1'
      'OPERATOR_LAST_MODIFIED_1=OPERATOR_LAST_MODIFIED_1'
      'DATE_LAST_MODIFIED_1=DATE_LAST_MODIFIED_1'
      'ACC_NS_WIDTH=ACC_NS_WIDTH'
      'ACC_NS_HEIGHT=ACC_NS_HEIGHT'
      'NOTES=NOTES'
      'ACCESSORY_ID_1=ACCESSORY_ID_1'
      'LOCATION_ID_1=LOCATION_ID_1'
      'ACC_SKU=ACC_SKU'
      'QUANTITY_1=QUANTITY_1'
      'OB_QUANTITY=OB_QUANTITY'
      'UOM=UOM'
      'PRICE_1=PRICE_1'
      'ACC_NAME=ACC_NAME'
      'ACC_DESCRIPTION=ACC_DESCRIPTION'
      'ACCESSORY_TYPE_ID=ACCESSORY_TYPE_ID'
      'ACC_COST=ACC_COST'
      'ACC_WIDTH=ACC_WIDTH'
      'ACC_LENGTH=ACC_LENGTH'
      'IS_VISIBLE=IS_VISIBLE'
      'GUI_SEQUENCE=GUI_SEQUENCE'
      'ACC_NS_WIDTH_1=ACC_NS_WIDTH_1'
      'ACC_NS_HEIGHT_1=ACC_NS_HEIGHT_1'
      'NOTES_1=NOTES_1')
    DataSet = SubRepSQL
    BCDToCurrency = False
    Left = 213
    Top = 79
  end
  object frxPDFExport1: TfrxPDFExport
    FileName = 'C:\Users\Smith\Desktop\prod shipper.pdf'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 42300.357774409720000000
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 663
    Top = 240
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 477
    Top = 239
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Left = 563
    Top = 186
  end
  object MemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 527
    Top = 18
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 661
    Top = 187
  end
  object frxGradientObject1: TfrxGradientObject
    Left = 659
    Top = 72
  end
  object frxMailExport1: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ShowExportDialog = True
    FromCompany = 'ATI Windows- ABC Window Systems'
    SmtpPort = 25
    UseIniFile = True
    TimeOut = 60
    ConfurmReading = False
    UseMAPI = MSOutlook
    Left = 564
    Top = 239
  end
  object dsRepSQL: TDataSource
    DataSet = RepSQL
    Left = 153
    Top = 141
  end
  object RepHF: TIBCQuery
    SQLInsert.Strings = (
      'INSERT INTO REPORT_SETTINGS'
      '  (GENPK_ID, BRANCHES, DISCLAIMER1, DISCLAIMER2)'
      'VALUES'
      '  (:GENPK_ID, :BRANCHES, :DISCLAIMER1, :DISCLAIMER2)')
    SQLDelete.Strings = (
      'DELETE FROM REPORT_SETTINGS'
      'WHERE'
      '  GENPK_ID = :Old_GENPK_ID')
    SQLUpdate.Strings = (
      'UPDATE REPORT_SETTINGS'
      'SET'
      
        '  GENPK_ID = :GENPK_ID, BRANCHES = :BRANCHES, DISCLAIMER1 = :DIS' +
        'CLAIMER1, DISCLAIMER2 = :DISCLAIMER2'
      'WHERE'
      '  GENPK_ID = :Old_GENPK_ID')
    SQLRefresh.Strings = (
      
        'SELECT GENPK_ID, BRANCHES, DISCLAIMER1, DISCLAIMER2 FROM REPORT_' +
        'SETTINGS'
      'WHERE'
      '  GENPK_ID = :GENPK_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM REPORT_SETTINGS'
      'WHERE'
      'GENPK_ID = :Old_GENPK_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM REPORT_SETTINGS'
      ''
      ') q')
    Connection = CostingDM.MainDB
    Transaction = CostingDM.TransRead
    UpdateTransaction = CostingDM.TransRead
    SQL.Strings = (
      
        'select customers.cust_name, customers.bill_phone, customers.bill' +
        '_fax, so_quote_hdr.ship_note,'
      
        '       so_quote_hdr.ship_address_1, so_quote_hdr.ship_address_2,' +
        ' zipntax.zipcode, zipntax.city,'
      
        '       so_quote_hdr.quote_no, so_quote_hdr.prod_cost, so_quote_h' +
        'dr.j_disc, so_quote_hdr.sales_tax,'
      
        '       so_quote_hdr.delivery_cost, so_quote_hdr.job_name, so_quo' +
        'te_hdr.quote_date from zipntax'
      
        '       inner join so_quote_hdr on (zipntax.zipntax_id = so_quote' +
        '_hdr.ship_zipntax_id)'
      
        '       inner join customers on (so_quote_hdr.customer_id = custo' +
        'mers.customer_id)'
      '       where so_quote_hdr.QUOTE_ID = 11077')
    Left = 101
    Top = 18
  end
  object frdsRepHF: TfrxDBDataset
    UserName = 'frdsRepHF'
    CloseDataSource = True
    FieldAliases.Strings = (
      'CUST_NAME=CUST_NAME'
      'BILL_PHONE=BILL_PHONE'
      'BILL_FAX=BILL_FAX'
      'SHIP_NOTE=SHIP_NOTE'
      'SHIP_ADDRESS_1=SHIP_ADDRESS_1'
      'SHIP_ADDRESS_2=SHIP_ADDRESS_2'
      'ZIPCODE=ZIPCODE'
      'CITY=CITY'
      'QUOTE_NO=QUOTE_NO'
      'PROD_COST=PROD_COST'
      'J_DISC=J_DISC'
      'SALES_TAX=SALES_TAX'
      'DELIVERY_COST=DELIVERY_COST'
      'JOB_NAME=JOB_NAME'
      'QUOTE_DATE=QUOTE_DATE')
    OpenDataSource = False
    DataSet = RepHF
    BCDToCurrency = False
    Left = 101
    Top = 79
  end
  object SubRepSQL2: TIBCQuery
    Connection = CostingDM.MainDB
    Transaction = CostingDM.TransRead
    UpdateTransaction = CostingDM.TransRead
    SQL.Strings = (
      'select * from VW_MULL Where (quote_win_id = :quote_win_id)')
    ReadOnly = True
    UniDirectional = True
    Left = 284
    Top = 17
    ParamData = <
      item
        DataType = ftInteger
        Name = 'quote_win_id'
        ParamType = ptInput
        Value = 53827
      end>
  end
  object frdsSubRep2: TfrxDBDataset
    UserName = 'frdsSubRep2'
    CloseDataSource = True
    FieldAliases.Strings = (
      'WIN_MULL_ID=WIN_MULL_ID'
      'QUOTE_WIN_ID=QUOTE_WIN_ID'
      'MULL_QUOTE_WIN_ID=MULL_QUOTE_WIN_ID'
      'MULL_EDGE=MULL_EDGE'
      'SERIES_NAME=SERIES_NAME'
      'MODEL_NAME=MODEL_NAME'
      'CALLOUTS=CALLOUTS'
      'WIN_WIDTH=WIN_WIDTH'
      'WIN_HEIGHT=WIN_HEIGHT'
      'GKIND_NAME=GKIND_NAME'
      'GRIDS_ACROSS=GRIDS_ACROSS'
      'GRIDS_UPDOWN=GRIDS_UPDOWN')
    DataSet = SubRepSQL2
    BCDToCurrency = False
    Left = 284
    Top = 79
  end
end
