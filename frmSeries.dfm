object Seriesfrm: TSeriesfrm
  Left = 238
  Top = 120
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Series Edit'
  ClientHeight = 439
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    514
    439)
  PixelsPerInch = 96
  TextHeight = 13
  object SeriesGrid: TcxGrid
    Left = 7
    Top = 8
    Width = 498
    Height = 392
    BorderStyle = cxcbsNone
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    object vwSeries: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Delete.Visible = False
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      DataController.DataSource = CostingDM.dsSeries
      DataController.KeyFieldNames = 'SERIES_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.NavigatorHints = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object vwSeriesSERIES_ID: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'SERIES_ID'
        Width = 35
      end
      object vwSeriesSERIES_NAME: TcxGridDBColumn
        Caption = 'Name'
        DataBinding.FieldName = 'SERIES_NAME'
        Width = 126
      end
      object vwSeriesSERIES_DESCRIPTION: TcxGridDBColumn
        Caption = 'Description'
        DataBinding.FieldName = 'SERIES_DESCRIPTION'
        Width = 220
      end
      object vwSeriesGUI_SEQUENCE: TcxGridDBColumn
        Caption = 'Sequence'
        DataBinding.FieldName = 'GUI_SEQUENCE'
        Options.Filtering = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Width = 52
      end
      object vwSeriesColumn1: TcxGridDBColumn
        Caption = 'Visible'
        DataBinding.FieldName = 'IS_VISIBLE'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = '1'
        Properties.DisplayUnchecked = '0'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 34
      end
    end
    object SeriesGridLevel1: TcxGridLevel
      GridView = vwSeries
    end
  end
  object cxButton1: TcxButton
    Left = 219
    Top = 407
    Width = 93
    Height = 26
    Anchors = [akRight, akBottom]
    Caption = '&OK'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    ModalResult = 1
    TabOrder = 1
  end
  object cxButton2: TcxButton
    Left = 317
    Top = 407
    Width = 94
    Height = 26
    Anchors = [akRight, akBottom]
    Caption = 'Cance&l'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    ModalResult = 2
    TabOrder = 2
  end
  object btnClose: TcxButton
    Left = 416
    Top = 407
    Width = 93
    Height = 26
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akRight, akBottom]
    Caption = '&Close'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    ModalResult = 1
    TabOrder = 3
    OnClick = btnCloseClick
  end
  object dxSpellChecker1: TdxSpellChecker
    AutoCorrectOptions.Active = True
    AutoLoadDictionaries = True
    CheckAsYouTypeOptions.Active = True
    DialogLookAndFeel.SkinName = 'LondonLiquidSky'
    DictionaryItems = <
      item
        DictionaryTypeClassName = 'TdxHunspellDictionary'
        DictionaryType.DictionaryPath = '..\dic\en_US.dic'
        DictionaryType.GrammarPath = '..\dic\en_US.aff'
        DictionaryType.Language = 1033
      end
      item
        DictionaryTypeClassName = 'TdxUserSpellCheckerDictionary'
        DictionaryType.DictionaryPath = '..\dic\User.dic'
      end>
    SpellingOptions.CheckFromCursorPos = True
    UseThreadedLoad = True
    Left = 36
    Top = 554
  end
end
