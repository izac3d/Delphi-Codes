object Pricingfrm: TPricingfrm
  Left = 61
  Top = 98
  HelpContext = 500
  BorderIcons = [biSystemMenu, biHelp]
  Caption = 'Pricing'
  ClientHeight = 603
  ClientWidth = 944
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grpOptions: TcxGroupBox
    Left = 0
    Top = 0
    HelpContext = 500
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsUltraFlat
    TabOrder = 1
    Height = 65
    Width = 944
    object Label1: TLabel
      Left = 30
      Top = 15
      Width = 29
      Height = 13
      Margins.Bottom = 2
      Caption = 'Series'
      Transparent = True
    end
    object luSeries: TcxLookupComboBox
      Left = 63
      Top = 13
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'SERIES_ID'
      Properties.ListColumns = <
        item
          MinWidth = 40
          FieldName = 'SERIES_NAME'
        end
        item
          MinWidth = 70
          FieldName = 'SERIES_DESCRIPTION'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = CostingDM.dsSeries
      Properties.OnEditValueChanged = luSeriesPropertiesEditValueChanged
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 126
    end
    object luSModels: TcxLookupComboBox
      Left = 63
      Top = 38
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'SM_ID'
      Properties.ListColumns = <
        item
          Caption = 'Model'
          MinWidth = 40
          FieldName = 'MODEL_NAME'
        end
        item
          Caption = 'Model Description'
          MinWidth = 70
          FieldName = 'MODEL_DESCRIPTION'
        end
        item
          MinWidth = 0
          Width = 0
          FieldName = 'SERIES_ID'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = CostingDM.dsSerMod_Lookup
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 126
    end
    object luSNailfin: TcxLookupComboBox
      Left = 273
      Top = 38
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'SNF_ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAILFIN_NAME'
        end
        item
          FieldName = 'NAILFIN_DESCRIPTION'
        end
        item
          MinWidth = 0
          Width = 0
          FieldName = 'SERIES_ID'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = CostingDM.dsSerNailfin_lookup
      Properties.ReadOnly = False
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Width = 126
    end
    object luSColor: TcxLookupComboBox
      Left = 273
      Top = 13
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'SC_ID'
      Properties.ListColumns = <
        item
          FieldName = 'COLOR_NAME'
        end
        item
          FieldName = 'COLOR_DESCRIPTION'
        end
        item
          MinWidth = 0
          Width = 0
          FieldName = 'SERIES_ID'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = CostingDM.dsSerColor_lookup
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Width = 126
    end
    object cbSModels: TcxCheckBox
      Left = 5
      Top = 38
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Models'
      Properties.OnEditValueChanged = cbModelsPropertiesEditValueChanged
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 4
      Transparent = True
    end
    object cbSColor: TcxCheckBox
      Left = 213
      Top = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Colors'
      Properties.OnEditValueChanged = cbModelsPropertiesEditValueChanged
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 5
      Transparent = True
    end
    object cbSNailfin: TcxCheckBox
      Left = 213
      Top = 38
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Nailfin'
      Properties.OnEditValueChanged = cbModelsPropertiesEditValueChanged
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 6
      Transparent = True
    end
    object cxButton6: TcxButton
      Left = 424
      Top = 31
      Width = 93
      Height = 26
      Caption = 'View'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 1
      TabOrder = 7
      OnClick = cxButton6Click
    end
    object btnCopy: TcxButton
      Left = 527
      Top = 31
      Width = 93
      Height = 26
      Caption = 'Copy'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 1
      TabOrder = 8
      OnClick = btnCopyClick
    end
    object cxButton1: TcxButton
      Left = 736
      Top = 31
      Width = 93
      Height = 26
      Caption = '&Print'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 1
      TabOrder = 9
      OnClick = cxButton1Click
    end
    object btnClose: TcxButton
      Left = 838
      Top = 31
      Width = 93
      Height = 26
      Caption = '&Close'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 1
      TabOrder = 10
      OnClick = btnCloseClick
    end
    object btnXLSExport: TcxButton
      Left = 633
      Top = 31
      Width = 95
      Height = 26
      Caption = 'Export to XLS'
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 11
      OnClick = btnXLSExportClick
    end
  end
  object gridPricing: TcxGrid
    Left = 0
    Top = 65
    Width = 944
    Height = 538
    HelpContext = 545
    Align = alClient
    BorderStyle = cxcbsNone
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    object vwPricing: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = False
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      FilterBox.Position = fpTop
      DataController.DataSource = CostingDM.dsPricing
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnFilteredItemsList = True
      FilterRow.Visible = True
      OptionsBehavior.CellHints = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.NavigatorHints = True
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.Indicator = True
      Styles.Background = CostingDM.gridBackground
      object vwPricingPRICING_ID: TcxGridDBColumn
        DataBinding.FieldName = 'PRICING_ID'
        Visible = False
      end
      object vwPricingSM_ID: TcxGridDBColumn
        Caption = 'Model'
        DataBinding.FieldName = 'SM_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.GridMode = True
        Properties.KeyFieldNames = 'SM_ID'
        Properties.ListColumns = <
          item
            FieldName = 'MODEL_NAME'
          end
          item
            FieldName = 'MODEL_DESCRIPTION'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = CostingDM.dsSeriesModel
        Width = 82
      end
      object vwPricingSC_ID: TcxGridDBColumn
        Caption = 'Color'
        DataBinding.FieldName = 'SC_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.GridMode = True
        Properties.KeyFieldNames = 'SC_ID'
        Properties.ListColumns = <
          item
            FieldName = 'COLOR_NAME'
          end
          item
            FieldName = 'COLOR_DESCRIPTION'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = CostingDM.dsSeriesColor
        Width = 76
      end
      object vwPricingSNF_ID: TcxGridDBColumn
        Caption = 'Nailfin'
        DataBinding.FieldName = 'SNF_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.GridMode = True
        Properties.KeyFieldNames = 'SNF_ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAILFIN_NAME'
          end
          item
            FieldName = 'NAILFIN_DESCRIPTION'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = CostingDM.dsSeriesNailfin
        Width = 76
      end
      object vwPricingFRAME_HORIZ: TcxGridDBColumn
        Caption = 'Frame H'
        DataBinding.FieldName = 'FRAME_HORIZ'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 3
        Properties.DisplayFormat = '$,0.000;($,0.000)'
        Width = 77
      end
      object vwPricingFRAME_VERT: TcxGridDBColumn
        Caption = 'Frame V'
        DataBinding.FieldName = 'FRAME_VERT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 3
        Properties.DisplayFormat = '$,0.000;($,0.000)'
        Width = 77
      end
      object vwPricingFRAME_PARTS: TcxGridDBColumn
        Caption = 'Frame Parts'
        DataBinding.FieldName = 'FRAME_PARTS'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 3
        Properties.DisplayFormat = '$,0.000;($,0.000)'
        Width = 90
      end
      object vwPricingFRAME_LABOR_RATE: TcxGridDBColumn
        Caption = 'Frame Labor Rate'
        DataBinding.FieldName = 'FRAME_LABOR_RATE'
        Options.Filtering = False
        Width = 142
      end
      object vwPricingFRAME_MIN_LABOR: TcxGridDBColumn
        Caption = 'Frame Min Labor'
        DataBinding.FieldName = 'FRAME_MIN_LABOR'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 3
        Options.Filtering = False
        Width = 117
      end
      object vwPricingMULTIPLIER_1: TcxGridDBColumn
        Caption = 'Multiplier 1'
        DataBinding.FieldName = 'MULTIPLIER_1'
        Options.Filtering = False
        Width = 93
      end
      object vwPricingMULTIPLIER_2: TcxGridDBColumn
        Caption = 'Multiplier 2'
        DataBinding.FieldName = 'MULTIPLIER_2'
        Options.Filtering = False
        Width = 84
      end
      object vwPricingSERIES_DESCRIPTION: TcxGridDBColumn
        DataBinding.FieldName = 'SERIES_DESCRIPTION'
        Visible = False
        Options.Filtering = False
      end
      object vwPricingSERIES_NAME: TcxGridDBColumn
        DataBinding.FieldName = 'SERIES_NAME'
        Visible = False
        Options.Filtering = False
      end
      object vwPricingSERIES_ID: TcxGridDBColumn
        DataBinding.FieldName = 'SERIES_ID'
        Visible = False
        Options.Filtering = False
      end
      object vwPricingINSTALL_COST_FACTOR: TcxGridDBColumn
        Caption = 'Install Factor'
        DataBinding.FieldName = 'INSTALL_COST_FACTOR'
        Width = 102
      end
      object vwPricingNFS_COST: TcxGridDBColumn
        Caption = 'NFS Cost'
        DataBinding.FieldName = 'NFS_COST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Width = 82
      end
    end
    object glvlPricing: TcxGridLevel
      GridView = vwPricing
    end
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = PricingPrinterLink
    Version = 0
    Left = 672
    Top = 291
    object PricingPrinterLink: TdxGridReportLink
      Active = True
      Component = gridPricing
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 5
      PrinterPage.Footer = 210
      PrinterPage.GrayShading = True
      PrinterPage.Header = 210
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.CenterTitle.Strings = (
        '[User Name][User Name] on [Machine Name]')
      PrinterPage.PageFooter.LeftTitle.Strings = (
        '[Page # of Pages #]')
      PrinterPage.PageFooter.RightTitle.Strings = (
        '[Date & Time Printed]')
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clBlack
      PrinterPage.PageHeader.Font.Height = -19
      PrinterPage.PageHeader.Font.Name = 'Tahoma'
      PrinterPage.PageHeader.Font.Style = [fsBold]
      PrinterPage.PageHeader.LeftTitle.Strings = (
        'MODEL PRICING')
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 14000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.CreationDate = 42183.323592662040000000
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      OptionsOnEveryPage.Footers = False
      OptionsSize.AutoWidth = True
      OptionsView.Footers = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
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
    Left = 661
    Top = 362
  end
end
