object CostingDM: TCostingDM
  OldCreateOrder = False
  Height = 871
  Width = 1868
  object MainDB: TIBCConnection
    Database = 'C:\Stephen\Win\DB\WINDOZ.FDB'
    Options.Charset = 'WIN1252'
    Options.KeepDesignConnected = False
    DefaultTransaction = TransRead
    ClientLibrary = 'C:\Program Files\Firebird\Firebird_2_5\WOW64\fbclient.dll'
    Port = '3050'
    Username = 'sysdba'
    Server = '127.0.0.1'
    Connected = True
    LoginPrompt = False
    Left = 29
    Top = 11
    EncryptedPassword = '92FF9EFF8CFF8BFF9AFF8DFF94FF9AFF86FF'
  end
  object TransRead: TIBCTransaction
    DefaultConnection = MainDB
    Left = 100
    Top = 10
  end
  object dsSeries: TIBCDataSource
    DataSet = tblSeries
    Left = 44
    Top = 151
  end
  object tblSeries: TIBCQuery
    KeyFields = 'SERIES_ID'
    KeyGenerator = 'GEN_SERIES_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO SERIES'
      
        '  (SERIES_ID, SERIES_NAME, SERIES_DESCRIPTION, IS_VISIBLE, GUI_S' +
        'EQUENCE, ALPHA_VALUE, OPERATOR, DATE_SAVED, OPERATOR_LAST_MODIFI' +
        'ED, DATE_LAST_MODIFIED, ROCHART_FILEPATH, UVALUECHART_FILEPATH, ' +
        'STCCHART_FILEPATH, BROCHURE_FILEPATH)'
      'VALUES'
      
        '  (:SERIES_ID, :SERIES_NAME, :SERIES_DESCRIPTION, :IS_VISIBLE, :' +
        'GUI_SEQUENCE, :ALPHA_VALUE, :OPERATOR, :DATE_SAVED, :OPERATOR_LA' +
        'ST_MODIFIED, :DATE_LAST_MODIFIED, :ROCHART_FILEPATH, :UVALUECHAR' +
        'T_FILEPATH, :STCCHART_FILEPATH, :BROCHURE_FILEPATH)')
    SQLDelete.Strings = (
      'DELETE FROM SERIES'
      'WHERE'
      '  SERIES_ID = :Old_SERIES_ID')
    SQLUpdate.Strings = (
      'UPDATE SERIES'
      'SET'
      
        '  SERIES_ID = :SERIES_ID, SERIES_NAME = :SERIES_NAME, SERIES_DES' +
        'CRIPTION = :SERIES_DESCRIPTION, IS_VISIBLE = :IS_VISIBLE, GUI_SE' +
        'QUENCE = :GUI_SEQUENCE, ALPHA_VALUE = :ALPHA_VALUE, OPERATOR = :' +
        'OPERATOR, DATE_SAVED = :DATE_SAVED, OPERATOR_LAST_MODIFIED = :OP' +
        'ERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED = :DATE_LAST_MODIFIED, ' +
        'ROCHART_FILEPATH = :ROCHART_FILEPATH, UVALUECHART_FILEPATH = :UV' +
        'ALUECHART_FILEPATH, STCCHART_FILEPATH = :STCCHART_FILEPATH, BROC' +
        'HURE_FILEPATH = :BROCHURE_FILEPATH'
      'WHERE'
      '  SERIES_ID = :Old_SERIES_ID')
    SQLRefresh.Strings = (
      
        'SELECT SERIES_ID, SERIES_NAME, SERIES_DESCRIPTION, IS_VISIBLE, G' +
        'UI_SEQUENCE, ALPHA_VALUE, OPERATOR, DATE_SAVED, OPERATOR_LAST_MO' +
        'DIFIED, DATE_LAST_MODIFIED, ROCHART_FILEPATH, UVALUECHART_FILEPA' +
        'TH, STCCHART_FILEPATH, BROCHURE_FILEPATH FROM SERIES'
      'WHERE'
      '  SERIES_ID = :SERIES_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM SERIES'
      'WHERE'
      'SERIES_ID = :Old_SERIES_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM SERIES'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'Select * from SERIES'
      'where is_visible like :vp'
      'Order By GUI_SEQUENCE')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 44
    Top = 98
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vp'
        Value = nil
      end>
  end
  object dsSeriesHanding: TIBCDataSource
    DataSet = tblSeriesHanding
    Left = 1007
    Top = 151
  end
  object dsSeriesModel: TIBCDataSource
    DataSet = tblSeriesModel
    Left = 307
    Top = 151
  end
  object dsSeriesNailfin: TIBCDataSource
    DataSet = tblSeriesNailfin
    Left = 138
    Top = 282
  end
  object dsSeriesColor: TIBCDataSource
    DataSet = tblSeriesColor
    Left = 641
    Top = 151
  end
  object tblSeriesHanding: TIBCQuery
    UpdatingTable = 'HANDING_SM'
    KeyFields = 'HSM_ID'
    KeyGenerator = 'GEN_HANDING_SM_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO HANDING_SM'
      '  (HSM_ID, HANDING_ID, SM_ID, IS_VISIBLE)'
      'VALUES'
      '  (:HSM_ID, :HANDING_ID, :SM_ID, :IS_VISIBLE)')
    SQLDelete.Strings = (
      'DELETE FROM HANDING_SM'
      'WHERE'
      '  HSM_ID = :Old_HSM_ID')
    SQLUpdate.Strings = (
      'UPDATE HANDING_SM'
      'SET'
      
        '  HSM_ID = :HSM_ID, HANDING_ID = :HANDING_ID, SM_ID = :SM_ID, IS' +
        '_VISIBLE = :IS_VISIBLE'
      'WHERE'
      '  HSM_ID = :Old_HSM_ID')
    SQLRefresh.Strings = (
      'SELECT HSM_ID, HANDING_ID, SM_ID, IS_VISIBLE FROM HANDING_SM'
      'WHERE'
      '  HSM_ID = :HSM_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM HANDING_SM'
      'WHERE'
      'HSM_ID = :Old_HSM_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    handing_sm.hsm_id,'
      '    handing_sm.handing_id,'
      '    handing_sm.sm_id,'
      '    handing_sm.is_visible,'
      '    handing.handing_name,'
      '    handing.handing_description,'
      '    handing.viewed_from,'
      '    handing.gui_sequence,'
      '    series_model.series_id,'
      '    series_model.model_id,'
      '    models.model_name,'
      '    models.model_description,'
      '    series.series_description,'
      '    series.series_name'
      'from series'
      
        '   right outer join series_model on (series.series_id = series_m' +
        'odel.series_id)'
      
        '   right outer join handing_sm on (series_model.sm_id = handing_' +
        'sm.sm_id)'
      
        '   left outer join handing on (handing_sm.handing_id = handing.h' +
        'anding_id)'
      
        '   left outer join models on (series_model.model_id = models.mod' +
        'el_id)'
      'where (handing_sm.sm_id = :SM_ID)'
      'and (handing_sm.IS_VISIBLE like :vp)'
      'Order by handing.GUI_SEQUENCE')
    MasterSource = dsSeriesModel
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 1007
    Top = 98
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SM_ID'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'vp'
        Value = nil
      end>
  end
  object tblSeriesModel: TIBCQuery
    UpdatingTable = 'SERIES_MODEL'
    KeyFields = 'SM_ID'
    KeyGenerator = 'GEN_SERIES_MODEL_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO SERIES_MODEL'
      
        '  (SM_ID, SERIES_ID, MODEL_ID, IS_VISIBLE, MIN_WIDTH, MAX_WIDTH,' +
        ' MIN_HEIGHT, MAX_HEIGHT, MAX_AREA, MIN_WIDTH_HEIGHT, MAX_WIDTH_H' +
        'EIGHT, NFS_WIDTH_DEDUCT, NFS_HEIGHT_DEDUCT, OPEN_WIDTH_DIVISOR, ' +
        'OPEN_WIDTH_DEDUCT, OPEN_HEIGHT_DIVISOR, OPEN_HEIGHT_DEDUCT, GLAS' +
        'S_EDGE_ID, ESL, PROD_HOURS)'
      'VALUES'
      
        '  (:SM_ID, :SERIES_ID, :MODEL_ID, :IS_VISIBLE, :MIN_WIDTH, :MAX_' +
        'WIDTH, :MIN_HEIGHT, :MAX_HEIGHT, :MAX_AREA, :MIN_WIDTH_HEIGHT, :' +
        'MAX_WIDTH_HEIGHT, :NFS_WIDTH_DEDUCT, :NFS_HEIGHT_DEDUCT, :OPEN_W' +
        'IDTH_DIVISOR, :OPEN_WIDTH_DEDUCT, :OPEN_HEIGHT_DIVISOR, :OPEN_HE' +
        'IGHT_DEDUCT, :GLASS_EDGE_ID, :ESL, :PROD_HOURS)')
    SQLDelete.Strings = (
      'DELETE FROM SERIES_MODEL'
      'WHERE'
      '  SM_ID = :Old_SM_ID')
    SQLUpdate.Strings = (
      'UPDATE SERIES_MODEL'
      'SET'
      
        '  SM_ID = :SM_ID, SERIES_ID = :SERIES_ID, MODEL_ID = :MODEL_ID, ' +
        'IS_VISIBLE = :IS_VISIBLE, MIN_WIDTH = :MIN_WIDTH, MAX_WIDTH = :M' +
        'AX_WIDTH, MIN_HEIGHT = :MIN_HEIGHT, MAX_HEIGHT = :MAX_HEIGHT, MA' +
        'X_AREA = :MAX_AREA, MIN_WIDTH_HEIGHT = :MIN_WIDTH_HEIGHT, MAX_WI' +
        'DTH_HEIGHT = :MAX_WIDTH_HEIGHT, NFS_WIDTH_DEDUCT = :NFS_WIDTH_DE' +
        'DUCT, NFS_HEIGHT_DEDUCT = :NFS_HEIGHT_DEDUCT, OPEN_WIDTH_DIVISOR' +
        ' = :OPEN_WIDTH_DIVISOR, OPEN_WIDTH_DEDUCT = :OPEN_WIDTH_DEDUCT, ' +
        'OPEN_HEIGHT_DIVISOR = :OPEN_HEIGHT_DIVISOR, OPEN_HEIGHT_DEDUCT =' +
        ' :OPEN_HEIGHT_DEDUCT, GLASS_EDGE_ID = :GLASS_EDGE_ID, ESL = :ESL' +
        ', PROD_HOURS = :PROD_HOURS'
      'WHERE'
      '  SM_ID = :Old_SM_ID')
    SQLRefresh.Strings = (
      'select '
      '    series_model.sm_id,'
      '    series_model.series_id,'
      '    series_model.model_id,'
      '    series_model.is_visible,'
      '    series_model.glass_edge_id,'
      '    series_model.min_width,'
      '    series_model.max_width,'
      '    series_model.min_height,'
      '    series_model.max_height,'
      '    series_model.max_area,'
      '    series_model.min_width_height,'
      '    series_model.max_width_height,'
      '    series_model.nfs_width_deduct,'
      '    series_model.nfs_height_deduct,'
      '    series_model.open_width_divisor,'
      '    series_model.open_width_deduct,'
      '    series_model.open_height_divisor,'
      '    series_model.open_height_deduct,'
      '    series_model.prod_hours,'
      '    series_model.esl,'
      '    series.series_name,'
      '    series.series_description,'
      '    models.model_name,'
      '    models.model_description,'
      '    models.vert_horz,'
      '    models.tempered,'
      '    models.igu_no,'
      '    models.model_img_big,'
      '    models.model_type_id,'
      '    models.is_special_model,'
      '    model_types.model_type_name'
      'from model_types'
      
        '   right outer join models on (model_types.model_type_id = model' +
        's.model_type_id)'
      
        '   right outer join series_model on (models.model_id = series_mo' +
        'del.model_id)'
      
        '   left outer join series on (series_model.series_id = series.se' +
        'ries_id)'
      'WHERE'
      '  SM_ID = :SM_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM SERIES_MODEL'
      'WHERE'
      'SM_ID = :Old_SM_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM SERIES_MODEL'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    series_model.sm_id,'
      '    series_model.series_id,'
      '    series_model.model_id,'
      '    series_model.is_visible,'
      '    series_model.glass_edge_id,'
      '    series_model.min_width,'
      '    series_model.max_width,'
      '    series_model.min_height,'
      '    series_model.max_height,'
      '    series_model.max_area,'
      '    series_model.min_width_height,'
      '    series_model.max_width_height,'
      '    series_model.nfs_width_deduct,'
      '    series_model.nfs_height_deduct,'
      '    series_model.open_width_divisor,'
      '    series_model.open_width_deduct,'
      '    series_model.open_height_divisor,'
      '    series_model.open_height_deduct,'
      '    series_model.prod_hours,'
      '    series_model.esl,'
      '    series.series_name,'
      '    series.series_description,'
      '    models.model_name,'
      '    models.model_description,'
      '    models.vert_horz,'
      '    models.tempered,'
      '    models.igu_no,'
      '    models.model_img_big,'
      '    models.model_type_id,'
      '    models.is_special_model,'
      '    model_types.model_type_name'
      'from model_types'
      
        '   right outer join models on (model_types.model_type_id = model' +
        's.model_type_id)'
      
        '   right outer join series_model on (models.model_id = series_mo' +
        'del.model_id)'
      
        '   left outer join series on (series_model.series_id = series.se' +
        'ries_id)'
      'where series_model.series_id = :series_id'
      'and series_model.is_visible like :vp'
      'Order By models.GUI_SEQUENCE')
    MasterSource = dsSeries
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    AfterInsert = tblSeriesModelAfterInsert
    Left = 308
    Top = 98
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'SERIES_ID'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'vp'
        Value = nil
      end>
  end
  object tblSeriesColor: TIBCQuery
    UpdatingTable = 'SERIES_COLOR'
    KeyFields = 'SC_ID'
    KeyGenerator = 'GEN_SERIES_COLOR_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO SERIES_COLOR'
      '  (SC_ID, SERIES_ID, COLOR_ID, IS_VISIBLE)'
      'VALUES'
      '  (:SC_ID, :SERIES_ID, :COLOR_ID, :IS_VISIBLE)')
    SQLDelete.Strings = (
      'DELETE FROM SERIES_COLOR'
      'WHERE'
      '  SC_ID = :Old_SC_ID')
    SQLUpdate.Strings = (
      'UPDATE SERIES_COLOR'
      'SET'
      
        '  SC_ID = :SC_ID, SERIES_ID = :SERIES_ID, COLOR_ID = :COLOR_ID, ' +
        'IS_VISIBLE = :IS_VISIBLE'
      'WHERE'
      '  SC_ID = :Old_SC_ID')
    SQLRefresh.Strings = (
      'SELECT SC_ID, SERIES_ID, COLOR_ID, IS_VISIBLE FROM SERIES_COLOR'
      'WHERE'
      '  SC_ID = :SC_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM SERIES_COLOR'
      'WHERE'
      'SC_ID = :Old_SC_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    series_color.sc_id,'
      '    series_color.series_id,'
      '    series_color.color_id,'
      '    series_color.is_visible,'
      '    colors.color_name,'
      '    colors.color_description,'
      '    colors.gui_sequence,'
      '    series.series_name,'
      '    series.series_description'
      'from series_color'
      
        '   left outer join series on (series_color.series_id = series.se' +
        'ries_id)'
      
        '   left outer join colors on (series_color.color_id = colors.col' +
        'or_id)'
      'where (series_color.series_id = :series_id)'
      'and (series_color.IS_VISIBLE like :vp)'
      'Order By colors.GUI_SEQUENCE')
    MasterSource = dsSeries
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 643
    Top = 98
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'SERIES_ID'
        ParamType = ptInput
        Value = 18
      end
      item
        DataType = ftUnknown
        Name = 'vp'
        Value = nil
      end>
  end
  object tblSeriesNailfin: TIBCQuery
    UpdatingTable = 'SERIES_NAILFIN'
    KeyFields = 'SNF_ID'
    KeyGenerator = 'GEN_SERIES_NAILFIN_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO SERIES_NAILFIN'
      '  (SNF_ID, NAILFIN_ID, SERIES_ID, IS_VISIBLE)'
      'VALUES'
      '  (:SNF_ID, :NAILFIN_ID, :SERIES_ID, :IS_VISIBLE)')
    SQLDelete.Strings = (
      'DELETE FROM SERIES_NAILFIN'
      'WHERE'
      '  SNF_ID = :Old_SNF_ID')
    SQLUpdate.Strings = (
      'UPDATE SERIES_NAILFIN'
      'SET'
      
        '  SNF_ID = :SNF_ID, NAILFIN_ID = :NAILFIN_ID, SERIES_ID = :SERIE' +
        'S_ID, IS_VISIBLE = :IS_VISIBLE'
      'WHERE'
      '  SNF_ID = :Old_SNF_ID')
    SQLRefresh.Strings = (
      
        'SELECT SNF_ID, NAILFIN_ID, SERIES_ID, IS_VISIBLE FROM SERIES_NAI' +
        'LFIN'
      'WHERE'
      '  SNF_ID = :SNF_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM SERIES_NAILFIN'
      'WHERE'
      'SNF_ID = :Old_SNF_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    series_nailfin.snf_id,'
      '    series_nailfin.nailfin_id,'
      '    series_nailfin.series_id,'
      '    series_nailfin.is_visible,'
      '    series.series_name,'
      '    series.series_description,'
      '    nailfin.nailfin_name,'
      '    nailfin.nailfin_description,'
      '    nailfin.gui_sequence'
      'from series'
      
        '   right outer join series_nailfin on (series.series_id = series' +
        '_nailfin.series_id)'
      
        '   left outer join nailfin on (series_nailfin.nailfin_id = nailf' +
        'in.nailfin_id)'
      'where (series_nailfin.series_id = :series_id)'
      'And (series_nailfin.IS_VISIBLE like :vp)'
      'Order by nailfin.GUI_SEQUENCE')
    MasterSource = dsSeries
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 138
    Top = 219
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'SERIES_ID'
        ParamType = ptInput
        Value = 18
      end
      item
        DataType = ftUnknown
        Name = 'vp'
        Value = nil
      end>
  end
  object tblCallouts: TIBCQuery
    UpdatingTable = 'CALLOUTS'
    KeyFields = 'CALLOUTS_ID'
    KeyGenerator = 'GEN_CALLOUTS_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO CALLOUTS'
      
        '  (CALLOUTS_ID, SM_ID, CALLOUTS, GUI_SEQUENCE, NFS_WIDTH, NFS_HE' +
        'IGHT, IS_VISIBLE)'
      'VALUES'
      
        '  (:CALLOUTS_ID, :SM_ID, :CALLOUTS, :GUI_SEQUENCE, :NFS_WIDTH, :' +
        'NFS_HEIGHT, :IS_VISIBLE)')
    SQLDelete.Strings = (
      'DELETE FROM CALLOUTS'
      'WHERE'
      '  CALLOUTS_ID = :Old_CALLOUTS_ID')
    SQLUpdate.Strings = (
      'UPDATE CALLOUTS'
      'SET'
      
        '  CALLOUTS_ID = :CALLOUTS_ID, SM_ID = :SM_ID, CALLOUTS = :CALLOU' +
        'TS, GUI_SEQUENCE = :GUI_SEQUENCE, NFS_WIDTH = :NFS_WIDTH, NFS_HE' +
        'IGHT = :NFS_HEIGHT, IS_VISIBLE = :IS_VISIBLE'
      'WHERE'
      '  CALLOUTS_ID = :Old_CALLOUTS_ID')
    SQLRefresh.Strings = (
      
        'SELECT CALLOUTS_ID, SM_ID, CALLOUTS, GUI_SEQUENCE, NFS_WIDTH, NF' +
        'S_HEIGHT, IS_VISIBLE FROM CALLOUTS'
      'WHERE'
      '  CALLOUTS_ID = :CALLOUTS_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM CALLOUTS'
      'WHERE'
      'CALLOUTS_ID = :Old_CALLOUTS_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM CALLOUTS'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    callouts.callouts_id,'
      '    callouts.sm_id,'
      '    callouts.callouts,'
      '    callouts.NFS_WIDTH,'
      '    callouts.NFS_HEIGHT,'
      '    callouts.gui_sequence,'
      '    callouts.IS_VISIBLE,'
      '    models.model_name,'
      '    models.model_description,'
      '    series.series_name,'
      '    series.series_description'
      'from series'
      
        '   right outer join series_model on (series.series_id = series_m' +
        'odel.series_id)'
      
        '   right outer join callouts on (series_model.sm_id = callouts.s' +
        'm_id)'
      
        '   left outer join models on (series_model.model_id = models.mod' +
        'el_id)'
      'where callouts.sm_id = :sm_id'
      'and callouts.IS_VISIBLE like :vp'
      'Order by callouts.GUI_SEQUENCE')
    MasterSource = dsSeriesModel
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    AfterInsert = tblCalloutsAfterInsert
    Left = 381
    Top = 219
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sm_id'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'vp'
        Value = nil
      end>
  end
  object dsCallouts: TIBCDataSource
    DataSet = tblCallouts
    Left = 381
    Top = 282
  end
  object transWrite: TIBCTransaction
    DefaultConnection = MainDB
    Params.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    DefaultCloseAction = taCommitRetaining
    IsolationLevel = iblCustom
    Left = 185
    Top = 10
  end
  object MainSQL: TIBCQuery
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from VW_QUOTES')
    LockMode = lmLockDelayed
    Options.QueryRecCount = True
    Left = 401
    Top = 10
  end
  object ExecSQL: TIBCSQL
    Connection = MainDB
    Transaction = TransRead
    SQL.Strings = (
      'rdb$set_context('#39'USER_TRANSACTION'#39', '#39'P_job_batch_id'#39', 11);')
    Left = 564
    Top = 10
  end
  object tblModels: TIBCQuery
    KeyFields = 'MODEL_ID'
    KeyGenerator = 'GEN_MODELS_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO MODELS'
      
        '  (MODEL_ID, MODEL_NAME, MODEL_DESCRIPTION, MODEL_IMG_BIG, TEMPE' +
        'RED, VERT_HORZ, DRAWING, GUI_SEQUENCE, MODEL_TYPE_ID, IGU_NO, XP' +
        'ANEL_NO, DPANEL_NO, GED_CODE, IS_SPECIAL_MODEL)'
      'VALUES'
      
        '  (:MODEL_ID, :MODEL_NAME, :MODEL_DESCRIPTION, :MODEL_IMG_BIG, :' +
        'TEMPERED, :VERT_HORZ, :DRAWING, :GUI_SEQUENCE, :MODEL_TYPE_ID, :' +
        'IGU_NO, :XPANEL_NO, :DPANEL_NO, :GED_CODE, :IS_SPECIAL_MODEL)')
    SQLDelete.Strings = (
      'DELETE FROM MODELS'
      'WHERE'
      '  MODEL_ID = :Old_MODEL_ID')
    SQLUpdate.Strings = (
      'UPDATE MODELS'
      'SET'
      
        '  MODEL_ID = :MODEL_ID, MODEL_NAME = :MODEL_NAME, MODEL_DESCRIPT' +
        'ION = :MODEL_DESCRIPTION, MODEL_IMG_BIG = :MODEL_IMG_BIG, TEMPER' +
        'ED = :TEMPERED, VERT_HORZ = :VERT_HORZ, DRAWING = :DRAWING, GUI_' +
        'SEQUENCE = :GUI_SEQUENCE, MODEL_TYPE_ID = :MODEL_TYPE_ID, IGU_NO' +
        ' = :IGU_NO, XPANEL_NO = :XPANEL_NO, DPANEL_NO = :DPANEL_NO, GED_' +
        'CODE = :GED_CODE, IS_SPECIAL_MODEL = :IS_SPECIAL_MODEL'
      'WHERE'
      '  MODEL_ID = :Old_MODEL_ID')
    SQLRefresh.Strings = (
      
        'SELECT MODEL_ID, MODEL_NAME, MODEL_DESCRIPTION, MODEL_IMG_BIG, T' +
        'EMPERED, VERT_HORZ, DRAWING, GUI_SEQUENCE, MODEL_TYPE_ID, IGU_NO' +
        ', XPANEL_NO, DPANEL_NO, GED_CODE, IS_SPECIAL_MODEL FROM MODELS'
      'WHERE'
      '  MODEL_ID = :MODEL_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM MODELS'
      'WHERE'
      'MODEL_ID = :Old_MODEL_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM MODELS'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from MODELS'
      'Order By GUI_SEQUENCE')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Options.DetailDelay = 1
    IndexFieldNames = 'MODEL_NAME'
    Left = 215
    Top = 98
  end
  object dsModels: TIBCDataSource
    DataSet = tblModels
    Left = 215
    Top = 151
  end
  object tblColors: TIBCQuery
    KeyFields = 'COLOR_ID'
    KeyGenerator = 'GEN_COLORS_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO COLORS'
      
        '  (COLOR_ID, COLOR_NAME, COLOR_DESCRIPTION, GUI_SEQUENCE, OPERAT' +
        'OR, DATE_SAVED, OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED)'
      'VALUES'
      
        '  (:COLOR_ID, :COLOR_NAME, :COLOR_DESCRIPTION, :GUI_SEQUENCE, :O' +
        'PERATOR, :DATE_SAVED, :OPERATOR_LAST_MODIFIED, :DATE_LAST_MODIFI' +
        'ED)')
    SQLDelete.Strings = (
      'DELETE FROM COLORS'
      'WHERE'
      '  COLOR_ID = :Old_COLOR_ID')
    SQLUpdate.Strings = (
      'UPDATE COLORS'
      'SET'
      
        '  COLOR_ID = :COLOR_ID, COLOR_NAME = :COLOR_NAME, COLOR_DESCRIPT' +
        'ION = :COLOR_DESCRIPTION, GUI_SEQUENCE = :GUI_SEQUENCE, OPERATOR' +
        ' = :OPERATOR, DATE_SAVED = :DATE_SAVED, OPERATOR_LAST_MODIFIED =' +
        ' :OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED = :DATE_LAST_MODIFI' +
        'ED'
      'WHERE'
      '  COLOR_ID = :Old_COLOR_ID')
    SQLRefresh.Strings = (
      
        'SELECT COLOR_ID, COLOR_NAME, COLOR_DESCRIPTION, GUI_SEQUENCE, OP' +
        'ERATOR, DATE_SAVED, OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED F' +
        'ROM COLORS'
      'WHERE'
      '  COLOR_ID = :COLOR_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM COLORS'
      'WHERE'
      'COLOR_ID = :Old_COLOR_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'Select * from COLORS'
      'Order By GUI_SEQUENCE')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 552
    Top = 98
  end
  object dsColors: TIBCDataSource
    DataSet = tblColors
    Left = 550
    Top = 151
  end
  object tblNailfin: TIBCQuery
    KeyFields = 'NAILFIN_ID'
    KeyGenerator = 'GEN_NAILFIN_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO NAILFIN'
      
        '  (NAILFIN_ID, NAILFIN_NAME, NAILFIN_DESCRIPTION, GUI_SEQUENCE, ' +
        'OPERATOR, DATE_SAVED, OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED' +
        ')'
      'VALUES'
      
        '  (:NAILFIN_ID, :NAILFIN_NAME, :NAILFIN_DESCRIPTION, :GUI_SEQUEN' +
        'CE, :OPERATOR, :DATE_SAVED, :OPERATOR_LAST_MODIFIED, :DATE_LAST_' +
        'MODIFIED)')
    SQLDelete.Strings = (
      'DELETE FROM NAILFIN'
      'WHERE'
      '  NAILFIN_ID = :Old_NAILFIN_ID')
    SQLUpdate.Strings = (
      'UPDATE NAILFIN'
      'SET'
      
        '  NAILFIN_ID = :NAILFIN_ID, NAILFIN_NAME = :NAILFIN_NAME, NAILFI' +
        'N_DESCRIPTION = :NAILFIN_DESCRIPTION, GUI_SEQUENCE = :GUI_SEQUEN' +
        'CE, OPERATOR = :OPERATOR, DATE_SAVED = :DATE_SAVED, OPERATOR_LAS' +
        'T_MODIFIED = :OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED = :DATE' +
        '_LAST_MODIFIED'
      'WHERE'
      '  NAILFIN_ID = :Old_NAILFIN_ID')
    SQLRefresh.Strings = (
      
        'SELECT NAILFIN_ID, NAILFIN_NAME, NAILFIN_DESCRIPTION, GUI_SEQUEN' +
        'CE, OPERATOR, DATE_SAVED, OPERATOR_LAST_MODIFIED, DATE_LAST_MODI' +
        'FIED FROM NAILFIN'
      'WHERE'
      '  NAILFIN_ID = :NAILFIN_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM NAILFIN'
      'WHERE'
      'NAILFIN_ID = :Old_NAILFIN_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from NAILFIN'
      'Order by GUI_SEQUENCE')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 42
    Top = 219
  end
  object dsNailfin: TIBCDataSource
    DataSet = tblNailfin
    Left = 40
    Top = 282
  end
  object tblHanding: TIBCQuery
    KeyFields = 'HANDING_ID'
    KeyGenerator = 'GEN_HANDING_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO HANDING'
      
        '  (HANDING_ID, HANDING_NAME, HANDING_DESCRIPTION, VIEWED_FROM, G' +
        'UI_SEQUENCE, OPERATOR, DATE_SAVED, OPERATOR_LAST_MODIFIED, DATE_' +
        'LAST_MODIFIED)'
      'VALUES'
      
        '  (:HANDING_ID, :HANDING_NAME, :HANDING_DESCRIPTION, :VIEWED_FRO' +
        'M, :GUI_SEQUENCE, :OPERATOR, :DATE_SAVED, :OPERATOR_LAST_MODIFIE' +
        'D, :DATE_LAST_MODIFIED)')
    SQLDelete.Strings = (
      'DELETE FROM HANDING'
      'WHERE'
      '  HANDING_ID = :Old_HANDING_ID')
    SQLUpdate.Strings = (
      'UPDATE HANDING'
      'SET'
      
        '  HANDING_ID = :HANDING_ID, HANDING_NAME = :HANDING_NAME, HANDIN' +
        'G_DESCRIPTION = :HANDING_DESCRIPTION, VIEWED_FROM = :VIEWED_FROM' +
        ', GUI_SEQUENCE = :GUI_SEQUENCE, OPERATOR = :OPERATOR, DATE_SAVED' +
        ' = :DATE_SAVED, OPERATOR_LAST_MODIFIED = :OPERATOR_LAST_MODIFIED' +
        ', DATE_LAST_MODIFIED = :DATE_LAST_MODIFIED'
      'WHERE'
      '  HANDING_ID = :Old_HANDING_ID')
    SQLRefresh.Strings = (
      
        'SELECT HANDING_ID, HANDING_NAME, HANDING_DESCRIPTION, VIEWED_FRO' +
        'M, GUI_SEQUENCE, OPERATOR, DATE_SAVED, OPERATOR_LAST_MODIFIED, D' +
        'ATE_LAST_MODIFIED FROM HANDING'
      'WHERE'
      '  HANDING_ID = :HANDING_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM HANDING'
      'WHERE'
      'HANDING_ID = :Old_HANDING_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from HANDING'
      'Order by GUI_SEQUENCE')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    IndexFieldNames = 'HANDING_ID'
    Left = 892
    Top = 98
  end
  object dsHanding: TIBCDataSource
    DataSet = tblHanding
    Left = 892
    Top = 151
  end
  object dsInvShadow: TIBCDataSource
    DataSet = tblInvShadow
    Left = 112
    Top = 669
  end
  object tblInvShadow: TIBCQuery
    KeyFields = 'INV_SHADOW_ID'
    KeyGenerator = 'GEN_INV_SHADOW_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO INV_SHADOW'
      
        '  (INV_SHADOW_ID, PART_NUMBER, DESCRIPTION, UOM_INV, UOM_BOM, UO' +
        'M_METHOD, UOM_CONVERSION, PO_UNIT_PRICE, PRICE_BOM, WEIGHT, USER' +
        '_OPERATOR, DATE_SAVED)'
      'VALUES'
      
        '  (:INV_SHADOW_ID, :PART_NUMBER, :DESCRIPTION, :UOM_INV, :UOM_BO' +
        'M, :UOM_METHOD, :UOM_CONVERSION, :PO_UNIT_PRICE, :PRICE_BOM, :WE' +
        'IGHT, :USER_OPERATOR, :DATE_SAVED)')
    SQLDelete.Strings = (
      'DELETE FROM INV_SHADOW'
      'WHERE'
      '  INV_SHADOW_ID = :Old_INV_SHADOW_ID')
    SQLUpdate.Strings = (
      'UPDATE INV_SHADOW'
      'SET'
      
        '  INV_SHADOW_ID = :INV_SHADOW_ID, PART_NUMBER = :PART_NUMBER, DE' +
        'SCRIPTION = :DESCRIPTION, UOM_INV = :UOM_INV, UOM_BOM = :UOM_BOM' +
        ', UOM_METHOD = :UOM_METHOD, UOM_CONVERSION = :UOM_CONVERSION, PO' +
        '_UNIT_PRICE = :PO_UNIT_PRICE, PRICE_BOM = :PRICE_BOM, WEIGHT = :' +
        'WEIGHT, USER_OPERATOR = :USER_OPERATOR, DATE_SAVED = :DATE_SAVED'
      'WHERE'
      '  INV_SHADOW_ID = :Old_INV_SHADOW_ID')
    SQLRefresh.Strings = (
      
        'SELECT INV_SHADOW_ID, PART_NUMBER, DESCRIPTION, UOM_INV, UOM_BOM' +
        ', UOM_METHOD, UOM_CONVERSION, PO_UNIT_PRICE, PRICE_BOM, WEIGHT, ' +
        'USER_OPERATOR, DATE_SAVED FROM INV_SHADOW'
      'WHERE'
      '  INV_SHADOW_ID = :INV_SHADOW_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM INV_SHADOW'
      'WHERE'
      'INV_SHADOW_ID = :Old_INV_SHADOW_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM INV_SHADOW'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'Select * from INV_SHADOW')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    IndexFieldNames = 'INV_SHADOW_ID'
    BeforeEdit = tblInvShadowBeforeEdit
    BeforePost = tblInvShadowBeforePost
    Left = 112
    Top = 616
  end
  object dsInvShadowArch: TIBCDataSource
    DataSet = tblInvShadowArch
    Left = 203
    Top = 669
  end
  object tblInvShadowArch: TIBCQuery
    KeyFields = 'INV_SHADOW_ARCH_ID'
    KeyGenerator = 'GEN_INV_SHADOW_ARCHIVE_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO INV_SHADOW_ARCHIVE'
      
        '  (INV_SHADOW_ARCH_ID, INV_SHADOW_ID, PART_NUMBER, DESCRIPTION, ' +
        'UOM_INV, UOM_BOM, UOM_METHOD, UOM_CONVERSION, PO_UNIT_PRICE, PRI' +
        'CE_BOM, WEIGHT, USER_OPERATOR, DATE_SAVED, SURCHARGE, TRANSPORTA' +
        'TION, TOTAL_PRICE)'
      'VALUES'
      
        '  (:INV_SHADOW_ARCH_ID, :INV_SHADOW_ID, :PART_NUMBER, :DESCRIPTI' +
        'ON, :UOM_INV, :UOM_BOM, :UOM_METHOD, :UOM_CONVERSION, :PO_UNIT_P' +
        'RICE, :PRICE_BOM, :WEIGHT, :USER_OPERATOR, :DATE_SAVED, :SURCHAR' +
        'GE, :TRANSPORTATION, :TOTAL_PRICE)')
    SQLDelete.Strings = (
      'DELETE FROM INV_SHADOW_ARCHIVE'
      'WHERE'
      '  INV_SHADOW_ARCH_ID = :Old_INV_SHADOW_ARCH_ID')
    SQLUpdate.Strings = (
      'UPDATE INV_SHADOW_ARCHIVE'
      'SET'
      
        '  INV_SHADOW_ARCH_ID = :INV_SHADOW_ARCH_ID, INV_SHADOW_ID = :INV' +
        '_SHADOW_ID, PART_NUMBER = :PART_NUMBER, DESCRIPTION = :DESCRIPTI' +
        'ON, UOM_INV = :UOM_INV, UOM_BOM = :UOM_BOM, UOM_METHOD = :UOM_ME' +
        'THOD, UOM_CONVERSION = :UOM_CONVERSION, PO_UNIT_PRICE = :PO_UNIT' +
        '_PRICE, PRICE_BOM = :PRICE_BOM, WEIGHT = :WEIGHT, USER_OPERATOR ' +
        '= :USER_OPERATOR, DATE_SAVED = :DATE_SAVED, SURCHARGE = :SURCHAR' +
        'GE, TRANSPORTATION = :TRANSPORTATION, TOTAL_PRICE = :TOTAL_PRICE'
      'WHERE'
      '  INV_SHADOW_ARCH_ID = :Old_INV_SHADOW_ARCH_ID')
    SQLRefresh.Strings = (
      
        'SELECT INV_SHADOW_ARCH_ID, INV_SHADOW_ID, PART_NUMBER, DESCRIPTI' +
        'ON, UOM_INV, UOM_BOM, UOM_METHOD, UOM_CONVERSION, PO_UNIT_PRICE,' +
        ' PRICE_BOM, WEIGHT, USER_OPERATOR, DATE_SAVED, SURCHARGE, TRANSP' +
        'ORTATION, TOTAL_PRICE FROM INV_SHADOW_ARCHIVE'
      'WHERE'
      '  INV_SHADOW_ARCH_ID = :INV_SHADOW_ARCH_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM INV_SHADOW_ARCHIVE'
      'WHERE'
      'INV_SHADOW_ARCH_ID = :Old_INV_SHADOW_ARCH_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM INV_SHADOW_ARCHIVE'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'Select * from INV_SHADOW_ARCHIVE'
      'where INV_SHADOW_ID = :INV_SHADOW_ID')
    MasterSource = dsInvShadow
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    IndexFieldNames = 'INV_SHADOW_ARCH_ID'
    Left = 203
    Top = 616
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'INV_SHADOW_ID'
        Value = nil
      end>
  end
  object tblBOM: TIBCQuery
    UpdatingTable = 'BOM'
    KeyFields = 'BOM_ID'
    KeyGenerator = 'GEN_BOM_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO BOM'
      
        '  (BOM_ID, BOM_NAME, BOM_DESCRIPTION, WORKCELL_TYPE_ID, SM_ID, S' +
        'C_ID, SNF_ID, SUBASSEMBLY, INV_SHADOW_ID, QUANTITY, WIDTH_DEDUCT' +
        ', WIDTH_DIVISOR, HEIGHT_DEDUCT, HEIGHT_DIVISOR, WASTE, BASE_COST' +
        ', SELECTED_COPY, DIMENSION_TYPE, BCT_ID)'
      'VALUES'
      
        '  (:BOM_ID, :BOM_NAME, :BOM_DESCRIPTION, :WORKCELL_TYPE_ID, :SM_' +
        'ID, :SC_ID, :SNF_ID, :SUBASSEMBLY, :INV_SHADOW_ID, :QUANTITY, :W' +
        'IDTH_DEDUCT, :WIDTH_DIVISOR, :HEIGHT_DEDUCT, :HEIGHT_DIVISOR, :W' +
        'ASTE, :BASE_COST, :SELECTED_COPY, :DIMENSION_TYPE, :BCT_ID)')
    SQLDelete.Strings = (
      'DELETE FROM BOM'
      'WHERE'
      '  BOM_ID = :Old_BOM_ID')
    SQLUpdate.Strings = (
      'UPDATE BOM'
      'SET'
      
        '  BOM_ID = :BOM_ID, BOM_NAME = :BOM_NAME, BOM_DESCRIPTION = :BOM' +
        '_DESCRIPTION, WORKCELL_TYPE_ID = :WORKCELL_TYPE_ID, SM_ID = :SM_' +
        'ID, SC_ID = :SC_ID, SNF_ID = :SNF_ID, SUBASSEMBLY = :SUBASSEMBLY' +
        ', INV_SHADOW_ID = :INV_SHADOW_ID, QUANTITY = :QUANTITY, WIDTH_DE' +
        'DUCT = :WIDTH_DEDUCT, WIDTH_DIVISOR = :WIDTH_DIVISOR, HEIGHT_DED' +
        'UCT = :HEIGHT_DEDUCT, HEIGHT_DIVISOR = :HEIGHT_DIVISOR, WASTE = ' +
        ':WASTE, BASE_COST = :BASE_COST, SELECTED_COPY = :SELECTED_COPY, ' +
        'DIMENSION_TYPE = :DIMENSION_TYPE, BCT_ID = :BCT_ID'
      'WHERE'
      '  BOM_ID = :Old_BOM_ID')
    SQLRefresh.Strings = (
      'select '
      '    bom.bom_id,'
      '    bom.bom_name,'
      '    bom.bom_description,'
      '    bom.sm_id,'
      '    bom.sc_id,'
      '    bom.snf_id,'
      '    bom.subassembly,'
      '    bom.inv_shadow_id,'
      '    bom.quantity,'
      '    bom.width_deduct,'
      '    bom.width_divisor,'
      '    bom.height_deduct,'
      '    bom.height_divisor,'
      '    bom.waste,'
      '    bom.base_cost,'
      '    bom.selected_copy,'
      '    bom.dimension_type,'
      '    bom.bct_id,'
      '    bom.workcell_type_id,'
      '    bom.win_cost,'
      '    series_model.series_id,'
      '    series_model.model_id,'
      '    series_color.color_id,'
      '    series_nailfin.nailfin_id,'
      '    series.series_name,'
      '    models.model_name,'
      '    colors.color_name,'
      '    nailfin.nailfin_name,'
      '    inv_shadow.part_number,'
      '    inv_shadow.description'
      'from inv_shadow'
      
        '   right outer join bom on (inv_shadow.inv_shadow_id = bom.inv_s' +
        'hadow_id)'
      
        '   left outer join series_model on (bom.sm_id = series_model.sm_' +
        'id)'
      
        '   left outer join series on (series_model.series_id = series.se' +
        'ries_id)'
      
        '   left outer join models on (series_model.model_id = models.mod' +
        'el_id)'
      
        '   left outer join series_color on (bom.sc_id = series_color.sc_' +
        'id)'
      
        '   left outer join colors on (series_color.color_id = colors.col' +
        'or_id)'
      
        '   left outer join series_nailfin on (bom.snf_id = series_nailfi' +
        'n.snf_id)'
      
        '   left outer join nailfin on (series_nailfin.nailfin_id = nailf' +
        'in.nailfin_id)'
      'WHERE'
      '  BOM_ID = :BOM_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM BOM'
      'WHERE'
      'BOM_ID = :Old_BOM_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM BOM'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    bom.bom_id,'
      '    bom.bom_name,'
      '    bom.bom_description,'
      '    bom.sm_id,'
      '    bom.sc_id,'
      '    bom.snf_id,'
      '    bom.subassembly,'
      '    bom.inv_shadow_id,'
      '    bom.quantity,'
      '    bom.width_deduct,'
      '    bom.width_divisor,'
      '    bom.height_deduct,'
      '    bom.height_divisor,'
      '    bom.waste,'
      '    bom.base_cost,'
      '    bom.selected_copy,'
      '    bom.dimension_type,'
      '    bom.bct_id,'
      '    bom.workcell_type_id,'
      '    bom.win_cost,'
      '    series_model.series_id,'
      '    series_model.model_id,'
      '    series_color.color_id,'
      '    series_nailfin.nailfin_id,'
      '    series.series_name,'
      '    models.model_name,'
      '    colors.color_name,'
      '    nailfin.nailfin_name,'
      '    inv_shadow.part_number,'
      '    inv_shadow.description'
      'from inv_shadow'
      
        '   right outer join bom on (inv_shadow.inv_shadow_id = bom.inv_s' +
        'hadow_id)'
      
        '   left outer join series_model on (bom.sm_id = series_model.sm_' +
        'id)'
      
        '   left outer join series on (series_model.series_id = series.se' +
        'ries_id)'
      
        '   left outer join models on (series_model.model_id = models.mod' +
        'el_id)'
      
        '   left outer join series_color on (bom.sc_id = series_color.sc_' +
        'id)'
      
        '   left outer join colors on (series_color.color_id = colors.col' +
        'or_id)'
      
        '   left outer join series_nailfin on (bom.snf_id = series_nailfi' +
        'n.snf_id)'
      
        '   left outer join nailfin on (series_nailfin.nailfin_id = nailf' +
        'in.nailfin_id)')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    IndexFieldNames = 'BOM_ID'
    AfterPost = tblBOMAfterPost
    Left = 379
    Top = 616
  end
  object dsBOM: TIBCDataSource
    DataSet = tblBOM
    Left = 379
    Top = 669
  end
  object tblWindows: TIBCQuery
    UpdatingTable = 'WINDOW'
    KeyFields = 'QUOTE_WIN_ID'
    KeyGenerator = 'GEN_QUOTE_WIN_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO WINDOW'
      
        '  (QUOTE_WIN_ID, WINDOW_ID, LOCATION_ID, QUOTE_ID, COPY_REF_NO, ' +
        'BIN_NO, RECORD_LOCKED, IS_STOCK_WINDOW, IS_TRACT, IS_SPECIAL_WIN' +
        'DOW, IS_GENERATE_LOG, SP_CALLOUT_ID, QUOTE_POSITION, QUANTITY, S' +
        'ERIES_ID, SM_ID, SC_ID, SNF_ID, SCREEN_SM_ID, PAINT_SM_ID, GLASS' +
        '_EDGE_ID, WINLOCK_SM_ID, HSM_ID, CALLOUTS_ID, WIN_WIDTH, WIN_HEI' +
        'GHT, TEMPERED, IGU_SELECTED, GRIDS_ID, GRIDS_ACROSS, GRIDS_UPDOW' +
        'N, W_REVERSE, ROOM, SELL_PRICE, LOCK_PRICE, LOCK_SELL_PRICE, PRI' +
        'CE, COST, NFS, UFZ, CUSTOM_FILE_NAME, CUSTOM_FILE, IS_EGRESS, DI' +
        'M_A, DIM_B, DIM_C, GLAZING_ID, GLASS_KIND_ID_OUTER, GLASS_KIND_I' +
        'D_MIDDLE, GLASS_KIND_ID_INNER, GAS_ID, NOTE, W_OPERATOR, DATE_SA' +
        'VED, DATE_LAST_MODIFIED, OPERATOR_LAST_MODIFIED, IS_SERVICE, XPA' +
        'NEL_NO, SERVICE_NOTES, QUOTE_ID_COPIED_FROM, IGU_SELECTED_NOGRID' +
        'S)'
      'VALUES'
      
        '  (:QUOTE_WIN_ID, :WINDOW_ID, :LOCATION_ID, :QUOTE_ID, :COPY_REF' +
        '_NO, :BIN_NO, :RECORD_LOCKED, :IS_STOCK_WINDOW, :IS_TRACT, :IS_S' +
        'PECIAL_WINDOW, :IS_GENERATE_LOG, :SP_CALLOUT_ID, :QUOTE_POSITION' +
        ', :QUANTITY, :SERIES_ID, :SM_ID, :SC_ID, :SNF_ID, :SCREEN_SM_ID,' +
        ' :PAINT_SM_ID, :GLASS_EDGE_ID, :WINLOCK_SM_ID, :HSM_ID, :CALLOUT' +
        'S_ID, :WIN_WIDTH, :WIN_HEIGHT, :TEMPERED, :IGU_SELECTED, :GRIDS_' +
        'ID, :GRIDS_ACROSS, :GRIDS_UPDOWN, :W_REVERSE, :ROOM, :SELL_PRICE' +
        ', :LOCK_PRICE, :LOCK_SELL_PRICE, :PRICE, :COST, :NFS, :UFZ, :CUS' +
        'TOM_FILE_NAME, :CUSTOM_FILE, :IS_EGRESS, :DIM_A, :DIM_B, :DIM_C,' +
        ' :GLAZING_ID, :GLASS_KIND_ID_OUTER, :GLASS_KIND_ID_MIDDLE, :GLAS' +
        'S_KIND_ID_INNER, :GAS_ID, :NOTE, :W_OPERATOR, :DATE_SAVED, :DATE' +
        '_LAST_MODIFIED, :OPERATOR_LAST_MODIFIED, :IS_SERVICE, :XPANEL_NO' +
        ', :SERVICE_NOTES, :QUOTE_ID_COPIED_FROM, :IGU_SELECTED_NOGRIDS)')
    SQLDelete.Strings = (
      'DELETE FROM WINDOW'
      'WHERE'
      '  QUOTE_WIN_ID = :Old_QUOTE_WIN_ID')
    SQLUpdate.Strings = (
      'UPDATE WINDOW'
      'SET'
      
        '  QUOTE_WIN_ID = :QUOTE_WIN_ID, WINDOW_ID = :WINDOW_ID, LOCATION' +
        '_ID = :LOCATION_ID, QUOTE_ID = :QUOTE_ID, COPY_REF_NO = :COPY_RE' +
        'F_NO, BIN_NO = :BIN_NO, RECORD_LOCKED = :RECORD_LOCKED, IS_STOCK' +
        '_WINDOW = :IS_STOCK_WINDOW, IS_TRACT = :IS_TRACT, IS_SPECIAL_WIN' +
        'DOW = :IS_SPECIAL_WINDOW, IS_GENERATE_LOG = :IS_GENERATE_LOG, SP' +
        '_CALLOUT_ID = :SP_CALLOUT_ID, QUOTE_POSITION = :QUOTE_POSITION, ' +
        'QUANTITY = :QUANTITY, SERIES_ID = :SERIES_ID, SM_ID = :SM_ID, SC' +
        '_ID = :SC_ID, SNF_ID = :SNF_ID, SCREEN_SM_ID = :SCREEN_SM_ID, PA' +
        'INT_SM_ID = :PAINT_SM_ID, GLASS_EDGE_ID = :GLASS_EDGE_ID, WINLOC' +
        'K_SM_ID = :WINLOCK_SM_ID, HSM_ID = :HSM_ID, CALLOUTS_ID = :CALLO' +
        'UTS_ID, WIN_WIDTH = :WIN_WIDTH, WIN_HEIGHT = :WIN_HEIGHT, TEMPER' +
        'ED = :TEMPERED, IGU_SELECTED = :IGU_SELECTED, GRIDS_ID = :GRIDS_' +
        'ID, GRIDS_ACROSS = :GRIDS_ACROSS, GRIDS_UPDOWN = :GRIDS_UPDOWN, ' +
        'W_REVERSE = :W_REVERSE, ROOM = :ROOM, SELL_PRICE = :SELL_PRICE, ' +
        'LOCK_PRICE = :LOCK_PRICE, LOCK_SELL_PRICE = :LOCK_SELL_PRICE, PR' +
        'ICE = :PRICE, COST = :COST, NFS = :NFS, UFZ = :UFZ, CUSTOM_FILE_' +
        'NAME = :CUSTOM_FILE_NAME, CUSTOM_FILE = :CUSTOM_FILE, IS_EGRESS ' +
        '= :IS_EGRESS, DIM_A = :DIM_A, DIM_B = :DIM_B, DIM_C = :DIM_C, GL' +
        'AZING_ID = :GLAZING_ID, GLASS_KIND_ID_OUTER = :GLASS_KIND_ID_OUT' +
        'ER, GLASS_KIND_ID_MIDDLE = :GLASS_KIND_ID_MIDDLE, GLASS_KIND_ID_' +
        'INNER = :GLASS_KIND_ID_INNER, GAS_ID = :GAS_ID, NOTE = :NOTE, W_' +
        'OPERATOR = :W_OPERATOR, DATE_SAVED = :DATE_SAVED, DATE_LAST_MODI' +
        'FIED = :DATE_LAST_MODIFIED, OPERATOR_LAST_MODIFIED = :OPERATOR_L' +
        'AST_MODIFIED, IS_SERVICE = :IS_SERVICE, XPANEL_NO = :XPANEL_NO, ' +
        'SERVICE_NOTES = :SERVICE_NOTES, QUOTE_ID_COPIED_FROM = :QUOTE_ID' +
        '_COPIED_FROM, IGU_SELECTED_NOGRIDS = :IGU_SELECTED_NOGRIDS'
      'WHERE'
      '  QUOTE_WIN_ID = :Old_QUOTE_WIN_ID')
    SQLRefresh.Strings = (
      'select '
      '    window.quote_win_id,'
      '    window.window_id,'
      '    window.copy_ref_no,'
      '    window.bin_no,'
      '    window.location_id,'
      '    window.quote_id,'
      '    window.quote_id_copied_from,'
      '    window.record_locked,'
      '    window.is_stock_window,'
      '    window.is_tract,'
      '    window.is_service,'
      '    window.is_generate_log,'
      '    window.xpanel_no,'
      '    window.quote_position,'
      '    window.quantity,'
      '    window.sm_id,'
      '    window.callouts_id,'
      '    window.win_width,'
      '    window.win_height,'
      '    window.tempered,'
      '    window.igu_selected,'
      '    window.grids_across,'
      '    window.grids_updown,'
      '    window.w_reverse,'
      '    window.room,'
      '    window.sell_price,'
      '    window.price,'
      '    window.sell_price*window.quantity sell_price,'
      '    window.price*window.quantity price,'
      '    window.lock_price,'
      '    window.lock_sell_price,'
      '    window.cost,'
      '    window.w_operator,'
      '    window.date_saved,'
      '    window.date_last_modified,'
      '    window.operator_last_modified,'
      '    window.nfs,'
      '    series_model.esl,'
      '    window.ufz,'
      '    window.hsm_id,'
      '    window.series_id,'
      '    window.winlock_sm_id,'
      '    window.sc_id,'
      '    window.snf_id,'
      '    window.glazing_id,'
      '    window.grids_id,'
      '    window.is_egress,'
      '    window.glass_edge_id,'
      '    window.note,'
      '    window.glass_kind_id_outer,'
      '    window.glass_kind_id_middle,'
      '    window.glass_kind_id_inner,'
      '    window.dim_a,'
      '    window.dim_b,'
      '    window.dim_c,'
      '    window.is_special_window,'
      '    window.sp_callout_id,'
      '    window.gas_id,'
      '    window.custom_file_name,'
      '    window.custom_file,'
      '    window.service_notes,'
      '    window.igu_selected_nogrids,'
      '    customers.cust_name,'
      '    customers.bill_address_1,'
      '    customers.bill_address_2,'
      '    customers.open_account,'
      '    customers.bill_phone,'
      '    customers.bill_fax,'
      '    models.model_name,'
      '    models.model_description,'
      '    models.igu_no,'
      '    models.is_special_model,'
      '    callouts.callouts,'
      '    handing.handing_name,'
      '    handing.handing_description,'
      '    series.series_name,'
      '    series.series_description,'
      '    winlock_sm.winlock_name,'
      '    winlock_sm.winlock_description,'
      '    colors.color_name,'
      '    colors.color_description,'
      '    nailfin.nailfin_name,'
      '    nailfin.nailfin_description,'
      '    glazing.glazing_description,'
      '    glazing.glazing_name,'
      '    so_quote_hdr.quote_no,'
      '    so_quote_hdr.job_batch_id,'
      '    so_quote_hdr.customer_id,'
      '    so_quote_hdr.ship_address_1,'
      '    so_quote_hdr.ship_address_2,'
      '    grids.cost,'
      '    grid_kind.gkind_name,'
      '    grid_kind.gkind_description,'
      '    grid_pattern.gpattern_name,'
      '    grid_pattern.gpattern_description,'
      '    window.paint_sm_id,'
      '    window.screen_sm_id,'
      '    paint_sm.cost,'
      '    paint.paint_name,'
      '    paint.paint_description,'
      '    gas.gas_name,'
      '    screen1.screen_name,'
      '    screen1.screen_description,'
      '    glass_kind_outer.glass_kind glass_kind_name_outer,'
      '    glass_kind_outer.description glass_kind_description_outer,'
      '    glass_kind_middle.glass_kind glass_kind_name_middle,'
      '    glass_kind_middle.description glass_kind_description_middle,'
      '    glass_kind_inner.glass_kind glass_kind_name_inner,'
      '    glass_kind_inner.description glass_kind_description_inner,'
      '    get_mull_count.mull_count * window.quantity mull_qty'
      'from get_mull_count'
      
        '   right outer join window on (get_mull_count.quote_win_id = win' +
        'dow.quote_win_id)'
      '   inner join gas on (window.gas_id = gas.gas_id)'
      
        '   left outer join glass_kind glass_kind_inner on (window.glass_' +
        'kind_id_inner = glass_kind_inner.glass_kind_id)'
      
        '   left outer join screen_sm on (window.screen_sm_id = screen_sm' +
        '.screen_sm_id)'
      
        '   left outer join screen screen1 on (screen_sm.screen_id = scre' +
        'en1.screen_id)'
      
        '   left outer join paint_sm on (window.paint_sm_id = paint_sm.pa' +
        'int_sm_id)'
      '   left outer join paint on (paint_sm.paint_id = paint.paint_id)'
      
        '   inner join so_quote_hdr on (window.quote_id = so_quote_hdr.qu' +
        'ote_id)'
      
        '   inner join customers on (so_quote_hdr.customer_id = customers' +
        '.customer_id)'
      
        '   inner join series_model on (window.sm_id = series_model.sm_id' +
        ')'
      
        '   inner join models on (series_model.model_id = models.model_id' +
        ')'
      
        '   left outer join callouts on (window.callouts_id = callouts.ca' +
        'llouts_id)'
      
        '   left outer join handing_sm on (window.hsm_id = handing_sm.hsm' +
        '_id)'
      
        '   left outer join handing on (handing_sm.handing_id = handing.h' +
        'anding_id)'
      '   inner join series on (window.series_id = series.series_id)'
      
        '   left outer join winlock_sm on (window.winlock_sm_id = winlock' +
        '_sm.winlock_sm_id)'
      
        '   inner join series_color on (window.sc_id = series_color.sc_id' +
        ')'
      
        '   inner join colors on (series_color.color_id = colors.color_id' +
        ')'
      
        '   inner join series_nailfin on (window.snf_id = series_nailfin.' +
        'snf_id)'
      
        '   inner join nailfin on (series_nailfin.nailfin_id = nailfin.na' +
        'ilfin_id)'
      
        '   inner join glazing on (window.glazing_id = glazing.glazing_id' +
        ')'
      '   inner join grids on (window.grids_id = grids.grids_id)'
      '   inner join grid_kind on (grids.gkind_id = grid_kind.gkind_id)'
      
        '   inner join grid_pattern on (grids.gpat_id = grid_pattern.gpat' +
        '_id)'
      
        '   left outer join glass_kind glass_kind_outer on (window.glass_' +
        'kind_id_outer = glass_kind_outer.glass_kind_id)'
      
        '   left outer join glass_kind glass_kind_middle on (window.glass' +
        '_kind_id_middle = glass_kind_middle.glass_kind_id)'
      'WHERE'
      '  window.QUOTE_WIN_ID = :QUOTE_WIN_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM WINDOW'
      'WHERE'
      'QUOTE_WIN_ID = :Old_QUOTE_WIN_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM WINDOW'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    window.quote_win_id,'
      '    window.window_id,'
      '    window.copy_ref_no,'
      '    window.bin_no,'
      '    window.location_id,'
      '    window.quote_id,'
      '    window.quote_id_copied_from,'
      '    window.record_locked,'
      '    window.is_stock_window,'
      '    window.is_tract,'
      '    window.is_service,'
      '    window.is_generate_log,'
      '    window.xpanel_no,'
      '    window.quote_position,'
      '    window.quantity,'
      '    window.sm_id,'
      '    window.callouts_id,'
      '    window.win_width,'
      '    window.win_height,'
      '    window.tempered,'
      '    window.igu_selected,'
      '    window.grids_across,'
      '    window.grids_updown,'
      '    window.w_reverse,'
      '    window.room,'
      '    window.sell_price,'
      '    window.price,'
      '    window.sell_price*window.quantity sell_price,'
      '    window.price*window.quantity price,'
      '    window.lock_price,'
      '    window.lock_sell_price,'
      '    window.cost,'
      '    window.w_operator,'
      '    window.date_saved,'
      '    window.date_last_modified,'
      '    window.operator_last_modified,'
      '    window.nfs,'
      '    series_model.esl,'
      '    window.ufz,'
      '    window.hsm_id,'
      '    window.series_id,'
      '    window.winlock_sm_id,'
      '    window.sc_id,'
      '    window.snf_id,'
      '    window.glazing_id,'
      '    window.grids_id,'
      '    window.is_egress,'
      '    window.glass_edge_id,'
      '    window.note,'
      '    window.glass_kind_id_outer,'
      '    window.glass_kind_id_middle,'
      '    window.glass_kind_id_inner,'
      '    window.dim_a,'
      '    window.dim_b,'
      '    window.dim_c,'
      '    window.is_special_window,'
      '    window.sp_callout_id,'
      '    window.gas_id,'
      '    window.custom_file_name,'
      '    window.custom_file,'
      '    window.service_notes,'
      '    window.igu_selected_nogrids,'
      '    customers.cust_name,'
      '    customers.bill_address_1,'
      '    customers.bill_address_2,'
      '    customers.open_account,'
      '    customers.bill_phone,'
      '    customers.bill_fax,'
      '    models.model_name,'
      '    models.model_description,'
      '    models.igu_no,'
      '    models.is_special_model,'
      '    callouts.callouts,'
      '    handing.handing_name,'
      '    handing.handing_description,'
      '    series.series_name,'
      '    series.series_description,'
      '    winlock_sm.winlock_name,'
      '    winlock_sm.winlock_description,'
      '    colors.color_name,'
      '    colors.color_description,'
      '    nailfin.nailfin_name,'
      '    nailfin.nailfin_description,'
      '    glazing.glazing_description,'
      '    glazing.glazing_name,'
      '    so_quote_hdr.quote_no,'
      '    so_quote_hdr.job_batch_id,'
      '    so_quote_hdr.customer_id,'
      '    so_quote_hdr.ship_address_1,'
      '    so_quote_hdr.ship_address_2,'
      '    grids.cost,'
      '    grid_kind.gkind_name,'
      '    grid_kind.gkind_description,'
      '    grid_pattern.gpattern_name,'
      '    grid_pattern.gpattern_description,'
      '    window.paint_sm_id,'
      '    window.screen_sm_id,'
      '    paint_sm.cost,'
      '    paint.paint_name,'
      '    paint.paint_description,'
      '    gas.gas_name,'
      '    screen1.screen_name,'
      '    screen1.screen_description,'
      '    glass_kind_outer.glass_kind glass_kind_name_outer,'
      '    glass_kind_outer.description glass_kind_description_outer,'
      '    glass_kind_middle.glass_kind glass_kind_name_middle,'
      '    glass_kind_middle.description glass_kind_description_middle,'
      '    glass_kind_inner.glass_kind glass_kind_name_inner,'
      '    glass_kind_inner.description glass_kind_description_inner,'
      '    get_mull_count.mull_count * window.quantity mull_qty'
      'from get_mull_count'
      
        '   right outer join window on (get_mull_count.quote_win_id = win' +
        'dow.quote_win_id)'
      '   inner join gas on (window.gas_id = gas.gas_id)'
      
        '   left outer join glass_kind glass_kind_inner on (window.glass_' +
        'kind_id_inner = glass_kind_inner.glass_kind_id)'
      
        '   left outer join screen_sm on (window.screen_sm_id = screen_sm' +
        '.screen_sm_id)'
      
        '   left outer join screen screen1 on (screen_sm.screen_id = scre' +
        'en1.screen_id)'
      
        '   left outer join paint_sm on (window.paint_sm_id = paint_sm.pa' +
        'int_sm_id)'
      '   left outer join paint on (paint_sm.paint_id = paint.paint_id)'
      
        '   inner join so_quote_hdr on (window.quote_id = so_quote_hdr.qu' +
        'ote_id)'
      
        '   inner join customers on (so_quote_hdr.customer_id = customers' +
        '.customer_id)'
      
        '   inner join series_model on (window.sm_id = series_model.sm_id' +
        ')'
      
        '   inner join models on (series_model.model_id = models.model_id' +
        ')'
      
        '   left outer join callouts on (window.callouts_id = callouts.ca' +
        'llouts_id)'
      
        '   left outer join handing_sm on (window.hsm_id = handing_sm.hsm' +
        '_id)'
      
        '   left outer join handing on (handing_sm.handing_id = handing.h' +
        'anding_id)'
      '   inner join series on (window.series_id = series.series_id)'
      
        '   left outer join winlock_sm on (window.winlock_sm_id = winlock' +
        '_sm.winlock_sm_id)'
      
        '   inner join series_color on (window.sc_id = series_color.sc_id' +
        ')'
      
        '   inner join colors on (series_color.color_id = colors.color_id' +
        ')'
      
        '   inner join series_nailfin on (window.snf_id = series_nailfin.' +
        'snf_id)'
      
        '   inner join nailfin on (series_nailfin.nailfin_id = nailfin.na' +
        'ilfin_id)'
      
        '   inner join glazing on (window.glazing_id = glazing.glazing_id' +
        ')'
      '   inner join grids on (window.grids_id = grids.grids_id)'
      '   inner join grid_kind on (grids.gkind_id = grid_kind.gkind_id)'
      
        '   inner join grid_pattern on (grids.gpat_id = grid_pattern.gpat' +
        '_id)'
      
        '   left outer join glass_kind glass_kind_outer on (window.glass_' +
        'kind_id_outer = glass_kind_outer.glass_kind_id)'
      
        '   left outer join glass_kind glass_kind_middle on (window.glass' +
        '_kind_id_middle = glass_kind_middle.glass_kind_id)'
      '--order by QUOTE_ID, window.quote_win_id')
    FetchRows = 20
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    IndexFieldNames = 'QUOTE_ID'
    AfterInsert = tblWindowsAfterInsert
    AfterEdit = tblWindowsAfterEdit
    BeforePost = tblWindowsBeforePost
    AfterPost = tblWindowsAfterPost
    Left = 401
    Top = 489
  end
  object dsWindows: TIBCDataSource
    DataSet = tblWindows
    Left = 400
    Top = 544
  end
  object tblIGU: TIBCQuery
    UpdatingTable = 'IGU'
    KeyFields = 'IGU_ID'
    KeyGenerator = 'GEN_IGU_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO IGU'
      
        '  (IGU_ID, QUOTE_WIN_ID, IGU_POSITION, GLASS_TYPE_ID_OUTER, GLAS' +
        'S_TYPE_ID_MIDDLE, GLASS_TYPE_ID_INNER, TEMP_INNER, TEMP_MIDDLE, ' +
        'TEMP_OUTER, INNER_SPACER_ID, OUTER_SPACER_ID, IGU_WIDTH, IGU_HEI' +
        'GHT, IGU_GRIDS_ACROSS, IGU_GRIDS_UPDOWN, SHAPE, A_DIM, B_DIM, C_' +
        'DIM, GRID_COLOR_ID, GRID_PATTERN_ID, GED_CODE, GLASS_COST_IGU, E' +
        'DGE_COST_IGU, BT_COST_IGU, GLASS_LABOR_COST_IGU, GAS_COST_IGU, I' +
        'GU_OPERATOR, IS_SERVICE)'
      'VALUES'
      
        '  (:IGU_ID, :QUOTE_WIN_ID, :IGU_POSITION, :GLASS_TYPE_ID_OUTER, ' +
        ':GLASS_TYPE_ID_MIDDLE, :GLASS_TYPE_ID_INNER, :TEMP_INNER, :TEMP_' +
        'MIDDLE, :TEMP_OUTER, :INNER_SPACER_ID, :OUTER_SPACER_ID, :IGU_WI' +
        'DTH, :IGU_HEIGHT, :IGU_GRIDS_ACROSS, :IGU_GRIDS_UPDOWN, :SHAPE, ' +
        ':A_DIM, :B_DIM, :C_DIM, :GRID_COLOR_ID, :GRID_PATTERN_ID, :GED_C' +
        'ODE, :GLASS_COST_IGU, :EDGE_COST_IGU, :BT_COST_IGU, :GLASS_LABOR' +
        '_COST_IGU, :GAS_COST_IGU, :IGU_OPERATOR, :IS_SERVICE)')
    SQLDelete.Strings = (
      'DELETE FROM IGU'
      'WHERE'
      '  IGU_ID = :Old_IGU_ID')
    SQLUpdate.Strings = (
      'UPDATE IGU'
      'SET'
      
        '  IGU_ID = :IGU_ID, QUOTE_WIN_ID = :QUOTE_WIN_ID, IGU_POSITION =' +
        ' :IGU_POSITION, GLASS_TYPE_ID_OUTER = :GLASS_TYPE_ID_OUTER, GLAS' +
        'S_TYPE_ID_MIDDLE = :GLASS_TYPE_ID_MIDDLE, GLASS_TYPE_ID_INNER = ' +
        ':GLASS_TYPE_ID_INNER, TEMP_INNER = :TEMP_INNER, TEMP_MIDDLE = :T' +
        'EMP_MIDDLE, TEMP_OUTER = :TEMP_OUTER, INNER_SPACER_ID = :INNER_S' +
        'PACER_ID, OUTER_SPACER_ID = :OUTER_SPACER_ID, IGU_WIDTH = :IGU_W' +
        'IDTH, IGU_HEIGHT = :IGU_HEIGHT, IGU_GRIDS_ACROSS = :IGU_GRIDS_AC' +
        'ROSS, IGU_GRIDS_UPDOWN = :IGU_GRIDS_UPDOWN, SHAPE = :SHAPE, A_DI' +
        'M = :A_DIM, B_DIM = :B_DIM, C_DIM = :C_DIM, GRID_COLOR_ID = :GRI' +
        'D_COLOR_ID, GRID_PATTERN_ID = :GRID_PATTERN_ID, GED_CODE = :GED_' +
        'CODE, GLASS_COST_IGU = :GLASS_COST_IGU, EDGE_COST_IGU = :EDGE_CO' +
        'ST_IGU, BT_COST_IGU = :BT_COST_IGU, GLASS_LABOR_COST_IGU = :GLAS' +
        'S_LABOR_COST_IGU, GAS_COST_IGU = :GAS_COST_IGU, IGU_OPERATOR = :' +
        'IGU_OPERATOR, IS_SERVICE = :IS_SERVICE'
      'WHERE'
      '  IGU_ID = :Old_IGU_ID')
    SQLRefresh.Strings = (
      
        'SELECT IGU_ID, QUOTE_WIN_ID, IGU_POSITION, GLASS_TYPE_ID_OUTER, ' +
        'GLASS_TYPE_ID_MIDDLE, GLASS_TYPE_ID_INNER, TEMP_INNER, TEMP_MIDD' +
        'LE, TEMP_OUTER, INNER_SPACER_ID, OUTER_SPACER_ID, IGU_WIDTH, IGU' +
        '_HEIGHT, IGU_GRIDS_ACROSS, IGU_GRIDS_UPDOWN, SHAPE, A_DIM, B_DIM' +
        ', C_DIM, GRID_COLOR_ID, GRID_PATTERN_ID, GED_CODE, GLASS_COST_IG' +
        'U, EDGE_COST_IGU, BT_COST_IGU, GLASS_LABOR_COST_IGU, GAS_COST_IG' +
        'U, IGU_OPERATOR, IS_SERVICE FROM IGU'
      'WHERE'
      '  IGU_ID = :IGU_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM IGU'
      'WHERE'
      'IGU_ID = :Old_IGU_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM IGU'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    igu.igu_id,'
      '    igu.quote_win_id,'
      '    igu.igu_position,'
      '    igu.glass_type_id_outer,'
      '    igu.glass_type_id_middle,'
      '    igu.glass_type_id_inner,'
      '    igu.temp_inner,'
      '    igu.temp_middle,'
      '    igu.temp_outer,'
      '    igu.inner_spacer_id,'
      '    igu.outer_spacer_id,'
      '    igu.igu_width,'
      '    igu.igu_height,'
      '    igu.igu_grids_across,'
      '    igu.igu_grids_updown,'
      '    igu.shape,'
      '    igu.a_dim,'
      '    igu.b_dim,'
      '    igu.c_dim,'
      '    igu.grid_color_id,'
      '    igu.grid_pattern_id,'
      '    igu.ged_code,'
      '    igu.glass_cost_igu,'
      '    igu.edge_cost_igu,'
      '    igu.bt_cost_igu,'
      '    igu.glass_labor_cost_igu,'
      '    igu.gas_cost_igu,'
      '    igu.igu_operator,'
      '    igu.is_service,'
      '    glass_type_outer.glass_name glass_name_outer,'
      '    glass_type_outer.description description_outer,'
      '    glass_type_inner.glass_name glass_name_inner,'
      '    glass_type_inner.description description_inner,'
      '    glass_type_middle.glass_name glass_name_middle,'
      '    glass_type_middle.description description_middle,'
      '    window.bin_no,'
      '    so_quote_hdr.quote_no,'
      '    so_quote_hdr.job_batch_id'
      'from so_quote_hdr'
      
        '   inner join window on (so_quote_hdr.quote_id = window.quote_id' +
        ')'
      '   inner join igu on (window.quote_win_id = igu.quote_win_id)'
      
        '   left outer join glass_type glass_type_middle on (igu.glass_ty' +
        'pe_id_middle = glass_type_middle.glass_type_id)'
      
        '   left outer join glass_type glass_type_outer on (igu.glass_typ' +
        'e_id_outer = glass_type_outer.glass_type_id)'
      
        '   left outer join glass_type glass_type_inner on (igu.glass_typ' +
        'e_id_inner = glass_type_inner.glass_type_id)')
    MasterSource = dsWindows
    FetchRows = 5
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    IndexFieldNames = 'QUOTE_WIN_ID;IGU_POSITION'
    AfterInsert = tblIGUAfterInsert
    Left = 540
    Top = 489
  end
  object dsIGU: TIBCDataSource
    DataSet = tblIGU
    Left = 540
    Top = 544
  end
  object tblCountries: TIBCQuery
    KeyFields = 'COUNTRY_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO COUNTRIES'
      '  (COUNTRY_ID, USER_ID, DESCRIPTION, IS_DEFAULT)'
      'VALUES'
      '  (:COUNTRY_ID, :USER_ID, :DESCRIPTION, :IS_DEFAULT)')
    SQLDelete.Strings = (
      'DELETE FROM COUNTRIES'
      'WHERE'
      '  COUNTRY_ID = :Old_COUNTRY_ID')
    SQLUpdate.Strings = (
      'UPDATE COUNTRIES'
      'SET'
      
        '  COUNTRY_ID = :COUNTRY_ID, USER_ID = :USER_ID, DESCRIPTION = :D' +
        'ESCRIPTION, IS_DEFAULT = :IS_DEFAULT'
      'WHERE'
      '  COUNTRY_ID = :Old_COUNTRY_ID')
    SQLRefresh.Strings = (
      
        'SELECT COUNTRY_ID, USER_ID, DESCRIPTION, IS_DEFAULT FROM COUNTRI' +
        'ES'
      'WHERE'
      '  COUNTRY_ID = :COUNTRY_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM COUNTRIES'
      'WHERE'
      'COUNTRY_ID = :Old_COUNTRY_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'Select * from COUNTRIES')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    IndexFieldNames = 'COUNTRY_ID'
    Left = 818
    Top = 616
  end
  object dsCountries: TIBCDataSource
    DataSet = tblCountries
    Left = 818
    Top = 669
  end
  object tblZipnTax: TIBCQuery
    KeyFields = 'ZIPNTAX_ID'
    KeyGenerator = 'GEN_ZIPNTAX_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO ZIPNTAX'
      
        '  (ZIPNTAX_ID, ZIPCODE, CITY, STATE, SALES_TAX_RATE, JURISDICTIO' +
        'N, SALES_TAX_REPCODE, COUNTY, DELIVERY_COST, IS_DELIVERY_TAXABLE' +
        ', ZIP_MULTI_WINPRICE)'
      'VALUES'
      
        '  (:ZIPNTAX_ID, :ZIPCODE, :CITY, :STATE, :SALES_TAX_RATE, :JURIS' +
        'DICTION, :SALES_TAX_REPCODE, :COUNTY, :DELIVERY_COST, :IS_DELIVE' +
        'RY_TAXABLE, :ZIP_MULTI_WINPRICE)')
    SQLDelete.Strings = (
      'DELETE FROM ZIPNTAX'
      'WHERE'
      '  ZIPNTAX_ID = :Old_ZIPNTAX_ID')
    SQLUpdate.Strings = (
      'UPDATE ZIPNTAX'
      'SET'
      
        '  ZIPNTAX_ID = :ZIPNTAX_ID, ZIPCODE = :ZIPCODE, CITY = :CITY, ST' +
        'ATE = :STATE, SALES_TAX_RATE = :SALES_TAX_RATE, JURISDICTION = :' +
        'JURISDICTION, SALES_TAX_REPCODE = :SALES_TAX_REPCODE, COUNTY = :' +
        'COUNTY, DELIVERY_COST = :DELIVERY_COST, IS_DELIVERY_TAXABLE = :I' +
        'S_DELIVERY_TAXABLE, ZIP_MULTI_WINPRICE = :ZIP_MULTI_WINPRICE'
      'WHERE'
      '  ZIPNTAX_ID = :Old_ZIPNTAX_ID')
    SQLRefresh.Strings = (
      
        'SELECT ZIPNTAX_ID, ZIPCODE, CITY, STATE, SALES_TAX_RATE, JURISDI' +
        'CTION, SALES_TAX_REPCODE, COUNTY, DELIVERY_COST, IS_DELIVERY_TAX' +
        'ABLE, ZIP_MULTI_WINPRICE FROM ZIPNTAX'
      'WHERE'
      '  ZIPNTAX_ID = :ZIPNTAX_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM ZIPNTAX'
      'WHERE'
      'ZIPNTAX_ID = :Old_ZIPNTAX_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM ZIPNTAX'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'Select * from ZIPNTAX')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 44
    Top = 616
  end
  object dsZipnTax: TIBCDataSource
    DataSet = tblZipnTax
    Left = 45
    Top = 669
  end
  object tblCustomers: TIBCQuery
    KeyFields = 'CUSTOMER_ID'
    KeyGenerator = 'GEN_CUSTOMERS_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO CUSTOMERS'
      
        '  (CUSTOMER_ID, CUST_NAME, BILL_ADDRESS_1, BILL_ADDRESS_2, BILL_' +
        'COUNTRY_ID, BILL_COUNTRY_CODE, BILL_PHONE, BILL_FAX, BILL_ZIPCOD' +
        'ES_ID, TAX_EXEMPT, IS_PROBLEM, RESELLER_NUMBER, SLS_ID, TERMS_ID' +
        ', COMMISSION, DISCOUNT, CREDIT_LIMIT, DATE_CREATED, COMMENT, NOT' +
        'ES, OPERATOR, DATE_SAVED, SHIPPING_FOB_ID, FRT_TERMS_ID, WEBSITE' +
        ', WHSE_ID, CREDIT_HOLD, GROUP_ID, OPEN_ACCOUNT, CUSTOMER_FACTOR,' +
        ' PAYMENT_TERMS, CUTOFF_DATES, PLANS_WEBSITE, PLANS_USERNAME, PLA' +
        'NS_PASSWORD, ORDER_WEBSITE, ORDER_USERNAME, ORDER_PASSWORD)'
      'VALUES'
      
        '  (:CUSTOMER_ID, :CUST_NAME, :BILL_ADDRESS_1, :BILL_ADDRESS_2, :' +
        'BILL_COUNTRY_ID, :BILL_COUNTRY_CODE, :BILL_PHONE, :BILL_FAX, :BI' +
        'LL_ZIPCODES_ID, :TAX_EXEMPT, :IS_PROBLEM, :RESELLER_NUMBER, :SLS' +
        '_ID, :TERMS_ID, :COMMISSION, :DISCOUNT, :CREDIT_LIMIT, :DATE_CRE' +
        'ATED, :COMMENT, :NOTES, :OPERATOR, :DATE_SAVED, :SHIPPING_FOB_ID' +
        ', :FRT_TERMS_ID, :WEBSITE, :WHSE_ID, :CREDIT_HOLD, :GROUP_ID, :O' +
        'PEN_ACCOUNT, :CUSTOMER_FACTOR, :PAYMENT_TERMS, :CUTOFF_DATES, :P' +
        'LANS_WEBSITE, :PLANS_USERNAME, :PLANS_PASSWORD, :ORDER_WEBSITE, ' +
        ':ORDER_USERNAME, :ORDER_PASSWORD)')
    SQLDelete.Strings = (
      'DELETE FROM CUSTOMERS'
      'WHERE'
      '  CUSTOMER_ID = :Old_CUSTOMER_ID')
    SQLUpdate.Strings = (
      'UPDATE CUSTOMERS'
      'SET'
      
        '  CUSTOMER_ID = :CUSTOMER_ID, CUST_NAME = :CUST_NAME, BILL_ADDRE' +
        'SS_1 = :BILL_ADDRESS_1, BILL_ADDRESS_2 = :BILL_ADDRESS_2, BILL_C' +
        'OUNTRY_ID = :BILL_COUNTRY_ID, BILL_COUNTRY_CODE = :BILL_COUNTRY_' +
        'CODE, BILL_PHONE = :BILL_PHONE, BILL_FAX = :BILL_FAX, BILL_ZIPCO' +
        'DES_ID = :BILL_ZIPCODES_ID, TAX_EXEMPT = :TAX_EXEMPT, IS_PROBLEM' +
        ' = :IS_PROBLEM, RESELLER_NUMBER = :RESELLER_NUMBER, SLS_ID = :SL' +
        'S_ID, TERMS_ID = :TERMS_ID, COMMISSION = :COMMISSION, DISCOUNT =' +
        ' :DISCOUNT, CREDIT_LIMIT = :CREDIT_LIMIT, DATE_CREATED = :DATE_C' +
        'REATED, COMMENT = :COMMENT, NOTES = :NOTES, OPERATOR = :OPERATOR' +
        ', DATE_SAVED = :DATE_SAVED, SHIPPING_FOB_ID = :SHIPPING_FOB_ID, ' +
        'FRT_TERMS_ID = :FRT_TERMS_ID, WEBSITE = :WEBSITE, WHSE_ID = :WHS' +
        'E_ID, CREDIT_HOLD = :CREDIT_HOLD, GROUP_ID = :GROUP_ID, OPEN_ACC' +
        'OUNT = :OPEN_ACCOUNT, CUSTOMER_FACTOR = :CUSTOMER_FACTOR, PAYMEN' +
        'T_TERMS = :PAYMENT_TERMS, CUTOFF_DATES = :CUTOFF_DATES, PLANS_WE' +
        'BSITE = :PLANS_WEBSITE, PLANS_USERNAME = :PLANS_USERNAME, PLANS_' +
        'PASSWORD = :PLANS_PASSWORD, ORDER_WEBSITE = :ORDER_WEBSITE, ORDE' +
        'R_USERNAME = :ORDER_USERNAME, ORDER_PASSWORD = :ORDER_PASSWORD'
      'WHERE'
      '  CUSTOMER_ID = :Old_CUSTOMER_ID')
    SQLRefresh.Strings = (
      
        'SELECT CUSTOMER_ID, CUST_NAME, BILL_ADDRESS_1, BILL_ADDRESS_2, B' +
        'ILL_COUNTRY_ID, BILL_COUNTRY_CODE, BILL_PHONE, BILL_FAX, BILL_ZI' +
        'PCODES_ID, TAX_EXEMPT, IS_PROBLEM, RESELLER_NUMBER, SLS_ID, TERM' +
        'S_ID, COMMISSION, DISCOUNT, CREDIT_LIMIT, DATE_CREATED, COMMENT,' +
        ' NOTES, OPERATOR, DATE_SAVED, SHIPPING_FOB_ID, FRT_TERMS_ID, WEB' +
        'SITE, WHSE_ID, CREDIT_HOLD, GROUP_ID, OPEN_ACCOUNT, CUSTOMER_FAC' +
        'TOR, PAYMENT_TERMS, CUTOFF_DATES, PLANS_WEBSITE, PLANS_USERNAME,' +
        ' PLANS_PASSWORD, ORDER_WEBSITE, ORDER_USERNAME, ORDER_PASSWORD F' +
        'ROM CUSTOMERS'
      'WHERE'
      '  CUSTOMER_ID = :CUSTOMER_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM CUSTOMERS'
      'WHERE'
      'CUSTOMER_ID = :Old_CUSTOMER_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM CUSTOMERS'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'Select * from CUSTOMERS'
      'Order By upper(CUST_NAME)')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Options.CacheCalcFields = True
    AfterInsert = tblCustomersAfterInsert
    Left = 1483
    Top = 356
  end
  object dsCustomers: TIBCDataSource
    DataSet = tblCustomers
    Left = 1483
    Top = 409
  end
  object tblQuotes: TIBCQuery
    UpdatingTable = 'SO_QUOTE_HDR'
    KeyFields = 'QUOTE_ID'
    KeyGenerator = 'GEN_SO_QUOTE_HDR_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO SO_QUOTE_HDR'
      
        '  (QUOTE_ID, QUOTE_NO, PHASE_ID, TRACT_ID, CUSTOMER_ID, JOB_BATC' +
        'H_ID, IS_TRACT, JOB_NAME, QUOTE_DATE, FOLLOWUP_DATE, OPERATOR_SA' +
        'VED, DATE_SAVED, OPERATOR_LAST_MODIFIED, OPERATOR_ORDERED, DATE_' +
        'LAST_MODIFIED, TAX_EXEMPT, BILLING_ADDR_ID, BILL_NAME, BILL_ADDR' +
        'ESS_1, BILL_ADDRESS_2, BILL_ADDRESS_3, BILL_CITY, BILL_STATE, BI' +
        'LL_ZIP, BILL_COUNTRY_ID, BILL_COUNTRY_CODE, CONTACT_ID, TERMS_ID' +
        ', COD, SHIP_NOTE, CONTACT_TELEPHONE, CUST_SHIP_ID, SHIP_NAME, SH' +
        'IP_ADDRESS_1, SHIP_ADDRESS_2, SHIP_ADDRESS_3, SHIP_ZIPNTAX_ID, S' +
        'HIP_COUNTRY_ID, SHIP_COUNTRY_CODE, SALES_TAX, SHIP_COMMENT, SLS_' +
        'ID, SALES_TAX_RATE, PROD_COST, DELIVERY_COST, DELIVERY_COST_MODI' +
        'FIED, TOTAL_COST, CONTACT_FAX, SHIPPING_TYPE, J_DISC_PCT, J_DISC' +
        ', QUOTE_STATUS, ORDER_DATE, ORDER_DUEDATE, NFS, UFZ, SERIES_ID, ' +
        'SC_ID, SNF_ID, GLAZING_ID, GRIDS_ID, GLASS_KIND_ID_OUTER, GLASS_' +
        'KIND_ID_MIDDLE, GLASS_KIND_ID_INNER, GAS_ID, TOTAL_IGU_QTY, TOTA' +
        'L_XPANEL_QTY, TOTAL_DPANEL_QTY, MODEL_W_WIN_QTY, MODEL_G_SPECIAL' +
        'S_QTY, MODEL_PD_PATIO_DOORS_QTY, MODEL_E_EURO_STYLE_QTY, MODEL_M' +
        '_MULLED_QTY, MODEL_CF_COMMON_FRAME_QTY, TRACT_LOT, TRACT_PLAN, T' +
        'RACT_DELIVERY, TRACT_LOT_REVERSE, EXPECTED_DATE, IS_OPTION, COMP' +
        'LETED_DATE, DELIVERED_DATE, GRID_COLOR_STATUS_ID, IS_SERVICE)'
      'VALUES'
      
        '  (:QUOTE_ID, :QUOTE_NO, :PHASE_ID, :TRACT_ID, :CUSTOMER_ID, :JO' +
        'B_BATCH_ID, :IS_TRACT, :JOB_NAME, :QUOTE_DATE, :FOLLOWUP_DATE, :' +
        'OPERATOR_SAVED, :DATE_SAVED, :OPERATOR_LAST_MODIFIED, :OPERATOR_' +
        'ORDERED, :DATE_LAST_MODIFIED, :TAX_EXEMPT, :BILLING_ADDR_ID, :BI' +
        'LL_NAME, :BILL_ADDRESS_1, :BILL_ADDRESS_2, :BILL_ADDRESS_3, :BIL' +
        'L_CITY, :BILL_STATE, :BILL_ZIP, :BILL_COUNTRY_ID, :BILL_COUNTRY_' +
        'CODE, :CONTACT_ID, :TERMS_ID, :COD, :SHIP_NOTE, :CONTACT_TELEPHO' +
        'NE, :CUST_SHIP_ID, :SHIP_NAME, :SHIP_ADDRESS_1, :SHIP_ADDRESS_2,' +
        ' :SHIP_ADDRESS_3, :SHIP_ZIPNTAX_ID, :SHIP_COUNTRY_ID, :SHIP_COUN' +
        'TRY_CODE, :SALES_TAX, :SHIP_COMMENT, :SLS_ID, :SALES_TAX_RATE, :' +
        'PROD_COST, :DELIVERY_COST, :DELIVERY_COST_MODIFIED, :TOTAL_COST,' +
        ' :CONTACT_FAX, :SHIPPING_TYPE, :J_DISC_PCT, :J_DISC, :QUOTE_STAT' +
        'US, :ORDER_DATE, :ORDER_DUEDATE, :NFS, :UFZ, :SERIES_ID, :SC_ID,' +
        ' :SNF_ID, :GLAZING_ID, :GRIDS_ID, :GLASS_KIND_ID_OUTER, :GLASS_K' +
        'IND_ID_MIDDLE, :GLASS_KIND_ID_INNER, :GAS_ID, :TOTAL_IGU_QTY, :T' +
        'OTAL_XPANEL_QTY, :TOTAL_DPANEL_QTY, :MODEL_W_WIN_QTY, :MODEL_G_S' +
        'PECIALS_QTY, :MODEL_PD_PATIO_DOORS_QTY, :MODEL_E_EURO_STYLE_QTY,' +
        ' :MODEL_M_MULLED_QTY, :MODEL_CF_COMMON_FRAME_QTY, :TRACT_LOT, :T' +
        'RACT_PLAN, :TRACT_DELIVERY, :TRACT_LOT_REVERSE, :EXPECTED_DATE, ' +
        ':IS_OPTION, :COMPLETED_DATE, :DELIVERED_DATE, :GRID_COLOR_STATUS' +
        '_ID, :IS_SERVICE)')
    SQLDelete.Strings = (
      'DELETE FROM SO_QUOTE_HDR'
      'WHERE'
      '  QUOTE_ID = :Old_QUOTE_ID')
    SQLUpdate.Strings = (
      'UPDATE SO_QUOTE_HDR'
      'SET'
      
        '  QUOTE_ID = :QUOTE_ID, QUOTE_NO = :QUOTE_NO, PHASE_ID = :PHASE_' +
        'ID, TRACT_ID = :TRACT_ID, CUSTOMER_ID = :CUSTOMER_ID, JOB_BATCH_' +
        'ID = :JOB_BATCH_ID, IS_TRACT = :IS_TRACT, JOB_NAME = :JOB_NAME, ' +
        'QUOTE_DATE = :QUOTE_DATE, FOLLOWUP_DATE = :FOLLOWUP_DATE, OPERAT' +
        'OR_SAVED = :OPERATOR_SAVED, DATE_SAVED = :DATE_SAVED, OPERATOR_L' +
        'AST_MODIFIED = :OPERATOR_LAST_MODIFIED, OPERATOR_ORDERED = :OPER' +
        'ATOR_ORDERED, DATE_LAST_MODIFIED = :DATE_LAST_MODIFIED, TAX_EXEM' +
        'PT = :TAX_EXEMPT, BILLING_ADDR_ID = :BILLING_ADDR_ID, BILL_NAME ' +
        '= :BILL_NAME, BILL_ADDRESS_1 = :BILL_ADDRESS_1, BILL_ADDRESS_2 =' +
        ' :BILL_ADDRESS_2, BILL_ADDRESS_3 = :BILL_ADDRESS_3, BILL_CITY = ' +
        ':BILL_CITY, BILL_STATE = :BILL_STATE, BILL_ZIP = :BILL_ZIP, BILL' +
        '_COUNTRY_ID = :BILL_COUNTRY_ID, BILL_COUNTRY_CODE = :BILL_COUNTR' +
        'Y_CODE, CONTACT_ID = :CONTACT_ID, TERMS_ID = :TERMS_ID, COD = :C' +
        'OD, SHIP_NOTE = :SHIP_NOTE, CONTACT_TELEPHONE = :CONTACT_TELEPHO' +
        'NE, CUST_SHIP_ID = :CUST_SHIP_ID, SHIP_NAME = :SHIP_NAME, SHIP_A' +
        'DDRESS_1 = :SHIP_ADDRESS_1, SHIP_ADDRESS_2 = :SHIP_ADDRESS_2, SH' +
        'IP_ADDRESS_3 = :SHIP_ADDRESS_3, SHIP_ZIPNTAX_ID = :SHIP_ZIPNTAX_' +
        'ID, SHIP_COUNTRY_ID = :SHIP_COUNTRY_ID, SHIP_COUNTRY_CODE = :SHI' +
        'P_COUNTRY_CODE, SALES_TAX = :SALES_TAX, SHIP_COMMENT = :SHIP_COM' +
        'MENT, SLS_ID = :SLS_ID, SALES_TAX_RATE = :SALES_TAX_RATE, PROD_C' +
        'OST = :PROD_COST, DELIVERY_COST = :DELIVERY_COST, DELIVERY_COST_' +
        'MODIFIED = :DELIVERY_COST_MODIFIED, TOTAL_COST = :TOTAL_COST, CO' +
        'NTACT_FAX = :CONTACT_FAX, SHIPPING_TYPE = :SHIPPING_TYPE, J_DISC' +
        '_PCT = :J_DISC_PCT, J_DISC = :J_DISC, QUOTE_STATUS = :QUOTE_STAT' +
        'US, ORDER_DATE = :ORDER_DATE, ORDER_DUEDATE = :ORDER_DUEDATE, NF' +
        'S = :NFS, UFZ = :UFZ, SERIES_ID = :SERIES_ID, SC_ID = :SC_ID, SN' +
        'F_ID = :SNF_ID, GLAZING_ID = :GLAZING_ID, GRIDS_ID = :GRIDS_ID, ' +
        'GLASS_KIND_ID_OUTER = :GLASS_KIND_ID_OUTER, GLASS_KIND_ID_MIDDLE' +
        ' = :GLASS_KIND_ID_MIDDLE, GLASS_KIND_ID_INNER = :GLASS_KIND_ID_I' +
        'NNER, GAS_ID = :GAS_ID, TOTAL_IGU_QTY = :TOTAL_IGU_QTY, TOTAL_XP' +
        'ANEL_QTY = :TOTAL_XPANEL_QTY, TOTAL_DPANEL_QTY = :TOTAL_DPANEL_Q' +
        'TY, MODEL_W_WIN_QTY = :MODEL_W_WIN_QTY, MODEL_G_SPECIALS_QTY = :' +
        'MODEL_G_SPECIALS_QTY, MODEL_PD_PATIO_DOORS_QTY = :MODEL_PD_PATIO' +
        '_DOORS_QTY, MODEL_E_EURO_STYLE_QTY = :MODEL_E_EURO_STYLE_QTY, MO' +
        'DEL_M_MULLED_QTY = :MODEL_M_MULLED_QTY, MODEL_CF_COMMON_FRAME_QT' +
        'Y = :MODEL_CF_COMMON_FRAME_QTY, TRACT_LOT = :TRACT_LOT, TRACT_PL' +
        'AN = :TRACT_PLAN, TRACT_DELIVERY = :TRACT_DELIVERY, TRACT_LOT_RE' +
        'VERSE = :TRACT_LOT_REVERSE, EXPECTED_DATE = :EXPECTED_DATE, IS_O' +
        'PTION = :IS_OPTION, COMPLETED_DATE = :COMPLETED_DATE, DELIVERED_' +
        'DATE = :DELIVERED_DATE, GRID_COLOR_STATUS_ID = :GRID_COLOR_STATU' +
        'S_ID, IS_SERVICE = :IS_SERVICE'
      'WHERE'
      '  QUOTE_ID = :Old_QUOTE_ID')
    SQLRefresh.Strings = (
      'SELECT '
      '  SO_QUOTE_HDR.QUOTE_ID,'
      '  SO_QUOTE_HDR.QUOTE_NO,'
      '  SO_QUOTE_HDR.CUSTOMER_ID,'
      '  SO_QUOTE_HDR.JOB_BATCH_ID,'
      '  SO_QUOTE_HDR.TRACT_ID,'
      '  SO_QUOTE_HDR.PHASE_ID,'
      '  SO_QUOTE_HDR.IS_TRACT,'
      '  SO_QUOTE_HDR.IS_SERVICE,'
      '  SO_QUOTE_HDR.JOB_NAME,'
      '  SO_QUOTE_HDR.QUOTE_DATE,'
      '  SO_QUOTE_HDR.FOLLOWUP_DATE,'
      '  SO_QUOTE_HDR.OPERATOR_SAVED,'
      '  SO_QUOTE_HDR.DATE_SAVED,'
      '  SO_QUOTE_HDR.OPERATOR_LAST_MODIFIED,'
      '  SO_QUOTE_HDR.OPERATOR_ORDERED,'
      '  SO_QUOTE_HDR.DATE_LAST_MODIFIED,'
      '  SO_QUOTE_HDR.TAX_EXEMPT,'
      '  SO_QUOTE_HDR.BILLING_ADDR_ID,'
      '  SO_QUOTE_HDR.BILL_NAME,'
      '  SO_QUOTE_HDR.BILL_ADDRESS_1,'
      '  SO_QUOTE_HDR.BILL_ADDRESS_2,'
      '  SO_QUOTE_HDR.BILL_ADDRESS_3,'
      '  SO_QUOTE_HDR.BILL_CITY,'
      '  SO_QUOTE_HDR.BILL_STATE,'
      '  SO_QUOTE_HDR.BILL_ZIP,'
      '  SO_QUOTE_HDR.BILL_COUNTRY_ID,'
      '  SO_QUOTE_HDR.BILL_COUNTRY_CODE,'
      '  SO_QUOTE_HDR.CONTACT_ID,'
      '  SO_QUOTE_HDR.TERMS_ID,'
      '  SO_QUOTE_HDR.COD,'
      '  SO_QUOTE_HDR.SHIP_NOTE,'
      '  SO_QUOTE_HDR.CONTACT_TELEPHONE,'
      '  SO_QUOTE_HDR.CUST_SHIP_ID,'
      '  SO_QUOTE_HDR.SHIP_NAME,'
      '  SO_QUOTE_HDR.SHIP_ADDRESS_1,'
      '  SO_QUOTE_HDR.SHIP_ADDRESS_2,'
      '  SO_QUOTE_HDR.SHIP_ADDRESS_3,'
      '  SO_QUOTE_HDR.SHIP_ZIPNTAX_ID,'
      '  SO_QUOTE_HDR.SHIP_COUNTRY_ID,'
      '  SO_QUOTE_HDR.SHIP_COUNTRY_CODE,'
      '  SO_QUOTE_HDR.SALES_TAX,'
      '  SO_QUOTE_HDR.SHIP_COMMENT,'
      '  SO_QUOTE_HDR.SLS_ID,'
      '  SO_QUOTE_HDR.SALES_TAX_RATE,'
      '  SO_QUOTE_HDR.PROD_COST,'
      '  SO_QUOTE_HDR.DELIVERY_COST,'
      '  SO_QUOTE_HDR.DELIVERY_COST_MODIFIED,'
      '  SO_QUOTE_HDR.TOTAL_COST,'
      '  SO_QUOTE_HDR.CONTACT_FAX,'
      '  SO_QUOTE_HDR.SHIPPING_TYPE,'
      '  SO_QUOTE_HDR.J_DISC_PCT,'
      '  SO_QUOTE_HDR.QUOTE_STATUS,'
      '  SO_QUOTE_HDR.ORDER_DATE,'
      '  SO_QUOTE_HDR.ORDER_DUEDATE,'
      '  SO_QUOTE_HDR.NFS,'
      '  SO_QUOTE_HDR.UFZ,'
      '  SO_QUOTE_HDR.SERIES_ID,'
      '  SO_QUOTE_HDR.SC_ID,'
      '  SO_QUOTE_HDR.SNF_ID,'
      '  SO_QUOTE_HDR.GLAZING_ID,'
      '  SO_QUOTE_HDR.GRIDS_ID,'
      '  SO_QUOTE_HDR.J_DISC,'
      '  SO_QUOTE_HDR.GLASS_KIND_ID_OUTER,'
      '  SO_QUOTE_HDR.GLASS_KIND_ID_MIDDLE,'
      '  SO_QUOTE_HDR.GLASS_KIND_ID_INNER,'
      '  SO_QUOTE_HDR.GAS_ID,'
      '  SO_QUOTE_HDR.TOTAL_IGU_QTY,'
      '  SO_QUOTE_HDR.TOTAL_XPANEL_QTY,'
      '  SO_QUOTE_HDR.TOTAL_DPANEL_QTY,'
      '  SO_QUOTE_HDR.MODEL_W_WIN_QTY,'
      '  SO_QUOTE_HDR.MODEL_G_SPECIALS_QTY,'
      '  SO_QUOTE_HDR.MODEL_PD_PATIO_DOORS_QTY,'
      '  SO_QUOTE_HDR.MODEL_E_EURO_STYLE_QTY,'
      '  SO_QUOTE_HDR.MODEL_M_MULLED_QTY,'
      '  SO_QUOTE_HDR.MODEL_CF_COMMON_FRAME_QTY,'
      '  SO_QUOTE_HDR.TRACT_LOT,'
      '  SO_QUOTE_HDR.TRACT_PLAN,'
      '  SO_QUOTE_HDR.TRACT_DELIVERY,'
      '  SO_QUOTE_HDR.TRACT_LOT_REVERSE,'
      '  SO_QUOTE_HDR.EXPECTED_DATE,'
      '  SO_QUOTE_HDR.IS_OPTION,'
      '  SO_QUOTE_HDR.COMPLETED_DATE,'
      '  SO_QUOTE_HDR.DELIVERED_DATE,'
      '  SO_QUOTE_HDR.GRID_COLOR_STATUS_ID,'
      '  GRID_COLOR_STATUS.COLOR,'
      '  GRID_COLOR_STATUS.DESCRIPTION,'
      '  CUSTOMERS.CUST_NAME,'
      '  TRACT.TRACT_NUMBER,'
      '  TRACT.TRACT_NAME,'
      '  TRACT_PHASE.PHASE_NAME,'
      '  SERIES.SERIES_NAME,'
      '  COLORS.COLOR_NAME,'
      '  GLASS_KIND_OUTER.GLASS_KIND AS GLASS_KIND_OUTER,'
      '  GLASS_KIND_MIDDLE.GLASS_KIND AS GLASS_KIND_MIDDLE,'
      '  GLASS_KIND_INNER.GLASS_KIND AS GLASS_KIND_INNER,'
      '  NAILFIN.NAILFIN_NAME,'
      '  NAILFIN.NAILFIN_DESCRIPTION,'
      '  GAS.GAS_NAME,'
      '  GLAZING.GLAZING_NAME,'
      '  GRIDS.GKIND_ID,'
      '  GRIDS.GPAT_ID,'
      '  GRID_PATTERN.GPATTERN_NAME,'
      '  GRID_KIND.GKIND_NAME'
      'FROM'
      '  GRID_PATTERN'
      
        '  RIGHT OUTER JOIN GRIDS ON (GRID_PATTERN.GPAT_ID = GRIDS.GPAT_I' +
        'D)'
      
        '  RIGHT OUTER JOIN SO_QUOTE_HDR ON (GRIDS.GRIDS_ID = SO_QUOTE_HD' +
        'R.GRIDS_ID)'
      
        '  LEFT OUTER JOIN GRID_COLOR_STATUS ON (SO_QUOTE_HDR.GRID_COLOR_' +
        'STATUS_ID = GRID_COLOR_STATUS.GRID_COLOR_STATUS_ID)'
      
        '  LEFT OUTER JOIN SERIES_NAILFIN ON (SO_QUOTE_HDR.SNF_ID = SERIE' +
        'S_NAILFIN.SNF_ID)'
      
        '  LEFT OUTER JOIN NAILFIN ON (SERIES_NAILFIN.NAILFIN_ID = NAILFI' +
        'N.NAILFIN_ID)'
      
        '  LEFT OUTER JOIN CUSTOMERS ON (SO_QUOTE_HDR.CUSTOMER_ID = CUSTO' +
        'MERS.CUSTOMER_ID)'
      
        '  LEFT OUTER JOIN TRACT_PHASE ON (SO_QUOTE_HDR.PHASE_ID = TRACT_' +
        'PHASE.PHASE_ID)'
      
        '  LEFT OUTER JOIN TRACT ON (SO_QUOTE_HDR.TRACT_ID = TRACT.TRACT_' +
        'ID)'
      
        '  LEFT OUTER JOIN SERIES ON (SO_QUOTE_HDR.SERIES_ID = SERIES.SER' +
        'IES_ID)'
      
        '  LEFT OUTER JOIN SERIES_COLOR ON (SO_QUOTE_HDR.SC_ID = SERIES_C' +
        'OLOR.SC_ID)'
      
        '  LEFT OUTER JOIN COLORS ON (SERIES_COLOR.COLOR_ID = COLORS.COLO' +
        'R_ID)'
      
        '  LEFT OUTER JOIN GLASS_KIND GLASS_KIND_OUTER ON (SO_QUOTE_HDR.G' +
        'LASS_KIND_ID_OUTER = GLASS_KIND_OUTER.GLASS_KIND_ID)'
      
        '  LEFT OUTER JOIN GLASS_KIND GLASS_KIND_MIDDLE ON (SO_QUOTE_HDR.' +
        'GLASS_KIND_ID_MIDDLE = GLASS_KIND_MIDDLE.GLASS_KIND_ID)'
      
        '  LEFT OUTER JOIN GLASS_KIND GLASS_KIND_INNER ON (SO_QUOTE_HDR.G' +
        'LASS_KIND_ID_INNER = GLASS_KIND_INNER.GLASS_KIND_ID)'
      '  LEFT OUTER JOIN GAS ON (SO_QUOTE_HDR.GAS_ID = GAS.GAS_ID)'
      
        '  LEFT OUTER JOIN GLAZING ON (SO_QUOTE_HDR.GLAZING_ID = GLAZING.' +
        'GLAZING_ID)'
      
        '  LEFT OUTER JOIN GRID_KIND ON (GRIDS.GKIND_ID = GRID_KIND.GKIND' +
        '_ID)'
      'WHERE'
      '  QUOTE_ID = :QUOTE_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM SO_QUOTE_HDR'
      'WHERE'
      'QUOTE_ID = :Old_QUOTE_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM SO_QUOTE_HDR'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'SELECT '
      '  SO_QUOTE_HDR.QUOTE_ID,'
      '  SO_QUOTE_HDR.QUOTE_NO,'
      '  SO_QUOTE_HDR.CUSTOMER_ID,'
      '  SO_QUOTE_HDR.JOB_BATCH_ID,'
      '  SO_QUOTE_HDR.TRACT_ID,'
      '  SO_QUOTE_HDR.PHASE_ID,'
      '  SO_QUOTE_HDR.IS_TRACT,'
      '  SO_QUOTE_HDR.IS_SERVICE,'
      '  SO_QUOTE_HDR.JOB_NAME,'
      '  SO_QUOTE_HDR.QUOTE_DATE,'
      '  SO_QUOTE_HDR.FOLLOWUP_DATE,'
      '  SO_QUOTE_HDR.OPERATOR_SAVED,'
      '  SO_QUOTE_HDR.DATE_SAVED,'
      '  SO_QUOTE_HDR.OPERATOR_LAST_MODIFIED,'
      '  SO_QUOTE_HDR.OPERATOR_ORDERED,'
      '  SO_QUOTE_HDR.DATE_LAST_MODIFIED,'
      '  SO_QUOTE_HDR.TAX_EXEMPT,'
      '  SO_QUOTE_HDR.BILLING_ADDR_ID,'
      '  SO_QUOTE_HDR.BILL_NAME,'
      '  SO_QUOTE_HDR.BILL_ADDRESS_1,'
      '  SO_QUOTE_HDR.BILL_ADDRESS_2,'
      '  SO_QUOTE_HDR.BILL_ADDRESS_3,'
      '  SO_QUOTE_HDR.BILL_CITY,'
      '  SO_QUOTE_HDR.BILL_STATE,'
      '  SO_QUOTE_HDR.BILL_ZIP,'
      '  SO_QUOTE_HDR.BILL_COUNTRY_ID,'
      '  SO_QUOTE_HDR.BILL_COUNTRY_CODE,'
      '  SO_QUOTE_HDR.CONTACT_ID,'
      '  SO_QUOTE_HDR.TERMS_ID,'
      '  SO_QUOTE_HDR.COD,'
      '  SO_QUOTE_HDR.SHIP_NOTE,'
      '  SO_QUOTE_HDR.CONTACT_TELEPHONE,'
      '  SO_QUOTE_HDR.CUST_SHIP_ID,'
      '  SO_QUOTE_HDR.SHIP_NAME,'
      '  SO_QUOTE_HDR.SHIP_ADDRESS_1,'
      '  SO_QUOTE_HDR.SHIP_ADDRESS_2,'
      '  SO_QUOTE_HDR.SHIP_ADDRESS_3,'
      '  SO_QUOTE_HDR.SHIP_ZIPNTAX_ID,'
      '  SO_QUOTE_HDR.SHIP_COUNTRY_ID,'
      '  SO_QUOTE_HDR.SHIP_COUNTRY_CODE,'
      '  SO_QUOTE_HDR.SALES_TAX,'
      '  SO_QUOTE_HDR.SHIP_COMMENT,'
      '  SO_QUOTE_HDR.SLS_ID,'
      '  SO_QUOTE_HDR.SALES_TAX_RATE,'
      '  SO_QUOTE_HDR.PROD_COST,'
      '  SO_QUOTE_HDR.DELIVERY_COST,'
      '  SO_QUOTE_HDR.DELIVERY_COST_MODIFIED,'
      '  SO_QUOTE_HDR.TOTAL_COST,'
      '  SO_QUOTE_HDR.CONTACT_FAX,'
      '  SO_QUOTE_HDR.SHIPPING_TYPE,'
      '  SO_QUOTE_HDR.J_DISC_PCT,'
      '  SO_QUOTE_HDR.QUOTE_STATUS,'
      '  SO_QUOTE_HDR.ORDER_DATE,'
      '  SO_QUOTE_HDR.ORDER_DUEDATE,'
      '  SO_QUOTE_HDR.NFS,'
      '  SO_QUOTE_HDR.UFZ,'
      '  SO_QUOTE_HDR.SERIES_ID,'
      '  SO_QUOTE_HDR.SC_ID,'
      '  SO_QUOTE_HDR.SNF_ID,'
      '  SO_QUOTE_HDR.GLAZING_ID,'
      '  SO_QUOTE_HDR.GRIDS_ID,'
      '  SO_QUOTE_HDR.J_DISC,'
      '  SO_QUOTE_HDR.GLASS_KIND_ID_OUTER,'
      '  SO_QUOTE_HDR.GLASS_KIND_ID_MIDDLE,'
      '  SO_QUOTE_HDR.GLASS_KIND_ID_INNER,'
      '  SO_QUOTE_HDR.GAS_ID,'
      '  SO_QUOTE_HDR.TOTAL_IGU_QTY,'
      '  SO_QUOTE_HDR.TOTAL_XPANEL_QTY,'
      '  SO_QUOTE_HDR.TOTAL_DPANEL_QTY,'
      '  SO_QUOTE_HDR.MODEL_W_WIN_QTY,'
      '  SO_QUOTE_HDR.MODEL_G_SPECIALS_QTY,'
      '  SO_QUOTE_HDR.MODEL_PD_PATIO_DOORS_QTY,'
      '  SO_QUOTE_HDR.MODEL_E_EURO_STYLE_QTY,'
      '  SO_QUOTE_HDR.MODEL_M_MULLED_QTY,'
      '  SO_QUOTE_HDR.MODEL_CF_COMMON_FRAME_QTY,'
      '  SO_QUOTE_HDR.TRACT_LOT,'
      '  SO_QUOTE_HDR.TRACT_PLAN,'
      '  SO_QUOTE_HDR.TRACT_DELIVERY,'
      '  SO_QUOTE_HDR.TRACT_LOT_REVERSE,'
      '  SO_QUOTE_HDR.EXPECTED_DATE,'
      '  SO_QUOTE_HDR.IS_OPTION,'
      '  SO_QUOTE_HDR.COMPLETED_DATE,'
      '  SO_QUOTE_HDR.DELIVERED_DATE,'
      '  SO_QUOTE_HDR.GRID_COLOR_STATUS_ID,'
      '  GRID_COLOR_STATUS.COLOR,'
      '  GRID_COLOR_STATUS.DESCRIPTION,'
      '  CUSTOMERS.CUST_NAME,'
      '  TRACT.TRACT_NUMBER,'
      '  TRACT.TRACT_NAME,'
      '  TRACT_PHASE.PHASE_NAME,'
      '  SERIES.SERIES_NAME,'
      '  COLORS.COLOR_NAME,'
      '  GLASS_KIND_OUTER.GLASS_KIND AS GLASS_KIND_OUTER,'
      '  GLASS_KIND_MIDDLE.GLASS_KIND AS GLASS_KIND_MIDDLE,'
      '  GLASS_KIND_INNER.GLASS_KIND AS GLASS_KIND_INNER,'
      '  NAILFIN.NAILFIN_NAME,'
      '  NAILFIN.NAILFIN_DESCRIPTION,'
      '  GAS.GAS_NAME,'
      '  GLAZING.GLAZING_NAME,'
      '  GRIDS.GKIND_ID,'
      '  GRIDS.GPAT_ID,'
      '  GRID_PATTERN.GPATTERN_NAME,'
      '  GRID_KIND.GKIND_NAME'
      'FROM'
      '  GRID_PATTERN'
      
        '  RIGHT OUTER JOIN GRIDS ON (GRID_PATTERN.GPAT_ID = GRIDS.GPAT_I' +
        'D)'
      
        '  RIGHT OUTER JOIN SO_QUOTE_HDR ON (GRIDS.GRIDS_ID = SO_QUOTE_HD' +
        'R.GRIDS_ID)'
      
        '  LEFT OUTER JOIN GRID_COLOR_STATUS ON (SO_QUOTE_HDR.GRID_COLOR_' +
        'STATUS_ID = GRID_COLOR_STATUS.GRID_COLOR_STATUS_ID)'
      
        '  LEFT OUTER JOIN SERIES_NAILFIN ON (SO_QUOTE_HDR.SNF_ID = SERIE' +
        'S_NAILFIN.SNF_ID)'
      
        '  LEFT OUTER JOIN NAILFIN ON (SERIES_NAILFIN.NAILFIN_ID = NAILFI' +
        'N.NAILFIN_ID)'
      
        '  LEFT OUTER JOIN CUSTOMERS ON (SO_QUOTE_HDR.CUSTOMER_ID = CUSTO' +
        'MERS.CUSTOMER_ID)'
      
        '  LEFT OUTER JOIN TRACT_PHASE ON (SO_QUOTE_HDR.PHASE_ID = TRACT_' +
        'PHASE.PHASE_ID)'
      
        '  LEFT OUTER JOIN TRACT ON (SO_QUOTE_HDR.TRACT_ID = TRACT.TRACT_' +
        'ID)'
      
        '  LEFT OUTER JOIN SERIES ON (SO_QUOTE_HDR.SERIES_ID = SERIES.SER' +
        'IES_ID)'
      
        '  LEFT OUTER JOIN SERIES_COLOR ON (SO_QUOTE_HDR.SC_ID = SERIES_C' +
        'OLOR.SC_ID)'
      
        '  LEFT OUTER JOIN COLORS ON (SERIES_COLOR.COLOR_ID = COLORS.COLO' +
        'R_ID)'
      
        '  LEFT OUTER JOIN GLASS_KIND GLASS_KIND_OUTER ON (SO_QUOTE_HDR.G' +
        'LASS_KIND_ID_OUTER = GLASS_KIND_OUTER.GLASS_KIND_ID)'
      
        '  LEFT OUTER JOIN GLASS_KIND GLASS_KIND_MIDDLE ON (SO_QUOTE_HDR.' +
        'GLASS_KIND_ID_MIDDLE = GLASS_KIND_MIDDLE.GLASS_KIND_ID)'
      
        '  LEFT OUTER JOIN GLASS_KIND GLASS_KIND_INNER ON (SO_QUOTE_HDR.G' +
        'LASS_KIND_ID_INNER = GLASS_KIND_INNER.GLASS_KIND_ID)'
      '  LEFT OUTER JOIN GAS ON (SO_QUOTE_HDR.GAS_ID = GAS.GAS_ID)'
      
        '  LEFT OUTER JOIN GLAZING ON (SO_QUOTE_HDR.GLAZING_ID = GLAZING.' +
        'GLAZING_ID)'
      
        '  LEFT OUTER JOIN GRID_KIND ON (GRIDS.GKIND_ID = GRID_KIND.GKIND' +
        '_ID)')
    LockMode = lmLockDelayed
    Options.RequiredFields = False
    Options.DefaultValues = True
    Options.ReturnParams = True
    LocalConstraints = False
    AfterInsert = tblQuotesAfterInsert
    AfterEdit = tblQuotesAfterEdit
    BeforePost = tblQuotesBeforePost
    AfterPost = tblQuotesAfterPost
    Left = 46
    Top = 489
  end
  object dsQuotes: TIBCDataSource
    DataSet = tblQuotes
    Left = 44
    Top = 544
  end
  object dsMainSQL: TIBCDataSource
    DataSet = MainSQL
    Left = 487
    Top = 10
  end
  object tblCustContacts: TIBCQuery
    KeyFields = 'CONTACT_ID'
    KeyGenerator = 'GEN_CUST_CONTACT_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO CUST_CONTACT'
      
        '  (CONTACT_ID, CUSTOMER_ID, IS_DEFAULT, FIRST_NAME, LAST_NAME, C' +
        'ONTACT_TITLE, CONTACT_TELEPHONE, PHONE_EXT, CONTACT_FAX, CONTACT' +
        '_EMAIL, CONTACT_CELL, ACCEPT_SMS)'
      'VALUES'
      
        '  (:CONTACT_ID, :CUSTOMER_ID, :IS_DEFAULT, :FIRST_NAME, :LAST_NA' +
        'ME, :CONTACT_TITLE, :CONTACT_TELEPHONE, :PHONE_EXT, :CONTACT_FAX' +
        ', :CONTACT_EMAIL, :CONTACT_CELL, :ACCEPT_SMS)')
    SQLDelete.Strings = (
      'DELETE FROM CUST_CONTACT'
      'WHERE'
      '  CONTACT_ID = :Old_CONTACT_ID')
    SQLUpdate.Strings = (
      'UPDATE CUST_CONTACT'
      'SET'
      
        '  CONTACT_ID = :CONTACT_ID, CUSTOMER_ID = :CUSTOMER_ID, IS_DEFAU' +
        'LT = :IS_DEFAULT, FIRST_NAME = :FIRST_NAME, LAST_NAME = :LAST_NA' +
        'ME, CONTACT_TITLE = :CONTACT_TITLE, CONTACT_TELEPHONE = :CONTACT' +
        '_TELEPHONE, PHONE_EXT = :PHONE_EXT, CONTACT_FAX = :CONTACT_FAX, ' +
        'CONTACT_EMAIL = :CONTACT_EMAIL, CONTACT_CELL = :CONTACT_CELL, AC' +
        'CEPT_SMS = :ACCEPT_SMS'
      'WHERE'
      '  CONTACT_ID = :Old_CONTACT_ID')
    SQLRefresh.Strings = (
      
        'SELECT CONTACT_ID, CUSTOMER_ID, IS_DEFAULT, FIRST_NAME, LAST_NAM' +
        'E, CONTACT_TITLE, CONTACT_TELEPHONE, PHONE_EXT, CONTACT_FAX, CON' +
        'TACT_EMAIL, CONTACT_CELL, ACCEPT_SMS FROM CUST_CONTACT'
      'WHERE'
      '  CONTACT_ID = :CONTACT_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM CUST_CONTACT'
      'WHERE'
      'CONTACT_ID = :Old_CONTACT_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM CUST_CONTACT'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'Select * from CUST_CONTACT'
      'Where CUSTOMER_ID = :CUSTOMER_ID')
    MasterSource = dsCustomers
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    IndexFieldNames = 'CONTACT_ID'
    AfterInsert = tblCustContactsAfterInsert
    BeforePost = tblCustContactsBeforePost
    AfterPost = tblCustContactsAfterPost
    Left = 1593
    Top = 354
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CUSTOMER_ID'
        ParamType = ptInput
        Value = 1000068
      end>
  end
  object dsCustContacts: TIBCDataSource
    DataSet = tblCustContacts
    Left = 1593
    Top = 407
  end
  object tblGroups: TIBCQuery
    KeyFields = 'GROUP_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO CUST_GROUP_SETUP'
      '  (GROUP_ID, DESCRIPTION, COMMENT, OPERATOR_SAVED, DATE_SAVED)'
      'VALUES'
      
        '  (:GROUP_ID, :DESCRIPTION, :COMMENT, :OPERATOR_SAVED, :DATE_SAV' +
        'ED)')
    SQLDelete.Strings = (
      'DELETE FROM CUST_GROUP_SETUP'
      'WHERE'
      '  GROUP_ID = :Old_GROUP_ID')
    SQLUpdate.Strings = (
      'UPDATE CUST_GROUP_SETUP'
      'SET'
      
        '  GROUP_ID = :GROUP_ID, DESCRIPTION = :DESCRIPTION, COMMENT = :C' +
        'OMMENT, OPERATOR_SAVED = :OPERATOR_SAVED, DATE_SAVED = :DATE_SAV' +
        'ED'
      'WHERE'
      '  GROUP_ID = :Old_GROUP_ID')
    SQLRefresh.Strings = (
      
        'SELECT GROUP_ID, DESCRIPTION, COMMENT, OPERATOR_SAVED, DATE_SAVE' +
        'D FROM CUST_GROUP_SETUP'
      'WHERE'
      '  GROUP_ID = :GROUP_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM CUST_GROUP_SETUP'
      'WHERE'
      'GROUP_ID = :Old_GROUP_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'Select * from CUST_GROUP_SETUP')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    IndexFieldNames = 'GROUP_ID'
    Left = 907
    Top = 616
  end
  object dsGroups: TIBCDataSource
    DataSet = tblGroups
    Left = 907
    Top = 669
  end
  object gridStyles: TcxStyleRepository
    Left = 1061
    Top = 7
    PixelsPerInch = 96
    object gridBackground: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object gridBackgroundDetail: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object gridBackgroundWhite: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object grdTract_Grid_Status: TcxStyle
    end
    object ActiveHeader14: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 16579320
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -28
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object grdWindows_Stock_Status: TcxStyle
      AssignedValues = [svColor]
      Color = 16774636
    end
    object sDisabled: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15790320
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sYellowBK: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 13565951
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sGreenBK: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14876633
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sMagenta: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 16744703
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sRed: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 13158655
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sBlue: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 16767963
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object ActiveHeader8: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 16579320
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object tblUsers: TIBCQuery
    KeyFields = 'UID'
    KeyGenerator = 'GEN_USERS_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO USERS'
      
        '  (UID, UNAME, WU_PASSWORD, UGROUP, LOCATION_ID, CELLPHONE, PHON' +
        'E_EXT, DIRECT_PHONE, EMAIL, FIRST_NAME, LAST_NAME, UTITLE, USIGN' +
        'ATURE)'
      'VALUES'
      
        '  (:UID, :UNAME, :WU_PASSWORD, :UGROUP, :LOCATION_ID, :CELLPHONE' +
        ', :PHONE_EXT, :DIRECT_PHONE, :EMAIL, :FIRST_NAME, :LAST_NAME, :U' +
        'TITLE, :USIGNATURE)')
    SQLDelete.Strings = (
      'DELETE FROM USERS'
      'WHERE'
      '  UID = :Old_UID')
    SQLUpdate.Strings = (
      'UPDATE USERS'
      'SET'
      
        '  UID = :UID, UNAME = :UNAME, WU_PASSWORD = :WU_PASSWORD, UGROUP' +
        ' = :UGROUP, LOCATION_ID = :LOCATION_ID, CELLPHONE = :CELLPHONE, ' +
        'PHONE_EXT = :PHONE_EXT, DIRECT_PHONE = :DIRECT_PHONE, EMAIL = :E' +
        'MAIL, FIRST_NAME = :FIRST_NAME, LAST_NAME = :LAST_NAME, UTITLE =' +
        ' :UTITLE, USIGNATURE = :USIGNATURE'
      'WHERE'
      '  UID = :Old_UID')
    SQLRefresh.Strings = (
      
        'SELECT UID, UNAME, WU_PASSWORD, UGROUP, LOCATION_ID, CELLPHONE, ' +
        'PHONE_EXT, DIRECT_PHONE, EMAIL, FIRST_NAME, LAST_NAME, UTITLE, U' +
        'SIGNATURE FROM USERS'
      'WHERE'
      '  UID = :UID')
    SQLLock.Strings = (
      'SELECT NULL FROM USERS'
      'WHERE'
      'UID = :Old_UID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM USERS'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from USERS')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    BeforePost = tblUsersBeforePost
    Left = 439
    Top = 359
  end
  object dsUsers: TIBCDataSource
    DataSet = tblUsers
    Left = 438
    Top = 411
  end
  object dsWinQuote_lookup: TIBCDataSource
    DataSet = tblWinQuote_lookup
    Left = 309
    Top = 544
  end
  object tblWinLock_SM: TIBCQuery
    KeyFields = 'WINLOCK_SM_ID'
    KeyGenerator = 'GEN_WINLOCK_SM_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO WINLOCK_SM'
      
        '  (WINLOCK_SM_ID, SM_ID, WINLOCK_NAME, WINLOCK_DESCRIPTION, COST' +
        ', IS_VISIBLE, IS_DEFAULT, GUI_SEQUENCE)'
      'VALUES'
      
        '  (:WINLOCK_SM_ID, :SM_ID, :WINLOCK_NAME, :WINLOCK_DESCRIPTION, ' +
        ':COST, :IS_VISIBLE, :IS_DEFAULT, :GUI_SEQUENCE)')
    SQLDelete.Strings = (
      'DELETE FROM WINLOCK_SM'
      'WHERE'
      '  WINLOCK_SM_ID = :Old_WINLOCK_SM_ID')
    SQLUpdate.Strings = (
      'UPDATE WINLOCK_SM'
      'SET'
      
        '  WINLOCK_SM_ID = :WINLOCK_SM_ID, SM_ID = :SM_ID, WINLOCK_NAME =' +
        ' :WINLOCK_NAME, WINLOCK_DESCRIPTION = :WINLOCK_DESCRIPTION, COST' +
        ' = :COST, IS_VISIBLE = :IS_VISIBLE, IS_DEFAULT = :IS_DEFAULT, GU' +
        'I_SEQUENCE = :GUI_SEQUENCE'
      'WHERE'
      '  WINLOCK_SM_ID = :Old_WINLOCK_SM_ID')
    SQLRefresh.Strings = (
      
        'SELECT WINLOCK_SM_ID, SM_ID, WINLOCK_NAME, WINLOCK_DESCRIPTION, ' +
        'COST, IS_VISIBLE, IS_DEFAULT, GUI_SEQUENCE FROM WINLOCK_SM'
      'WHERE'
      '  WINLOCK_SM_ID = :WINLOCK_SM_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM WINLOCK_SM'
      'WHERE'
      'WINLOCK_SM_ID = :Old_WINLOCK_SM_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM WINLOCK_SM'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from WINLOCK_SM'
      'where (SM_ID = :SM_ID) and (IS_VISIBLE like :vp)'
      'Order by GUI_SEQUENCE')
    MasterSource = dsSeriesModel
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    AfterInsert = tblWinLock_SMAfterInsert
    Left = 1100
    Top = 489
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SM_ID'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'vp'
        Value = nil
      end>
  end
  object dsWinLock_SM: TIBCDataSource
    DataSet = tblWinLock_SM
    Left = 1101
    Top = 544
  end
  object tblScreen: TIBCQuery
    KeyFields = 'SCREEN_ID'
    KeyGenerator = 'GEN_SCREEN_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO SCREEN'
      
        '  (SCREEN_ID, SCREEN_NAME, SCREEN_DESCRIPTION, IS_NO_DIM, GUI_SE' +
        'QUENCE, OPERATOR, DATE_SAVED, OPERATOR_LAST_MODIFIED, DATE_LAST_' +
        'MODIFIED)'
      'VALUES'
      
        '  (:SCREEN_ID, :SCREEN_NAME, :SCREEN_DESCRIPTION, :IS_NO_DIM, :G' +
        'UI_SEQUENCE, :OPERATOR, :DATE_SAVED, :OPERATOR_LAST_MODIFIED, :D' +
        'ATE_LAST_MODIFIED)')
    SQLDelete.Strings = (
      'DELETE FROM SCREEN'
      'WHERE'
      '  SCREEN_ID = :Old_SCREEN_ID')
    SQLUpdate.Strings = (
      'UPDATE SCREEN'
      'SET'
      
        '  SCREEN_ID = :SCREEN_ID, SCREEN_NAME = :SCREEN_NAME, SCREEN_DES' +
        'CRIPTION = :SCREEN_DESCRIPTION, IS_NO_DIM = :IS_NO_DIM, GUI_SEQU' +
        'ENCE = :GUI_SEQUENCE, OPERATOR = :OPERATOR, DATE_SAVED = :DATE_S' +
        'AVED, OPERATOR_LAST_MODIFIED = :OPERATOR_LAST_MODIFIED, DATE_LAS' +
        'T_MODIFIED = :DATE_LAST_MODIFIED'
      'WHERE'
      '  SCREEN_ID = :Old_SCREEN_ID')
    SQLRefresh.Strings = (
      
        'SELECT SCREEN_ID, SCREEN_NAME, SCREEN_DESCRIPTION, IS_NO_DIM, GU' +
        'I_SEQUENCE, OPERATOR, DATE_SAVED, OPERATOR_LAST_MODIFIED, DATE_L' +
        'AST_MODIFIED FROM SCREEN'
      'WHERE'
      '  SCREEN_ID = :SCREEN_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM SCREEN'
      'WHERE'
      'SCREEN_ID = :Old_SCREEN_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM SCREEN'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from SCREEN'
      'Order by GUI_SEQUENCE')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 106
    Top = 740
  end
  object dsScreen: TIBCDataSource
    DataSet = tblScreen
    Left = 103
    Top = 794
  end
  object tblGridPattern: TIBCQuery
    KeyFields = 'GPAT_ID'
    KeyGenerator = 'GEN_GRID_PATTERN_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO GRID_PATTERN'
      
        '  (GPAT_ID, GPAT_GED, GPATTERN_NAME, GPATTERN_DESCRIPTION, GPAT_' +
        'WIDTH_MULT, GPAT_WIDTH_DIVISOR, GPAT_WIDTH_OFFSET, GPAT_HEIGHT_M' +
        'ULT, GPAT_HEIGHT_DIVISOR, GPAT_HEIGHT_OFFSET, IS_VISIBLE, GUI_SE' +
        'QUENCE)'
      'VALUES'
      
        '  (:GPAT_ID, :GPAT_GED, :GPATTERN_NAME, :GPATTERN_DESCRIPTION, :' +
        'GPAT_WIDTH_MULT, :GPAT_WIDTH_DIVISOR, :GPAT_WIDTH_OFFSET, :GPAT_' +
        'HEIGHT_MULT, :GPAT_HEIGHT_DIVISOR, :GPAT_HEIGHT_OFFSET, :IS_VISI' +
        'BLE, :GUI_SEQUENCE)')
    SQLDelete.Strings = (
      'DELETE FROM GRID_PATTERN'
      'WHERE'
      '  GPAT_ID = :Old_GPAT_ID')
    SQLUpdate.Strings = (
      'UPDATE GRID_PATTERN'
      'SET'
      
        '  GPAT_ID = :GPAT_ID, GPAT_GED = :GPAT_GED, GPATTERN_NAME = :GPA' +
        'TTERN_NAME, GPATTERN_DESCRIPTION = :GPATTERN_DESCRIPTION, GPAT_W' +
        'IDTH_MULT = :GPAT_WIDTH_MULT, GPAT_WIDTH_DIVISOR = :GPAT_WIDTH_D' +
        'IVISOR, GPAT_WIDTH_OFFSET = :GPAT_WIDTH_OFFSET, GPAT_HEIGHT_MULT' +
        ' = :GPAT_HEIGHT_MULT, GPAT_HEIGHT_DIVISOR = :GPAT_HEIGHT_DIVISOR' +
        ', GPAT_HEIGHT_OFFSET = :GPAT_HEIGHT_OFFSET, IS_VISIBLE = :IS_VIS' +
        'IBLE, GUI_SEQUENCE = :GUI_SEQUENCE'
      'WHERE'
      '  GPAT_ID = :Old_GPAT_ID')
    SQLRefresh.Strings = (
      
        'SELECT GPAT_ID, GPAT_GED, GPATTERN_NAME, GPATTERN_DESCRIPTION, G' +
        'PAT_WIDTH_MULT, GPAT_WIDTH_DIVISOR, GPAT_WIDTH_OFFSET, GPAT_HEIG' +
        'HT_MULT, GPAT_HEIGHT_DIVISOR, GPAT_HEIGHT_OFFSET, IS_VISIBLE, GU' +
        'I_SEQUENCE FROM GRID_PATTERN'
      'WHERE'
      '  GPAT_ID = :GPAT_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM GRID_PATTERN'
      'WHERE'
      'GPAT_ID = :Old_GPAT_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from GRID_PATTERN'
      'where IS_VISIBLE = 1'
      'Order by GUI_SEQUENCE')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 716
    Top = 222
  end
  object dsGridPattern: TIBCDataSource
    DataSet = tblGridPattern
    Left = 716
    Top = 282
  end
  object tblGridKind: TIBCQuery
    KeyFields = 'GKIND_ID'
    KeyGenerator = 'GEN_GRID_KIND_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO GRID_KIND'
      
        '  (GKIND_ID, GKIND_NAME, GKIND_DESCRIPTION, IS_VISIBLE, GUI_SEQU' +
        'ENCE, GED_CODE, OPERATOR, DATE_SAVED, OPERATOR_LAST_MODIFIED, DA' +
        'TE_LAST_MODIFIED)'
      'VALUES'
      
        '  (:GKIND_ID, :GKIND_NAME, :GKIND_DESCRIPTION, :IS_VISIBLE, :GUI' +
        '_SEQUENCE, :GED_CODE, :OPERATOR, :DATE_SAVED, :OPERATOR_LAST_MOD' +
        'IFIED, :DATE_LAST_MODIFIED)')
    SQLDelete.Strings = (
      'DELETE FROM GRID_KIND'
      'WHERE'
      '  GKIND_ID = :Old_GKIND_ID')
    SQLUpdate.Strings = (
      'UPDATE GRID_KIND'
      'SET'
      
        '  GKIND_ID = :GKIND_ID, GKIND_NAME = :GKIND_NAME, GKIND_DESCRIPT' +
        'ION = :GKIND_DESCRIPTION, IS_VISIBLE = :IS_VISIBLE, GUI_SEQUENCE' +
        ' = :GUI_SEQUENCE, GED_CODE = :GED_CODE, OPERATOR = :OPERATOR, DA' +
        'TE_SAVED = :DATE_SAVED, OPERATOR_LAST_MODIFIED = :OPERATOR_LAST_' +
        'MODIFIED, DATE_LAST_MODIFIED = :DATE_LAST_MODIFIED'
      'WHERE'
      '  GKIND_ID = :Old_GKIND_ID')
    SQLRefresh.Strings = (
      
        'SELECT GKIND_ID, GKIND_NAME, GKIND_DESCRIPTION, IS_VISIBLE, GUI_' +
        'SEQUENCE, GED_CODE, OPERATOR, DATE_SAVED, OPERATOR_LAST_MODIFIED' +
        ', DATE_LAST_MODIFIED FROM GRID_KIND'
      'WHERE'
      '  GKIND_ID = :GKIND_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM GRID_KIND'
      'WHERE'
      'GKIND_ID = :Old_GKIND_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from GRID_KIND'
      'where IS_VISIBLE = 1'
      'Order by GUI_SEQUENCE')
    LockMode = lmLockDelayed
    Left = 822
    Top = 222
  end
  object dsGridKind: TIBCDataSource
    DataSet = tblGridKind
    Left = 822
    Top = 282
  end
  object dsGlazing: TIBCDataSource
    DataSet = tblGlazing
    Left = 905
    Top = 282
  end
  object tblGlazing: TIBCQuery
    KeyFields = 'GLAZING_ID'
    KeyGenerator = 'GEN_GLAZING_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO GLAZING'
      
        '  (GLAZING_ID, NLITES, GLAZING_NAME, GLAZING_DESCRIPTION, GLASS_' +
        'LABOR, IS_VISIBLE, GUI_SEQUENCE)'
      'VALUES'
      
        '  (:GLAZING_ID, :NLITES, :GLAZING_NAME, :GLAZING_DESCRIPTION, :G' +
        'LASS_LABOR, :IS_VISIBLE, :GUI_SEQUENCE)')
    SQLDelete.Strings = (
      'DELETE FROM GLAZING'
      'WHERE'
      '  GLAZING_ID = :Old_GLAZING_ID')
    SQLUpdate.Strings = (
      'UPDATE GLAZING'
      'SET'
      
        '  GLAZING_ID = :GLAZING_ID, NLITES = :NLITES, GLAZING_NAME = :GL' +
        'AZING_NAME, GLAZING_DESCRIPTION = :GLAZING_DESCRIPTION, GLASS_LA' +
        'BOR = :GLASS_LABOR, IS_VISIBLE = :IS_VISIBLE, GUI_SEQUENCE = :GU' +
        'I_SEQUENCE'
      'WHERE'
      '  GLAZING_ID = :Old_GLAZING_ID')
    SQLRefresh.Strings = (
      
        'SELECT GLAZING_ID, NLITES, GLAZING_NAME, GLAZING_DESCRIPTION, GL' +
        'ASS_LABOR, IS_VISIBLE, GUI_SEQUENCE FROM GLAZING'
      'WHERE'
      '  GLAZING_ID = :GLAZING_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM GLAZING'
      'WHERE'
      'GLAZING_ID = :Old_GLAZING_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM GLAZING'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from GLAZING'
      'where is_visible like :vp'
      'Order by GUI_SEQUENCE')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 906
    Top = 222
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vp'
        Value = nil
      end>
  end
  object sqlSum: TIBCQuery
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from SO_QUOTE_HDR where QUOTE_ID = 37')
    LockMode = lmLockDelayed
    Options.QueryRecCount = True
    Left = 639
    Top = 10
  end
  object tblWindowStock: TIBCQuery
    KeyFields = 'WINDOW_ID'
    KeyGenerator = 'GEN_WINDOW_STOCK_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO WINDOW_STOCK'
      
        '  (WINDOW_ID, RECORD_LOCKED, TABLE_POSITION, QUANTITY, OB_QUANTI' +
        'TY, LOCATION_ID, SM_ID, CALLOUTS_ID, WIN_WIDTH, WIN_HEIGHT, A_DI' +
        'M, B_DIM, C_DIM, TEMPERED, GRIDS_ACROSS, GRIDS_UPDOWN, PRICE, OP' +
        'ERATOR_SAVED, DATE_SAVED, DATE_LAST_MODIFIED, OPERATOR_LAST_MODI' +
        'FIED, NFS, UFZ, HSM_ID, SERIES_ID, WINLOCK_SM_ID, SCREEN_SM_ID, ' +
        'SC_ID, SNF_ID, GLAZING_ID, GRIDS_ID, GLASS_KIND_ID_OUTER, GLASS_' +
        'KIND_ID_MIDDLE, GLASS_KIND_ID_INNER)'
      'VALUES'
      
        '  (:WINDOW_ID, :RECORD_LOCKED, :TABLE_POSITION, :QUANTITY, :OB_Q' +
        'UANTITY, :LOCATION_ID, :SM_ID, :CALLOUTS_ID, :WIN_WIDTH, :WIN_HE' +
        'IGHT, :A_DIM, :B_DIM, :C_DIM, :TEMPERED, :GRIDS_ACROSS, :GRIDS_U' +
        'PDOWN, :PRICE, :OPERATOR_SAVED, :DATE_SAVED, :DATE_LAST_MODIFIED' +
        ', :OPERATOR_LAST_MODIFIED, :NFS, :UFZ, :HSM_ID, :SERIES_ID, :WIN' +
        'LOCK_SM_ID, :SCREEN_SM_ID, :SC_ID, :SNF_ID, :GLAZING_ID, :GRIDS_' +
        'ID, :GLASS_KIND_ID_OUTER, :GLASS_KIND_ID_MIDDLE, :GLASS_KIND_ID_' +
        'INNER)')
    SQLDelete.Strings = (
      'DELETE FROM WINDOW_STOCK'
      'WHERE'
      '  WINDOW_ID = :Old_WINDOW_ID')
    SQLUpdate.Strings = (
      'UPDATE WINDOW_STOCK'
      'SET'
      
        '  WINDOW_ID = :WINDOW_ID, RECORD_LOCKED = :RECORD_LOCKED, TABLE_' +
        'POSITION = :TABLE_POSITION, QUANTITY = :QUANTITY, OB_QUANTITY = ' +
        ':OB_QUANTITY, LOCATION_ID = :LOCATION_ID, SM_ID = :SM_ID, CALLOU' +
        'TS_ID = :CALLOUTS_ID, WIN_WIDTH = :WIN_WIDTH, WIN_HEIGHT = :WIN_' +
        'HEIGHT, A_DIM = :A_DIM, B_DIM = :B_DIM, C_DIM = :C_DIM, TEMPERED' +
        ' = :TEMPERED, GRIDS_ACROSS = :GRIDS_ACROSS, GRIDS_UPDOWN = :GRID' +
        'S_UPDOWN, PRICE = :PRICE, OPERATOR_SAVED = :OPERATOR_SAVED, DATE' +
        '_SAVED = :DATE_SAVED, DATE_LAST_MODIFIED = :DATE_LAST_MODIFIED, ' +
        'OPERATOR_LAST_MODIFIED = :OPERATOR_LAST_MODIFIED, NFS = :NFS, UF' +
        'Z = :UFZ, HSM_ID = :HSM_ID, SERIES_ID = :SERIES_ID, WINLOCK_SM_I' +
        'D = :WINLOCK_SM_ID, SCREEN_SM_ID = :SCREEN_SM_ID, SC_ID = :SC_ID' +
        ', SNF_ID = :SNF_ID, GLAZING_ID = :GLAZING_ID, GRIDS_ID = :GRIDS_' +
        'ID, GLASS_KIND_ID_OUTER = :GLASS_KIND_ID_OUTER, GLASS_KIND_ID_MI' +
        'DDLE = :GLASS_KIND_ID_MIDDLE, GLASS_KIND_ID_INNER = :GLASS_KIND_' +
        'ID_INNER'
      'WHERE'
      '  WINDOW_ID = :Old_WINDOW_ID')
    SQLRefresh.Strings = (
      
        'SELECT WINDOW_ID, RECORD_LOCKED, TABLE_POSITION, QUANTITY, OB_QU' +
        'ANTITY, LOCATION_ID, SM_ID, CALLOUTS_ID, WIN_WIDTH, WIN_HEIGHT, ' +
        'A_DIM, B_DIM, C_DIM, TEMPERED, GRIDS_ACROSS, GRIDS_UPDOWN, PRICE' +
        ', OPERATOR_SAVED, DATE_SAVED, DATE_LAST_MODIFIED, OPERATOR_LAST_' +
        'MODIFIED, NFS, UFZ, HSM_ID, SERIES_ID, WINLOCK_SM_ID, SCREEN_SM_' +
        'ID, SC_ID, SNF_ID, GLAZING_ID, GRIDS_ID, GLASS_KIND_ID_OUTER, GL' +
        'ASS_KIND_ID_MIDDLE, GLASS_KIND_ID_INNER, TOTAL_PRICE FROM WINDOW' +
        '_STOCK'
      'WHERE'
      '  WINDOW_ID = :WINDOW_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM WINDOW_STOCK'
      'WHERE'
      'WINDOW_ID = :Old_WINDOW_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM WINDOW_STOCK'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from WINDOW_STOCK'
      'where LOCATION_ID = :LOCATION_ID')
    MasterSource = dsLocationStock
    LockMode = lmLockDelayed
    RefreshOptions = [roAfterInsert, roAfterUpdate]
    Options.DefaultValues = True
    IndexFieldNames = 'WINDOW_ID'
    AfterInsert = tblWindowStockAfterInsert
    Left = 925
    Top = 489
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'LOCATION_ID'
        ParamType = ptInput
        Value = 1
      end>
  end
  object dsWindowStock: TIBCDataSource
    DataSet = tblWindowStock
    Left = 925
    Top = 544
  end
  object dsSerMod_Lookup: TIBCDataSource
    DataSet = tblSerMod_Lookup
    Left = 438
    Top = 151
  end
  object tblSerMod_Lookup: TIBCQuery
    UpdatingTable = 'SERIES_MODEL'
    KeyFields = 'SM_ID'
    KeyGenerator = 'GEN_SERIES_MODEL_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO SERIES_MODEL'
      
        '  (SM_ID, SERIES_ID, MODEL_ID, MIN_WIDTH, MAX_WIDTH, MIN_HEIGHT,' +
        ' MAX_HEIGHT, MAX_AREA, MIN_WIDTH_HEIGHT, MAX_WIDTH_HEIGHT, NFS_W' +
        'IDTH_DEDUCT, NFS_HEIGHT_DEDUCT, GLASS_EDGE_ID)'
      'VALUES'
      
        '  (:SM_ID, :SERIES_ID, :MODEL_ID, :MIN_WIDTH, :MAX_WIDTH, :MIN_H' +
        'EIGHT, :MAX_HEIGHT, :MAX_AREA, :MIN_WIDTH_HEIGHT, :MAX_WIDTH_HEI' +
        'GHT, :NFS_WIDTH_DEDUCT, :NFS_HEIGHT_DEDUCT, :GLASS_EDGE_ID)')
    SQLDelete.Strings = (
      'DELETE FROM SERIES_MODEL'
      'WHERE'
      '  SM_ID = :Old_SM_ID')
    SQLUpdate.Strings = (
      'UPDATE SERIES_MODEL'
      'SET'
      
        '  SM_ID = :SM_ID, SERIES_ID = :SERIES_ID, MODEL_ID = :MODEL_ID, ' +
        'MIN_WIDTH = :MIN_WIDTH, MAX_WIDTH = :MAX_WIDTH, MIN_HEIGHT = :MI' +
        'N_HEIGHT, MAX_HEIGHT = :MAX_HEIGHT, MAX_AREA = :MAX_AREA, MIN_WI' +
        'DTH_HEIGHT = :MIN_WIDTH_HEIGHT, MAX_WIDTH_HEIGHT = :MAX_WIDTH_HE' +
        'IGHT, NFS_WIDTH_DEDUCT = :NFS_WIDTH_DEDUCT, NFS_HEIGHT_DEDUCT = ' +
        ':NFS_HEIGHT_DEDUCT, GLASS_EDGE_ID = :GLASS_EDGE_ID'
      'WHERE'
      '  SM_ID = :Old_SM_ID')
    SQLRefresh.Strings = (
      
        'SELECT SM_ID, SERIES_ID, MODEL_ID, MIN_WIDTH, MAX_WIDTH, MIN_HEI' +
        'GHT, MAX_HEIGHT, MAX_AREA, MIN_WIDTH_HEIGHT, MAX_WIDTH_HEIGHT, N' +
        'FS_WIDTH_DEDUCT, NFS_HEIGHT_DEDUCT, GLASS_EDGE_ID FROM SERIES_MO' +
        'DEL'
      'WHERE'
      '  SM_ID = :SM_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM SERIES_MODEL'
      'WHERE'
      'SM_ID = :Old_SM_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM SERIES_MODEL'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    series_model.sm_id,'
      '    series_model.series_id,'
      '    series_model.model_id,'
      '    series_model.glass_edge_id,'
      '    series_model.min_width,'
      '    series_model.max_width,'
      '    series_model.min_height,'
      '    series_model.max_height,'
      '    series_model.max_area,'
      '    series_model.min_width_height,'
      '    series_model.max_width_height,'
      '    series_model.nfs_width_deduct,'
      '    series_model.nfs_height_deduct,'
      '    series.series_name,'
      '    series.series_description,'
      '    models.model_name,'
      '    models.model_description,'
      '    models.TEMPERED,'
      '    models.VERT_HORZ'
      'from models'
      
        '   right outer join series_model on (models.model_id = series_mo' +
        'del.model_id)'
      
        '   left outer join series on (series_model.series_id = series.se' +
        'ries_id)'
      'Order By models.GUI_SEQUENCE')
    LockMode = lmLockDelayed
    Options.DetailDelay = 1
    AfterInsert = tblSeriesModelAfterInsert
    Left = 440
    Top = 98
  end
  object dsSerColor_lookup: TIBCDataSource
    DataSet = tblSerColor_lookup
    Left = 770
    Top = 151
  end
  object tblSerColor_lookup: TIBCQuery
    UpdatingTable = 'SERIES_COLOR'
    KeyFields = 'SC_ID'
    KeyGenerator = 'GEN_SERIES_COLOR_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO SERIES_COLOR'
      '  (SC_ID, SERIES_ID, COLOR_ID, IS_VISIBLE)'
      'VALUES'
      '  (:SC_ID, :SERIES_ID, :COLOR_ID, :IS_VISIBLE)')
    SQLDelete.Strings = (
      'DELETE FROM SERIES_COLOR'
      'WHERE'
      '  SC_ID = :Old_SC_ID')
    SQLUpdate.Strings = (
      'UPDATE SERIES_COLOR'
      'SET'
      
        '  SC_ID = :SC_ID, SERIES_ID = :SERIES_ID, COLOR_ID = :COLOR_ID, ' +
        'IS_VISIBLE = :IS_VISIBLE'
      'WHERE'
      '  SC_ID = :Old_SC_ID')
    SQLRefresh.Strings = (
      'SELECT SC_ID, SERIES_ID, COLOR_ID, IS_VISIBLE FROM SERIES_COLOR'
      'WHERE'
      '  SC_ID = :SC_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM SERIES_COLOR'
      'WHERE'
      'SC_ID = :Old_SC_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    series_color.sc_id,'
      '    series_color.series_id,'
      '    series_color.color_id,'
      '    series_color.is_visible,'
      '    colors.color_name,'
      '    colors.color_description,'
      '    series.series_name,'
      '    series.series_description'
      'from series_color'
      
        '   left outer join series on (series_color.series_id = series.se' +
        'ries_id)'
      
        '   left outer join colors on (series_color.color_id = colors.col' +
        'or_id)'
      'where series_color.IS_VISIBLE = 1'
      'Order By colors.GUI_SEQUENCE')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 771
    Top = 98
  end
  object dsSerNailfin_lookup: TIBCDataSource
    DataSet = tblSerNailfin_lookup
    Left = 272
    Top = 282
  end
  object tblSerNailfin_lookup: TIBCQuery
    UpdatingTable = 'SERIES_NAILFIN'
    KeyFields = 'SNF_ID'
    KeyGenerator = 'GEN_SERIES_NAILFIN_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO SERIES_NAILFIN'
      '  (SNF_ID, NAILFIN_ID, SERIES_ID, IS_VISIBLE)'
      'VALUES'
      '  (:SNF_ID, :NAILFIN_ID, :SERIES_ID, :IS_VISIBLE)')
    SQLDelete.Strings = (
      'DELETE FROM SERIES_NAILFIN'
      'WHERE'
      '  SNF_ID = :Old_SNF_ID')
    SQLUpdate.Strings = (
      'UPDATE SERIES_NAILFIN'
      'SET'
      
        '  SNF_ID = :SNF_ID, NAILFIN_ID = :NAILFIN_ID, SERIES_ID = :SERIE' +
        'S_ID, IS_VISIBLE = :IS_VISIBLE'
      'WHERE'
      '  SNF_ID = :Old_SNF_ID')
    SQLRefresh.Strings = (
      
        'SELECT SNF_ID, NAILFIN_ID, SERIES_ID, IS_VISIBLE FROM SERIES_NAI' +
        'LFIN'
      'WHERE'
      '  SNF_ID = :SNF_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM SERIES_NAILFIN'
      'WHERE'
      'SNF_ID = :Old_SNF_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    series_nailfin.snf_id,'
      '    series_nailfin.nailfin_id,'
      '    series_nailfin.series_id,'
      '    series_nailfin.IS_VISIBLE,'
      '    series.series_name,'
      '    series.series_description,'
      '    nailfin.nailfin_name,'
      '    nailfin.nailfin_description'
      'from series'
      
        '   right outer join series_nailfin on (series.series_id = series' +
        '_nailfin.series_id)'
      
        '   left outer join nailfin on (series_nailfin.nailfin_id = nailf' +
        'in.nailfin_id)'
      'where series_nailfin.IS_VISIBLE = 1'
      'Order by nailfin.GUI_SEQUENCE')
    LockMode = lmLockDelayed
    Left = 272
    Top = 219
  end
  object tblLocationStock: TIBCQuery
    KeyFields = 'LOCATION_ID'
    KeyGenerator = 'GEN_LOCATIONS_STOCK_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO LOCATIONS_STOCK'
      '  (LOCATION_ID, LOCATIONS_NAME, ADDRESS)'
      'VALUES'
      '  (:LOCATION_ID, :LOCATIONS_NAME, :ADDRESS)')
    SQLDelete.Strings = (
      'DELETE FROM LOCATIONS_STOCK'
      'WHERE'
      '  LOCATION_ID = :Old_LOCATION_ID')
    SQLUpdate.Strings = (
      'UPDATE LOCATIONS_STOCK'
      'SET'
      
        '  LOCATION_ID = :LOCATION_ID, LOCATIONS_NAME = :LOCATIONS_NAME, ' +
        'ADDRESS = :ADDRESS'
      'WHERE'
      '  LOCATION_ID = :Old_LOCATION_ID')
    SQLRefresh.Strings = (
      'SELECT LOCATION_ID, LOCATIONS_NAME, ADDRESS FROM LOCATIONS_STOCK'
      'WHERE'
      '  LOCATION_ID = :LOCATION_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM LOCATIONS_STOCK'
      'WHERE'
      'LOCATION_ID = :Old_LOCATION_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from LOCATIONS_STOCK')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    IndexFieldNames = 'LOCATION_ID'
    Left = 50
    Top = 358
  end
  object dsLocationStock: TIBCDataSource
    DataSet = tblLocationStock
    Left = 49
    Top = 410
  end
  object tblAccessories: TIBCQuery
    KeyFields = 'ACCESSORY_ID'
    KeyGenerator = 'GEN_ACCESSORY_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO ACCESSORY'
      
        '  (ACCESSORY_ID, LOCATION_ID, ACC_SKU, QUANTITY, OB_QUANTITY, UO' +
        'M, PRICE, ACC_NAME, ACC_DESCRIPTION, ACCESSORY_TYPE_ID, ACC_COST' +
        ', ACC_WIDTH, ACC_LENGTH, ACC_NS_WIDTH, ACC_NS_HEIGHT, NOTES, IS_' +
        'VISIBLE, GUI_SEQUENCE)'
      'VALUES'
      
        '  (:ACCESSORY_ID, :LOCATION_ID, :ACC_SKU, :QUANTITY, :OB_QUANTIT' +
        'Y, :UOM, :PRICE, :ACC_NAME, :ACC_DESCRIPTION, :ACCESSORY_TYPE_ID' +
        ', :ACC_COST, :ACC_WIDTH, :ACC_LENGTH, :ACC_NS_WIDTH, :ACC_NS_HEI' +
        'GHT, :NOTES, :IS_VISIBLE, :GUI_SEQUENCE)')
    SQLDelete.Strings = (
      'DELETE FROM ACCESSORY'
      'WHERE'
      '  ACCESSORY_ID = :Old_ACCESSORY_ID')
    SQLUpdate.Strings = (
      'UPDATE ACCESSORY'
      'SET'
      
        '  ACCESSORY_ID = :ACCESSORY_ID, LOCATION_ID = :LOCATION_ID, ACC_' +
        'SKU = :ACC_SKU, QUANTITY = :QUANTITY, OB_QUANTITY = :OB_QUANTITY' +
        ', UOM = :UOM, PRICE = :PRICE, ACC_NAME = :ACC_NAME, ACC_DESCRIPT' +
        'ION = :ACC_DESCRIPTION, ACCESSORY_TYPE_ID = :ACCESSORY_TYPE_ID, ' +
        'ACC_COST = :ACC_COST, ACC_WIDTH = :ACC_WIDTH, ACC_LENGTH = :ACC_' +
        'LENGTH, ACC_NS_WIDTH = :ACC_NS_WIDTH, ACC_NS_HEIGHT = :ACC_NS_HE' +
        'IGHT, NOTES = :NOTES, IS_VISIBLE = :IS_VISIBLE, GUI_SEQUENCE = :' +
        'GUI_SEQUENCE'
      'WHERE'
      '  ACCESSORY_ID = :Old_ACCESSORY_ID')
    SQLRefresh.Strings = (
      
        'SELECT ACCESSORY_ID, LOCATION_ID, ACC_SKU, QUANTITY, OB_QUANTITY' +
        ', UOM, PRICE, ACC_NAME, ACC_DESCRIPTION, ACCESSORY_TYPE_ID, ACC_' +
        'COST, ACC_WIDTH, ACC_LENGTH, ACC_NS_WIDTH, ACC_NS_HEIGHT, NOTES,' +
        ' IS_VISIBLE, GUI_SEQUENCE FROM ACCESSORY'
      'WHERE'
      '  ACCESSORY_ID = :ACCESSORY_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM ACCESSORY'
      'WHERE'
      'ACCESSORY_ID = :Old_ACCESSORY_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM ACCESSORY'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from ACCESSORY'
      'where LOCATION_ID = :LOCATION_ID'
      'Order By GUI_SEQUENCE')
    MasterSource = dsLocationStock
    LockMode = lmLockDelayed
    RefreshOptions = [roAfterInsert, roAfterUpdate]
    Options.DefaultValues = True
    AfterInsert = tblAccessoriesAfterInsert
    Left = 136
    Top = 358
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'LOCATION_ID'
        ParamType = ptInput
        Value = 1
      end>
  end
  object dsAccessories: TIBCDataSource
    DataSet = tblAccessories
    Left = 136
    Top = 410
  end
  object tblCallouts_lookup: TIBCQuery
    UpdatingTable = 'CALLOUTS'
    KeyFields = 'CALLOUTS_ID'
    KeyGenerator = 'GEN_CALLOUTS_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO CALLOUTS'
      
        '  (CALLOUTS_ID, SM_ID, CALLOUTS, GUI_SEQUENCE, NFS_WIDTH, NFS_HE' +
        'IGHT, IS_VISIBLE)'
      'VALUES'
      
        '  (:CALLOUTS_ID, :SM_ID, :CALLOUTS, :GUI_SEQUENCE, :NFS_WIDTH, :' +
        'NFS_HEIGHT, :IS_VISIBLE)')
    SQLDelete.Strings = (
      'DELETE FROM CALLOUTS'
      'WHERE'
      '  CALLOUTS_ID = :Old_CALLOUTS_ID')
    SQLUpdate.Strings = (
      'UPDATE CALLOUTS'
      'SET'
      
        '  CALLOUTS_ID = :CALLOUTS_ID, SM_ID = :SM_ID, CALLOUTS = :CALLOU' +
        'TS, GUI_SEQUENCE = :GUI_SEQUENCE, NFS_WIDTH = :NFS_WIDTH, NFS_HE' +
        'IGHT = :NFS_HEIGHT, IS_VISIBLE = :IS_VISIBLE'
      'WHERE'
      '  CALLOUTS_ID = :Old_CALLOUTS_ID')
    SQLRefresh.Strings = (
      
        'SELECT CALLOUTS_ID, SM_ID, CALLOUTS, GUI_SEQUENCE, NFS_WIDTH, NF' +
        'S_HEIGHT, IS_VISIBLE FROM CALLOUTS'
      'WHERE'
      '  CALLOUTS_ID = :CALLOUTS_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM CALLOUTS'
      'WHERE'
      'CALLOUTS_ID = :Old_CALLOUTS_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM CALLOUTS'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    callouts.callouts_id,'
      '    callouts.sm_id,'
      '    callouts.callouts,'
      '    callouts.NFS_WIDTH,'
      '    callouts.NFS_HEIGHT,'
      '    callouts.gui_sequence,'
      '    callouts.IS_VISIBLE,'
      '    models.model_name,'
      '    models.model_description,'
      '    series.series_name,'
      '    series.series_description'
      'from series'
      
        '   right outer join series_model on (series.series_id = series_m' +
        'odel.series_id)'
      
        '   right outer join callouts on (series_model.sm_id = callouts.s' +
        'm_id)'
      
        '   left outer join models on (series_model.model_id = models.mod' +
        'el_id)'
      'where callouts.IS_VISIBLE = 1'
      'Order by callouts.GUI_SEQUENCE')
    LockMode = lmLockDelayed
    AfterInsert = tblCalloutsAfterInsert
    Left = 495
    Top = 219
  end
  object dsCallouts_lookup: TIBCDataSource
    DataSet = tblCallouts_lookup
    Left = 495
    Top = 282
  end
  object tblQAccessories: TIBCQuery
    UpdatingTable = 'QUOTE_ACCESSORY'
    KeyFields = 'QACCESS_ID'
    KeyGenerator = 'GEN_QUOTE_ACCESSORY_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO QUOTE_ACCESSORY'
      
        '  (QACCESS_ID, QUOTE_ID, ACCESSORY_ID, LOCATION_ID, ACC_NS_WIDTH' +
        ', ACC_NS_HEIGHT, NOTES, QUANTITY, PRICE, OPERATOR_SAVED, DATE_SA' +
        'VED, OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED)'
      'VALUES'
      
        '  (:QACCESS_ID, :QUOTE_ID, :ACCESSORY_ID, :LOCATION_ID, :ACC_NS_' +
        'WIDTH, :ACC_NS_HEIGHT, :NOTES, :QUANTITY, :PRICE, :OPERATOR_SAVE' +
        'D, :DATE_SAVED, :OPERATOR_LAST_MODIFIED, :DATE_LAST_MODIFIED)')
    SQLDelete.Strings = (
      'DELETE FROM QUOTE_ACCESSORY'
      'WHERE'
      '  QACCESS_ID = :Old_QACCESS_ID')
    SQLUpdate.Strings = (
      'UPDATE QUOTE_ACCESSORY'
      'SET'
      
        '  QACCESS_ID = :QACCESS_ID, QUOTE_ID = :QUOTE_ID, ACCESSORY_ID =' +
        ' :ACCESSORY_ID, LOCATION_ID = :LOCATION_ID, ACC_NS_WIDTH = :ACC_' +
        'NS_WIDTH, ACC_NS_HEIGHT = :ACC_NS_HEIGHT, NOTES = :NOTES, QUANTI' +
        'TY = :QUANTITY, PRICE = :PRICE, OPERATOR_SAVED = :OPERATOR_SAVED' +
        ', DATE_SAVED = :DATE_SAVED, OPERATOR_LAST_MODIFIED = :OPERATOR_L' +
        'AST_MODIFIED, DATE_LAST_MODIFIED = :DATE_LAST_MODIFIED'
      'WHERE'
      '  QACCESS_ID = :Old_QACCESS_ID')
    SQLRefresh.Strings = (
      
        'SELECT QACCESS_ID, QUOTE_ID, ACCESSORY_ID, LOCATION_ID, ACC_NS_W' +
        'IDTH, ACC_NS_HEIGHT, NOTES, QUANTITY, PRICE, OPERATOR_SAVED, DAT' +
        'E_SAVED, OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED FROM QUOTE_A' +
        'CCESSORY'
      'WHERE'
      '  QACCESS_ID = :QACCESS_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM QUOTE_ACCESSORY'
      'WHERE'
      'QACCESS_ID = :Old_QACCESS_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM QUOTE_ACCESSORY'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    quote_accessory.qaccess_id,'
      '    quote_accessory.quote_id,'
      '    quote_accessory.accessory_id,'
      '    quote_accessory.location_id,'
      '    quote_accessory.acc_ns_width,'
      '    quote_accessory.acc_ns_height,'
      '    quote_accessory.notes,'
      '    quote_accessory.quantity,'
      '    quote_accessory.price,'
      '    quote_accessory.operator_saved,'
      '    quote_accessory.date_saved,'
      '    quote_accessory.operator_last_modified,'
      '    quote_accessory.date_last_modified,'
      '    accessory.acc_sku,'
      '    accessory.uom,'
      '    accessory.acc_name,'
      '    accessory.acc_description'
      'from quote_accessory'
      
        '   left outer join accessory on (quote_accessory.accessory_id = ' +
        'accessory.accessory_id)'
      'Where quote_accessory.quote_id = :quote_id')
    MasterSource = dsQuotes
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    IndexFieldNames = 'QACCESS_ID'
    AfterInsert = tblQAccessoriesAfterInsert
    Left = 1010
    Top = 489
    ParamData = <
      item
        DataType = ftInteger
        Name = 'QUOTE_ID'
        ParamType = ptInput
        Value = 203
      end>
  end
  object dsQAccessories: TIBCDataSource
    DataSet = tblQAccessories
    Left = 1010
    Top = 544
  end
  object mStoredProc: TIBCStoredProc
    StoredProcName = 'GRID_KIND_PROC'
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    AutoCommit = False
    Options.AutoClose = True
    Options.DefaultValues = True
    Options.AutoPrepare = True
    Options.ReturnParams = True
    Left = 282
    Top = 10
    CommandStoredProcName = 'GRID_KIND_PROC'
  end
  object sqlGen: TIBCQuery
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    LockMode = lmLockDelayed
    Options.QueryRecCount = True
    Left = 702
    Top = 10
  end
  object tblUserSettings: TIBCQuery
    KeyFields = 'USET_ID'
    KeyGenerator = 'GEN_USER_SETTINGS_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO USER_SETTINGS'
      
        '  (USET_ID, UID, SERIES_ID, SC_ID, SNF_ID, GLAZING_ID, GLASS_EDG' +
        'E_ID, GLASS_KIND_ID_OUTER, GLASS_KIND_ID_MIDDLE, GLASS_KIND_ID_I' +
        'NNER, GAS_ID, GRIDS_ID, NFS, UFZ)'
      'VALUES'
      
        '  (:USET_ID, :UID, :SERIES_ID, :SC_ID, :SNF_ID, :GLAZING_ID, :GL' +
        'ASS_EDGE_ID, :GLASS_KIND_ID_OUTER, :GLASS_KIND_ID_MIDDLE, :GLASS' +
        '_KIND_ID_INNER, :GAS_ID, :GRIDS_ID, :NFS, :UFZ)')
    SQLDelete.Strings = (
      'DELETE FROM USER_SETTINGS'
      'WHERE'
      '  USET_ID = :Old_USET_ID')
    SQLUpdate.Strings = (
      'UPDATE USER_SETTINGS'
      'SET'
      
        '  USET_ID = :USET_ID, UID = :UID, SERIES_ID = :SERIES_ID, SC_ID ' +
        '= :SC_ID, SNF_ID = :SNF_ID, GLAZING_ID = :GLAZING_ID, GLASS_EDGE' +
        '_ID = :GLASS_EDGE_ID, GLASS_KIND_ID_OUTER = :GLASS_KIND_ID_OUTER' +
        ', GLASS_KIND_ID_MIDDLE = :GLASS_KIND_ID_MIDDLE, GLASS_KIND_ID_IN' +
        'NER = :GLASS_KIND_ID_INNER, GAS_ID = :GAS_ID, GRIDS_ID = :GRIDS_' +
        'ID, NFS = :NFS, UFZ = :UFZ'
      'WHERE'
      '  USET_ID = :Old_USET_ID')
    SQLRefresh.Strings = (
      'select '
      '    user_settings.uset_id,'
      '    user_settings.uid,'
      '    user_settings.series_id,'
      '    user_settings.sc_id,'
      '    user_settings.snf_id,'
      '    user_settings.glazing_id,'
      '    user_settings.glass_edge_id,'
      '    user_settings.glass_kind_id_outer,'
      '    user_settings.glass_kind_id_middle,'
      '    user_settings.glass_kind_id_inner,'
      '    user_settings.gas_id,'
      '    user_settings.nfs,'
      '    user_settings.ufz,'
      '    user_settings.grids_id,'
      '    series.series_name,'
      '    colors.color_name,'
      '    nailfin.nailfin_name,'
      '    glazing.glazing_name,'
      '    glass_edge.edge,'
      '    gas.gas_name,'
      '    glass_kind_inner.glass_kind glass_kind_inner,'
      '    glass_kind_middle.glass_kind glass_kind_middle,'
      '    glass_kind_outer.glass_kind glass_kind_outer,'
      '    grids.gkind_id,'
      '    grids.gpat_id,'
      '    grid_kind.gkind_name,'
      '    grid_pattern.gpattern_name'
      'from grid_pattern'
      
        '   right outer join grids on (grid_pattern.gpat_id = grids.gpat_' +
        'id)'
      
        '   right outer join user_settings on (grids.grids_id = user_sett' +
        'ings.grids_id)'
      
        '   left outer join glass_kind glass_kind_middle on (user_setting' +
        's.glass_kind_id_middle = glass_kind_middle.glass_kind_id)'
      
        '   left outer join glass_kind glass_kind_outer on (user_settings' +
        '.glass_kind_id_outer = glass_kind_outer.glass_kind_id)'
      
        '   left outer join series on (user_settings.series_id = series.s' +
        'eries_id)'
      
        '   left outer join series_color on (user_settings.sc_id = series' +
        '_color.sc_id)'
      
        '   left outer join colors on (series_color.color_id = colors.col' +
        'or_id)'
      
        '   left outer join series_nailfin on (user_settings.snf_id = ser' +
        'ies_nailfin.snf_id)'
      
        '   left outer join nailfin on (series_nailfin.nailfin_id = nailf' +
        'in.nailfin_id)'
      
        '   left outer join glazing on (user_settings.glazing_id = glazin' +
        'g.glazing_id)'
      
        '   left outer join glass_edge on (user_settings.glass_edge_id = ' +
        'glass_edge.glass_edge_id)'
      '   left outer join gas on (user_settings.gas_id = gas.gas_id)'
      
        '   left outer join glass_kind glass_kind_inner on (user_settings' +
        '.glass_kind_id_inner = glass_kind_inner.glass_kind_id)'
      
        '   left outer join grid_kind on (grids.gkind_id = grid_kind.gkin' +
        'd_id)'
      'WHERE'
      '  USET_ID = :USET_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM USER_SETTINGS'
      'WHERE'
      'USET_ID = :Old_USET_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    user_settings.uset_id,'
      '    user_settings.uid,'
      '    user_settings.series_id,'
      '    user_settings.sc_id,'
      '    user_settings.snf_id,'
      '    user_settings.glazing_id,'
      '    user_settings.glass_edge_id,'
      '    user_settings.glass_kind_id_outer,'
      '    user_settings.glass_kind_id_middle,'
      '    user_settings.glass_kind_id_inner,'
      '    user_settings.gas_id,'
      '    user_settings.nfs,'
      '    user_settings.ufz,'
      '    user_settings.grids_id,'
      '    series.series_name,'
      '    colors.color_name,'
      '    nailfin.nailfin_name,'
      '    glazing.glazing_name,'
      '    glass_edge.edge,'
      '    gas.gas_name,'
      '    glass_kind_inner.glass_kind glass_kind_inner,'
      '    glass_kind_middle.glass_kind glass_kind_middle,'
      '    glass_kind_outer.glass_kind glass_kind_outer,'
      '    grids.gkind_id,'
      '    grids.gpat_id,'
      '    grid_kind.gkind_name,'
      '    grid_pattern.gpattern_name'
      'from grid_pattern'
      
        '   right outer join grids on (grid_pattern.gpat_id = grids.gpat_' +
        'id)'
      
        '   right outer join user_settings on (grids.grids_id = user_sett' +
        'ings.grids_id)'
      
        '   left outer join glass_kind glass_kind_middle on (user_setting' +
        's.glass_kind_id_middle = glass_kind_middle.glass_kind_id)'
      
        '   left outer join glass_kind glass_kind_outer on (user_settings' +
        '.glass_kind_id_outer = glass_kind_outer.glass_kind_id)'
      
        '   left outer join series on (user_settings.series_id = series.s' +
        'eries_id)'
      
        '   left outer join series_color on (user_settings.sc_id = series' +
        '_color.sc_id)'
      
        '   left outer join colors on (series_color.color_id = colors.col' +
        'or_id)'
      
        '   left outer join series_nailfin on (user_settings.snf_id = ser' +
        'ies_nailfin.snf_id)'
      
        '   left outer join nailfin on (series_nailfin.nailfin_id = nailf' +
        'in.nailfin_id)'
      
        '   left outer join glazing on (user_settings.glazing_id = glazin' +
        'g.glazing_id)'
      
        '   left outer join glass_edge on (user_settings.glass_edge_id = ' +
        'glass_edge.glass_edge_id)'
      '   left outer join gas on (user_settings.gas_id = gas.gas_id)'
      
        '   left outer join glass_kind glass_kind_inner on (user_settings' +
        '.glass_kind_id_inner = glass_kind_inner.glass_kind_id)'
      
        '   left outer join grid_kind on (grids.gkind_id = grid_kind.gkin' +
        'd_id)')
    LockMode = lmLockDelayed
    IndexFieldNames = 'USET_ID'
    AfterInsert = tblUserSettingsAfterInsert
    Left = 793
    Top = 740
  end
  object dsUserSettings: TIBCDataSource
    DataSet = tblUserSettings
    Left = 790
    Top = 795
  end
  object mdDBSettings: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F02000000280000000100060064625F697000F40100
      000100080064625F706174680001090000003132372E302E302E3100}
    SortOptions = []
    Left = 1515
    Top = 8
    object mdDBSettingsdb_ip: TStringField
      FieldName = 'db_ip'
      Size = 40
    end
    object mdDBSettingsdb_path: TStringField
      FieldName = 'db_path'
      Size = 500
    end
  end
  object dsmdDBSettings: TIBCDataSource
    DataSet = mdDBSettings
    Left = 1515
    Top = 80
  end
  object tblGlassType: TIBCQuery
    KeyFields = 'GLASS_TYPE_ID'
    KeyGenerator = 'GEN_GLASS_TYPE_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO GLASS_TYPE'
      
        '  (GLASS_TYPE_ID, GLASS_KIND_ID, GLASS_NAME, TEMPERED, DESCRIPTI' +
        'ON, GED_CODE, THICKNESS, AREA, BASE_COST, WASTE, GUI_SEQUENCE, I' +
        'S_VISIBLE)'
      'VALUES'
      
        '  (:GLASS_TYPE_ID, :GLASS_KIND_ID, :GLASS_NAME, :TEMPERED, :DESC' +
        'RIPTION, :GED_CODE, :THICKNESS, :AREA, :BASE_COST, :WASTE, :GUI_' +
        'SEQUENCE, :IS_VISIBLE)')
    SQLDelete.Strings = (
      'DELETE FROM GLASS_TYPE'
      'WHERE'
      '  GLASS_TYPE_ID = :Old_GLASS_TYPE_ID')
    SQLUpdate.Strings = (
      'UPDATE GLASS_TYPE'
      'SET'
      
        '  GLASS_TYPE_ID = :GLASS_TYPE_ID, GLASS_KIND_ID = :GLASS_KIND_ID' +
        ', GLASS_NAME = :GLASS_NAME, TEMPERED = :TEMPERED, DESCRIPTION = ' +
        ':DESCRIPTION, GED_CODE = :GED_CODE, THICKNESS = :THICKNESS, AREA' +
        ' = :AREA, BASE_COST = :BASE_COST, WASTE = :WASTE, GUI_SEQUENCE =' +
        ' :GUI_SEQUENCE, IS_VISIBLE = :IS_VISIBLE'
      'WHERE'
      '  GLASS_TYPE_ID = :Old_GLASS_TYPE_ID')
    SQLRefresh.Strings = (
      'select '
      '    glass_type.glass_type_id,'
      '    glass_type.glass_kind_id,'
      '    glass_type.glass_name,'
      '    glass_type.tempered,'
      '    glass_type.description,'
      '    glass_type.ged_code,'
      '    glass_type.thickness,'
      '    glass_type.area,'
      '    glass_type.base_cost,'
      '    glass_type.waste,'
      '    glass_type.cost,'
      '    glass_type.gui_sequence,'
      '    glass_type.is_visible,'
      '    glass_kind.glass_kind,'
      '    glass_kind.description'
      'from glass_kind'
      
        '   right outer join glass_type on (glass_kind.glass_kind_id = gl' +
        'ass_type.glass_kind_id)'
      'WHERE'
      '  GLASS_TYPE_ID = :GLASS_TYPE_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM GLASS_TYPE'
      'WHERE'
      'GLASS_TYPE_ID = :Old_GLASS_TYPE_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    glass_type.glass_type_id,'
      '    glass_type.glass_kind_id,'
      '    glass_type.glass_name,'
      '    glass_type.tempered,'
      '    glass_type.description,'
      '    glass_type.ged_code,'
      '    glass_type.thickness,'
      '    glass_type.area,'
      '    glass_type.base_cost,'
      '    glass_type.waste,'
      '    glass_type.cost,'
      '    glass_type.gui_sequence,'
      '    glass_type.is_visible,'
      '    glass_kind.glass_kind,'
      '    glass_kind.description'
      'from glass_kind'
      
        '   right outer join glass_type on (glass_kind.glass_kind_id = gl' +
        'ass_type.glass_kind_id)'
      'where glass_type.is_visible like :vp'
      'Order by glass_type.gui_sequence')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    IndexFieldNames = 'GLASS_TYPE_ID'
    AfterPost = tblGlassTypeAfterPost
    Left = 703
    Top = 359
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vp'
        Value = nil
      end>
  end
  object dsGlassType: TIBCDataSource
    DataSet = tblGlassType
    Left = 703
    Top = 412
  end
  object dsGlassKOuter: TIBCDataSource
    DataSet = tblGlassKOuter
    Left = 875
    Top = 412
  end
  object tblGlassKOuter: TIBCQuery
    KeyFields = 'GLASS_KIND_ID'
    KeyGenerator = 'GEN_GLASS_KIND_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO GLASS_KIND'
      
        '  (GLASS_KIND_ID, GLASS_KIND, DESCRIPTION, GUI_SEQUENCE_OUTER, G' +
        'UI_SEQUENCE_MIDDLE, GUI_SEQUENCE_INNER, IS_VISIBLE_OUTER, IS_VIS' +
        'IBLE_MIDDLE, IS_VISIBLE_INNER, OPERATOR, DATE_SAVED, OPERATOR_LA' +
        'ST_MODIFIED, DATE_LAST_MODIFIED)'
      'VALUES'
      
        '  (:GLASS_KIND_ID, :GLASS_KIND, :DESCRIPTION, :GUI_SEQUENCE_OUTE' +
        'R, :GUI_SEQUENCE_MIDDLE, :GUI_SEQUENCE_INNER, :IS_VISIBLE_OUTER,' +
        ' :IS_VISIBLE_MIDDLE, :IS_VISIBLE_INNER, :OPERATOR, :DATE_SAVED, ' +
        ':OPERATOR_LAST_MODIFIED, :DATE_LAST_MODIFIED)')
    SQLDelete.Strings = (
      'DELETE FROM GLASS_KIND'
      'WHERE'
      '  GLASS_KIND_ID = :Old_GLASS_KIND_ID')
    SQLUpdate.Strings = (
      'UPDATE GLASS_KIND'
      'SET'
      
        '  GLASS_KIND_ID = :GLASS_KIND_ID, GLASS_KIND = :GLASS_KIND, DESC' +
        'RIPTION = :DESCRIPTION, GUI_SEQUENCE_OUTER = :GUI_SEQUENCE_OUTER' +
        ', GUI_SEQUENCE_MIDDLE = :GUI_SEQUENCE_MIDDLE, GUI_SEQUENCE_INNER' +
        ' = :GUI_SEQUENCE_INNER, IS_VISIBLE_OUTER = :IS_VISIBLE_OUTER, IS' +
        '_VISIBLE_MIDDLE = :IS_VISIBLE_MIDDLE, IS_VISIBLE_INNER = :IS_VIS' +
        'IBLE_INNER, OPERATOR = :OPERATOR, DATE_SAVED = :DATE_SAVED, OPER' +
        'ATOR_LAST_MODIFIED = :OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED' +
        ' = :DATE_LAST_MODIFIED'
      'WHERE'
      '  GLASS_KIND_ID = :Old_GLASS_KIND_ID')
    SQLRefresh.Strings = (
      
        'SELECT GLASS_KIND_ID, GLASS_KIND, DESCRIPTION, GUI_SEQUENCE_OUTE' +
        'R, GUI_SEQUENCE_MIDDLE, GUI_SEQUENCE_INNER, IS_VISIBLE_OUTER, IS' +
        '_VISIBLE_MIDDLE, IS_VISIBLE_INNER, OPERATOR, DATE_SAVED, OPERATO' +
        'R_LAST_MODIFIED, DATE_LAST_MODIFIED FROM GLASS_KIND'
      'WHERE'
      '  GLASS_KIND_ID = :GLASS_KIND_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM GLASS_KIND'
      'WHERE'
      'GLASS_KIND_ID = :Old_GLASS_KIND_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from GLASS_KIND'
      'where IS_VISIBLE_OUTER like :vp'
      'Order by GUI_SEQUENCE_OUTER')
    LockMode = lmLockDelayed
    Filter = '[IS_VISIBLE_OUTER]=1'
    IndexFieldNames = 'GLASS_KIND_ID'
    Left = 876
    Top = 358
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vp'
        Value = nil
      end>
  end
  object dsPricing: TIBCDataSource
    DataSet = tblPricing
    Left = 242
    Top = 794
  end
  object tblPricing: TIBCQuery
    UpdatingTable = 'PRICING'
    KeyFields = 'PRICING_ID'
    KeyGenerator = 'GEN_PRICING_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO PRICING'
      
        '  (PRICING_ID, SM_ID, SC_ID, SNF_ID, NFS_COST, FRAME_HORIZ, FRAM' +
        'E_VERT, FRAME_PARTS, FRAME_LABOR_RATE, FRAME_MIN_LABOR, MULTIPLI' +
        'ER_1, MULTIPLIER_2, INSTALL_COST_FACTOR)'
      'VALUES'
      
        '  (:PRICING_ID, :SM_ID, :SC_ID, :SNF_ID, :NFS_COST, :FRAME_HORIZ' +
        ', :FRAME_VERT, :FRAME_PARTS, :FRAME_LABOR_RATE, :FRAME_MIN_LABOR' +
        ', :MULTIPLIER_1, :MULTIPLIER_2, :INSTALL_COST_FACTOR)')
    SQLDelete.Strings = (
      'DELETE FROM PRICING'
      'WHERE'
      '  PRICING_ID = :Old_PRICING_ID')
    SQLUpdate.Strings = (
      'UPDATE PRICING'
      'SET'
      
        '  PRICING_ID = :PRICING_ID, SM_ID = :SM_ID, SC_ID = :SC_ID, SNF_' +
        'ID = :SNF_ID, NFS_COST = :NFS_COST, FRAME_HORIZ = :FRAME_HORIZ, ' +
        'FRAME_VERT = :FRAME_VERT, FRAME_PARTS = :FRAME_PARTS, FRAME_LABO' +
        'R_RATE = :FRAME_LABOR_RATE, FRAME_MIN_LABOR = :FRAME_MIN_LABOR, ' +
        'MULTIPLIER_1 = :MULTIPLIER_1, MULTIPLIER_2 = :MULTIPLIER_2, INST' +
        'ALL_COST_FACTOR = :INSTALL_COST_FACTOR'
      'WHERE'
      '  PRICING_ID = :Old_PRICING_ID')
    SQLRefresh.Strings = (
      
        'SELECT PRICING_ID, SM_ID, SC_ID, SNF_ID, NFS_COST, FRAME_HORIZ, ' +
        'FRAME_VERT, FRAME_PARTS, FRAME_LABOR_RATE, FRAME_MIN_LABOR, MULT' +
        'IPLIER_1, MULTIPLIER_2, INSTALL_COST_FACTOR FROM PRICING'
      'WHERE'
      '  PRICING_ID = :PRICING_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM PRICING'
      'WHERE'
      'PRICING_ID = :Old_PRICING_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM PRICING'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    pricing.pricing_id,'
      '    pricing.sm_id,'
      '    pricing.sc_id,'
      '    pricing.snf_id,'
      '    pricing.nfs_cost,'
      '    pricing.frame_horiz,'
      '    pricing.frame_vert,'
      '    pricing.frame_parts,'
      '    pricing.frame_labor_rate,'
      '    pricing.frame_min_labor,'
      '    pricing.multiplier_1,'
      '    pricing.multiplier_2,'
      '    pricing.install_cost_factor,'
      '    series_model.model_id,'
      '    series_model.series_id,'
      '    series_color.color_id,'
      '    series_nailfin.nailfin_id'
      'from series_nailfin'
      
        '   right outer join pricing on (series_nailfin.snf_id = pricing.' +
        'snf_id)'
      
        '   left outer join series_model on (pricing.sm_id = series_model' +
        '.sm_id)'
      
        '   left outer join series_color on (pricing.sc_id = series_color' +
        '.sc_id)'
      'Where series_model.series_id = :series_id')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Options.DetailDelay = 1
    IndexFieldNames = 'PRICING_ID'
    Left = 242
    Top = 740
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'series_id'
        Value = nil
      end>
  end
  object dsGlassKMiddle: TIBCDataSource
    DataSet = tblGlassKMiddle
    Left = 983
    Top = 412
  end
  object tblGlassKMiddle: TIBCQuery
    KeyFields = 'GLASS_KIND_ID'
    KeyGenerator = 'GEN_GLASS_KIND_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO GLASS_KIND'
      
        '  (GLASS_KIND_ID, GLASS_KIND, DESCRIPTION, GUI_SEQUENCE_OUTER, G' +
        'UI_SEQUENCE_MIDDLE, GUI_SEQUENCE_INNER, IS_VISIBLE_OUTER, IS_VIS' +
        'IBLE_MIDDLE, IS_VISIBLE_INNER, OPERATOR, DATE_SAVED, OPERATOR_LA' +
        'ST_MODIFIED, DATE_LAST_MODIFIED)'
      'VALUES'
      
        '  (:GLASS_KIND_ID, :GLASS_KIND, :DESCRIPTION, :GUI_SEQUENCE_OUTE' +
        'R, :GUI_SEQUENCE_MIDDLE, :GUI_SEQUENCE_INNER, :IS_VISIBLE_OUTER,' +
        ' :IS_VISIBLE_MIDDLE, :IS_VISIBLE_INNER, :OPERATOR, :DATE_SAVED, ' +
        ':OPERATOR_LAST_MODIFIED, :DATE_LAST_MODIFIED)')
    SQLDelete.Strings = (
      'DELETE FROM GLASS_KIND'
      'WHERE'
      '  GLASS_KIND_ID = :Old_GLASS_KIND_ID')
    SQLUpdate.Strings = (
      'UPDATE GLASS_KIND'
      'SET'
      
        '  GLASS_KIND_ID = :GLASS_KIND_ID, GLASS_KIND = :GLASS_KIND, DESC' +
        'RIPTION = :DESCRIPTION, GUI_SEQUENCE_OUTER = :GUI_SEQUENCE_OUTER' +
        ', GUI_SEQUENCE_MIDDLE = :GUI_SEQUENCE_MIDDLE, GUI_SEQUENCE_INNER' +
        ' = :GUI_SEQUENCE_INNER, IS_VISIBLE_OUTER = :IS_VISIBLE_OUTER, IS' +
        '_VISIBLE_MIDDLE = :IS_VISIBLE_MIDDLE, IS_VISIBLE_INNER = :IS_VIS' +
        'IBLE_INNER, OPERATOR = :OPERATOR, DATE_SAVED = :DATE_SAVED, OPER' +
        'ATOR_LAST_MODIFIED = :OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED' +
        ' = :DATE_LAST_MODIFIED'
      'WHERE'
      '  GLASS_KIND_ID = :Old_GLASS_KIND_ID')
    SQLRefresh.Strings = (
      
        'SELECT GLASS_KIND_ID, GLASS_KIND, DESCRIPTION, GUI_SEQUENCE_OUTE' +
        'R, GUI_SEQUENCE_MIDDLE, GUI_SEQUENCE_INNER, IS_VISIBLE_OUTER, IS' +
        '_VISIBLE_MIDDLE, IS_VISIBLE_INNER, OPERATOR, DATE_SAVED, OPERATO' +
        'R_LAST_MODIFIED, DATE_LAST_MODIFIED FROM GLASS_KIND'
      'WHERE'
      '  GLASS_KIND_ID = :GLASS_KIND_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM GLASS_KIND'
      'WHERE'
      'GLASS_KIND_ID = :Old_GLASS_KIND_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from GLASS_KIND'
      'where IS_VISIBLE_MIDDLE like :vp'
      'Order by GUI_SEQUENCE_MIDDLE')
    LockMode = lmLockDelayed
    Filter = '[IS_VISIBLE_MIDDLE] = 1'
    IndexFieldNames = 'GLASS_KIND_ID'
    Left = 983
    Top = 358
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vp'
        Value = nil
      end>
  end
  object dsGlassKInner: TIBCDataSource
    DataSet = tblGlassKInner
    Left = 1098
    Top = 412
  end
  object tblGlassKInner: TIBCQuery
    KeyFields = 'GLASS_KIND_ID'
    KeyGenerator = 'GEN_GLASS_KIND_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO GLASS_KIND'
      
        '  (GLASS_KIND_ID, GLASS_KIND, DESCRIPTION, GUI_SEQUENCE_OUTER, G' +
        'UI_SEQUENCE_MIDDLE, GUI_SEQUENCE_INNER, IS_VISIBLE_OUTER, IS_VIS' +
        'IBLE_MIDDLE, IS_VISIBLE_INNER, OPERATOR, DATE_SAVED, OPERATOR_LA' +
        'ST_MODIFIED, DATE_LAST_MODIFIED)'
      'VALUES'
      
        '  (:GLASS_KIND_ID, :GLASS_KIND, :DESCRIPTION, :GUI_SEQUENCE_OUTE' +
        'R, :GUI_SEQUENCE_MIDDLE, :GUI_SEQUENCE_INNER, :IS_VISIBLE_OUTER,' +
        ' :IS_VISIBLE_MIDDLE, :IS_VISIBLE_INNER, :OPERATOR, :DATE_SAVED, ' +
        ':OPERATOR_LAST_MODIFIED, :DATE_LAST_MODIFIED)')
    SQLDelete.Strings = (
      'DELETE FROM GLASS_KIND'
      'WHERE'
      '  GLASS_KIND_ID = :Old_GLASS_KIND_ID')
    SQLUpdate.Strings = (
      'UPDATE GLASS_KIND'
      'SET'
      
        '  GLASS_KIND_ID = :GLASS_KIND_ID, GLASS_KIND = :GLASS_KIND, DESC' +
        'RIPTION = :DESCRIPTION, GUI_SEQUENCE_OUTER = :GUI_SEQUENCE_OUTER' +
        ', GUI_SEQUENCE_MIDDLE = :GUI_SEQUENCE_MIDDLE, GUI_SEQUENCE_INNER' +
        ' = :GUI_SEQUENCE_INNER, IS_VISIBLE_OUTER = :IS_VISIBLE_OUTER, IS' +
        '_VISIBLE_MIDDLE = :IS_VISIBLE_MIDDLE, IS_VISIBLE_INNER = :IS_VIS' +
        'IBLE_INNER, OPERATOR = :OPERATOR, DATE_SAVED = :DATE_SAVED, OPER' +
        'ATOR_LAST_MODIFIED = :OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED' +
        ' = :DATE_LAST_MODIFIED'
      'WHERE'
      '  GLASS_KIND_ID = :Old_GLASS_KIND_ID')
    SQLRefresh.Strings = (
      
        'SELECT GLASS_KIND_ID, GLASS_KIND, DESCRIPTION, GUI_SEQUENCE_OUTE' +
        'R, GUI_SEQUENCE_MIDDLE, GUI_SEQUENCE_INNER, IS_VISIBLE_OUTER, IS' +
        '_VISIBLE_MIDDLE, IS_VISIBLE_INNER, OPERATOR, DATE_SAVED, OPERATO' +
        'R_LAST_MODIFIED, DATE_LAST_MODIFIED FROM GLASS_KIND'
      'WHERE'
      '  GLASS_KIND_ID = :GLASS_KIND_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM GLASS_KIND'
      'WHERE'
      'GLASS_KIND_ID = :Old_GLASS_KIND_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from GLASS_KIND'
      'where IS_VISIBLE_INNER like :vp'
      'Order by GUI_SEQUENCE_INNER')
    LockMode = lmLockDelayed
    Filter = '[IS_VISIBLE_INNER] = 1'
    IndexFieldNames = 'GLASS_KIND_ID'
    Left = 1098
    Top = 358
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vp'
        Value = nil
      end>
  end
  object dsGlassEdge: TIBCDataSource
    DataSet = tblGlassEdge
    Left = 40
    Top = 794
  end
  object tblGlassEdge: TIBCQuery
    KeyFields = 'GLASS_EDGE_ID'
    KeyGenerator = 'GEN_GLASS_EDGE_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO GLASS_EDGE'
      
        '  (GLASS_EDGE_ID, EDGE, DESCRIPTION, BASE_COST, WASTE, LABOR, GE' +
        'D_CODE)'
      'VALUES'
      
        '  (:GLASS_EDGE_ID, :EDGE, :DESCRIPTION, :BASE_COST, :WASTE, :LAB' +
        'OR, :GED_CODE)')
    SQLDelete.Strings = (
      'DELETE FROM GLASS_EDGE'
      'WHERE'
      '  GLASS_EDGE_ID = :Old_GLASS_EDGE_ID')
    SQLUpdate.Strings = (
      'UPDATE GLASS_EDGE'
      'SET'
      
        '  GLASS_EDGE_ID = :GLASS_EDGE_ID, EDGE = :EDGE, DESCRIPTION = :D' +
        'ESCRIPTION, BASE_COST = :BASE_COST, WASTE = :WASTE, LABOR = :LAB' +
        'OR, GED_CODE = :GED_CODE'
      'WHERE'
      '  GLASS_EDGE_ID = :Old_GLASS_EDGE_ID')
    SQLRefresh.Strings = (
      
        'SELECT GLASS_EDGE_ID, EDGE, DESCRIPTION, BASE_COST, WASTE, LABOR' +
        ', GED_CODE, COST FROM GLASS_EDGE'
      'WHERE'
      '  GLASS_EDGE_ID = :GLASS_EDGE_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM GLASS_EDGE'
      'WHERE'
      'GLASS_EDGE_ID = :Old_GLASS_EDGE_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from GLASS_EDGE')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    IndexFieldNames = 'GLASS_EDGE_ID'
    Left = 40
    Top = 740
  end
  object tblGridCost: TIBCQuery
    UpdatingTable = 'GRIDS'
    KeyFields = 'GRIDS_ID'
    KeyGenerator = 'GEN_GRIDS_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO GRIDS'
      
        '  (GRIDS_ID, GKIND_ID, GPAT_ID, BASE_COST, WASTE, OPERATOR, DATE' +
        '_SAVED, OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED)'
      'VALUES'
      
        '  (:GRIDS_ID, :GKIND_ID, :GPAT_ID, :BASE_COST, :WASTE, :OPERATOR' +
        ', :DATE_SAVED, :OPERATOR_LAST_MODIFIED, :DATE_LAST_MODIFIED)')
    SQLDelete.Strings = (
      'DELETE FROM GRIDS'
      'WHERE'
      '  GRIDS_ID = :Old_GRIDS_ID')
    SQLUpdate.Strings = (
      'UPDATE GRIDS'
      'SET'
      
        '  GRIDS_ID = :GRIDS_ID, GKIND_ID = :GKIND_ID, GPAT_ID = :GPAT_ID' +
        ', BASE_COST = :BASE_COST, WASTE = :WASTE, OPERATOR = :OPERATOR, ' +
        'DATE_SAVED = :DATE_SAVED, OPERATOR_LAST_MODIFIED = :OPERATOR_LAS' +
        'T_MODIFIED, DATE_LAST_MODIFIED = :DATE_LAST_MODIFIED'
      'WHERE'
      '  GRIDS_ID = :Old_GRIDS_ID')
    SQLRefresh.Strings = (
      
        'SELECT GRIDS_ID, GKIND_ID, GPAT_ID, BASE_COST, WASTE, OPERATOR, ' +
        'DATE_SAVED, OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED, COST FRO' +
        'M GRIDS'
      'WHERE'
      '  GRIDS_ID = :GRIDS_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM GRIDS'
      'WHERE'
      'GRIDS_ID = :Old_GRIDS_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    grids.grids_id,'
      '    grids.gkind_id,'
      '    grids.gpat_id,'
      '    grids.base_cost,'
      '    grids.waste,'
      '    grids.cost,'
      '    grids.operator,'
      '    grids.date_saved,'
      '    grids.operator_last_modified,'
      '    grids.date_last_modified,'
      '    grid_kind.gkind_name,'
      '    grid_kind.gkind_description,'
      '    grid_pattern.gpattern_name,'
      '    grid_pattern.gpattern_description'
      'from grid_pattern'
      
        '   right outer join grids on (grid_pattern.gpat_id = grids.gpat_' +
        'id)'
      
        '   left outer join grid_kind on (grids.gkind_id = grid_kind.gkin' +
        'd_id)')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    IndexFieldNames = 'GRIDS_ID'
    Left = 615
    Top = 221
  end
  object dsGridCost: TIBCDataSource
    DataSet = tblGridCost
    Left = 615
    Top = 279
  end
  object tblPaint: TIBCQuery
    KeyFields = 'PAINT_ID'
    KeyGenerator = 'GEN_PAINT_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO PAINT'
      
        '  (PAINT_ID, PAINT_NAME, PAINT_DESCRIPTION, GUI_SEQUENCE, OPERAT' +
        'OR, DATE_SAVED, OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED)'
      'VALUES'
      
        '  (:PAINT_ID, :PAINT_NAME, :PAINT_DESCRIPTION, :GUI_SEQUENCE, :O' +
        'PERATOR, :DATE_SAVED, :OPERATOR_LAST_MODIFIED, :DATE_LAST_MODIFI' +
        'ED)')
    SQLDelete.Strings = (
      'DELETE FROM PAINT'
      'WHERE'
      '  PAINT_ID = :Old_PAINT_ID')
    SQLUpdate.Strings = (
      'UPDATE PAINT'
      'SET'
      
        '  PAINT_ID = :PAINT_ID, PAINT_NAME = :PAINT_NAME, PAINT_DESCRIPT' +
        'ION = :PAINT_DESCRIPTION, GUI_SEQUENCE = :GUI_SEQUENCE, OPERATOR' +
        ' = :OPERATOR, DATE_SAVED = :DATE_SAVED, OPERATOR_LAST_MODIFIED =' +
        ' :OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED = :DATE_LAST_MODIFI' +
        'ED'
      'WHERE'
      '  PAINT_ID = :Old_PAINT_ID')
    SQLRefresh.Strings = (
      
        'SELECT PAINT_ID, PAINT_NAME, PAINT_DESCRIPTION, GUI_SEQUENCE, OP' +
        'ERATOR, DATE_SAVED, OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED F' +
        'ROM PAINT'
      'WHERE'
      '  PAINT_ID = :PAINT_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM PAINT'
      'WHERE'
      'PAINT_ID = :Old_PAINT_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from PAINT'
      'Order by GUI_SEQUENCE')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 360
    Top = 740
  end
  object dsPaint: TIBCDataSource
    DataSet = tblPaint
    Left = 360
    Top = 794
  end
  object tblPaint_SM: TIBCQuery
    UpdatingTable = 'PAINT_SM'
    KeyFields = 'PAINT_SM_ID'
    KeyGenerator = 'GEN_PAINT_SM_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO PAINT_SM'
      
        '  (PAINT_SM_ID, SM_ID, PAINT_ID, COST, IS_VISIBLE, IS_DEFAULT, G' +
        'UI_SEQUENCE)'
      'VALUES'
      
        '  (:PAINT_SM_ID, :SM_ID, :PAINT_ID, :COST, :IS_VISIBLE, :IS_DEFA' +
        'ULT, :GUI_SEQUENCE)')
    SQLDelete.Strings = (
      'DELETE FROM PAINT_SM'
      'WHERE'
      '  PAINT_SM_ID = :Old_PAINT_SM_ID')
    SQLUpdate.Strings = (
      'UPDATE PAINT_SM'
      'SET'
      
        '  PAINT_SM_ID = :PAINT_SM_ID, SM_ID = :SM_ID, PAINT_ID = :PAINT_' +
        'ID, COST = :COST, IS_VISIBLE = :IS_VISIBLE, IS_DEFAULT = :IS_DEF' +
        'AULT, GUI_SEQUENCE = :GUI_SEQUENCE'
      'WHERE'
      '  PAINT_SM_ID = :Old_PAINT_SM_ID')
    SQLRefresh.Strings = (
      
        'SELECT PAINT_SM_ID, SM_ID, PAINT_ID, COST, IS_VISIBLE, IS_DEFAUL' +
        'T, GUI_SEQUENCE FROM PAINT_SM'
      'WHERE'
      '  PAINT_SM_ID = :PAINT_SM_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM PAINT_SM'
      'WHERE'
      'PAINT_SM_ID = :Old_PAINT_SM_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM PAINT_SM'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '  paint_sm.paint_sm_id,'
      '  paint_sm.sm_id,'
      '  paint_sm.paint_id,'
      '  paint_sm.cost,'
      '  paint_sm.is_visible,'
      '  paint_sm.is_default,'
      '  paint_sm.gui_sequence,'
      '  series_model.series_id,'
      '  series_model.model_id,'
      '  paint.paint_name,'
      '  paint.paint_description'
      'from paint'
      
        '   right outer join paint_sm on (paint.paint_id = paint_sm.paint' +
        '_id)'
      
        '   left outer join series_model on (paint_sm.sm_id = series_mode' +
        'l.sm_id)'
      'Where (paint_sm.sm_id = :sm_id)'
      'And (paint_sm.IS_VISIBLE like :vp) '
      'Order by paint_sm.GUI_SEQUENCE')
    MasterSource = dsSeriesModel
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 426
    Top = 740
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SM_ID'
        ParamType = ptInput
        Value = 126
      end
      item
        DataType = ftUnknown
        Name = 'vp'
        Value = nil
      end>
  end
  object dsPaint_SM: TIBCDataSource
    DataSet = tblPaint_SM
    Left = 426
    Top = 794
  end
  object tblScreen_SM: TIBCQuery
    UpdatingTable = 'SCREEN_SM'
    KeyFields = 'SCREEN_SM_ID'
    KeyGenerator = 'GEN_SCREEN_SM_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO SCREEN_SM'
      
        '  (SCREEN_SM_ID, SCREEN_ID, SM_ID, COST, IS_VISIBLE, IS_DEFAULT,' +
        ' QUANTITY, WIDTH_DEDUCT, WIDTH_DIVISOR, HEIGHT_DEDUCT, HEIGHT_DI' +
        'VISOR, GUI_SEQUENCE)'
      'VALUES'
      
        '  (:SCREEN_SM_ID, :SCREEN_ID, :SM_ID, :COST, :IS_VISIBLE, :IS_DE' +
        'FAULT, :QUANTITY, :WIDTH_DEDUCT, :WIDTH_DIVISOR, :HEIGHT_DEDUCT,' +
        ' :HEIGHT_DIVISOR, :GUI_SEQUENCE)')
    SQLDelete.Strings = (
      'DELETE FROM SCREEN_SM'
      'WHERE'
      '  SCREEN_SM_ID = :Old_SCREEN_SM_ID')
    SQLUpdate.Strings = (
      'UPDATE SCREEN_SM'
      'SET'
      
        '  SCREEN_SM_ID = :SCREEN_SM_ID, SCREEN_ID = :SCREEN_ID, SM_ID = ' +
        ':SM_ID, COST = :COST, IS_VISIBLE = :IS_VISIBLE, IS_DEFAULT = :IS' +
        '_DEFAULT, QUANTITY = :QUANTITY, WIDTH_DEDUCT = :WIDTH_DEDUCT, WI' +
        'DTH_DIVISOR = :WIDTH_DIVISOR, HEIGHT_DEDUCT = :HEIGHT_DEDUCT, HE' +
        'IGHT_DIVISOR = :HEIGHT_DIVISOR, GUI_SEQUENCE = :GUI_SEQUENCE'
      'WHERE'
      '  SCREEN_SM_ID = :Old_SCREEN_SM_ID')
    SQLRefresh.Strings = (
      
        'SELECT SCREEN_SM_ID, SCREEN_ID, SM_ID, COST, IS_VISIBLE, IS_DEFA' +
        'ULT, QUANTITY, WIDTH_DEDUCT, WIDTH_DIVISOR, HEIGHT_DEDUCT, HEIGH' +
        'T_DIVISOR, GUI_SEQUENCE FROM SCREEN_SM'
      'WHERE'
      '  SCREEN_SM_ID = :SCREEN_SM_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM SCREEN_SM'
      'WHERE'
      'SCREEN_SM_ID = :Old_SCREEN_SM_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM SCREEN_SM'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    screen_sm.screen_sm_id,'
      '    screen_sm.screen_id,'
      '    screen_sm.sm_id,'
      '    screen_sm.cost,'
      '    screen_sm.is_visible,'
      '    screen_sm.is_default,'
      '    screen_sm.quantity,'
      '    screen_sm.width_deduct,'
      '    screen_sm.width_divisor,'
      '    screen_sm.height_deduct,'
      '    screen_sm.height_divisor,'
      '    screen_sm.gui_sequence,'
      '    screen.screen_name,'
      '    screen.screen_description,'
      '    series_model.series_id,'
      '    series_model.model_id,'
      '    models.model_name,'
      '    models.model_description,'
      '    series.series_name,'
      '    series.series_description'
      'from series'
      
        '   right outer join series_model on (series.series_id = series_m' +
        'odel.series_id)'
      
        '   right outer join screen_sm on (series_model.sm_id = screen_sm' +
        '.sm_id)'
      '   inner join screen on (screen_sm.screen_id = screen.screen_id)'
      
        '   left outer join models on (series_model.model_id = models.mod' +
        'el_id)'
      'Where (screen_sm.sm_id = :sm_id)'
      'and (screen_sm.IS_VISIBLE like :vp)'
      'Order by screen_sm.GUI_SEQUENCE')
    MasterSource = dsSeriesModel
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 172
    Top = 740
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sm_id'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'vp'
        Value = nil
      end>
  end
  object dsScreen_SM: TIBCDataSource
    DataSet = tblScreen_SM
    Left = 172
    Top = 794
  end
  object tblSTC_SM: TIBCQuery
    KeyFields = 'STC_SM_ID'
    KeyGenerator = 'GEN_STC_SM_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO STC_SM'
      
        '  (STC_SM_ID, SM_ID, STC, GT_INNER, GT_MIDDLE, GT_OUTER, TYPE_IN' +
        'NER, TYPE_MIDDLE, TYPE_OUTER, IS_VISIBLE, GUI_SEQUENCE, OPERATOR' +
        ', DATE_SAVED, OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED)'
      'VALUES'
      
        '  (:STC_SM_ID, :SM_ID, :STC, :GT_INNER, :GT_MIDDLE, :GT_OUTER, :' +
        'TYPE_INNER, :TYPE_MIDDLE, :TYPE_OUTER, :IS_VISIBLE, :GUI_SEQUENC' +
        'E, :OPERATOR, :DATE_SAVED, :OPERATOR_LAST_MODIFIED, :DATE_LAST_M' +
        'ODIFIED)')
    SQLDelete.Strings = (
      'DELETE FROM STC_SM'
      'WHERE'
      '  STC_SM_ID = :Old_STC_SM_ID')
    SQLUpdate.Strings = (
      'UPDATE STC_SM'
      'SET'
      
        '  STC_SM_ID = :STC_SM_ID, SM_ID = :SM_ID, STC = :STC, GT_INNER =' +
        ' :GT_INNER, GT_MIDDLE = :GT_MIDDLE, GT_OUTER = :GT_OUTER, TYPE_I' +
        'NNER = :TYPE_INNER, TYPE_MIDDLE = :TYPE_MIDDLE, TYPE_OUTER = :TY' +
        'PE_OUTER, IS_VISIBLE = :IS_VISIBLE, GUI_SEQUENCE = :GUI_SEQUENCE' +
        ', OPERATOR = :OPERATOR, DATE_SAVED = :DATE_SAVED, OPERATOR_LAST_' +
        'MODIFIED = :OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED = :DATE_L' +
        'AST_MODIFIED'
      'WHERE'
      '  STC_SM_ID = :Old_STC_SM_ID')
    SQLRefresh.Strings = (
      
        'SELECT STC_SM_ID, SM_ID, STC, GT_INNER, GT_MIDDLE, GT_OUTER, TYP' +
        'E_INNER, TYPE_MIDDLE, TYPE_OUTER, IS_VISIBLE, GUI_SEQUENCE, OPER' +
        'ATOR, DATE_SAVED, OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED FRO' +
        'M STC_SM'
      'WHERE'
      '  STC_SM_ID = :STC_SM_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM STC_SM'
      'WHERE'
      'STC_SM_ID = :Old_STC_SM_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from STC_SM'
      'where (SM_ID = :SM_ID) And (IS_VISIBLE like :vp)'
      'Order by GUI_SEQUENCE')
    MasterSource = dsSeriesModel
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    AfterInsert = tblSTC_SMAfterInsert
    Left = 305
    Top = 740
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SM_ID'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'vp'
        Value = nil
      end>
  end
  object dsSTC_SM: TIBCDataSource
    DataSet = tblSTC_SM
    Left = 305
    Top = 794
  end
  object dsSeriesHanding_lookup: TIBCDataSource
    DataSet = tblSeriesHanding_lookup
    Left = 1167
    Top = 151
  end
  object tblSeriesHanding_lookup: TIBCQuery
    UpdatingTable = 'HANDING_SM'
    KeyFields = 'HSM_ID'
    KeyGenerator = 'GEN_HANDING_SM_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO HANDING_SM'
      '  (HSM_ID, HANDING_ID, SM_ID, IS_VISIBLE)'
      'VALUES'
      '  (:HSM_ID, :HANDING_ID, :SM_ID, :IS_VISIBLE)')
    SQLDelete.Strings = (
      'DELETE FROM HANDING_SM'
      'WHERE'
      '  HSM_ID = :Old_HSM_ID')
    SQLUpdate.Strings = (
      'UPDATE HANDING_SM'
      'SET'
      
        '  HSM_ID = :HSM_ID, HANDING_ID = :HANDING_ID, SM_ID = :SM_ID, IS' +
        '_VISIBLE = :IS_VISIBLE'
      'WHERE'
      '  HSM_ID = :Old_HSM_ID')
    SQLRefresh.Strings = (
      'SELECT HSM_ID, HANDING_ID, SM_ID, IS_VISIBLE FROM HANDING_SM'
      'WHERE'
      '  HSM_ID = :HSM_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM HANDING_SM'
      'WHERE'
      'HSM_ID = :Old_HSM_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    handing_sm.hsm_id,'
      '    handing_sm.handing_id,'
      '    handing_sm.sm_id,'
      '    handing_sm.is_visible,'
      '    handing.handing_name,'
      '    handing.handing_description,'
      '    handing.viewed_from,'
      '    series_model.series_id,'
      '    series_model.model_id,'
      '    models.model_name,'
      '    models.model_description,'
      '    series.series_description,'
      '    series.series_name'
      'from series'
      
        '   right outer join series_model on (series.series_id = series_m' +
        'odel.series_id)'
      
        '   right outer join handing_sm on (series_model.sm_id = handing_' +
        'sm.sm_id)'
      
        '   left outer join handing on (handing_sm.handing_id = handing.h' +
        'anding_id)'
      
        '   left outer join models on (series_model.model_id = models.mod' +
        'el_id)'
      'where handing_sm.IS_VISIBLE = 1'
      'Order by handing.GUI_SEQUENCE')
    LockMode = lmLockDelayed
    Left = 1169
    Top = 98
  end
  object tblPaint_SM_lookup: TIBCQuery
    UpdatingTable = 'PAINT_SM'
    KeyFields = 'PAINT_SM_ID'
    KeyGenerator = 'GEN_PAINT_SM_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO PAINT_SM'
      
        '  (PAINT_SM_ID, SM_ID, PAINT_ID, COST, IS_VISIBLE, IS_DEFAULT, G' +
        'UI_SEQUENCE)'
      'VALUES'
      
        '  (:PAINT_SM_ID, :SM_ID, :PAINT_ID, :COST, :IS_VISIBLE, :IS_DEFA' +
        'ULT, :GUI_SEQUENCE)')
    SQLDelete.Strings = (
      'DELETE FROM PAINT_SM'
      'WHERE'
      '  PAINT_SM_ID = :Old_PAINT_SM_ID')
    SQLUpdate.Strings = (
      'UPDATE PAINT_SM'
      'SET'
      
        '  PAINT_SM_ID = :PAINT_SM_ID, SM_ID = :SM_ID, PAINT_ID = :PAINT_' +
        'ID, COST = :COST, IS_VISIBLE = :IS_VISIBLE, IS_DEFAULT = :IS_DEF' +
        'AULT, GUI_SEQUENCE = :GUI_SEQUENCE'
      'WHERE'
      '  PAINT_SM_ID = :Old_PAINT_SM_ID')
    SQLRefresh.Strings = (
      
        'SELECT PAINT_SM_ID, SM_ID, PAINT_ID, COST, IS_VISIBLE, IS_DEFAUL' +
        'T, GUI_SEQUENCE FROM PAINT_SM'
      'WHERE'
      '  PAINT_SM_ID = :PAINT_SM_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM PAINT_SM'
      'WHERE'
      'PAINT_SM_ID = :Old_PAINT_SM_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM PAINT_SM'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '  paint_sm.paint_sm_id,'
      '  paint_sm.sm_id,'
      '  paint_sm.paint_id,'
      '  paint_sm.cost,'
      '  paint_sm.is_visible,'
      '  paint_sm.gui_sequence,'
      '  series_model.series_id,'
      '  series_model.model_id,'
      '  paint.paint_name,'
      '  paint.paint_description'
      'from paint'
      
        '   right outer join paint_sm on (paint.paint_id = paint_sm.paint' +
        '_id)'
      
        '   left outer join series_model on (paint_sm.sm_id = series_mode' +
        'l.sm_id)'
      'Where paint_sm.IS_VISIBLE = 1'
      'Order by paint_sm.GUI_SEQUENCE')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 514
    Top = 739
  end
  object dsPaint_SM_lookup: TIBCDataSource
    DataSet = tblPaint_SM_lookup
    Left = 514
    Top = 793
  end
  object tblEnergy: TIBCQuery
    KeyFields = 'ENERGY_ID'
    KeyGenerator = 'GEN_ENERGY_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO ENERGY'
      
        '  (ENERGY_ID, SM_ID, CPD, PRODUCT_CODE, GLASS_KIND_ID_OUTER, GLA' +
        'SS_KIND_ID_INNER, GLASS_KIND_ID_MIDDLE, GAS_ID, GKIND_ID, GLASS_' +
        'EDGE_ID, U_FACTOR, SHGC, VT, AIR_LEAK, CONDENSATION)'
      'VALUES'
      
        '  (:ENERGY_ID, :SM_ID, :CPD, :PRODUCT_CODE, :GLASS_KIND_ID_OUTER' +
        ', :GLASS_KIND_ID_INNER, :GLASS_KIND_ID_MIDDLE, :GAS_ID, :GKIND_I' +
        'D, :GLASS_EDGE_ID, :U_FACTOR, :SHGC, :VT, :AIR_LEAK, :CONDENSATI' +
        'ON)')
    SQLDelete.Strings = (
      'DELETE FROM ENERGY'
      'WHERE'
      '  ENERGY_ID = :Old_ENERGY_ID')
    SQLUpdate.Strings = (
      'UPDATE ENERGY'
      'SET'
      
        '  ENERGY_ID = :ENERGY_ID, SM_ID = :SM_ID, CPD = :CPD, PRODUCT_CO' +
        'DE = :PRODUCT_CODE, GLASS_KIND_ID_OUTER = :GLASS_KIND_ID_OUTER, ' +
        'GLASS_KIND_ID_INNER = :GLASS_KIND_ID_INNER, GLASS_KIND_ID_MIDDLE' +
        ' = :GLASS_KIND_ID_MIDDLE, GAS_ID = :GAS_ID, GKIND_ID = :GKIND_ID' +
        ', GLASS_EDGE_ID = :GLASS_EDGE_ID, U_FACTOR = :U_FACTOR, SHGC = :' +
        'SHGC, VT = :VT, AIR_LEAK = :AIR_LEAK, CONDENSATION = :CONDENSATI' +
        'ON'
      'WHERE'
      '  ENERGY_ID = :Old_ENERGY_ID')
    SQLRefresh.Strings = (
      
        'SELECT ENERGY_ID, SM_ID, CPD, PRODUCT_CODE, GLASS_KIND_ID_OUTER,' +
        ' GLASS_KIND_ID_INNER, GLASS_KIND_ID_MIDDLE, GAS_ID, GKIND_ID, GL' +
        'ASS_EDGE_ID, U_FACTOR, SHGC, VT, AIR_LEAK, CONDENSATION FROM ENE' +
        'RGY'
      'WHERE'
      '  ENERGY_ID = :ENERGY_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM ENERGY'
      'WHERE'
      'ENERGY_ID = :Old_ENERGY_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from ENERGY'
      'where sm_id = :p_sm_id')
    MasterSource = dsSeriesModel
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 1190
    Top = 358
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_sm_id'
        Value = nil
      end>
  end
  object dsEnergy: TIBCDataSource
    DataSet = tblEnergy
    Left = 1190
    Top = 412
  end
  object stylelblEgressSt: TcxEditStyleController
    Style.LookAndFeel.NativeStyle = False
    Style.TextColor = clFuchsia
    Style.ButtonStyle = btsUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    Left = 967
    Top = 7
    PixelsPerInch = 96
  end
  object tblTract: TIBCQuery
    UpdatingTable = 'TRACT'
    KeyFields = 'TRACT_ID'
    KeyGenerator = 'GEN_TRACT_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO TRACT'
      
        '  (TRACT_ID, CUSTOMER_ID, TRACT_NAME, TRACT_NUMBER, TRACT_TYPE_I' +
        'D, ZIPNTAX_ID, SERIES_ID, SC_ID, SNF_ID, GLASS_KIND_ID_OUTER, GL' +
        'ASS_KIND_ID_MIDDLE, GLASS_KIND_ID_INNER, GAS_ID, GLAZING_ID, GLA' +
        'SS_EDGE_ID, GRIDS_ID, CROSS_STREET_1, CROSS_STREET_2, CLINIC_ADD' +
        'RESS, EMERG_DIRECTIONS, NFS, UFZ, NOTES, INSTALL_DESCRIPTION, DO' +
        'UBLE_CAULK, FASTENER_ACC_ID, CAULK_ACC_ID, WINDOW_FLASH_ACC_ID, ' +
        'DOOR_FLASH_ACC_ID, ACCESSORIES_ACC_ID, GRID_COLOR_STATUS_ID, SAL' +
        'ES_ZONE_ID, TOTAL_HOUSING_UNITS, REMAINING_HOUSING_UNITS, BID_DU' +
        'E_DATE, PAINT_NAME, SECURITY_BAR, SECOND_LOCK, FILM_NAME, XO_UVA' +
        'LUE, XO_SHGC, XO_STC, SH_UVALUE, SH_SHGC, SH_STC, FIX_UVALUE, FI' +
        'X_SHGC, FIX_STC, PD_UVALUE, PD_SHGC, PD_STC, IS_TRACT_ON_HOLD, I' +
        'S_OCIP, OCIP_RATE, OCIP_DEDUCT, CONTRACT_STATUS, PRICE_HOLD_DATE' +
        ', LAST_PRICE_INCREASE_DATE, BUSINESS_LICENSE_DATE, INSURANCE_CER' +
        'TS_DATE, START_SHIPING_DATE, RO_SEND_DATE, INSTALL_NOTES, NEXT_P' +
        'HASE_DATE_1, NEXT_PHASE_DATE_2, UID_OPERATOR, UID_PROJECT_MANAGE' +
        'R, IS_STC, IS_ENHANCED)'
      'VALUES'
      
        '  (:TRACT_ID, :CUSTOMER_ID, :TRACT_NAME, :TRACT_NUMBER, :TRACT_T' +
        'YPE_ID, :ZIPNTAX_ID, :SERIES_ID, :SC_ID, :SNF_ID, :GLASS_KIND_ID' +
        '_OUTER, :GLASS_KIND_ID_MIDDLE, :GLASS_KIND_ID_INNER, :GAS_ID, :G' +
        'LAZING_ID, :GLASS_EDGE_ID, :GRIDS_ID, :CROSS_STREET_1, :CROSS_ST' +
        'REET_2, :CLINIC_ADDRESS, :EMERG_DIRECTIONS, :NFS, :UFZ, :NOTES, ' +
        ':INSTALL_DESCRIPTION, :DOUBLE_CAULK, :FASTENER_ACC_ID, :CAULK_AC' +
        'C_ID, :WINDOW_FLASH_ACC_ID, :DOOR_FLASH_ACC_ID, :ACCESSORIES_ACC' +
        '_ID, :GRID_COLOR_STATUS_ID, :SALES_ZONE_ID, :TOTAL_HOUSING_UNITS' +
        ', :REMAINING_HOUSING_UNITS, :BID_DUE_DATE, :PAINT_NAME, :SECURIT' +
        'Y_BAR, :SECOND_LOCK, :FILM_NAME, :XO_UVALUE, :XO_SHGC, :XO_STC, ' +
        ':SH_UVALUE, :SH_SHGC, :SH_STC, :FIX_UVALUE, :FIX_SHGC, :FIX_STC,' +
        ' :PD_UVALUE, :PD_SHGC, :PD_STC, :IS_TRACT_ON_HOLD, :IS_OCIP, :OC' +
        'IP_RATE, :OCIP_DEDUCT, :CONTRACT_STATUS, :PRICE_HOLD_DATE, :LAST' +
        '_PRICE_INCREASE_DATE, :BUSINESS_LICENSE_DATE, :INSURANCE_CERTS_D' +
        'ATE, :START_SHIPING_DATE, :RO_SEND_DATE, :INSTALL_NOTES, :NEXT_P' +
        'HASE_DATE_1, :NEXT_PHASE_DATE_2, :UID_OPERATOR, :UID_PROJECT_MAN' +
        'AGER, :IS_STC, :IS_ENHANCED)')
    SQLDelete.Strings = (
      'DELETE FROM TRACT'
      'WHERE'
      '  TRACT_ID = :Old_TRACT_ID')
    SQLUpdate.Strings = (
      'UPDATE TRACT'
      'SET'
      
        '  TRACT_ID = :TRACT_ID, CUSTOMER_ID = :CUSTOMER_ID, TRACT_NAME =' +
        ' :TRACT_NAME, TRACT_NUMBER = :TRACT_NUMBER, TRACT_TYPE_ID = :TRA' +
        'CT_TYPE_ID, ZIPNTAX_ID = :ZIPNTAX_ID, SERIES_ID = :SERIES_ID, SC' +
        '_ID = :SC_ID, SNF_ID = :SNF_ID, GLASS_KIND_ID_OUTER = :GLASS_KIN' +
        'D_ID_OUTER, GLASS_KIND_ID_MIDDLE = :GLASS_KIND_ID_MIDDLE, GLASS_' +
        'KIND_ID_INNER = :GLASS_KIND_ID_INNER, GAS_ID = :GAS_ID, GLAZING_' +
        'ID = :GLAZING_ID, GLASS_EDGE_ID = :GLASS_EDGE_ID, GRIDS_ID = :GR' +
        'IDS_ID, CROSS_STREET_1 = :CROSS_STREET_1, CROSS_STREET_2 = :CROS' +
        'S_STREET_2, CLINIC_ADDRESS = :CLINIC_ADDRESS, EMERG_DIRECTIONS =' +
        ' :EMERG_DIRECTIONS, NFS = :NFS, UFZ = :UFZ, NOTES = :NOTES, INST' +
        'ALL_DESCRIPTION = :INSTALL_DESCRIPTION, DOUBLE_CAULK = :DOUBLE_C' +
        'AULK, FASTENER_ACC_ID = :FASTENER_ACC_ID, CAULK_ACC_ID = :CAULK_' +
        'ACC_ID, WINDOW_FLASH_ACC_ID = :WINDOW_FLASH_ACC_ID, DOOR_FLASH_A' +
        'CC_ID = :DOOR_FLASH_ACC_ID, ACCESSORIES_ACC_ID = :ACCESSORIES_AC' +
        'C_ID, GRID_COLOR_STATUS_ID = :GRID_COLOR_STATUS_ID, SALES_ZONE_I' +
        'D = :SALES_ZONE_ID, TOTAL_HOUSING_UNITS = :TOTAL_HOUSING_UNITS, ' +
        'REMAINING_HOUSING_UNITS = :REMAINING_HOUSING_UNITS, BID_DUE_DATE' +
        ' = :BID_DUE_DATE, PAINT_NAME = :PAINT_NAME, SECURITY_BAR = :SECU' +
        'RITY_BAR, SECOND_LOCK = :SECOND_LOCK, FILM_NAME = :FILM_NAME, XO' +
        '_UVALUE = :XO_UVALUE, XO_SHGC = :XO_SHGC, XO_STC = :XO_STC, SH_U' +
        'VALUE = :SH_UVALUE, SH_SHGC = :SH_SHGC, SH_STC = :SH_STC, FIX_UV' +
        'ALUE = :FIX_UVALUE, FIX_SHGC = :FIX_SHGC, FIX_STC = :FIX_STC, PD' +
        '_UVALUE = :PD_UVALUE, PD_SHGC = :PD_SHGC, PD_STC = :PD_STC, IS_T' +
        'RACT_ON_HOLD = :IS_TRACT_ON_HOLD, IS_OCIP = :IS_OCIP, OCIP_RATE ' +
        '= :OCIP_RATE, OCIP_DEDUCT = :OCIP_DEDUCT, CONTRACT_STATUS = :CON' +
        'TRACT_STATUS, PRICE_HOLD_DATE = :PRICE_HOLD_DATE, LAST_PRICE_INC' +
        'REASE_DATE = :LAST_PRICE_INCREASE_DATE, BUSINESS_LICENSE_DATE = ' +
        ':BUSINESS_LICENSE_DATE, INSURANCE_CERTS_DATE = :INSURANCE_CERTS_' +
        'DATE, START_SHIPING_DATE = :START_SHIPING_DATE, RO_SEND_DATE = :' +
        'RO_SEND_DATE, INSTALL_NOTES = :INSTALL_NOTES, NEXT_PHASE_DATE_1 ' +
        '= :NEXT_PHASE_DATE_1, NEXT_PHASE_DATE_2 = :NEXT_PHASE_DATE_2, UI' +
        'D_OPERATOR = :UID_OPERATOR, UID_PROJECT_MANAGER = :UID_PROJECT_M' +
        'ANAGER, IS_STC = :IS_STC, IS_ENHANCED = :IS_ENHANCED'
      'WHERE'
      '  TRACT_ID = :Old_TRACT_ID')
    SQLRefresh.Strings = (
      'select '
      '    tract.tract_id,'
      '    tract.customer_id,'
      '    tract.tract_name,'
      '    tract.tract_number,'
      '    tract.tract_type_id,'
      '    tract.zipntax_id,'
      '    tract.series_id,'
      '    tract.sc_id,'
      '    tract.snf_id,'
      '    tract.glass_kind_id_outer,'
      '    tract.glass_kind_id_middle,'
      '    tract.glass_kind_id_inner,'
      '    tract.gas_id,'
      '    tract.cross_street_1,'
      '    tract.cross_street_2,'
      '    tract.clinic_address,'
      '    tract.emerg_directions,'
      '    tract.ufz,'
      '    tract.nfs,'
      '    tract.glazing_id,'
      '    tract.glass_edge_id,'
      '    tract.grids_id,'
      '    tract.notes,'
      '    tract.install_description,'
      '    tract.double_caulk,'
      '    tract.fastener_acc_id,'
      '    tract.caulk_acc_id,'
      '    tract.window_flash_acc_id,'
      '    tract.door_flash_acc_id,'
      '    tract.accessories_acc_id,'
      '    tract.grid_color_status_id,'
      '    tract.sales_zone_id,'
      '    tract.uid_operator,'
      '    tract.uid_project_manager,'
      '    tract.total_housing_units,'
      '    tract.remaining_housing_units,'
      '    tract.bid_due_date,'
      '    tract.paint_name,'
      '    tract.security_bar,'
      '    tract.second_lock,'
      '    tract.film_name,'
      '    tract.xo_uvalue,'
      '    tract.xo_shgc,'
      '    tract.xo_stc,'
      '    tract.sh_uvalue,'
      '    tract.sh_shgc,'
      '    tract.sh_stc,'
      '    tract.fix_uvalue,'
      '    tract.fix_shgc,'
      '    tract.fix_stc,'
      '    tract.pd_uvalue,'
      '    tract.pd_shgc,'
      '    tract.pd_stc,'
      '    tract.is_tract_on_hold,'
      '    tract.is_ocip,'
      '    tract.ocip_rate,'
      '    tract.ocip_deduct,'
      '    tract.contract_status,'
      '    tract.price_hold_date,'
      '    tract.last_price_increase_date,'
      '    tract.business_license_date,'
      '    tract.insurance_certs_date,'
      '    tract.start_shiping_date,'
      '    tract.ro_send_date,'
      '    tract.install_notes,'
      '    tract.next_phase_date_1,'
      '    tract.next_phase_date_2,'
      '    tract.is_stc,'
      '    tract.is_enhanced,'
      '    zipntax.zipcode,'
      '    zipntax.state,'
      '    zipntax.city,'
      '    zipntax.sales_tax_rate,'
      '    zipntax.county,'
      '    series.series_name,'
      '    series.series_description,'
      '    colors.color_name,'
      '    colors.color_description,'
      '    nailfin.nailfin_description,'
      '    nailfin.nailfin_name,'
      '    glass_kind_outer.description description_gk_outer,'
      '    glass_kind_outer.glass_kind glass_kind_outer,'
      '    glass_kind_middle.glass_kind glass_kind_middle,'
      '    glass_kind_middle.description description_gk_middle,'
      '    glass_kind_inner.glass_kind glass_kind_inner,'
      '    glass_kind_inner.description description_inner,'
      '    grid_color_status.description gs_description,'
      '    grid_color_status.color gs_color,'
      '    grids.gkind_id,'
      '    grids.gpat_id,'
      '    grid_kind.gkind_name,'
      '    grid_kind.gkind_description,'
      '    grid_pattern.gpattern_name,'
      '    grid_pattern.gpattern_description,'
      '    glazing.glazing_name,'
      '    glazing.glazing_description,'
      '    glass_edge.edge,'
      '    glass_edge.description,'
      '    tract_type.tract_type_desc,'
      '    customers.cust_name,'
      '    sales_zone.zone_description,'
      '    accessory_fastener.acc_name acc_name_fastener,'
      '    accessorycaulk.acc_name acc_name_caulk,'
      '    accessory_wflash.acc_name acc_name_winflash,'
      '    accessory_dflash.acc_name acc_name_doorflash,'
      '    accessory_otheracc.acc_name acc_name_otheracc,'
      '    users_operator.uname uname_operator,'
      '    users_project_manager.uname uname_project_manager'
      'from users users_project_manager'
      
        '   right outer join tract on (users_project_manager.uid = tract.' +
        'uid_project_manager)'
      
        '   left outer join accessory accessory_otheracc on (tract.access' +
        'ories_acc_id = accessory_otheracc.accessory_id)'
      
        '   left outer join customers on (tract.customer_id = customers.c' +
        'ustomer_id)'
      
        '   left outer join tract_type on (tract.tract_type_id = tract_ty' +
        'pe.tract_type_id)'
      
        '   left outer join glass_edge on (tract.glass_edge_id = glass_ed' +
        'ge.glass_edge_id)'
      
        '   left outer join grid_color_status on (tract.grid_color_status' +
        '_id = grid_color_status.grid_color_status_id)'
      
        '   left outer join series on (tract.series_id = series.series_id' +
        ')'
      
        '   left outer join zipntax on (tract.zipntax_id = zipntax.zipnta' +
        'x_id)'
      
        '   left outer join series_color on (tract.sc_id = series_color.s' +
        'c_id)'
      
        '   left outer join colors on (series_color.color_id = colors.col' +
        'or_id)'
      
        '   left outer join series_nailfin on (tract.snf_id = series_nail' +
        'fin.snf_id)'
      
        '   left outer join nailfin on (series_nailfin.nailfin_id = nailf' +
        'in.nailfin_id)'
      
        '   left outer join glass_kind glass_kind_outer on (tract.glass_k' +
        'ind_id_outer = glass_kind_outer.glass_kind_id)'
      
        '   left outer join glass_kind glass_kind_middle on (tract.glass_' +
        'kind_id_middle = glass_kind_middle.glass_kind_id)'
      
        '   left outer join glass_kind glass_kind_inner on (tract.glass_k' +
        'ind_id_inner = glass_kind_inner.glass_kind_id)'
      '   left outer join grids on (tract.grids_id = grids.grids_id)'
      
        '   left outer join grid_kind on (grids.gkind_id = grid_kind.gkin' +
        'd_id)'
      
        '   left outer join grid_pattern on (grids.gpat_id = grid_pattern' +
        '.gpat_id)'
      
        '   left outer join glazing on (tract.glazing_id = glazing.glazin' +
        'g_id)'
      
        '   left outer join sales_zone on (tract.sales_zone_id = sales_zo' +
        'ne.sales_zone_id)'
      
        '   left outer join accessory accessory_fastener on (tract.fasten' +
        'er_acc_id = accessory_fastener.accessory_id)'
      
        '   left outer join accessory accessorycaulk on (tract.caulk_acc_' +
        'id = accessorycaulk.accessory_id)'
      
        '   left outer join accessory accessory_wflash on (tract.window_f' +
        'lash_acc_id = accessory_wflash.accessory_id)'
      
        '   left outer join accessory accessory_dflash on (tract.door_fla' +
        'sh_acc_id = accessory_dflash.accessory_id)'
      
        '   left outer join users users_operator on (tract.uid_operator =' +
        ' users_operator.uid)'
      'WHERE'
      '  TRACT_ID = :TRACT_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM TRACT'
      'WHERE'
      'TRACT_ID = :Old_TRACT_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM TRACT'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    tract.tract_id,'
      '    tract.customer_id,'
      '    tract.tract_name,'
      '    tract.tract_number,'
      '    tract.tract_type_id,'
      '    tract.zipntax_id,'
      '    tract.series_id,'
      '    tract.sc_id,'
      '    tract.snf_id,'
      '    tract.glass_kind_id_outer,'
      '    tract.glass_kind_id_middle,'
      '    tract.glass_kind_id_inner,'
      '    tract.gas_id,'
      '    tract.cross_street_1,'
      '    tract.cross_street_2,'
      '    tract.clinic_address,'
      '    tract.emerg_directions,'
      '    tract.ufz,'
      '    tract.nfs,'
      '    tract.glazing_id,'
      '    tract.glass_edge_id,'
      '    tract.grids_id,'
      '    tract.notes,'
      '    tract.install_description,'
      '    tract.double_caulk,'
      '    tract.fastener_acc_id,'
      '    tract.caulk_acc_id,'
      '    tract.window_flash_acc_id,'
      '    tract.door_flash_acc_id,'
      '    tract.accessories_acc_id,'
      '    tract.grid_color_status_id,'
      '    tract.sales_zone_id,'
      '    tract.uid_operator,'
      '    tract.uid_project_manager,'
      '    tract.total_housing_units,'
      '    tract.remaining_housing_units,'
      '    tract.bid_due_date,'
      '    tract.paint_name,'
      '    tract.security_bar,'
      '    tract.second_lock,'
      '    tract.film_name,'
      '    tract.xo_uvalue,'
      '    tract.xo_shgc,'
      '    tract.xo_stc,'
      '    tract.sh_uvalue,'
      '    tract.sh_shgc,'
      '    tract.sh_stc,'
      '    tract.fix_uvalue,'
      '    tract.fix_shgc,'
      '    tract.fix_stc,'
      '    tract.pd_uvalue,'
      '    tract.pd_shgc,'
      '    tract.pd_stc,'
      '    tract.is_tract_on_hold,'
      '    tract.is_ocip,'
      '    tract.ocip_rate,'
      '    tract.ocip_deduct,'
      '    tract.contract_status,'
      '    tract.price_hold_date,'
      '    tract.last_price_increase_date,'
      '    tract.business_license_date,'
      '    tract.insurance_certs_date,'
      '    tract.start_shiping_date,'
      '    tract.ro_send_date,'
      '    tract.install_notes,'
      '    tract.next_phase_date_1,'
      '    tract.next_phase_date_2,'
      '    tract.is_stc,'
      '    tract.is_enhanced,'
      '    zipntax.zipcode,'
      '    zipntax.state,'
      '    zipntax.city,'
      '    zipntax.sales_tax_rate,'
      '    zipntax.county,'
      '    series.series_name,'
      '    series.series_description,'
      '    colors.color_name,'
      '    colors.color_description,'
      '    nailfin.nailfin_description,'
      '    nailfin.nailfin_name,'
      '    glass_kind_outer.description description_gk_outer,'
      '    glass_kind_outer.glass_kind glass_kind_outer,'
      '    glass_kind_middle.glass_kind glass_kind_middle,'
      '    glass_kind_middle.description description_gk_middle,'
      '    glass_kind_inner.glass_kind glass_kind_inner,'
      '    glass_kind_inner.description description_inner,'
      '    grid_color_status.description gs_description,'
      '    grid_color_status.color gs_color,'
      '    grids.gkind_id,'
      '    grids.gpat_id,'
      '    grid_kind.gkind_name,'
      '    grid_kind.gkind_description,'
      '    grid_pattern.gpattern_name,'
      '    grid_pattern.gpattern_description,'
      '    glazing.glazing_name,'
      '    glazing.glazing_description,'
      '    glass_edge.edge,'
      '    glass_edge.description,'
      '    tract_type.tract_type_desc,'
      '    customers.cust_name,'
      '    sales_zone.zone_description,'
      '    accessory_fastener.acc_name acc_name_fastener,'
      '    accessorycaulk.acc_name acc_name_caulk,'
      '    accessory_wflash.acc_name acc_name_winflash,'
      '    accessory_dflash.acc_name acc_name_doorflash,'
      '    accessory_otheracc.acc_name acc_name_otheracc,'
      '    users_operator.uname uname_operator,'
      '    users_project_manager.uname uname_project_manager'
      'from users users_project_manager'
      
        '   right outer join tract on (users_project_manager.uid = tract.' +
        'uid_project_manager)'
      
        '   left outer join accessory accessory_otheracc on (tract.access' +
        'ories_acc_id = accessory_otheracc.accessory_id)'
      
        '   left outer join customers on (tract.customer_id = customers.c' +
        'ustomer_id)'
      
        '   left outer join tract_type on (tract.tract_type_id = tract_ty' +
        'pe.tract_type_id)'
      
        '   left outer join glass_edge on (tract.glass_edge_id = glass_ed' +
        'ge.glass_edge_id)'
      
        '   left outer join grid_color_status on (tract.grid_color_status' +
        '_id = grid_color_status.grid_color_status_id)'
      
        '   left outer join series on (tract.series_id = series.series_id' +
        ')'
      
        '   left outer join zipntax on (tract.zipntax_id = zipntax.zipnta' +
        'x_id)'
      
        '   left outer join series_color on (tract.sc_id = series_color.s' +
        'c_id)'
      
        '   left outer join colors on (series_color.color_id = colors.col' +
        'or_id)'
      
        '   left outer join series_nailfin on (tract.snf_id = series_nail' +
        'fin.snf_id)'
      
        '   left outer join nailfin on (series_nailfin.nailfin_id = nailf' +
        'in.nailfin_id)'
      
        '   left outer join glass_kind glass_kind_outer on (tract.glass_k' +
        'ind_id_outer = glass_kind_outer.glass_kind_id)'
      
        '   left outer join glass_kind glass_kind_middle on (tract.glass_' +
        'kind_id_middle = glass_kind_middle.glass_kind_id)'
      
        '   left outer join glass_kind glass_kind_inner on (tract.glass_k' +
        'ind_id_inner = glass_kind_inner.glass_kind_id)'
      '   left outer join grids on (tract.grids_id = grids.grids_id)'
      
        '   left outer join grid_kind on (grids.gkind_id = grid_kind.gkin' +
        'd_id)'
      
        '   left outer join grid_pattern on (grids.gpat_id = grid_pattern' +
        '.gpat_id)'
      
        '   left outer join glazing on (tract.glazing_id = glazing.glazin' +
        'g_id)'
      
        '   left outer join sales_zone on (tract.sales_zone_id = sales_zo' +
        'ne.sales_zone_id)'
      
        '   left outer join accessory accessory_fastener on (tract.fasten' +
        'er_acc_id = accessory_fastener.accessory_id)'
      
        '   left outer join accessory accessorycaulk on (tract.caulk_acc_' +
        'id = accessorycaulk.accessory_id)'
      
        '   left outer join accessory accessory_wflash on (tract.window_f' +
        'lash_acc_id = accessory_wflash.accessory_id)'
      
        '   left outer join accessory accessory_dflash on (tract.door_fla' +
        'sh_acc_id = accessory_dflash.accessory_id)'
      
        '   left outer join users users_operator on (tract.uid_operator =' +
        ' users_operator.uid)'
      'where'
      '(tract.customer_id = :customer_id)')
    MasterSource = dsCustomers
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Options.CacheCalcFields = True
    IndexFieldNames = 'TRACT_ID'
    AfterInsert = tblTractAfterInsert
    BeforePost = tblTractBeforePost
    Left = 982
    Top = 616
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'customer_id'
        Value = nil
      end>
  end
  object dsTract: TIBCDataSource
    DataSet = tblTract
    Left = 982
    Top = 669
  end
  object tblTractPhase: TIBCQuery
    UpdatingTable = 'TRACT_PHASE'
    KeyFields = 'PHASE_ID'
    KeyGenerator = 'GEN_TRACT_PHASE_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO TRACT_PHASE'
      
        '  (PHASE_ID, TRACT_ID, PHASE_NAME, PHASE_MONTH_YEAR, IS_PRICED, ' +
        'COMM_PERCENT, SERVICE_PERCENT, TRANSPORT_PERCENT, SALESTAX_PERCE' +
        'NT, PO_PERCENT, WINDOW_INSTALL, DOOR_INSTALL, SCREEN_INSTALL)'
      'VALUES'
      
        '  (:PHASE_ID, :TRACT_ID, :PHASE_NAME, :PHASE_MONTH_YEAR, :IS_PRI' +
        'CED, :COMM_PERCENT, :SERVICE_PERCENT, :TRANSPORT_PERCENT, :SALES' +
        'TAX_PERCENT, :PO_PERCENT, :WINDOW_INSTALL, :DOOR_INSTALL, :SCREE' +
        'N_INSTALL)')
    SQLDelete.Strings = (
      'DELETE FROM TRACT_PHASE'
      'WHERE'
      '  PHASE_ID = :Old_PHASE_ID')
    SQLUpdate.Strings = (
      'UPDATE TRACT_PHASE'
      'SET'
      
        '  PHASE_ID = :PHASE_ID, TRACT_ID = :TRACT_ID, PHASE_NAME = :PHAS' +
        'E_NAME, PHASE_MONTH_YEAR = :PHASE_MONTH_YEAR, IS_PRICED = :IS_PR' +
        'ICED, COMM_PERCENT = :COMM_PERCENT, SERVICE_PERCENT = :SERVICE_P' +
        'ERCENT, TRANSPORT_PERCENT = :TRANSPORT_PERCENT, SALESTAX_PERCENT' +
        ' = :SALESTAX_PERCENT, PO_PERCENT = :PO_PERCENT, WINDOW_INSTALL =' +
        ' :WINDOW_INSTALL, DOOR_INSTALL = :DOOR_INSTALL, SCREEN_INSTALL =' +
        ' :SCREEN_INSTALL'
      'WHERE'
      '  PHASE_ID = :Old_PHASE_ID')
    SQLRefresh.Strings = (
      
        'SELECT PHASE_ID, TRACT_ID, PHASE_NAME, PHASE_MONTH_YEAR, IS_PRIC' +
        'ED, COMM_PERCENT, SERVICE_PERCENT, TRANSPORT_PERCENT, SALESTAX_P' +
        'ERCENT, PO_PERCENT, WINDOW_INSTALL, DOOR_INSTALL, SCREEN_INSTALL' +
        ' FROM TRACT_PHASE'
      'WHERE'
      '  PHASE_ID = :PHASE_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM TRACT_PHASE'
      'WHERE'
      'PHASE_ID = :Old_PHASE_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'Select * from TRACT_PHASE'
      'Where TRACT_ID = :TRACT_ID'
      'order by TRACT_ID, PHASE_NAME DESC')
    MasterSource = dsTract
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    AfterInsert = tblTractPhaseAfterInsert
    Left = 1157
    Top = 616
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TRACT_ID'
        ParamType = ptInput
        Value = 5235
      end>
  end
  object dsTractPhase: TIBCDataSource
    DataSet = tblTractPhase
    Left = 1157
    Top = 669
  end
  object tblPhaseQuotes: TIBCQuery
    UpdatingTable = 'SO_QUOTE_HDR'
    KeyFields = 'QUOTE_ID'
    KeyGenerator = 'GEN_SO_QUOTE_HDR_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO SO_QUOTE_HDR'
      
        '  (QUOTE_ID, QUOTE_NO, PHASE_ID, JOB_BATCH_ID, JOB_NAME, SHIP_AD' +
        'DRESS_1, ORDER_DATE, TRACT_LOT, TRACT_PLAN, TRACT_DELIVERY, TRAC' +
        'T_LOT_REVERSE)'
      'VALUES'
      
        '  (:QUOTE_ID, :QUOTE_NO, :PHASE_ID, :JOB_BATCH_ID, :JOB_NAME, :S' +
        'HIP_ADDRESS_1, :ORDER_DATE, :TRACT_LOT, :TRACT_PLAN, :TRACT_DELI' +
        'VERY, :TRACT_LOT_REVERSE)')
    SQLDelete.Strings = (
      'DELETE FROM SO_QUOTE_HDR'
      'WHERE'
      '  QUOTE_ID = :Old_QUOTE_ID')
    SQLUpdate.Strings = (
      'UPDATE SO_QUOTE_HDR'
      'SET'
      
        '  QUOTE_ID = :QUOTE_ID, QUOTE_NO = :QUOTE_NO, PHASE_ID = :PHASE_' +
        'ID, JOB_BATCH_ID = :JOB_BATCH_ID, JOB_NAME = :JOB_NAME, SHIP_ADD' +
        'RESS_1 = :SHIP_ADDRESS_1, ORDER_DATE = :ORDER_DATE, TRACT_LOT = ' +
        ':TRACT_LOT, TRACT_PLAN = :TRACT_PLAN, TRACT_DELIVERY = :TRACT_DE' +
        'LIVERY, TRACT_LOT_REVERSE = :TRACT_LOT_REVERSE'
      'WHERE'
      '  QUOTE_ID = :Old_QUOTE_ID')
    SQLRefresh.Strings = (
      
        'SELECT QUOTE_ID, QUOTE_NO, PHASE_ID, JOB_BATCH_ID, JOB_NAME, SHI' +
        'P_ADDRESS_1, ORDER_DATE, TRACT_LOT, TRACT_PLAN, TRACT_DELIVERY, ' +
        'TRACT_LOT_REVERSE FROM SO_QUOTE_HDR'
      'WHERE'
      '  QUOTE_ID = :QUOTE_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM SO_QUOTE_HDR'
      'WHERE'
      'QUOTE_ID = :Old_QUOTE_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM SO_QUOTE_HDR'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    so_quote_hdr.quote_id,'
      '    so_quote_hdr.phase_id,'
      '    so_quote_hdr.job_batch_id,'
      '    so_quote_hdr.quote_no,'
      '    so_quote_hdr.tract_lot,'
      '    so_quote_hdr.tract_plan,'
      '    so_quote_hdr.tract_delivery,'
      '    SO_QUOTE_HDR.JOB_NAME,'
      '    SO_QUOTE_HDR.SHIP_ADDRESS_1,'
      '    so_quote_hdr.tract_lot_reverse,'
      '    so_quote_hdr.ORDER_DATE'
      'from so_quote_hdr'
      'where so_quote_hdr.phase_id = :phase_id'
      
        'order by so_quote_hdr.phase_id, so_quote_hdr.tract_delivery, so_' +
        'quote_hdr.tract_lot')
    MasterSource = dsTractPhase
    Options.RequiredFields = False
    Options.DefaultValues = True
    Options.ReturnParams = True
    LocalConstraints = False
    Left = 125
    Top = 489
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PHASE_ID'
        ParamType = ptInput
        Value = 2
      end>
  end
  object dsPhaseQuotes: TIBCDataSource
    DataSet = tblPhaseQuotes
    Left = 123
    Top = 544
  end
  object MainGVR: TcxGridViewRepository
    Left = 1147
    Top = 7
    object WindowImgView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.KeyFieldNames = 'WIN_IMG_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.DataRowHeight = 80
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object WindowImgViewWIN_IMG_ID: TcxGridDBColumn
        DataBinding.FieldName = 'WIN_IMG_ID'
        Visible = False
      end
      object WindowImgViewWIN_IMG: TcxGridDBColumn
        DataBinding.FieldName = 'WIN_IMG'
        PropertiesClassName = 'TcxImageProperties'
        Properties.GraphicClassName = 'TJPEGImage'
        Properties.PopupMenuLayout.MenuItems = []
        Properties.ReadOnly = True
        Width = 213
      end
      object WindowImgViewWIN_IMG_BIG: TcxGridDBColumn
        DataBinding.FieldName = 'WIN_IMG_BIG'
        Visible = False
      end
      object WindowImgViewIMG_DESC: TcxGridDBColumn
        DataBinding.FieldName = 'IMG_DESC'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        Width = 137
      end
    end
    object MainGVR_vwQuotes: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Visible = True
      DataController.DataModeController.GridMode = True
      DataController.DataModeController.SyncMode = False
      DataController.DataSource = dsMainSQL
      DataController.KeyFieldNames = 'QUOTE_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.InvertSelect = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object MainGVR_vwQuotes_btnBrowse: TcxGridDBColumn
        Caption = 'Browse'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = False
        Properties.ViewStyle = vsButtonsOnly
        Options.Filtering = False
        Options.IncSearch = False
        Options.ShowEditButtons = isebAlways
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Width = 57
      end
      object MainGVR_vwQuotes_btnPrint: TcxGridDBColumn
        Caption = 'Print'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ViewStyle = vsButtonsOnly
        Options.Filtering = False
        Options.IncSearch = False
        Options.ShowEditButtons = isebAlways
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Width = 56
      end
      object MainGVR_vwQuotesCustomer_ID: TcxGridDBColumn
        DataBinding.FieldName = 'CUSTOMER_ID'
        Visible = False
        Options.Editing = False
        Width = 115
      end
      object MainGVR_vwQuotesJOB_BATCH_ID: TcxGridDBColumn
        DataBinding.FieldName = 'JOB_BATCH_ID'
        Visible = False
      end
      object MainGVR_vwQuotesQUOTE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'QUOTE_ID'
        Visible = False
        Options.Editing = False
      end
      object MainGVR_vwQuotesQUOTE_NO: TcxGridDBColumn
        Caption = 'Quote No'
        DataBinding.FieldName = 'QUOTE_NO'
        Options.Editing = False
        Width = 89
      end
      object MainGVR_vwQuotesQUOTE_DATE: TcxGridDBColumn
        Caption = 'Date'
        DataBinding.FieldName = 'QUOTE_DATE'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ShowTime = False
        Options.Editing = False
        Width = 89
      end
      object MainGVR_vwQuotesCUST_NAME: TcxGridDBColumn
        Caption = 'Customer'
        DataBinding.FieldName = 'CUST_NAME'
        Options.Editing = False
        Width = 248
      end
      object MainGVR_vwQuotesJOB_NAME: TcxGridDBColumn
        Caption = 'Job'
        DataBinding.FieldName = 'JOB_NAME'
        Options.Editing = False
        Width = 213
      end
    end
    object MainGVR_vwTracts: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Visible = True
      DataController.DataModeController.GridMode = True
      DataController.DataModeController.SyncMode = False
      DataController.DataSource = dsMainSQL
      DataController.KeyFieldNames = 'TRACT_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.PullFocusing = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object MainGVR_vwTracts_btnBrowse: TcxGridDBColumn
        Caption = 'Browse'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ViewStyle = vsButtonsOnly
        Options.Filtering = False
        Options.IncSearch = False
        Options.ShowEditButtons = isebAlways
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Width = 56
      end
      object MainGVR_vwTracts_btnPrint: TcxGridDBColumn
        Caption = 'Print'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ViewStyle = vsButtonsOnly
        Options.Filtering = False
        Options.IncSearch = False
        Options.ShowEditButtons = isebAlways
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Width = 55
      end
      object MainGVR_vwTractsTRACT_ID: TcxGridDBColumn
        DataBinding.FieldName = 'TRACT_ID'
        Visible = False
        Options.Editing = False
      end
      object MainGVR_vwTractsCUSTOMER_ID: TcxGridDBColumn
        DataBinding.FieldName = 'CUSTOMER_ID'
        Visible = False
        Options.Editing = False
      end
      object MainGVR_vwTractsTRACT_NAME: TcxGridDBColumn
        Caption = 'Tract'
        DataBinding.FieldName = 'TRACT_NAME'
        Options.Editing = False
        Width = 207
      end
      object MainGVR_vwTractsCUST_NAME: TcxGridDBColumn
        Caption = 'Customer'
        DataBinding.FieldName = 'CUST_NAME'
        Options.Editing = False
        Width = 271
      end
      object MainGVR_vwTractsTRACT_NUMBER: TcxGridDBColumn
        Caption = 'Tract No'
        DataBinding.FieldName = 'TRACT_NUMBER'
        Options.Editing = False
        Width = 94
      end
      object MainGVR_vwTractsCITY: TcxGridDBColumn
        Caption = 'City'
        DataBinding.FieldName = 'CITY'
        Options.Editing = False
        Width = 79
      end
    end
    object MainGVR_Grid_Status: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataModeController.SyncMode = False
      DataController.DataSource = dsGStatusColor
      DataController.KeyFieldNames = 'GRID_COLOR_STATUS_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.ScrollBars = ssVertical
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object MainGVR_Grid_StatusGRID_COLOR_STATUS_ID: TcxGridDBColumn
        DataBinding.FieldName = 'GRID_COLOR_STATUS_ID'
        Visible = False
      end
      object MainGVR_Grid_StatusCOLOR: TcxGridDBColumn
        Caption = 'Color'
        DataBinding.FieldName = 'COLOR'
        PropertiesClassName = 'TcxColorComboBoxProperties'
        Properties.ColorDialogType = cxcdtCustom
        Properties.CustomColors = <
          item
            Color = 13303754
            Description = 'Active'
          end
          item
            Color = clWhite
            Description = 'Bidding'
          end
          item
            Color = 13303807
            Description = 'Complete'
          end
          item
            Color = clBtnFace
            Description = 'Lost'
          end>
        Properties.DropDownSizeable = True
        Properties.ShowDescriptions = False
        Width = 50
      end
      object MainGVR_Grid_StatusDESCRIPTION: TcxGridDBColumn
        Caption = 'Description'
        DataBinding.FieldName = 'DESCRIPTION'
        Width = 200
      end
    end
  end
  object tblGStatusColor: TIBCQuery
    KeyFields = 'GRID_COLOR_STATUS_ID'
    KeyGenerator = 'GEN_GRID_COLOR_STATUS_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO GRID_COLOR_STATUS'
      '  (GRID_COLOR_STATUS_ID, COLOR, DESCRIPTION)'
      'VALUES'
      '  (:GRID_COLOR_STATUS_ID, :COLOR, :DESCRIPTION)')
    SQLDelete.Strings = (
      'DELETE FROM GRID_COLOR_STATUS'
      'WHERE'
      '  GRID_COLOR_STATUS_ID = :Old_GRID_COLOR_STATUS_ID')
    SQLUpdate.Strings = (
      'UPDATE GRID_COLOR_STATUS'
      'SET'
      
        '  GRID_COLOR_STATUS_ID = :GRID_COLOR_STATUS_ID, COLOR = :COLOR, ' +
        'DESCRIPTION = :DESCRIPTION'
      'WHERE'
      '  GRID_COLOR_STATUS_ID = :Old_GRID_COLOR_STATUS_ID')
    SQLRefresh.Strings = (
      
        'SELECT GRID_COLOR_STATUS_ID, COLOR, DESCRIPTION FROM GRID_COLOR_' +
        'STATUS'
      'WHERE'
      '  GRID_COLOR_STATUS_ID = :GRID_COLOR_STATUS_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM GRID_COLOR_STATUS'
      'WHERE'
      'GRID_COLOR_STATUS_ID = :Old_GRID_COLOR_STATUS_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from GRID_COLOR_STATUS')
    Left = 1298
    Top = 358
  end
  object dsGStatusColor: TIBCDataSource
    DataSet = tblGStatusColor
    Left = 1298
    Top = 412
  end
  object dsWin_Mull: TIBCDataSource
    DataSet = tblWin_Mull
    Left = 474
    Top = 544
  end
  object tblWinQuote_lookup: TIBCQuery
    SQLInsert.Strings = (
      'INSERT INTO WINDOW'
      
        '  (QUOTE_WIN_ID, WINDOW_ID, QUOTE_ID, IS_STOCK_WINDOW, SM_ID, CA' +
        'LLOUTS_ID, WIN_WIDTH, WIN_HEIGHT, GRIDS_ACROSS, GRIDS_UPDOWN, GR' +
        'IDS_ID)'
      'VALUES'
      
        '  (:QUOTE_WIN_ID, :WINDOW_ID, :QUOTE_ID, :IS_STOCK_WINDOW, :SM_I' +
        'D, :CALLOUTS_ID, :WIN_WIDTH, :WIN_HEIGHT, :GRIDS_ACROSS, :GRIDS_' +
        'UPDOWN, :GRIDS_ID)')
    SQLDelete.Strings = (
      'DELETE FROM WINDOW'
      'WHERE'
      '  QUOTE_WIN_ID = :Old_QUOTE_WIN_ID')
    SQLUpdate.Strings = (
      'UPDATE WINDOW'
      'SET'
      
        '  QUOTE_WIN_ID = :QUOTE_WIN_ID, WINDOW_ID = :WINDOW_ID, QUOTE_ID' +
        ' = :QUOTE_ID, IS_STOCK_WINDOW = :IS_STOCK_WINDOW, SM_ID = :SM_ID' +
        ', CALLOUTS_ID = :CALLOUTS_ID, WIN_WIDTH = :WIN_WIDTH, WIN_HEIGHT' +
        ' = :WIN_HEIGHT, GRIDS_ACROSS = :GRIDS_ACROSS, GRIDS_UPDOWN = :GR' +
        'IDS_UPDOWN, GRIDS_ID = :GRIDS_ID'
      'WHERE'
      '  QUOTE_WIN_ID = :Old_QUOTE_WIN_ID')
    SQLRefresh.Strings = (
      
        'SELECT QUOTE_WIN_ID, WINDOW_ID, QUOTE_ID, IS_STOCK_WINDOW, SM_ID' +
        ', CALLOUTS_ID, WIN_WIDTH, WIN_HEIGHT, GRIDS_ACROSS, GRIDS_UPDOWN' +
        ', GRIDS_ID FROM WINDOW'
      'WHERE'
      '  QUOTE_WIN_ID = :QUOTE_WIN_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM WINDOW'
      'WHERE'
      'QUOTE_WIN_ID = :Old_QUOTE_WIN_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    window.quote_win_id,'
      '    window.window_id,'
      '    window.quote_id,'
      '    window.is_stock_window,'
      '    window.sm_id,'
      '    window.callouts_id,'
      '    window.win_width,'
      '    window.win_height,'
      '    window.grids_across,'
      '    window.grids_updown,'
      '    window.grids_id,'
      '    models.model_name,'
      '    models.model_description,'
      '    callouts.callouts,'
      '    grid_kind.gkind_name,'
      '    grid_kind.gkind_description'
      'from window'
      
        '   left outer join series_model on (window.sm_id = series_model.' +
        'sm_id)'
      
        '   left outer join models on (series_model.model_id = models.mod' +
        'el_id)'
      
        '   left outer join callouts on (window.callouts_id = callouts.ca' +
        'llouts_id)'
      '   left outer join grids on (window.grids_id = grids.grids_id)'
      
        '   left outer join grid_kind on (grids.gkind_id = grid_kind.gkin' +
        'd_id)'
      '')
    Left = 312
    Top = 489
  end
  object tblWin_Mull: TIBCQuery
    UpdatingTable = 'WIN_MULL'
    KeyFields = 'WIN_MULL_ID'
    KeyGenerator = 'GEN_WIN_MULL_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO WIN_MULL'
      '  (WIN_MULL_ID, QUOTE_WIN_ID, MULL_QUOTE_WIN_ID, MULL_EDGE)'
      'VALUES'
      '  (:WIN_MULL_ID, :QUOTE_WIN_ID, :MULL_QUOTE_WIN_ID, :MULL_EDGE)')
    SQLDelete.Strings = (
      'DELETE FROM WIN_MULL'
      'WHERE'
      '  WIN_MULL_ID = :Old_WIN_MULL_ID')
    SQLUpdate.Strings = (
      'UPDATE WIN_MULL'
      'SET'
      
        '  WIN_MULL_ID = :WIN_MULL_ID, QUOTE_WIN_ID = :QUOTE_WIN_ID, MULL' +
        '_QUOTE_WIN_ID = :MULL_QUOTE_WIN_ID, MULL_EDGE = :MULL_EDGE'
      'WHERE'
      '  WIN_MULL_ID = :Old_WIN_MULL_ID')
    SQLRefresh.Strings = (
      'select '
      '    win_mull.win_mull_id,'
      '    win_mull.quote_win_id,'
      '    win_mull.mull_quote_win_id,'
      '    win_mull.mull_edge,'
      '    series.series_name,'
      '    models.model_name,'
      '    callouts.callouts,'
      '    window.win_width,'
      '    window.win_height,'
      '    grid_kind.gkind_name,'
      '    window.grids_across,'
      '    window.grids_updown'
      'from window'
      
        '   inner join win_mull on (window.quote_win_id = win_mull.mull_q' +
        'uote_win_id)'
      
        '   inner join series_model on (window.sm_id = series_model.sm_id' +
        ')'
      
        '   inner join series on (series_model.series_id = series.series_' +
        'id)'
      
        '   inner join models on (series_model.model_id = models.model_id' +
        ')'
      
        '   left outer join callouts on (window.callouts_id = callouts.ca' +
        'llouts_id)'
      '   inner join grids on (window.grids_id = grids.grids_id)'
      
        '   left outer join grid_kind on (grids.gkind_id = grid_kind.gkin' +
        'd_id)'
      'WHERE'
      '  WIN_MULL_ID = :WIN_MULL_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM WIN_MULL'
      'WHERE'
      'WIN_MULL_ID = :Old_WIN_MULL_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM WIN_MULL'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    win_mull.win_mull_id,'
      '    win_mull.quote_win_id,'
      '    win_mull.mull_quote_win_id,'
      '    win_mull.mull_edge,'
      '    series.series_name,'
      '    models.model_name,'
      '    callouts.callouts,'
      '    window.win_width,'
      '    window.win_height,'
      '    grid_kind.gkind_name,'
      '    window.grids_across,'
      '    window.grids_updown'
      'from window'
      
        '   inner join win_mull on (window.quote_win_id = win_mull.mull_q' +
        'uote_win_id)'
      
        '   inner join series_model on (window.sm_id = series_model.sm_id' +
        ')'
      
        '   inner join series on (series_model.series_id = series.series_' +
        'id)'
      
        '   inner join models on (series_model.model_id = models.model_id' +
        ')'
      
        '   left outer join callouts on (window.callouts_id = callouts.ca' +
        'llouts_id)'
      '   inner join grids on (window.grids_id = grids.grids_id)'
      
        '   left outer join grid_kind on (grids.gkind_id = grid_kind.gkin' +
        'd_id)'
      'Where (win_mull.quote_win_id = :quote_win_id) '
      '')
    MasterSource = dsWindows
    LockMode = lmLockDelayed
    AfterInsert = tblWin_MullAfterInsert
    AfterPost = tblWin_MullAfterPost
    Left = 475
    Top = 489
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'quote_win_id'
        Value = nil
      end>
  end
  object tblStruc_Perf: TIBCQuery
    KeyFields = 'STRUC_PERF_ID'
    KeyGenerator = 'GEN_STRUC_PERF_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO STRUC_PERF'
      
        '  (STRUC_PERF_ID, PERFORMANCE, DESCRIPTION, IS_VISIBLE, GUI_SEQU' +
        'ENCE)'
      'VALUES'
      
        '  (:STRUC_PERF_ID, :PERFORMANCE, :DESCRIPTION, :IS_VISIBLE, :GUI' +
        '_SEQUENCE)')
    SQLDelete.Strings = (
      'DELETE FROM STRUC_PERF'
      'WHERE'
      '  STRUC_PERF_ID = :Old_STRUC_PERF_ID')
    SQLUpdate.Strings = (
      'UPDATE STRUC_PERF'
      'SET'
      
        '  STRUC_PERF_ID = :STRUC_PERF_ID, PERFORMANCE = :PERFORMANCE, DE' +
        'SCRIPTION = :DESCRIPTION, IS_VISIBLE = :IS_VISIBLE, GUI_SEQUENCE' +
        ' = :GUI_SEQUENCE'
      'WHERE'
      '  STRUC_PERF_ID = :Old_STRUC_PERF_ID')
    SQLRefresh.Strings = (
      
        'SELECT STRUC_PERF_ID, PERFORMANCE, DESCRIPTION, IS_VISIBLE, GUI_' +
        'SEQUENCE FROM STRUC_PERF'
      'WHERE'
      '  STRUC_PERF_ID = :STRUC_PERF_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM STRUC_PERF'
      'WHERE'
      'STRUC_PERF_ID = :Old_STRUC_PERF_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from STRUC_PERF'
      'Order by GUI_SEQUENCE')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 609
    Top = 740
  end
  object dsStruc_Perf: TIBCDataSource
    DataSet = tblStruc_Perf
    Left = 609
    Top = 794
  end
  object tblStruc_Perf_SM: TIBCQuery
    UpdatingTable = 'STRUC_PERF_SM'
    KeyFields = 'STRUC_PERF_SM_ID'
    KeyGenerator = 'GEN_STRUC_PERF_SM_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO STRUC_PERF_SM'
      
        '  (STRUC_PERF_SM_ID, SM_ID, STRUC_PERF_ID, IS_VISIBLE, IS_DEFAUL' +
        'T, GUI_SEQUENCE)'
      'VALUES'
      
        '  (:STRUC_PERF_SM_ID, :SM_ID, :STRUC_PERF_ID, :IS_VISIBLE, :IS_D' +
        'EFAULT, :GUI_SEQUENCE)')
    SQLDelete.Strings = (
      'DELETE FROM STRUC_PERF_SM'
      'WHERE'
      '  STRUC_PERF_SM_ID = :Old_STRUC_PERF_SM_ID')
    SQLUpdate.Strings = (
      'UPDATE STRUC_PERF_SM'
      'SET'
      
        '  STRUC_PERF_SM_ID = :STRUC_PERF_SM_ID, SM_ID = :SM_ID, STRUC_PE' +
        'RF_ID = :STRUC_PERF_ID, IS_VISIBLE = :IS_VISIBLE, IS_DEFAULT = :' +
        'IS_DEFAULT, GUI_SEQUENCE = :GUI_SEQUENCE'
      'WHERE'
      '  STRUC_PERF_SM_ID = :Old_STRUC_PERF_SM_ID')
    SQLRefresh.Strings = (
      'select '
      '    struc_perf_sm.struc_perf_sm_id,'
      '    struc_perf_sm.sm_id,'
      '    struc_perf_sm.struc_perf_id,'
      '    struc_perf_sm.is_visible,'
      '    struc_perf_sm.is_default,'
      '    struc_perf_sm.gui_sequence,'
      '    struc_perf.description,'
      '    struc_perf.performance'
      'from struc_perf'
      
        '   right outer join struc_perf_sm on (struc_perf.struc_perf_id =' +
        ' struc_perf_sm.struc_perf_id)'
      'WHERE'
      '  STRUC_PERF_SM_ID = :STRUC_PERF_SM_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM STRUC_PERF_SM'
      'WHERE'
      'STRUC_PERF_SM_ID = :Old_STRUC_PERF_SM_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    struc_perf_sm.struc_perf_sm_id,'
      '    struc_perf_sm.sm_id,'
      '    struc_perf_sm.struc_perf_id,'
      '    struc_perf_sm.is_visible,'
      '    struc_perf_sm.is_default,'
      '    struc_perf_sm.gui_sequence,'
      '    struc_perf.description,'
      '    struc_perf.performance'
      'from struc_perf'
      
        '   right outer join struc_perf_sm on (struc_perf.struc_perf_id =' +
        ' struc_perf_sm.struc_perf_id)'
      
        'Where (struc_perf_sm.sm_id = :sm_id) And (struc_perf_sm.is_visib' +
        'le like :vp) '
      'Order by struc_perf_sm.gui_sequence')
    MasterSource = dsSeriesModel
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 699
    Top = 740
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SM_ID'
        ParamType = ptInput
        Value = 126
      end
      item
        DataType = ftUnknown
        Name = 'vp'
        Value = nil
      end>
  end
  object dsStruc_Perf_SM: TIBCDataSource
    DataSet = tblStruc_Perf_SM
    Left = 699
    Top = 794
  end
  object tblJobBatches: TIBCQuery
    KeyFields = 'JOB_BATCH_ID'
    KeyGenerator = 'GEN_JOB_BATCH_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO JOB_BATCH'
      
        '  (JOB_BATCH_ID, JOB_BATCH_TYPE, JOB_BATCH_DESCRIPTION, LOCATION' +
        '_ID, DAY_SEQ, IGU_QTY, WIN_QTY, SPECIALS_QTY, PATIO_DOORS_QTY, E' +
        'URO_STYLE_QTY, DUE_DATE, PRODUCTION_DATE, BATCH_NOTES)'
      'VALUES'
      
        '  (:JOB_BATCH_ID, :JOB_BATCH_TYPE, :JOB_BATCH_DESCRIPTION, :LOCA' +
        'TION_ID, :DAY_SEQ, :IGU_QTY, :WIN_QTY, :SPECIALS_QTY, :PATIO_DOO' +
        'RS_QTY, :EURO_STYLE_QTY, :DUE_DATE, :PRODUCTION_DATE, :BATCH_NOT' +
        'ES)')
    SQLDelete.Strings = (
      'DELETE FROM JOB_BATCH'
      'WHERE'
      '  JOB_BATCH_ID = :Old_JOB_BATCH_ID')
    SQLUpdate.Strings = (
      'UPDATE JOB_BATCH'
      'SET'
      
        '  JOB_BATCH_ID = :JOB_BATCH_ID, JOB_BATCH_TYPE = :JOB_BATCH_TYPE' +
        ', JOB_BATCH_DESCRIPTION = :JOB_BATCH_DESCRIPTION, LOCATION_ID = ' +
        ':LOCATION_ID, DAY_SEQ = :DAY_SEQ, IGU_QTY = :IGU_QTY, WIN_QTY = ' +
        ':WIN_QTY, SPECIALS_QTY = :SPECIALS_QTY, PATIO_DOORS_QTY = :PATIO' +
        '_DOORS_QTY, EURO_STYLE_QTY = :EURO_STYLE_QTY, DUE_DATE = :DUE_DA' +
        'TE, PRODUCTION_DATE = :PRODUCTION_DATE, BATCH_NOTES = :BATCH_NOT' +
        'ES'
      'WHERE'
      '  JOB_BATCH_ID = :Old_JOB_BATCH_ID')
    SQLRefresh.Strings = (
      
        'SELECT JOB_BATCH_ID, JOB_BATCH_TYPE, JOB_BATCH_DESCRIPTION, LOCA' +
        'TION_ID, DAY_SEQ, IGU_QTY, WIN_QTY, SPECIALS_QTY, PATIO_DOORS_QT' +
        'Y, EURO_STYLE_QTY, DUE_DATE, PRODUCTION_DATE, BATCH_NOTES FROM J' +
        'OB_BATCH'
      'WHERE'
      '  JOB_BATCH_ID = :JOB_BATCH_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM JOB_BATCH'
      'WHERE'
      'JOB_BATCH_ID = :Old_JOB_BATCH_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM JOB_BATCH'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select distinct '
      '    job_batch.job_batch_id,'
      '    job_batch.job_batch_type,'
      '    job_batch.job_batch_description,'
      '    job_batch.location_id,'
      '    job_batch.day_seq,'
      '    job_batch.igu_qty,'
      '    job_batch.win_qty,'
      '    job_batch.specials_qty,'
      '    job_batch.patio_doors_qty,'
      '    job_batch.euro_style_qty,'
      '    job_batch.due_date,'
      '    job_batch.production_date,'
      '    job_batch.batch_notes,'
      '    locations_stock.locations_name,'
      '    workcell.workcell_type_id'
      'from workcell'
      
        '   inner join scan_window on (workcell.workcell_id = scan_window' +
        '.workcell_id)'
      
        '   inner join window on (scan_window.quote_win_id = window.quote' +
        '_win_id)'
      
        '   inner join so_quote_hdr on (window.quote_id = so_quote_hdr.qu' +
        'ote_id)'
      
        '   right outer join job_batch on (so_quote_hdr.job_batch_id = jo' +
        'b_batch.job_batch_id)'
      
        '   left outer join locations_stock on (job_batch.location_id = l' +
        'ocations_stock.location_id)'
      '')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Options.CacheCalcFields = True
    Left = 1236
    Top = 616
  end
  object dsJobBatches: TIBCDataSource
    DataSet = tblJobBatches
    Left = 1236
    Top = 669
  end
  object DBAlerter: TIBCAlerter
    Active = True
    AutoRegister = True
    Connection = MainDB
    Transaction = TransRead
    Events.Strings = (
      'job_batch_day_seq_updated')
    OnEvent = DBAlerterEvent
    Left = 1784
    Top = 16
  end
  object tblGas: TIBCQuery
    KeyFields = 'GAS_ID'
    KeyGenerator = 'GEN_GAS_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO GAS'
      
        '  (GAS_ID, GAS_NAME, GAS_DESCRIPTION, IS_VISIBLE, GUI_SEQUENCE, ' +
        'COST, GED_CODE, OPERATOR, DATE_SAVED, OPERATOR_LAST_MODIFIED, DA' +
        'TE_LAST_MODIFIED)'
      'VALUES'
      
        '  (:GAS_ID, :GAS_NAME, :GAS_DESCRIPTION, :IS_VISIBLE, :GUI_SEQUE' +
        'NCE, :COST, :GED_CODE, :OPERATOR, :DATE_SAVED, :OPERATOR_LAST_MO' +
        'DIFIED, :DATE_LAST_MODIFIED)')
    SQLDelete.Strings = (
      'DELETE FROM GAS'
      'WHERE'
      '  GAS_ID = :Old_GAS_ID')
    SQLUpdate.Strings = (
      'UPDATE GAS'
      'SET'
      
        '  GAS_ID = :GAS_ID, GAS_NAME = :GAS_NAME, GAS_DESCRIPTION = :GAS' +
        '_DESCRIPTION, IS_VISIBLE = :IS_VISIBLE, GUI_SEQUENCE = :GUI_SEQU' +
        'ENCE, COST = :COST, GED_CODE = :GED_CODE, OPERATOR = :OPERATOR, ' +
        'DATE_SAVED = :DATE_SAVED, OPERATOR_LAST_MODIFIED = :OPERATOR_LAS' +
        'T_MODIFIED, DATE_LAST_MODIFIED = :DATE_LAST_MODIFIED'
      'WHERE'
      '  GAS_ID = :Old_GAS_ID')
    SQLRefresh.Strings = (
      
        'SELECT GAS_ID, GAS_NAME, GAS_DESCRIPTION, IS_VISIBLE, GUI_SEQUEN' +
        'CE, COST, GED_CODE, OPERATOR, DATE_SAVED, OPERATOR_LAST_MODIFIED' +
        ', DATE_LAST_MODIFIED FROM GAS'
      'WHERE'
      '  GAS_ID = :GAS_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM GAS'
      'WHERE'
      'GAS_ID = :Old_GAS_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from GAS'
      'where IS_VISIBLE like :vp'
      'Order by GUI_SEQUENCE')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 971
    Top = 223
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vp'
        Value = nil
      end>
  end
  object dsGas: TIBCDataSource
    DataSet = tblGas
    Left = 971
    Top = 282
  end
  object dsGlassKind: TIBCDataSource
    DataSet = tblGlassKind
    Left = 792
    Top = 413
  end
  object tblGlassKind: TIBCQuery
    KeyFields = 'GLASS_KIND_ID'
    KeyGenerator = 'GEN_GLASS_KIND_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO GLASS_KIND'
      
        '  (GLASS_KIND_ID, GLASS_KIND, DESCRIPTION, GUI_SEQUENCE_OUTER, G' +
        'UI_SEQUENCE_MIDDLE, GUI_SEQUENCE_INNER, IS_VISIBLE_OUTER, IS_VIS' +
        'IBLE_MIDDLE, IS_VISIBLE_INNER, OPERATOR, DATE_SAVED, OPERATOR_LA' +
        'ST_MODIFIED, DATE_LAST_MODIFIED)'
      'VALUES'
      
        '  (:GLASS_KIND_ID, :GLASS_KIND, :DESCRIPTION, :GUI_SEQUENCE_OUTE' +
        'R, :GUI_SEQUENCE_MIDDLE, :GUI_SEQUENCE_INNER, :IS_VISIBLE_OUTER,' +
        ' :IS_VISIBLE_MIDDLE, :IS_VISIBLE_INNER, :OPERATOR, :DATE_SAVED, ' +
        ':OPERATOR_LAST_MODIFIED, :DATE_LAST_MODIFIED)')
    SQLDelete.Strings = (
      'DELETE FROM GLASS_KIND'
      'WHERE'
      '  GLASS_KIND_ID = :Old_GLASS_KIND_ID')
    SQLUpdate.Strings = (
      'UPDATE GLASS_KIND'
      'SET'
      
        '  GLASS_KIND_ID = :GLASS_KIND_ID, GLASS_KIND = :GLASS_KIND, DESC' +
        'RIPTION = :DESCRIPTION, GUI_SEQUENCE_OUTER = :GUI_SEQUENCE_OUTER' +
        ', GUI_SEQUENCE_MIDDLE = :GUI_SEQUENCE_MIDDLE, GUI_SEQUENCE_INNER' +
        ' = :GUI_SEQUENCE_INNER, IS_VISIBLE_OUTER = :IS_VISIBLE_OUTER, IS' +
        '_VISIBLE_MIDDLE = :IS_VISIBLE_MIDDLE, IS_VISIBLE_INNER = :IS_VIS' +
        'IBLE_INNER, OPERATOR = :OPERATOR, DATE_SAVED = :DATE_SAVED, OPER' +
        'ATOR_LAST_MODIFIED = :OPERATOR_LAST_MODIFIED, DATE_LAST_MODIFIED' +
        ' = :DATE_LAST_MODIFIED'
      'WHERE'
      '  GLASS_KIND_ID = :Old_GLASS_KIND_ID')
    SQLRefresh.Strings = (
      
        'SELECT GLASS_KIND_ID, GLASS_KIND, DESCRIPTION, GUI_SEQUENCE_OUTE' +
        'R, GUI_SEQUENCE_MIDDLE, GUI_SEQUENCE_INNER, IS_VISIBLE_OUTER, IS' +
        '_VISIBLE_MIDDLE, IS_VISIBLE_INNER, OPERATOR, DATE_SAVED, OPERATO' +
        'R_LAST_MODIFIED, DATE_LAST_MODIFIED FROM GLASS_KIND'
      'WHERE'
      '  GLASS_KIND_ID = :GLASS_KIND_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM GLASS_KIND'
      'WHERE'
      'GLASS_KIND_ID = :Old_GLASS_KIND_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from GLASS_KIND')
    LockMode = lmLockDelayed
    Filter = '[IS_VISIBLE_OUTER]=1'
    IndexFieldNames = 'GLASS_KIND_ID'
    Left = 790
    Top = 359
  end
  object SchedulerStorage: TcxSchedulerStorage
    CustomFields = <>
    Holidays = SchedulerHolidays
    Resources.Items = <>
    Left = 1386
    Top = 7
  end
  object SchedulerHolidays: TcxSchedulerHolidays
    Locations = <
      item
        Name = 'United States'
        Visible = True
        Holidays = <
          item
            Date = 40172.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 40537.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 40902.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 41268.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 41633.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 41998.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 42363.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 42729.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 43094.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 43459.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 43824.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 41999.000000000000000000
            Name = 'Day After Christmas'
          end
          item
            Date = 42006.000000000000000000
            Name = 'Day After New Years'
          end
          item
            Date = 41971.000000000000000000
            Name = 'Day After Thanksgiving'
          end
          item
            Date = 39915.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 40272.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 40657.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 41007.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 41364.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 41749.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 42099.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 42456.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 42841.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 43191.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 43576.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 43933.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 39998.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 40363.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 40728.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 41094.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 41459.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 41824.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 42189.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 42555.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 42920.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 43285.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 43650.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 44016.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 40063.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 40427.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 40791.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 41155.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 41519.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 41883.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 42254.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 42618.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 42982.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 43346.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 43710.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 44081.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 39856.000000000000000000
            Name = 'Lincoln'#39's Birthday'
            Visible = False
          end
          item
            Date = 40221.000000000000000000
            Name = 'Lincoln'#39's Birthday'
            Visible = False
          end
          item
            Date = 40586.000000000000000000
            Name = 'Lincoln'#39's Birthday'
            Visible = False
          end
          item
            Date = 40951.000000000000000000
            Name = 'Lincoln'#39's Birthday'
            Visible = False
          end
          item
            Date = 41317.000000000000000000
            Name = 'Lincoln'#39's Birthday'
            Visible = False
          end
          item
            Date = 41682.000000000000000000
            Name = 'Lincoln'#39's Birthday'
            Visible = False
          end
          item
            Date = 42047.000000000000000000
            Name = 'Lincoln'#39's Birthday'
            Visible = False
          end
          item
            Date = 42412.000000000000000000
            Name = 'Lincoln'#39's Birthday'
            Visible = False
          end
          item
            Date = 42778.000000000000000000
            Name = 'Lincoln'#39's Birthday'
            Visible = False
          end
          item
            Date = 43143.000000000000000000
            Name = 'Lincoln'#39's Birthday'
            Visible = False
          end
          item
            Date = 43508.000000000000000000
            Name = 'Lincoln'#39's Birthday'
            Visible = False
          end
          item
            Date = 43873.000000000000000000
            Name = 'Lincoln'#39's Birthday'
            Visible = False
          end
          item
            Date = 39832.000000000000000000
            Name = 'Martin Luther King Day'
            Visible = False
          end
          item
            Date = 40196.000000000000000000
            Name = 'Martin Luther King Day'
            Visible = False
          end
          item
            Date = 40560.000000000000000000
            Name = 'Martin Luther King Day'
            Visible = False
          end
          item
            Date = 40924.000000000000000000
            Name = 'Martin Luther King Day'
            Visible = False
          end
          item
            Date = 41295.000000000000000000
            Name = 'Martin Luther King Day'
            Visible = False
          end
          item
            Date = 41659.000000000000000000
            Name = 'Martin Luther King Day'
            Visible = False
          end
          item
            Date = 42023.000000000000000000
            Name = 'Martin Luther King Day'
            Visible = False
          end
          item
            Date = 42387.000000000000000000
            Name = 'Martin Luther King Day'
            Visible = False
          end
          item
            Date = 42751.000000000000000000
            Name = 'Martin Luther King Day'
            Visible = False
          end
          item
            Date = 43115.000000000000000000
            Name = 'Martin Luther King Day'
            Visible = False
          end
          item
            Date = 43486.000000000000000000
            Name = 'Martin Luther King Day'
            Visible = False
          end
          item
            Date = 43850.000000000000000000
            Name = 'Martin Luther King Day'
            Visible = False
          end
          item
            Date = 39958.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 40329.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 40693.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 41057.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 41421.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 41785.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 42149.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 42520.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 42884.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 43248.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 43612.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 43976.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 39814.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 40179.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 40544.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 40909.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 41275.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 41640.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 42005.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 42370.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 42736.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 43101.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 43466.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 43831.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39860.000000000000000000
            Name = 'Presidents'#39' Day'
            Visible = False
          end
          item
            Date = 40224.000000000000000000
            Name = 'Presidents'#39' Day'
            Visible = False
          end
          item
            Date = 40595.000000000000000000
            Name = 'Presidents'#39' Day'
            Visible = False
          end
          item
            Date = 40959.000000000000000000
            Name = 'Presidents'#39' Day'
            Visible = False
          end
          item
            Date = 41323.000000000000000000
            Name = 'Presidents'#39' Day'
            Visible = False
          end
          item
            Date = 41687.000000000000000000
            Name = 'Presidents'#39' Day'
            Visible = False
          end
          item
            Date = 42051.000000000000000000
            Name = 'Presidents'#39' Day'
            Visible = False
          end
          item
            Date = 42415.000000000000000000
            Name = 'Presidents'#39' Day'
            Visible = False
          end
          item
            Date = 42786.000000000000000000
            Name = 'Presidents'#39' Day'
            Visible = False
          end
          item
            Date = 43150.000000000000000000
            Name = 'Presidents'#39' Day'
            Visible = False
          end
          item
            Date = 43514.000000000000000000
            Name = 'Presidents'#39' Day'
            Visible = False
          end
          item
            Date = 43878.000000000000000000
            Name = 'Presidents'#39' Day'
            Visible = False
          end
          item
            Date = 40143.000000000000000000
            Name = 'Thanksgiving Day'
          end
          item
            Date = 40507.000000000000000000
            Name = 'Thanksgiving Day'
          end
          item
            Date = 40871.000000000000000000
            Name = 'Thanksgiving Day'
          end
          item
            Date = 41235.000000000000000000
            Name = 'Thanksgiving Day'
          end
          item
            Date = 41606.000000000000000000
            Name = 'Thanksgiving Day'
          end
          item
            Date = 41970.000000000000000000
            Name = 'Thanksgiving Day'
          end
          item
            Date = 42334.000000000000000000
            Name = 'Thanksgiving Day'
          end
          item
            Date = 42698.000000000000000000
            Name = 'Thanksgiving Day'
          end
          item
            Date = 43062.000000000000000000
            Name = 'Thanksgiving Day'
          end
          item
            Date = 43426.000000000000000000
            Name = 'Thanksgiving Day'
          end
          item
            Date = 43797.000000000000000000
            Name = 'Thanksgiving Day'
          end
          item
            Date = 44161.000000000000000000
            Name = 'Thanksgiving Day'
          end>
      end>
    Left = 1264
    Top = 7
  end
  object tblWorkCell: TIBCQuery
    KeyFields = 'WORKCELL_ID'
    KeyGenerator = 'GEN_WORKCELL_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO WORKCELL'
      
        '  (WORKCELL_ID, WORKCELL_NAME, WORKCELL_TYPE_ID, LOCATION_ID, GU' +
        'I_SEQUENCE)'
      'VALUES'
      
        '  (:WORKCELL_ID, :WORKCELL_NAME, :WORKCELL_TYPE_ID, :LOCATION_ID' +
        ', :GUI_SEQUENCE)')
    SQLDelete.Strings = (
      'DELETE FROM WORKCELL'
      'WHERE'
      '  WORKCELL_ID = :Old_WORKCELL_ID')
    SQLUpdate.Strings = (
      'UPDATE WORKCELL'
      'SET'
      
        '  WORKCELL_ID = :WORKCELL_ID, WORKCELL_NAME = :WORKCELL_NAME, WO' +
        'RKCELL_TYPE_ID = :WORKCELL_TYPE_ID, LOCATION_ID = :LOCATION_ID, ' +
        'GUI_SEQUENCE = :GUI_SEQUENCE'
      'WHERE'
      '  WORKCELL_ID = :Old_WORKCELL_ID')
    SQLRefresh.Strings = (
      
        'SELECT WORKCELL_ID, WORKCELL_NAME, WORKCELL_TYPE_ID, LOCATION_ID' +
        ', GUI_SEQUENCE FROM WORKCELL'
      'WHERE'
      '  WORKCELL_ID = :WORKCELL_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM WORKCELL'
      'WHERE'
      'WORKCELL_ID = :Old_WORKCELL_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM WORKCELL'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    workcell.workcell_id,'
      '    workcell.workcell_name,'
      '    workcell.workcell_type_id,'
      '    workcell.location_id,'
      '    workcell.GUI_SEQUENCE,'
      '    locations_stock.locations_name'
      'from locations_stock'
      
        '   right outer join workcell on (locations_stock.location_id = w' +
        'orkcell.location_id)'
      'order by locations_stock.locations_name')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 587
    Top = 616
  end
  object dsWorkCell: TIBCDataSource
    DataSet = tblWorkCell
    Left = 586
    Top = 669
  end
  object tblModelTypes: TIBCQuery
    KeyGenerator = 'GEN_MODEL_TYPES_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO MODEL_TYPES'
      
        '  (MODEL_TYPE_ID, MODEL_TYPE_NAME, MODEL_TYPE_DESCRIPTION, IS_DO' +
        'OR, MAIN_REPORT)'
      'VALUES'
      
        '  (:MODEL_TYPE_ID, :MODEL_TYPE_NAME, :MODEL_TYPE_DESCRIPTION, :I' +
        'S_DOOR, :MAIN_REPORT)')
    SQLDelete.Strings = (
      'DELETE FROM MODEL_TYPES'
      'WHERE'
      '  MODEL_TYPE_ID = :Old_MODEL_TYPE_ID')
    SQLUpdate.Strings = (
      'UPDATE MODEL_TYPES'
      'SET'
      
        '  MODEL_TYPE_ID = :MODEL_TYPE_ID, MODEL_TYPE_NAME = :MODEL_TYPE_' +
        'NAME, MODEL_TYPE_DESCRIPTION = :MODEL_TYPE_DESCRIPTION, IS_DOOR ' +
        '= :IS_DOOR, MAIN_REPORT = :MAIN_REPORT'
      'WHERE'
      '  MODEL_TYPE_ID = :Old_MODEL_TYPE_ID')
    SQLRefresh.Strings = (
      
        'SELECT MODEL_TYPE_ID, MODEL_TYPE_NAME, MODEL_TYPE_DESCRIPTION, I' +
        'S_DOOR, MAIN_REPORT FROM MODEL_TYPES'
      'WHERE'
      '  MODEL_TYPE_ID = :MODEL_TYPE_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM MODEL_TYPES'
      'WHERE'
      'MODEL_TYPE_ID = :Old_MODEL_TYPE_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from MODEL_TYPES')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Options.DetailDelay = 1
    Left = 126
    Top = 98
  end
  object dsModelTypes: TIBCDataSource
    DataSet = tblModelTypes
    Left = 126
    Top = 151
  end
  object genRepository: TcxEditRepository
    Left = 864
    Top = 7
    object repoitemCheckBox: TcxEditRepositoryCheckBoxItem
      Properties.DisplayChecked = '1'
      Properties.DisplayUnchecked = '0'
      Properties.NullStyle = nssUnchecked
      Properties.ReadOnly = False
      Properties.ValueChecked = '1'
      Properties.ValueUnchecked = '0'
    end
  end
  object tblQuoteOpt: TIBCQuery
    KeyFields = 'QO_ID'
    KeyGenerator = 'GEN_QUOTE_OPTIONS_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO QUOTE_OPTIONS'
      
        '  (QO_ID, QUOTE_ID_FROM, QUOTE_ID_TO, DESCRIPTION, TIME_ADDED, U' +
        'SER_NAME)'
      'VALUES'
      
        '  (:QO_ID, :QUOTE_ID_FROM, :QUOTE_ID_TO, :DESCRIPTION, :TIME_ADD' +
        'ED, :USER_NAME)')
    SQLDelete.Strings = (
      'DELETE FROM QUOTE_OPTIONS'
      'WHERE'
      '  QO_ID = :Old_QO_ID')
    SQLUpdate.Strings = (
      'UPDATE QUOTE_OPTIONS'
      'SET'
      
        '  QO_ID = :QO_ID, QUOTE_ID_FROM = :QUOTE_ID_FROM, QUOTE_ID_TO = ' +
        ':QUOTE_ID_TO, DESCRIPTION = :DESCRIPTION, TIME_ADDED = :TIME_ADD' +
        'ED, USER_NAME = :USER_NAME'
      'WHERE'
      '  QO_ID = :Old_QO_ID')
    SQLRefresh.Strings = (
      
        'SELECT QO_ID, QUOTE_ID_FROM, QUOTE_ID_TO, DESCRIPTION, TIME_ADDE' +
        'D, USER_NAME FROM QUOTE_OPTIONS'
      'WHERE'
      '  QO_ID = :QO_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM QUOTE_OPTIONS'
      'WHERE'
      'QO_ID = :Old_QO_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from QUOTE_OPTIONS')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 1403
    Top = 357
  end
  object dsQuoteOpt: TIBCDataSource
    DataSet = tblQuoteOpt
    Left = 1404
    Top = 411
  end
  object tblIGU_SM_Lites: TIBCQuery
    KeyFields = 'IGU_SM_LITES_ID'
    KeyGenerator = 'GEN_IGU_SM_LITES_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO IGU_SM_LITES'
      
        '  (IGU_SM_LITES_ID, SM_ID, IGU_POSITION, LITE_GED_CODE, LITE_H, ' +
        'LITE_V, LITE_H_DEDUCT, LITE_V_DEDUCT, LITE_H_GRID, LITE_V_GRID, ' +
        'LITE_GLASS_EDGE_ID)'
      'VALUES'
      
        '  (:IGU_SM_LITES_ID, :SM_ID, :IGU_POSITION, :LITE_GED_CODE, :LIT' +
        'E_H, :LITE_V, :LITE_H_DEDUCT, :LITE_V_DEDUCT, :LITE_H_GRID, :LIT' +
        'E_V_GRID, :LITE_GLASS_EDGE_ID)')
    SQLDelete.Strings = (
      'DELETE FROM IGU_SM_LITES'
      'WHERE'
      '  IGU_SM_LITES_ID = :Old_IGU_SM_LITES_ID')
    SQLUpdate.Strings = (
      'UPDATE IGU_SM_LITES'
      'SET'
      
        '  IGU_SM_LITES_ID = :IGU_SM_LITES_ID, SM_ID = :SM_ID, IGU_POSITI' +
        'ON = :IGU_POSITION, LITE_GED_CODE = :LITE_GED_CODE, LITE_H = :LI' +
        'TE_H, LITE_V = :LITE_V, LITE_H_DEDUCT = :LITE_H_DEDUCT, LITE_V_D' +
        'EDUCT = :LITE_V_DEDUCT, LITE_H_GRID = :LITE_H_GRID, LITE_V_GRID ' +
        '= :LITE_V_GRID, LITE_GLASS_EDGE_ID = :LITE_GLASS_EDGE_ID'
      'WHERE'
      '  IGU_SM_LITES_ID = :Old_IGU_SM_LITES_ID')
    SQLRefresh.Strings = (
      
        'SELECT IGU_SM_LITES_ID, SM_ID, IGU_POSITION, LITE_GED_CODE, LITE' +
        '_H, LITE_V, LITE_H_DEDUCT, LITE_V_DEDUCT, LITE_H_GRID, LITE_V_GR' +
        'ID, LITE_GLASS_EDGE_ID FROM IGU_SM_LITES'
      'WHERE'
      '  IGU_SM_LITES_ID = :IGU_SM_LITES_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM IGU_SM_LITES'
      'WHERE'
      'IGU_SM_LITES_ID = :Old_IGU_SM_LITES_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from IGU_SM_LITES'
      'Where IGU_SM_LITES.SM_ID = :SM_ID'
      'Order by SM_ID, IGU_POSITION')
    MasterSource = dsSeriesModel
    FetchRows = 5
    LockMode = lmLockDelayed
    Options.RequiredFields = False
    Options.DefaultValues = True
    Options.ReturnParams = True
    LocalConstraints = False
    AfterInsert = tblIGU_SM_LitesAfterInsert
    AfterPost = tblIGU_SM_LitesAfterPost
    AfterDelete = tblIGU_SM_LitesAfterDelete
    Left = 737
    Top = 487
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SM_ID'
        Value = nil
      end>
  end
  object dsIGU_SM_Lites: TIBCDataSource
    DataSet = tblIGU_SM_Lites
    Left = 737
    Top = 542
  end
  object tblSalesZone: TIBCQuery
    KeyFields = 'SALES_ZONE_ID'
    KeyGenerator = 'GEN_SALES_ZONE_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO SALES_ZONE'
      '  (SALES_ZONE_ID, ZONE_NO, ZONE_DESCRIPTION)'
      'VALUES'
      '  (:SALES_ZONE_ID, :ZONE_NO, :ZONE_DESCRIPTION)')
    SQLDelete.Strings = (
      'DELETE FROM SALES_ZONE'
      'WHERE'
      '  SALES_ZONE_ID = :Old_SALES_ZONE_ID')
    SQLUpdate.Strings = (
      'UPDATE SALES_ZONE'
      'SET'
      
        '  SALES_ZONE_ID = :SALES_ZONE_ID, ZONE_NO = :ZONE_NO, ZONE_DESCR' +
        'IPTION = :ZONE_DESCRIPTION'
      'WHERE'
      '  SALES_ZONE_ID = :Old_SALES_ZONE_ID')
    SQLRefresh.Strings = (
      'SELECT SALES_ZONE_ID, ZONE_NO, ZONE_DESCRIPTION FROM SALES_ZONE'
      'WHERE'
      '  SALES_ZONE_ID = :SALES_ZONE_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM SALES_ZONE'
      'WHERE'
      'SALES_ZONE_ID = :Old_SALES_ZONE_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM SALES_ZONE'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from SALES_ZONE')
    LockMode = lmLockDelayed
    IndexFieldNames = 'SALES_ZONE_ID'
    Left = 878
    Top = 741
  end
  object dsSalesZone: TIBCDataSource
    DataSet = tblSalesZone
    Left = 876
    Top = 801
  end
  object tblTempGlass: TIBCQuery
    KeyFields = 'TEMPERED_GLASS_ID'
    KeyGenerator = 'GEN_TEMPERED_GLASS_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO TEMPERED_GLASS'
      
        '  (TEMPERED_GLASS_ID, LOCATION_ID, GLASS_TYPE_ID, TG_WIDTH, TG_H' +
        'EIGHT, TG_OB_QUANTITY, TG_CUR_QUANTITY, TG_BASE_COST, TG_WASTE)'
      'VALUES'
      
        '  (:TEMPERED_GLASS_ID, :LOCATION_ID, :GLASS_TYPE_ID, :TG_WIDTH, ' +
        ':TG_HEIGHT, :TG_OB_QUANTITY, :TG_CUR_QUANTITY, :TG_BASE_COST, :T' +
        'G_WASTE)')
    SQLDelete.Strings = (
      'DELETE FROM TEMPERED_GLASS'
      'WHERE'
      '  TEMPERED_GLASS_ID = :Old_TEMPERED_GLASS_ID')
    SQLUpdate.Strings = (
      'UPDATE TEMPERED_GLASS'
      'SET'
      
        '  TEMPERED_GLASS_ID = :TEMPERED_GLASS_ID, LOCATION_ID = :LOCATIO' +
        'N_ID, GLASS_TYPE_ID = :GLASS_TYPE_ID, TG_WIDTH = :TG_WIDTH, TG_H' +
        'EIGHT = :TG_HEIGHT, TG_OB_QUANTITY = :TG_OB_QUANTITY, TG_CUR_QUA' +
        'NTITY = :TG_CUR_QUANTITY, TG_BASE_COST = :TG_BASE_COST, TG_WASTE' +
        ' = :TG_WASTE'
      'WHERE'
      '  TEMPERED_GLASS_ID = :Old_TEMPERED_GLASS_ID')
    SQLRefresh.Strings = (
      
        'SELECT TEMPERED_GLASS_ID, LOCATION_ID, GLASS_TYPE_ID, TG_WIDTH, ' +
        'TG_HEIGHT, TG_OB_QUANTITY, TG_CUR_QUANTITY, TG_BASE_COST, TG_WAS' +
        'TE, TG_COST FROM TEMPERED_GLASS'
      'WHERE'
      '  TEMPERED_GLASS_ID = :TEMPERED_GLASS_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM TEMPERED_GLASS'
      'WHERE'
      'TEMPERED_GLASS_ID = :Old_TEMPERED_GLASS_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM TEMPERED_GLASS'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from TEMPERED_GLASS')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    AfterPost = tblTempGlassAfterPost
    Left = 1054
    Top = 223
  end
  object dsTempGlass: TIBCDataSource
    DataSet = tblTempGlass
    Left = 1054
    Top = 280
  end
  object tblTractType: TIBCQuery
    KeyFields = 'TRACT_TYPE_ID'
    KeyGenerator = 'GEN_TRACT_TYPE_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO TRACT_TYPE'
      '  (TRACT_TYPE_ID, TRACT_TYPE, TRACT_TYPE_DESC)'
      'VALUES'
      '  (:TRACT_TYPE_ID, :TRACT_TYPE, :TRACT_TYPE_DESC)')
    SQLDelete.Strings = (
      'DELETE FROM TRACT_TYPE'
      'WHERE'
      '  TRACT_TYPE_ID = :Old_TRACT_TYPE_ID')
    SQLUpdate.Strings = (
      'UPDATE TRACT_TYPE'
      'SET'
      
        '  TRACT_TYPE_ID = :TRACT_TYPE_ID, TRACT_TYPE = :TRACT_TYPE, TRAC' +
        'T_TYPE_DESC = :TRACT_TYPE_DESC'
      'WHERE'
      '  TRACT_TYPE_ID = :Old_TRACT_TYPE_ID')
    SQLRefresh.Strings = (
      
        'SELECT TRACT_TYPE_ID, TRACT_TYPE, TRACT_TYPE_DESC FROM TRACT_TYP' +
        'E'
      'WHERE'
      '  TRACT_TYPE_ID = :TRACT_TYPE_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM TRACT_TYPE'
      'WHERE'
      'TRACT_TYPE_ID = :Old_TRACT_TYPE_ID'
      'FOR UPDATE WITH LOCK')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from TRACT_TYPE')
    LockMode = lmLockDelayed
    IndexFieldNames = 'TRACT_TYPE_ID'
    Left = 1400
    Top = 616
  end
  object dsTractType: TIBCDataSource
    DataSet = tblTractType
    Left = 1399
    Top = 669
  end
  object tblTractContact: TIBCQuery
    KeyFields = 'TRACT_CONTACTS_ID'
    KeyGenerator = 'GEN_TRACT_CONTACTS_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO TRACT_CONTACTS'
      '  (TRACT_CONTACTS_ID, TRACT_ID, CONTACT_ID, IS_DEFAULT)'
      'VALUES'
      '  (:TRACT_CONTACTS_ID, :TRACT_ID, :CONTACT_ID, :IS_DEFAULT)')
    SQLDelete.Strings = (
      'DELETE FROM TRACT_CONTACTS'
      'WHERE'
      '  TRACT_CONTACTS_ID = :Old_TRACT_CONTACTS_ID')
    SQLUpdate.Strings = (
      'UPDATE TRACT_CONTACTS'
      'SET'
      
        '  TRACT_CONTACTS_ID = :TRACT_CONTACTS_ID, TRACT_ID = :TRACT_ID, ' +
        'CONTACT_ID = :CONTACT_ID, IS_DEFAULT = :IS_DEFAULT'
      'WHERE'
      '  TRACT_CONTACTS_ID = :Old_TRACT_CONTACTS_ID')
    SQLRefresh.Strings = (
      'select '
      '    tract_contacts.tract_contacts_id,'
      '    tract_contacts.tract_id,'
      '    tract_contacts.contact_id,'
      '    tract_contacts.is_default,'
      '    cust_contact.contact_title,'
      '    cust_contact.contact_telephone,'
      '    cust_contact.phone_ext,'
      '    cust_contact.first_name,'
      '    cust_contact.last_name,'
      '    cust_contact.contact_fax,'
      '    cust_contact.contact_email,'
      '    cust_contact.contact_cell,'
      '    cust_contact.accept_sms'
      'from cust_contact'
      
        '   right outer join tract_contacts on (cust_contact.contact_id =' +
        ' tract_contacts.contact_id)'
      'WHERE'
      '  TRACT_CONTACTS_ID = :TRACT_CONTACTS_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM TRACT_CONTACTS'
      'WHERE'
      'TRACT_CONTACTS_ID = :Old_TRACT_CONTACTS_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM TRACT_CONTACTS'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    tract_contacts.tract_contacts_id,'
      '    tract_contacts.tract_id,'
      '    tract_contacts.contact_id,'
      '    tract_contacts.is_default,'
      '    cust_contact.contact_title,'
      '    cust_contact.contact_telephone,'
      '    cust_contact.phone_ext,'
      '    cust_contact.first_name,'
      '    cust_contact.last_name,'
      '    cust_contact.contact_fax,'
      '    cust_contact.contact_email,'
      '    cust_contact.contact_cell,'
      '    cust_contact.accept_sms'
      'from cust_contact'
      
        '   right outer join tract_contacts on (cust_contact.contact_id =' +
        ' tract_contacts.contact_id)'
      'where tract_contacts.tract_id = :tract_id')
    MasterSource = dsTract
    LockMode = lmLockDelayed
    IndexFieldNames = 'TRACT_CONTACTS_ID'
    AfterInsert = tblTractContactAfterInsert
    AfterPost = tblTractContactAfterPost
    Left = 1485
    Top = 616
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tract_id'
        Value = nil
      end>
  end
  object dsTractContact: TIBCDataSource
    DataSet = tblTractContact
    Left = 1484
    Top = 669
  end
  object tblSPCallout: TIBCQuery
    KeyFields = 'SP_CALLOUT_ID'
    KeyGenerator = 'GEN_SP_CALLOUT_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO SP_CALLOUT'
      '  (SP_CALLOUT_ID, SM_ID, SP_CALLOUT_NAME, SP_DIM_AXIS)'
      'VALUES'
      '  (:SP_CALLOUT_ID, :SM_ID, :SP_CALLOUT_NAME, :SP_DIM_AXIS)')
    SQLDelete.Strings = (
      'DELETE FROM SP_CALLOUT'
      'WHERE'
      '  SP_CALLOUT_ID = :Old_SP_CALLOUT_ID')
    SQLUpdate.Strings = (
      'UPDATE SP_CALLOUT'
      'SET'
      
        '  SP_CALLOUT_ID = :SP_CALLOUT_ID, SM_ID = :SM_ID, SP_CALLOUT_NAM' +
        'E = :SP_CALLOUT_NAME, SP_DIM_AXIS = :SP_DIM_AXIS'
      'WHERE'
      '  SP_CALLOUT_ID = :Old_SP_CALLOUT_ID')
    SQLRefresh.Strings = (
      
        'SELECT SP_CALLOUT_ID, SM_ID, SP_CALLOUT_NAME, SP_DIM_AXIS FROM S' +
        'P_CALLOUT'
      'WHERE'
      '  SP_CALLOUT_ID = :SP_CALLOUT_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM SP_CALLOUT'
      'WHERE'
      'SP_CALLOUT_ID = :Old_SP_CALLOUT_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM SP_CALLOUT'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from SP_CALLOUT'
      'where SM_ID = :SM_ID')
    MasterSource = dsSeriesModel
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    IndexFieldNames = 'SP_CALLOUT_ID'
    AfterInsert = tblSPCalloutAfterInsert
    Left = 1180
    Top = 489
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SM_ID'
        Value = nil
      end>
  end
  object dsSPCallout: TIBCDataSource
    DataSet = tblSPCallout
    Left = 1178
    Top = 544
  end
  object tblSPDIM: TIBCQuery
    KeyFields = 'SP_DIM_ID'
    KeyGenerator = 'GEN_SP_DIM_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO SP_DIM'
      '  (SP_DIM_ID, SP_CALLOUT_ID, IGU_POSITION, SP_DIM_VAL)'
      'VALUES'
      '  (:SP_DIM_ID, :SP_CALLOUT_ID, :IGU_POSITION, :SP_DIM_VAL)')
    SQLDelete.Strings = (
      'DELETE FROM SP_DIM'
      'WHERE'
      '  SP_DIM_ID = :Old_SP_DIM_ID')
    SQLUpdate.Strings = (
      'UPDATE SP_DIM'
      'SET'
      
        '  SP_DIM_ID = :SP_DIM_ID, SP_CALLOUT_ID = :SP_CALLOUT_ID, IGU_PO' +
        'SITION = :IGU_POSITION, SP_DIM_VAL = :SP_DIM_VAL'
      'WHERE'
      '  SP_DIM_ID = :Old_SP_DIM_ID')
    SQLRefresh.Strings = (
      
        'SELECT SP_DIM_ID, SP_CALLOUT_ID, IGU_POSITION, SP_DIM_VAL FROM S' +
        'P_DIM'
      'WHERE'
      '  SP_DIM_ID = :SP_DIM_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM SP_DIM'
      'WHERE'
      'SP_DIM_ID = :Old_SP_DIM_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM SP_DIM'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from SP_DIM'
      'where SP_CALLOUT_ID = :SP_CALLOUT_ID')
    MasterSource = dsSPCallout
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    IndexFieldNames = 'SP_DIM_ID'
    AfterInsert = tblSPDIMAfterInsert
    Left = 1241
    Top = 489
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SP_CALLOUT_ID'
        ParamType = ptInput
        Value = nil
      end>
  end
  object dsSPDIM: TIBCDataSource
    DataSet = tblSPDIM
    Left = 1239
    Top = 544
  end
  object tblTractHistory: TIBCQuery
    UpdatingTable = 'TRACT_HISTORY'
    KeyFields = 'TH_ID'
    KeyGenerator = 'GEN_TRACT_HISTORY_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO TRACT_HISTORY'
      
        '  (TH_ID, TRACT_ID, CHANGE_DATE_TIME, UID, SERIES_ID, SC_ID, SNF' +
        '_ID, GLASS_KIND_ID_INNER, GLASS_KIND_ID_MIDDLE, GLASS_KIND_ID_OU' +
        'TER, GLAZING_ID, GAS_ID, USER_COMMENT)'
      'VALUES'
      
        '  (:TH_ID, :TRACT_ID, :CHANGE_DATE_TIME, :UID, :SERIES_ID, :SC_I' +
        'D, :SNF_ID, :GLASS_KIND_ID_INNER, :GLASS_KIND_ID_MIDDLE, :GLASS_' +
        'KIND_ID_OUTER, :GLAZING_ID, :GAS_ID, :USER_COMMENT)')
    SQLDelete.Strings = (
      'DELETE FROM TRACT_HISTORY'
      'WHERE'
      '  TH_ID = :Old_TH_ID')
    SQLUpdate.Strings = (
      'UPDATE TRACT_HISTORY'
      'SET'
      
        '  TH_ID = :TH_ID, TRACT_ID = :TRACT_ID, CHANGE_DATE_TIME = :CHAN' +
        'GE_DATE_TIME, UID = :UID, SERIES_ID = :SERIES_ID, SC_ID = :SC_ID' +
        ', SNF_ID = :SNF_ID, GLASS_KIND_ID_INNER = :GLASS_KIND_ID_INNER, ' +
        'GLASS_KIND_ID_MIDDLE = :GLASS_KIND_ID_MIDDLE, GLASS_KIND_ID_OUTE' +
        'R = :GLASS_KIND_ID_OUTER, GLAZING_ID = :GLAZING_ID, GAS_ID = :GA' +
        'S_ID, USER_COMMENT = :USER_COMMENT'
      'WHERE'
      '  TH_ID = :Old_TH_ID')
    SQLRefresh.Strings = (
      'select '
      '    tract_history.th_id,'
      '    tract_history.tract_id,'
      '    tract_history.change_date_time,'
      '    tract_history.uid,'
      '    tract_history.series_id,'
      '    tract_history.sc_id,'
      '    tract_history.snf_id,'
      '    tract_history.glass_kind_id_inner,'
      '    tract_history.glass_kind_id_middle,'
      '    tract_history.glass_kind_id_outer,'
      '    tract_history.glazing_id,'
      '    tract_history.gas_id,'
      '    tract_history.user_comment,'
      '    series.series_name,'
      '    colors.color_name,'
      '    nailfin.nailfin_name,'
      '    glass_kind_inner.glass_kind glass_kind_inner,'
      '    glass_kind_middle.glass_kind glass_kind_middle,'
      '    glass_kind_outer.glass_kind glass_kind_outer,'
      '    glazing.glazing_name,'
      '    gas.gas_name,'
      '    users.uname'
      'from users'
      
        '   right outer join tract_history on (users.uid = tract_history.' +
        'uid)'
      '   left outer join gas on (tract_history.gas_id = gas.gas_id)'
      
        '   left outer join series on (tract_history.series_id = series.s' +
        'eries_id)'
      
        '   left outer join series_color on (tract_history.sc_id = series' +
        '_color.sc_id)'
      
        '   left outer join colors on (series_color.color_id = colors.col' +
        'or_id)'
      
        '   left outer join series_nailfin on (tract_history.snf_id = ser' +
        'ies_nailfin.snf_id)'
      
        '   left outer join nailfin on (series_nailfin.nailfin_id = nailf' +
        'in.nailfin_id)'
      
        '   left outer join glass_kind glass_kind_inner on (tract_history' +
        '.glass_kind_id_inner = glass_kind_inner.glass_kind_id)'
      
        '   left outer join glass_kind glass_kind_middle on (tract_histor' +
        'y.glass_kind_id_middle = glass_kind_middle.glass_kind_id)'
      
        '   left outer join glass_kind glass_kind_outer on (tract_history' +
        '.glass_kind_id_outer = glass_kind_outer.glass_kind_id)'
      
        '   left outer join glazing on (tract_history.glazing_id = glazin' +
        'g.glazing_id)'
      'WHERE'
      '  TH_ID = :TH_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM TRACT_HISTORY'
      'WHERE'
      'TH_ID = :Old_TH_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM TRACT_HISTORY'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    tract_history.th_id,'
      '    tract_history.tract_id,'
      '    tract_history.change_date_time,'
      '    tract_history.uid,'
      '    tract_history.series_id,'
      '    tract_history.sc_id,'
      '    tract_history.snf_id,'
      '    tract_history.glass_kind_id_inner,'
      '    tract_history.glass_kind_id_middle,'
      '    tract_history.glass_kind_id_outer,'
      '    tract_history.glazing_id,'
      '    tract_history.gas_id,'
      '    tract_history.user_comment,'
      '    series.series_name,'
      '    colors.color_name,'
      '    nailfin.nailfin_name,'
      '    glass_kind_inner.glass_kind glass_kind_inner,'
      '    glass_kind_middle.glass_kind glass_kind_middle,'
      '    glass_kind_outer.glass_kind glass_kind_outer,'
      '    glazing.glazing_name,'
      '    gas.gas_name,'
      '    users.uname'
      'from users'
      
        '   right outer join tract_history on (users.uid = tract_history.' +
        'uid)'
      '   left outer join gas on (tract_history.gas_id = gas.gas_id)'
      
        '   left outer join series on (tract_history.series_id = series.s' +
        'eries_id)'
      
        '   left outer join series_color on (tract_history.sc_id = series' +
        '_color.sc_id)'
      
        '   left outer join colors on (series_color.color_id = colors.col' +
        'or_id)'
      
        '   left outer join series_nailfin on (tract_history.snf_id = ser' +
        'ies_nailfin.snf_id)'
      
        '   left outer join nailfin on (series_nailfin.nailfin_id = nailf' +
        'in.nailfin_id)'
      
        '   left outer join glass_kind glass_kind_inner on (tract_history' +
        '.glass_kind_id_inner = glass_kind_inner.glass_kind_id)'
      
        '   left outer join glass_kind glass_kind_middle on (tract_histor' +
        'y.glass_kind_id_middle = glass_kind_middle.glass_kind_id)'
      
        '   left outer join glass_kind glass_kind_outer on (tract_history' +
        '.glass_kind_id_outer = glass_kind_outer.glass_kind_id)'
      
        '   left outer join glazing on (tract_history.glazing_id = glazin' +
        'g.glazing_id)'
      'Where tract_history.TRACT_ID = :TRACT_ID'
      'Order by CHANGE_DATE_TIME desc')
    MasterSource = dsTract
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Left = 1075
    Top = 616
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TRACT_ID'
        ParamType = ptInput
        Value = 5235
      end>
  end
  object dsTractHistory: TIBCDataSource
    DataSet = tblTractHistory
    Left = 1075
    Top = 669
  end
  object GenScript: TIBCScript
    Connection = MainDB
    Transaction = transWrite
    Left = 1408
    Top = 80
  end
  object tblScanIGU: TIBCQuery
    UpdatingTable = 'SCAN_IGU'
    KeyFields = 'SCAN_IGU_ID'
    KeyGenerator = 'GEN_SCAN_IGU_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO SCAN_IGU'
      
        '  (SCAN_IGU_ID, IGU_ID, SCAN_DATE, SCAN_TIME, CART_NO, WORKCELL_' +
        'ID)'
      'VALUES'
      
        '  (:SCAN_IGU_ID, :IGU_ID, :SCAN_DATE, :SCAN_TIME, :CART_NO, :WOR' +
        'KCELL_ID)')
    SQLDelete.Strings = (
      'DELETE FROM SCAN_IGU'
      'WHERE'
      '  SCAN_IGU_ID = :Old_SCAN_IGU_ID')
    SQLUpdate.Strings = (
      'UPDATE SCAN_IGU'
      'SET'
      
        '  SCAN_IGU_ID = :SCAN_IGU_ID, IGU_ID = :IGU_ID, SCAN_DATE = :SCA' +
        'N_DATE, SCAN_TIME = :SCAN_TIME, CART_NO = :CART_NO, WORKCELL_ID ' +
        '= :WORKCELL_ID'
      'WHERE'
      '  SCAN_IGU_ID = :Old_SCAN_IGU_ID')
    SQLRefresh.Strings = (
      
        'SELECT SCAN_IGU_ID, IGU_ID, SCAN_DATE, SCAN_TIME, CART_NO, WORKC' +
        'ELL_ID FROM SCAN_IGU'
      'WHERE'
      '  SCAN_IGU_ID = :SCAN_IGU_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM SCAN_IGU'
      'WHERE'
      'SCAN_IGU_ID = :Old_SCAN_IGU_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM SCAN_IGU'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    scan_igu.scan_igu_id,'
      '    scan_igu.igu_id,'
      '    scan_igu.scan_date,'
      '    scan_igu.scan_time,'
      '    scan_igu.cart_no,'
      '    scan_igu.workcell_id,'
      '    workcell.workcell_name'
      'from scan_igu'
      
        '   left outer join workcell on (scan_igu.workcell_id = workcell.' +
        'workcell_id)'
      'where (scan_igu.igu_id = :igu_id)'
      
        ' And (scan_igu.scan_date >= current_Date -1) and (scan_igu.scan_' +
        'date <= current_Date +1)'
      
        '--scan_igu.scan_date between dateadd(-1 day to current_date) and' +
        ' dateadd(1 day to current_date)'
      
        'Order by scan_igu.scan_date desc, scan_igu.scan_time desc ,scan_' +
        'igu.cart_no')
    MasterSource = dsIGU
    FetchRows = 5
    LockMode = lmLockDelayed
    Options.RequiredFields = False
    Options.DefaultValues = True
    Options.ReturnParams = True
    LocalConstraints = False
    Left = 661
    Top = 487
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'igu_id'
        Value = nil
      end>
  end
  object dsScanIGU: TIBCDataSource
    DataSet = tblScanIGU
    Left = 661
    Top = 542
  end
  object tblWorkCell_Type: TIBCQuery
    KeyFields = 'WORKCELL_TYPE_ID'
    KeyGenerator = 'GEN_WORKCELL_TYPE_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO WORKCELL_TYPE'
      '  (WORKCELL_TYPE_ID, WORKCELL_TYPE)'
      'VALUES'
      '  (:WORKCELL_TYPE_ID, :WORKCELL_TYPE)')
    SQLDelete.Strings = (
      'DELETE FROM WORKCELL_TYPE'
      'WHERE'
      '  WORKCELL_TYPE_ID = :Old_WORKCELL_TYPE_ID')
    SQLUpdate.Strings = (
      'UPDATE WORKCELL_TYPE'
      'SET'
      
        '  WORKCELL_TYPE_ID = :WORKCELL_TYPE_ID, WORKCELL_TYPE = :WORKCEL' +
        'L_TYPE'
      'WHERE'
      '  WORKCELL_TYPE_ID = :Old_WORKCELL_TYPE_ID')
    SQLRefresh.Strings = (
      'SELECT WORKCELL_TYPE_ID, WORKCELL_TYPE FROM WORKCELL_TYPE'
      'WHERE'
      '  WORKCELL_TYPE_ID = :WORKCELL_TYPE_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM WORKCELL_TYPE'
      'WHERE'
      'WORKCELL_TYPE_ID = :Old_WORKCELL_TYPE_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM WORKCELL_TYPE'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from WORKCELL_TYPE')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    IndexFieldNames = 'WORKCELL_TYPE_ID'
    Left = 701
    Top = 616
  end
  object dsWorkCell_Type: TIBCDataSource
    DataSet = tblWorkCell_Type
    Left = 700
    Top = 669
  end
  object tblShift: TIBCQuery
    KeyGenerator = 'GEN_WORK_SHIFT_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO WORK_SHIFT'
      
        '  (WORK_SHIFT_ID, SHIFT_NO, SHIFT_START, SHIFT_END, SHIFT_GOAL, ' +
        'LUNCH_FROM, LUNCH_TO, BREAK_1_FROM, BREAK_1_TO, BREAK_2_FROM, BR' +
        'EAK_2_TO, BREAK_3_FROM, BREAK_3_TO)'
      'VALUES'
      
        '  (:WORK_SHIFT_ID, :SHIFT_NO, :SHIFT_START, :SHIFT_END, :SHIFT_G' +
        'OAL, :LUNCH_FROM, :LUNCH_TO, :BREAK_1_FROM, :BREAK_1_TO, :BREAK_' +
        '2_FROM, :BREAK_2_TO, :BREAK_3_FROM, :BREAK_3_TO)')
    SQLDelete.Strings = (
      'DELETE FROM WORK_SHIFT'
      'WHERE'
      '  WORK_SHIFT_ID = :Old_WORK_SHIFT_ID')
    SQLUpdate.Strings = (
      'UPDATE WORK_SHIFT'
      'SET'
      
        '  WORK_SHIFT_ID = :WORK_SHIFT_ID, SHIFT_NO = :SHIFT_NO, SHIFT_ST' +
        'ART = :SHIFT_START, SHIFT_END = :SHIFT_END, SHIFT_GOAL = :SHIFT_' +
        'GOAL, LUNCH_FROM = :LUNCH_FROM, LUNCH_TO = :LUNCH_TO, BREAK_1_FR' +
        'OM = :BREAK_1_FROM, BREAK_1_TO = :BREAK_1_TO, BREAK_2_FROM = :BR' +
        'EAK_2_FROM, BREAK_2_TO = :BREAK_2_TO, BREAK_3_FROM = :BREAK_3_FR' +
        'OM, BREAK_3_TO = :BREAK_3_TO'
      'WHERE'
      '  WORK_SHIFT_ID = :Old_WORK_SHIFT_ID')
    SQLRefresh.Strings = (
      
        'SELECT WORK_SHIFT_ID, SHIFT_NO, SHIFT_START, SHIFT_END, SHIFT_GO' +
        'AL, LUNCH_FROM, LUNCH_TO, BREAK_1_FROM, BREAK_1_TO, BREAK_2_FROM' +
        ', BREAK_2_TO, BREAK_3_FROM, BREAK_3_TO FROM WORK_SHIFT'
      'WHERE'
      '  WORK_SHIFT_ID = :WORK_SHIFT_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM WORK_SHIFT'
      'WHERE'
      'WORK_SHIFT_ID = :Old_WORK_SHIFT_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM WORK_SHIFT'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from WORK_SHIFT')
    LockMode = lmLockDelayed
    Options.RequiredFields = False
    Options.DefaultValues = True
    LocalConstraints = False
    Left = 948
    Top = 741
  end
  object dsShift: TIBCDataSource
    DataSet = tblShift
    Left = 948
    Top = 796
  end
  object tblPerformanceHistory: TIBCQuery
    KeyGenerator = 'GEN_PERFORMANCE_HISTORY_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO PERFORMANCE_HISTORY'
      
        '  (PERF_HISTORY_ID, PERF_DATE, SHIFT_NO, WORKCELL_ID, GOAL, DONE' +
        ', RATE, PERFORMANCE)'
      'VALUES'
      
        '  (:PERF_HISTORY_ID, :PERF_DATE, :SHIFT_NO, :WORKCELL_ID, :GOAL,' +
        ' :DONE, :RATE, :PERFORMANCE)')
    SQLDelete.Strings = (
      'DELETE FROM PERFORMANCE_HISTORY'
      'WHERE'
      '  PERF_HISTORY_ID = :Old_PERF_HISTORY_ID')
    SQLUpdate.Strings = (
      'UPDATE PERFORMANCE_HISTORY'
      'SET'
      
        '  PERF_HISTORY_ID = :PERF_HISTORY_ID, PERF_DATE = :PERF_DATE, SH' +
        'IFT_NO = :SHIFT_NO, WORKCELL_ID = :WORKCELL_ID, GOAL = :GOAL, DO' +
        'NE = :DONE, RATE = :RATE, PERFORMANCE = :PERFORMANCE'
      'WHERE'
      '  PERF_HISTORY_ID = :Old_PERF_HISTORY_ID')
    SQLRefresh.Strings = (
      
        'SELECT PERF_HISTORY_ID, PERF_DATE, SHIFT_NO, WORKCELL_ID, GOAL, ' +
        'DONE, RATE, PERFORMANCE FROM PERFORMANCE_HISTORY'
      'WHERE'
      '  PERF_HISTORY_ID = :PERF_HISTORY_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM PERFORMANCE_HISTORY'
      'WHERE'
      'PERF_HISTORY_ID = :Old_PERF_HISTORY_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM PERFORMANCE_HISTORY'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from PERFORMANCE_HISTORY')
    LockMode = lmLockDelayed
    Options.RequiredFields = False
    Options.DefaultValues = True
    LocalConstraints = False
    Left = 1039
    Top = 740
  end
  object dsPerformanceHistory: TIBCDataSource
    DataSet = tblPerformanceHistory
    Left = 1039
    Top = 795
  end
  object tblAccessories_Type: TIBCQuery
    KeyGenerator = 'GEN_ACCESSORY_TYPE_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO ACCESSORY_TYPE'
      '  (ACCESSORY_TYPE_ID, ACC_TYPE_NAME)'
      'VALUES'
      '  (:ACCESSORY_TYPE_ID, :ACC_TYPE_NAME)')
    SQLDelete.Strings = (
      'DELETE FROM ACCESSORY_TYPE'
      'WHERE'
      '  ACCESSORY_TYPE_ID = :Old_ACCESSORY_TYPE_ID')
    SQLUpdate.Strings = (
      'UPDATE ACCESSORY_TYPE'
      'SET'
      
        '  ACCESSORY_TYPE_ID = :ACCESSORY_TYPE_ID, ACC_TYPE_NAME = :ACC_T' +
        'YPE_NAME'
      'WHERE'
      '  ACCESSORY_TYPE_ID = :Old_ACCESSORY_TYPE_ID')
    SQLRefresh.Strings = (
      'SELECT ACCESSORY_TYPE_ID, ACC_TYPE_NAME FROM ACCESSORY_TYPE'
      'WHERE'
      '  ACCESSORY_TYPE_ID = :ACCESSORY_TYPE_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM ACCESSORY_TYPE'
      'WHERE'
      'ACCESSORY_TYPE_ID = :Old_ACCESSORY_TYPE_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM ACCESSORY_TYPE'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from ACCESSORY_TYPE')
    MasterSource = dsLocationStock
    LockMode = lmLockDelayed
    RefreshOptions = [roAfterInsert, roAfterUpdate]
    Options.DefaultValues = True
    Left = 352
    Top = 358
  end
  object dsAccessories_Type: TIBCDataSource
    DataSet = tblAccessories_Type
    Left = 352
    Top = 410
  end
  object tblTempGlassOrders: TIBCQuery
    KeyFields = 'TGO_ID'
    KeyGenerator = 'GEN_TEMPERED_GLASS_ORDERS_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO TEMPERED_GLASS_ORDERS'
      '  (TGO_ID, TGO_DATE, TEMPERED_GLASS_ID, TGO_QUANTITY)'
      'VALUES'
      '  (:TGO_ID, :TGO_DATE, :TEMPERED_GLASS_ID, :TGO_QUANTITY)')
    SQLDelete.Strings = (
      'DELETE FROM TEMPERED_GLASS_ORDERS'
      'WHERE'
      '  TEMPERED_GLASS_ID = :Old_TEMPERED_GLASS_ID')
    SQLUpdate.Strings = (
      'UPDATE TEMPERED_GLASS_ORDERS'
      'SET'
      
        '  TGO_ID = :TGO_ID, TGO_DATE = :TGO_DATE, TEMPERED_GLASS_ID = :T' +
        'EMPERED_GLASS_ID, TGO_QUANTITY = :TGO_QUANTITY'
      'WHERE'
      '  TEMPERED_GLASS_ID = :Old_TEMPERED_GLASS_ID')
    SQLRefresh.Strings = (
      
        'SELECT TGO_ID, TGO_DATE, TEMPERED_GLASS_ID, TGO_QUANTITY FROM TE' +
        'MPERED_GLASS_ORDERS'
      'WHERE'
      '  TEMPERED_GLASS_ID = :TEMPERED_GLASS_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM TEMPERED_GLASS_ORDERS'
      'WHERE'
      'TEMPERED_GLASS_ID = :Old_TEMPERED_GLASS_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM TEMPERED_GLASS_ORDERS'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from TEMPERED_GLASS_ORDERS'
      'where TEMPERED_GLASS_ID = :TEMPERED_GLASS_ID')
    MasterSource = dsTempGlass
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    AfterInsert = tblTempGlassOrdersAfterInsert
    AfterPost = tblTempGlassOrdersAfterPost
    AfterDelete = tblTempGlassOrdersAfterDelete
    Left = 1188
    Top = 223
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TEMPERED_GLASS_ID'
        Value = nil
      end>
  end
  object dsTempGlassOrders: TIBCDataSource
    DataSet = tblTempGlassOrders
    Left = 1188
    Top = 280
  end
  object tblXPanel_SM_Lites: TIBCQuery
    KeyFields = 'XPANEL_SM_LITES_ID'
    KeyGenerator = 'GEN_XPANEL_SM_LITES_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO XPANEL_SM_LITES'
      
        '  (XPANEL_SM_LITES_ID, SM_ID, XP_POSITION, XP_LITE_V, XP_LITE_H,' +
        ' XP_LITE_V_DEDUCT, XP_LITE_H_DEDUCT)'
      'VALUES'
      
        '  (:XPANEL_SM_LITES_ID, :SM_ID, :XP_POSITION, :XP_LITE_V, :XP_LI' +
        'TE_H, :XP_LITE_V_DEDUCT, :XP_LITE_H_DEDUCT)')
    SQLDelete.Strings = (
      'DELETE FROM XPANEL_SM_LITES'
      'WHERE'
      '  XPANEL_SM_LITES_ID = :Old_XPANEL_SM_LITES_ID')
    SQLUpdate.Strings = (
      'UPDATE XPANEL_SM_LITES'
      'SET'
      
        '  XPANEL_SM_LITES_ID = :XPANEL_SM_LITES_ID, SM_ID = :SM_ID, XP_P' +
        'OSITION = :XP_POSITION, XP_LITE_V = :XP_LITE_V, XP_LITE_H = :XP_' +
        'LITE_H, XP_LITE_V_DEDUCT = :XP_LITE_V_DEDUCT, XP_LITE_H_DEDUCT =' +
        ' :XP_LITE_H_DEDUCT'
      'WHERE'
      '  XPANEL_SM_LITES_ID = :Old_XPANEL_SM_LITES_ID')
    SQLRefresh.Strings = (
      
        'SELECT XPANEL_SM_LITES_ID, SM_ID, XP_POSITION, XP_LITE_V, XP_LIT' +
        'E_H, XP_LITE_V_DEDUCT, XP_LITE_H_DEDUCT FROM XPANEL_SM_LITES'
      'WHERE'
      '  XPANEL_SM_LITES_ID = :XPANEL_SM_LITES_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM XPANEL_SM_LITES'
      'WHERE'
      'XPANEL_SM_LITES_ID = :Old_XPANEL_SM_LITES_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM XPANEL_SM_LITES'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from XPANEL_SM_LITES'
      'Where XPANEL_SM_LITES.SM_ID = :SM_ID'
      'Order by SM_ID, XP_POSITION')
    MasterSource = dsSeriesModel
    FetchRows = 5
    LockMode = lmLockDelayed
    Options.RequiredFields = False
    Options.DefaultValues = True
    Options.ReturnParams = True
    LocalConstraints = False
    AfterInsert = tblXPanel_SM_LitesAfterInsert
    Left = 830
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SM_ID'
        Value = nil
      end>
  end
  object dsXPanel_SM_Lites: TIBCDataSource
    DataSet = tblXPanel_SM_Lites
    Left = 830
    Top = 543
  end
  object TractPhaseSQL: TIBCQuery
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from VW_CHART_TRACT_PHASE_DATE')
    LockMode = lmLockDelayed
    Options.QueryRecCount = True
    Left = 1670
    Top = 10
  end
  object tblQuotePrices: TIBCQuery
    KeyFields = 'QUOTE_PRICES_ID'
    KeyGenerator = 'GEN_QUOTE_PRICES_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO QUOTE_PRICES'
      
        '  (QUOTE_PRICES_ID, QUOTE_ID, UID, FIRST_DRAW, SECOND_DRAW, THIR' +
        'D_DRAW, RETENTION, PRICING_DATETIME, COMMENTS)'
      'VALUES'
      
        '  (:QUOTE_PRICES_ID, :QUOTE_ID, :UID, :FIRST_DRAW, :SECOND_DRAW,' +
        ' :THIRD_DRAW, :RETENTION, :PRICING_DATETIME, :COMMENTS)')
    SQLDelete.Strings = (
      'DELETE FROM QUOTE_PRICES'
      'WHERE'
      '  QUOTE_PRICES_ID = :Old_QUOTE_PRICES_ID')
    SQLUpdate.Strings = (
      'UPDATE QUOTE_PRICES'
      'SET'
      
        '  QUOTE_PRICES_ID = :QUOTE_PRICES_ID, QUOTE_ID = :QUOTE_ID, UID ' +
        '= :UID, FIRST_DRAW = :FIRST_DRAW, SECOND_DRAW = :SECOND_DRAW, TH' +
        'IRD_DRAW = :THIRD_DRAW, RETENTION = :RETENTION, PRICING_DATETIME' +
        ' = :PRICING_DATETIME, COMMENTS = :COMMENTS'
      'WHERE'
      '  QUOTE_PRICES_ID = :Old_QUOTE_PRICES_ID')
    SQLRefresh.Strings = (
      
        'SELECT QUOTE_PRICES_ID, QUOTE_ID, UID, FIRST_DRAW, SECOND_DRAW, ' +
        'THIRD_DRAW, RETENTION, QUOTE_PRICE, PRICING_DATETIME, COMMENTS F' +
        'ROM QUOTE_PRICES'
      'WHERE'
      '  QUOTE_PRICES_ID = :QUOTE_PRICES_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM QUOTE_PRICES'
      'WHERE'
      'QUOTE_PRICES_ID = :Old_QUOTE_PRICES_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM QUOTE_PRICES'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'SELECT * from QUOTE_PRICES'
      'where QUOTE_ID = :QUOTE_ID')
    MasterSource = dsQuotes
    LockMode = lmLockDelayed
    Options.RequiredFields = False
    Options.DefaultValues = True
    Options.ReturnParams = True
    LocalConstraints = False
    AfterInsert = tblQuotePricesAfterInsert
    Left = 214
    Top = 489
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'QUOTE_ID'
        Value = nil
      end>
  end
  object dsQuotePrices: TIBCDataSource
    DataSet = tblQuotePrices
    Left = 216
    Top = 544
  end
  object tblBOMCostType: TIBCQuery
    KeyFields = 'BCT_ID'
    KeyGenerator = 'GEN_BOM_COST_TYPE_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO BOM_COST_TYPE'
      '  (BCT_ID, BCT_NAME)'
      'VALUES'
      '  (:BCT_ID, :BCT_NAME)')
    SQLDelete.Strings = (
      'DELETE FROM BOM_COST_TYPE'
      'WHERE'
      '  BCT_ID = :Old_BCT_ID')
    SQLUpdate.Strings = (
      'UPDATE BOM_COST_TYPE'
      'SET'
      '  BCT_ID = :BCT_ID, BCT_NAME = :BCT_NAME'
      'WHERE'
      '  BCT_ID = :Old_BCT_ID')
    SQLRefresh.Strings = (
      'SELECT BCT_ID, BCT_NAME FROM BOM_COST_TYPE'
      'WHERE'
      '  BCT_ID = :BCT_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM BOM_COST_TYPE'
      'WHERE'
      'BCT_ID = :Old_BCT_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM BOM_COST_TYPE'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from BOM_COST_TYPE')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    AfterPost = tblBOMAfterPost
    Left = 477
    Top = 616
  end
  object dsBomCostType: TIBCDataSource
    DataSet = tblBOMCostType
    Left = 477
    Top = 669
  end
  object mdBookmark: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 1664
    Top = 80
    object mdBookmarkbook_no: TSmallintField
      FieldName = 'book_no'
    end
    object mdBookmarkbook_name: TStringField
      FieldName = 'book_name'
      Size = 50
    end
    object mdBookmarkbook_type: TStringField
      FieldName = 'book_type'
      Size = 30
    end
    object mdBookmarkcust_id: TIntegerField
      FieldName = 'cust_id'
    end
    object mdBookmarkquote_id: TIntegerField
      FieldName = 'quote_id'
    end
    object mdBookmarktract_id: TIntegerField
      FieldName = 'tract_id'
    end
    object mdBookmarkphase_id: TIntegerField
      FieldName = 'phase_id'
    end
  end
  object tblAccessories_lookup: TIBCQuery
    KeyFields = 'ACCESSORY_ID'
    KeyGenerator = 'GEN_ACCESSORY_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO ACCESSORY'
      
        '  (ACCESSORY_ID, LOCATION_ID, ACC_SKU, QUANTITY, OB_QUANTITY, UO' +
        'M, PRICE, ACC_NAME, ACC_DESCRIPTION, ACCESSORY_TYPE_ID, ACC_COST' +
        ', ACC_WIDTH, ACC_LENGTH, IS_VISIBLE, GUI_SEQUENCE)'
      'VALUES'
      
        '  (:ACCESSORY_ID, :LOCATION_ID, :ACC_SKU, :QUANTITY, :OB_QUANTIT' +
        'Y, :UOM, :PRICE, :ACC_NAME, :ACC_DESCRIPTION, :ACCESSORY_TYPE_ID' +
        ', :ACC_COST, :ACC_WIDTH, :ACC_LENGTH, :IS_VISIBLE, :GUI_SEQUENCE' +
        ')')
    SQLDelete.Strings = (
      'DELETE FROM ACCESSORY'
      'WHERE'
      '  ACCESSORY_ID = :Old_ACCESSORY_ID')
    SQLUpdate.Strings = (
      'UPDATE ACCESSORY'
      'SET'
      
        '  ACCESSORY_ID = :ACCESSORY_ID, LOCATION_ID = :LOCATION_ID, ACC_' +
        'SKU = :ACC_SKU, QUANTITY = :QUANTITY, OB_QUANTITY = :OB_QUANTITY' +
        ', UOM = :UOM, PRICE = :PRICE, ACC_NAME = :ACC_NAME, ACC_DESCRIPT' +
        'ION = :ACC_DESCRIPTION, ACCESSORY_TYPE_ID = :ACCESSORY_TYPE_ID, ' +
        'ACC_COST = :ACC_COST, ACC_WIDTH = :ACC_WIDTH, ACC_LENGTH = :ACC_' +
        'LENGTH, IS_VISIBLE = :IS_VISIBLE, GUI_SEQUENCE = :GUI_SEQUENCE'
      'WHERE'
      '  ACCESSORY_ID = :Old_ACCESSORY_ID')
    SQLRefresh.Strings = (
      
        'SELECT ACCESSORY_ID, LOCATION_ID, ACC_SKU, QUANTITY, OB_QUANTITY' +
        ', UOM, PRICE, ACC_NAME, ACC_DESCRIPTION, ACCESSORY_TYPE_ID, ACC_' +
        'COST, ACC_WIDTH, ACC_LENGTH, IS_VISIBLE, GUI_SEQUENCE FROM ACCES' +
        'SORY'
      'WHERE'
      '  ACCESSORY_ID = :ACCESSORY_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM ACCESSORY'
      'WHERE'
      'ACCESSORY_ID = :Old_ACCESSORY_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM ACCESSORY'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from ACCESSORY'
      'Order By GUI_SEQUENCE')
    LockMode = lmLockDelayed
    RefreshOptions = [roAfterInsert, roAfterUpdate]
    Options.DefaultValues = True
    AfterInsert = tblAccessoriesAfterInsert
    Left = 235
    Top = 358
  end
  object dsAccessories_lookup: TIBCDataSource
    DataSet = tblAccessories_lookup
    Left = 235
    Top = 410
  end
  object tblGridsStd: TIBCQuery
    KeyFields = 'GRIDS_STD_ID'
    KeyGenerator = 'GEN_GRIDS_STD_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO GRIDS_STD'
      
        '  (GRIDS_STD_ID, MODEL_ID, GPAT_ID, GRIDS_STD_DIM, GRIDS_ACROSS,' +
        ' GRIDS_UPDOWN)'
      'VALUES'
      
        '  (:GRIDS_STD_ID, :MODEL_ID, :GPAT_ID, :GRIDS_STD_DIM, :GRIDS_AC' +
        'ROSS, :GRIDS_UPDOWN)')
    SQLDelete.Strings = (
      'DELETE FROM GRIDS_STD'
      'WHERE'
      '  GRIDS_STD_ID = :Old_GRIDS_STD_ID')
    SQLUpdate.Strings = (
      'UPDATE GRIDS_STD'
      'SET'
      
        '  GRIDS_STD_ID = :GRIDS_STD_ID, MODEL_ID = :MODEL_ID, GPAT_ID = ' +
        ':GPAT_ID, GRIDS_STD_DIM = :GRIDS_STD_DIM, GRIDS_ACROSS = :GRIDS_' +
        'ACROSS, GRIDS_UPDOWN = :GRIDS_UPDOWN'
      'WHERE'
      '  GRIDS_STD_ID = :Old_GRIDS_STD_ID')
    SQLRefresh.Strings = (
      
        'SELECT GRIDS_STD_ID, MODEL_ID, GPAT_ID, GRIDS_STD_DIM, GRIDS_ACR' +
        'OSS, GRIDS_UPDOWN FROM GRIDS_STD'
      'WHERE'
      '  GRIDS_STD_ID = :GRIDS_STD_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM GRIDS_STD'
      'WHERE'
      'GRIDS_STD_ID = :Old_GRIDS_STD_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM GRIDS_STD'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from GRIDS_STD')
    LockMode = lmLockDelayed
    Options.RequiredFields = False
    Options.DefaultValues = True
    LocalConstraints = False
    Left = 1130
    Top = 741
  end
  object dsGridsStd: TIBCDataSource
    DataSet = tblGridsStd
    Left = 1130
    Top = 796
  end
  object tblScanWin: TIBCQuery
    UpdatingTable = 'SCAN_WINDOW'
    KeyFields = 'scan_win_id'
    KeyGenerator = 'GEN_SCAN_WINDOW_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO SCAN_IGU'
      
        '  (SCAN_IGU_ID, IGU_ID, SCAN_DATE, SCAN_TIME, SCAN_QTY, CART_NO,' +
        ' WORKCELL_ID)'
      'VALUES'
      
        '  (:SCAN_IGU_ID, :IGU_ID, :SCAN_DATE, :SCAN_TIME, :SCAN_QTY, :CA' +
        'RT_NO, :WORKCELL_ID)')
    SQLDelete.Strings = (
      'DELETE FROM SCAN_IGU'
      'WHERE'
      '  SCAN_IGU_ID = :Old_SCAN_IGU_ID')
    SQLUpdate.Strings = (
      'UPDATE SCAN_IGU'
      'SET'
      
        '  SCAN_IGU_ID = :SCAN_IGU_ID, IGU_ID = :IGU_ID, SCAN_DATE = :SCA' +
        'N_DATE, SCAN_TIME = :SCAN_TIME, SCAN_QTY = :SCAN_QTY, CART_NO = ' +
        ':CART_NO, WORKCELL_ID = :WORKCELL_ID'
      'WHERE'
      '  SCAN_IGU_ID = :Old_SCAN_IGU_ID')
    SQLRefresh.Strings = (
      
        'SELECT SCAN_IGU_ID, IGU_ID, SCAN_DATE, SCAN_TIME, SCAN_QTY, CART' +
        '_NO, WORKCELL_ID FROM SCAN_IGU'
      'WHERE'
      '  SCAN_IGU_ID = :SCAN_IGU_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM SCAN_IGU'
      'WHERE'
      'SCAN_IGU_ID = :Old_SCAN_IGU_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM SCAN_IGU'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    scan_window.scan_win_id,'
      '    scan_window.quote_win_id,'
      '    scan_window.scan_date,'
      '    scan_window.scan_time,'
      '    scan_window.scan_qty,'
      '    scan_window.cart_no,'
      '    scan_window.workcell_id,'
      '    workcell.workcell_name'
      'from scan_window'
      
        '   left outer join workcell on (scan_window.workcell_id = workce' +
        'll.workcell_id)'
      'where (scan_window.quote_win_id = :quote_win_id)'
      
        'and (scan_window.scan_date >= current_Date -1) and (scan_window.' +
        'scan_date <= current_Date +1)'
      
        '--scan_window.scan_date between dateadd(-1 day to current_date) ' +
        'and dateadd(1 day to current_date)'
      
        'Order by scan_window.scan_date desc, scan_window.scan_time desc,' +
        ' scan_window.cart_no')
    MasterSource = dsWindows
    FetchRows = 5
    LockMode = lmLockDelayed
    Options.RequiredFields = False
    Options.DefaultValues = True
    Options.ReturnParams = True
    LocalConstraints = False
    Left = 598
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'quote_win_id'
        Value = nil
      end>
  end
  object dsScanWin: TIBCDataSource
    DataSet = tblScanWin
    Left = 598
    Top = 544
  end
  object tblBatchWC: TIBCQuery
    KeyGenerator = 'GEN_BATCH_WORKCELLS_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO BATCH_WORKCELLS'
      
        '  (BATCHWC_ID, JOB_BATCH_ID, WORKCELL_ID, WC_START_TIME, WC_FINI' +
        'SH_TIME)'
      'VALUES'
      
        '  (:BATCHWC_ID, :JOB_BATCH_ID, :WORKCELL_ID, :WC_START_TIME, :WC' +
        '_FINISH_TIME)')
    SQLDelete.Strings = (
      'DELETE FROM BATCH_WORKCELLS'
      'WHERE'
      '  JOB_BATCH_ID = :Old_JOB_BATCH_ID')
    SQLUpdate.Strings = (
      'UPDATE BATCH_WORKCELLS'
      'SET'
      
        '  BATCHWC_ID = :BATCHWC_ID, JOB_BATCH_ID = :JOB_BATCH_ID, WORKCE' +
        'LL_ID = :WORKCELL_ID, WC_START_TIME = :WC_START_TIME, WC_FINISH_' +
        'TIME = :WC_FINISH_TIME'
      'WHERE'
      '  JOB_BATCH_ID = :Old_JOB_BATCH_ID')
    SQLRefresh.Strings = (
      
        'SELECT BATCHWC_ID, JOB_BATCH_ID, WORKCELL_ID, WC_START_TIME, WC_' +
        'FINISH_TIME FROM BATCH_WORKCELLS'
      'WHERE'
      '  JOB_BATCH_ID = :JOB_BATCH_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM BATCH_WORKCELLS'
      'WHERE'
      'JOB_BATCH_ID = :Old_JOB_BATCH_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM BATCH_WORKCELLS'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select '
      '    batch_workcells.batchwc_id,'
      '    batch_workcells.job_batch_id,'
      '    batch_workcells.workcell_id,'
      '    batch_workcells.wc_start_time,'
      '    batch_workcells.wc_finish_time,'
      '    workcell.workcell_name'
      'from workcell'
      
        '   inner join batch_workcells on (workcell.workcell_id = batch_w' +
        'orkcells.workcell_id)'
      '--where batch_workcells.job_batch_id = :job_batch_id'
      'order by batch_workcells.job_batch_id, workcell.GUI_SEQUENCE'
      '')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    Options.CacheCalcFields = True
    Left = 1316
    Top = 616
  end
  object dsBatchWC: TIBCDataSource
    DataSet = tblBatchWC
    Left = 1316
    Top = 669
  end
  object tblBookmarks: TIBCQuery
    KeyFields = 'BOOKMARK_ID'
    KeyGenerator = 'GEN_USER_BOOKMARKS_ID'
    GeneratorMode = gmInsert
    SQLInsert.Strings = (
      'INSERT INTO USER_BOOKMARKS'
      '  (BOOKMARK_ID, UID, BK_STR, BOOKMARK_NAME, BOOKMARK_DESC)'
      'VALUES'
      '  (:BOOKMARK_ID, :UID, :BK_STR, :BOOKMARK_NAME, :BOOKMARK_DESC)')
    SQLDelete.Strings = (
      'DELETE FROM USER_BOOKMARKS'
      'WHERE'
      '  BOOKMARK_ID = :Old_BOOKMARK_ID')
    SQLUpdate.Strings = (
      'UPDATE USER_BOOKMARKS'
      'SET'
      
        '  BOOKMARK_ID = :BOOKMARK_ID, UID = :UID, BK_STR = :BK_STR, BOOK' +
        'MARK_NAME = :BOOKMARK_NAME, BOOKMARK_DESC = :BOOKMARK_DESC'
      'WHERE'
      '  BOOKMARK_ID = :Old_BOOKMARK_ID')
    SQLRefresh.Strings = (
      
        'SELECT BOOKMARK_ID, UID, BK_STR, BOOKMARK_NAME, BOOKMARK_DESC FR' +
        'OM USER_BOOKMARKS'
      'WHERE'
      '  BOOKMARK_ID = :BOOKMARK_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM USER_BOOKMARKS'
      'WHERE'
      'BOOKMARK_ID = :Old_BOOKMARK_ID'
      'FOR UPDATE WITH LOCK')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM USER_BOOKMARKS'
      ''
      ') q')
    Connection = MainDB
    Transaction = TransRead
    UpdateTransaction = TransRead
    SQL.Strings = (
      'select * from USER_BOOKMARKS'
      '')
    LockMode = lmLockDelayed
    Options.DefaultValues = True
    AfterInsert = tblBookmarksAfterInsert
    Left = 503
    Top = 359
  end
  object dsBookmarks: TIBCDataSource
    DataSet = tblBookmarks
    Left = 504
    Top = 411
  end
end
