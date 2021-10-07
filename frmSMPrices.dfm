object Pricesfrm: TPricesfrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Prices'
  ClientHeight = 407
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 4
    Top = 357
    PanelStyle.Active = True
    TabOrder = 0
    Height = 42
    Width = 741
    object cxButton1: TcxButton
      Left = 285
      Top = 9
      Width = 170
      Height = 25
      Caption = 'Close'
      LookAndFeel.Kind = lfOffice11
      ModalResult = 1
      TabOrder = 0
      OnClick = cxButton1Click
    end
  end
  object gridPrices: TcxGrid
    Left = 8
    Top = 33
    Width = 734
    Height = 318
    BorderStyle = cxcbsNone
    TabOrder = 1
    object gridPricesDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.PriorPage.Visible = False
      NavigatorButtons.NextPage.Visible = False
      NavigatorButtons.Append.Visible = False
      NavigatorButtons.Edit.Visible = False
      NavigatorButtons.Filter.Visible = False
      DataController.DataSource = CostingDM.dsSM_Prices
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsView.Navigator = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.Background = CostingDM.gridBackground
      object gridPricesDBTableView1MIN_WIDTH: TcxGridDBColumn
        DataBinding.FieldName = 'MIN_WIDTH'
      end
      object gridPricesDBTableView1MAX_WIDTH: TcxGridDBColumn
        DataBinding.FieldName = 'MAX_WIDTH'
      end
      object gridPricesDBTableView1MIN_HEIGHT: TcxGridDBColumn
        DataBinding.FieldName = 'MIN_HEIGHT'
      end
      object gridPricesDBTableView1MAX_HEIGHT: TcxGridDBColumn
        DataBinding.FieldName = 'MAX_HEIGHT'
      end
      object gridPricesDBTableView1BASE_PRICE: TcxGridDBColumn
        DataBinding.FieldName = 'BASE_PRICE'
      end
      object gridPricesDBTableView1THIRD_PANELS_XOX: TcxGridDBColumn
        DataBinding.FieldName = 'THIRD_PANELS_XOX'
      end
      object gridPricesDBTableView1BEIGE: TcxGridDBColumn
        DataBinding.FieldName = 'BEIGE'
      end
      object gridPricesDBTableView1DESERT_SAND: TcxGridDBColumn
        DataBinding.FieldName = 'DESERT_SAND'
      end
      object gridPricesDBTableView1BL_NAILFIN: TcxGridDBColumn
        DataBinding.FieldName = 'BL_NAILFIN'
      end
      object gridPricesDBTableView1FF1_NAILFIN: TcxGridDBColumn
        DataBinding.FieldName = 'FF1_NAILFIN'
      end
      object gridPricesDBTableView1FF2_NAILFIN: TcxGridDBColumn
        DataBinding.FieldName = 'FF2_NAILFIN'
      end
      object gridPricesDBTableView1WIDTH_ADD: TcxGridDBColumn
        DataBinding.FieldName = 'WIDTH_ADD'
      end
      object gridPricesDBTableView1HEIGHT_ADD: TcxGridDBColumn
        DataBinding.FieldName = 'HEIGHT_ADD'
      end
      object gridPricesDBTableView1LE2: TcxGridDBColumn
        DataBinding.FieldName = 'LE2'
      end
      object gridPricesDBTableView1LE3: TcxGridDBColumn
        DataBinding.FieldName = 'LE3'
      end
      object gridPricesDBTableView1OBS: TcxGridDBColumn
        DataBinding.FieldName = 'OBS'
      end
      object gridPricesDBTableView1RAIN: TcxGridDBColumn
        DataBinding.FieldName = 'RAIN'
      end
      object gridPricesDBTableView1GLUECHIP: TcxGridDBColumn
        DataBinding.FieldName = 'GLUECHIP'
      end
      object gridPricesDBTableView1TEMP: TcxGridDBColumn
        DataBinding.FieldName = 'TEMP'
      end
      object gridPricesDBTableView1FLAT_GRIDS: TcxGridDBColumn
        DataBinding.FieldName = 'FLAT_GRIDS'
      end
      object gridPricesDBTableView1SCULPT_GRIDS: TcxGridDBColumn
        DataBinding.FieldName = 'SCULPT_GRIDS'
      end
    end
    object gridPricesLevel1: TcxGridLevel
      GridView = gridPricesDBTableView1
    end
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Caption = 'Series Model:'
    Transparent = True
  end
  object cbSM: TcxLookupComboBox
    Left = 74
    Top = 7
    Properties.KeyFieldNames = 'SM_ID'
    Properties.ListColumns = <
      item
        MinWidth = 40
        FieldName = 'MODEL_NAME'
      end
      item
        MinWidth = 70
        FieldName = 'MODEL_DESCRIPTION'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListOptions.SyncMode = True
    Properties.ListSource = CostingDM.dsSeriesModel
    TabOrder = 3
    Width = 169
  end
end
