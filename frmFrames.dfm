object Framesfrm: TFramesfrm
  Left = 75
  Top = 23
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Frame Configuration'
  ClientHeight = 639
  ClientWidth = 1241
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcFrames: TcxPageControl
    Left = 0
    Top = 38
    Width = 1241
    Height = 601
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    Properties.ActivePage = tsModels
    Properties.CustomButtons.Buttons = <>
    Properties.Options = [pcoFixedTabWidthWhenRotated, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize]
    Properties.Rotate = True
    Properties.ShowFrame = True
    Properties.Style = 9
    Properties.TabPosition = tpLeft
    Properties.TabSlants.Positions = [spLeft, spRight]
    Properties.TabWidth = 150
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabSlants.Positions = [spLeft, spRight]
    OnChange = pgcFramesChange
    ExplicitWidth = 1199
    ClientRectBottom = 600
    ClientRectLeft = 151
    ClientRectRight = 1240
    ClientRectTop = 1
    object tsModels: TcxTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Series && Models'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 5
      ParentFont = False
      ExplicitWidth = 1047
      object Label4: TLabel
        Left = 2
        Top = 7
        Width = 79
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Available Models'
      end
      object Label5: TLabel
        Left = 4
        Top = 258
        Width = 89
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'This Series'#39' Models'
      end
      object gridLookupModels: TcxGrid
        Left = 0
        Top = 20
        Width = 746
        Height = 230
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object viewModels: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsModels
          DataController.KeyFieldNames = 'MODEL_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.IncSearch = True
          OptionsBehavior.IncSearchItem = viewModelsMODEL_NAME
          OptionsBehavior.NavigatorHints = True
          OptionsData.Appending = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Preview.Visible = True
          object viewModelsMODEL_ID: TcxGridDBColumn
            Caption = 'Model ID'
            DataBinding.FieldName = 'MODEL_ID'
            Width = 77
          end
          object viewModelsMODEL_NAME: TcxGridDBColumn
            Caption = 'Name'
            DataBinding.FieldName = 'MODEL_NAME'
            Options.Filtering = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Width = 96
          end
          object viewModelsMODEL_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'MODEL_DESCRIPTION'
            Width = 151
          end
          object viewModelsMODEL_TYPE_ID: TcxGridDBColumn
            Caption = 'Type'
            DataBinding.FieldName = 'MODEL_TYPE_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.DropDownAutoSize = True
            Properties.DropDownSizeable = True
            Properties.KeyFieldNames = 'MODEL_TYPE_ID'
            Properties.ListColumns = <
              item
                Caption = 'Name'
                Width = 40
                FieldName = 'MODEL_TYPE_NAME'
              end
              item
                Caption = 'Description'
                Width = 250
                FieldName = 'MODEL_TYPE_DESCRIPTION'
              end
              item
                Caption = 'Door'
                RepositoryItem = CostingDM.repoitemCheckBox
                Width = 50
                FieldName = 'IS_DOOR'
              end>
            Properties.ListSource = CostingDM.dsModelTypes
            Width = 44
          end
          object viewModelsTEMPERED: TcxGridDBColumn
            Caption = 'Tempered'
            DataBinding.FieldName = 'TEMPERED'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 76
          end
          object viewModelsGUISequence: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            SortIndex = 0
            SortOrder = soAscending
            Width = 77
          end
          object viewModelsGED_CODE: TcxGridDBColumn
            Caption = 'GED Code'
            DataBinding.FieldName = 'GED_CODE'
            Width = 74
          end
          object viewModelsIGU_NO: TcxGridDBColumn
            Caption = 'IGUs'
            DataBinding.FieldName = 'IGU_NO'
            Width = 53
          end
          object viewModelsXPANEL_NO: TcxGridDBColumn
            Caption = 'XPanel'
            DataBinding.FieldName = 'XPANEL_NO'
          end
          object viewModelsDPANEL_NO: TcxGridDBColumn
            Caption = 'DPanel'
            DataBinding.FieldName = 'DPANEL_NO'
            Width = 61
          end
          object viewModelsVERT_HORZ: TcxGridDBColumn
            Caption = 'Orientation'
            DataBinding.FieldName = 'VERT_HORZ'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.DropDownListStyle = lsEditFixedList
            Properties.DropDownRows = 3
            Properties.Items.Strings = (
              'V'
              'H'
              'B')
            Width = 85
          end
          object viewModelsIS_SPECIAL_MODEL: TcxGridDBColumn
            Caption = 'Special'
            DataBinding.FieldName = 'IS_SPECIAL_MODEL'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 62
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = viewModels
        end
      end
      object gridSeriesModel: TcxGrid
        Left = -1
        Top = 272
        Width = 967
        Height = 320
        HelpContext = 180
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        LookAndFeel.NativeStyle = False
        object viewSeriesModels: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.Prior.Visible = True
          Navigator.Buttons.NextPage.Visible = True
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Post.Visible = True
          Navigator.Buttons.Cancel.Visible = True
          Navigator.Buttons.Refresh.Visible = True
          Navigator.Buttons.SaveBookmark.Visible = True
          Navigator.Buttons.GotoBookmark.Visible = True
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsSeriesModel
          DataController.KeyFieldNames = 'SM_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.IncSearch = True
          OptionsBehavior.IncSearchItem = viewSeriesModelsMODEL_NAME
          OptionsBehavior.NavigatorHints = True
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Preview.Visible = True
          object viewSeriesModelsSM_ID: TcxGridDBColumn
            DataBinding.FieldName = 'SM_ID'
            Options.Editing = False
            Width = 48
          end
          object viewSeriesModelsMODEL_NAME: TcxGridDBColumn
            Caption = 'Name'
            DataBinding.FieldName = 'MODEL_NAME'
            Width = 69
          end
          object viewSeriesModelsMODEL_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'MODEL_DESCRIPTION'
            Width = 88
          end
          object viewSeriesModelsGLASS_EDGE_ID: TcxGridDBColumn
            Caption = 'Spacer'
            DataBinding.FieldName = 'GLASS_EDGE_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownAutoSize = True
            Properties.DropDownSizeable = True
            Properties.KeyFieldNames = 'GLASS_EDGE_ID'
            Properties.ListColumns = <
              item
                Caption = 'Edge'
                FieldName = 'EDGE'
              end
              item
                Caption = 'Description'
                FieldName = 'DESCRIPTION'
              end>
            Properties.ListSource = CostingDM.dsGlassEdge
            Width = 57
          end
          object viewSeriesModelsMIN_WIDTH: TcxGridDBColumn
            Caption = 'Min Width'
            DataBinding.FieldName = 'MIN_WIDTH'
            Width = 52
          end
          object viewSeriesModelsMAX_WIDTH: TcxGridDBColumn
            Caption = 'Max Width'
            DataBinding.FieldName = 'MAX_WIDTH'
            Width = 56
          end
          object viewSeriesModelsMIN_HEIGHT: TcxGridDBColumn
            Caption = 'Min Height'
            DataBinding.FieldName = 'MIN_HEIGHT'
            Width = 55
          end
          object viewSeriesModelsMAX_HEIGHT: TcxGridDBColumn
            Caption = 'Max Height'
            DataBinding.FieldName = 'MAX_HEIGHT'
            Width = 59
          end
          object viewSeriesModelsMAX_AREA: TcxGridDBColumn
            Caption = 'Max Area'
            DataBinding.FieldName = 'MAX_AREA'
            Width = 51
          end
          object viewSeriesModelsMIN_WIDTH_HEIGHT: TcxGridDBColumn
            Caption = 'Min W/H'
            DataBinding.FieldName = 'MIN_WIDTH_HEIGHT'
            Width = 45
          end
          object viewSeriesModelsMAX_WIDTH_HEIGHT: TcxGridDBColumn
            Caption = 'Max W/H'
            DataBinding.FieldName = 'MAX_WIDTH_HEIGHT'
            Width = 49
          end
          object viewSeriesModelsNFS_WIDTH_DEDUCT: TcxGridDBColumn
            Caption = 'NFS W Deduct'
            DataBinding.FieldName = 'NFS_WIDTH_DEDUCT'
            Width = 74
          end
          object viewSeriesModelsNFS_HEIGHT_DEDUCT: TcxGridDBColumn
            Caption = 'NFS H Deduct'
            DataBinding.FieldName = 'NFS_HEIGHT_DEDUCT'
            Width = 71
          end
          object viewSeriesModelsVERT_HORZ: TcxGridDBColumn
            Caption = '[V]ert or [H]orz'
            DataBinding.FieldName = 'VERT_HORZ'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.DropDownListStyle = lsEditFixedList
            Properties.DropDownSizeable = True
            Properties.Items.Strings = (
              'H'
              'V'
              'B')
            Visible = False
            Options.Editing = False
            Width = 83
          end
          object viewSeriesModelsTEMPERED: TcxGridDBColumn
            DataBinding.FieldName = 'TEMPERED'
            Visible = False
          end
          object viewSeriesModelsOPERATOR: TcxGridDBColumn
            DataBinding.FieldName = 'OPERATOR'
            Visible = False
          end
          object viewSeriesModelsDATE_SAVED: TcxGridDBColumn
            DataBinding.FieldName = 'DATE_SAVED'
            Visible = False
          end
          object viewSeriesModelsOPERATOR_LAST_MODIFIED: TcxGridDBColumn
            DataBinding.FieldName = 'OPERATOR_LAST_MODIFIED'
            Visible = False
          end
          object viewSeriesModelsDATE_LAST_MODIFIED: TcxGridDBColumn
            DataBinding.FieldName = 'DATE_LAST_MODIFIED'
            Visible = False
          end
          object viewSeriesModelsSERIES_NAME: TcxGridDBColumn
            DataBinding.FieldName = 'SERIES_NAME'
            Visible = False
          end
          object viewSeriesModelsSERIES_DESCRIPTION: TcxGridDBColumn
            DataBinding.FieldName = 'SERIES_DESCRIPTION'
            Visible = False
          end
          object viewSeriesModelsColumn6: TcxGridDBColumn
            Caption = 'Open W Divisor'
            DataBinding.FieldName = 'OPEN_WIDTH_DIVISOR'
            Width = 79
          end
          object viewSeriesModelsColumn5: TcxGridDBColumn
            Caption = 'Open W Deduct'
            DataBinding.FieldName = 'OPEN_WIDTH_DEDUCT'
            Width = 81
          end
          object viewSeriesModelsColumn4: TcxGridDBColumn
            Caption = 'Open H Divisor'
            DataBinding.FieldName = 'OPEN_HEIGHT_DIVISOR'
            Width = 76
          end
          object viewSeriesModelsColumn3: TcxGridDBColumn
            Caption = 'Open H Deduct'
            DataBinding.FieldName = 'OPEN_HEIGHT_DEDUCT'
            Width = 90
          end
          object viewSeriesModelsColumn7: TcxGridDBColumn
            DataBinding.FieldName = 'ESL'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.Alignment = taCenter
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 22
          end
          object viewSeriesModelsIS_VISIBLE: TcxGridDBColumn
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
          object viewSeriesModelsColumn1: TcxGridDBColumn
            Caption = 'Manhours'
            DataBinding.FieldName = 'PROD_HOURS'
            Width = 54
          end
        end
        object cxGridLevel3: TcxGridLevel
          GridView = viewSeriesModels
        end
      end
      object cxGroupBox1: TcxGroupBox
        Left = 971
        Top = 272
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Copy NFS'
        ParentBackground = False
        ParentColor = False
        Style.Color = 16773345
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Height = 145
        Width = 107
        object Label15: TLabel
          Left = 11
          Top = 20
          Width = 60
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          AutoSize = False
          Caption = 'Width Deduction'
          WordWrap = True
        end
        object Label16: TLabel
          Left = 11
          Top = 59
          Width = 48
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Height Deduction'
          WordWrap = True
        end
        object edtNFSWidth: TcxSpinEdit
          Left = 59
          Top = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Properties.Increment = 0.500000000000000000
          Properties.MaxValue = 6.000000000000000000
          Properties.MinValue = -6.000000000000000000
          Properties.ValueType = vtFloat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Width = 39
        end
        object edtNFSHeight: TcxSpinEdit
          Left = 59
          Top = 63
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Properties.Increment = 0.500000000000000000
          Properties.MaxValue = 6.000000000000000000
          Properties.MinValue = -6.000000000000000000
          Properties.ValueType = vtFloat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 1
          Width = 39
        end
        object btnCopyNFS: TcxButton
          Left = 11
          Top = 91
          Width = 87
          Height = 39
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Copy To All Models'
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          TabOrder = 2
          WordWrap = True
          OnClick = btnCopyNFSClick
        end
      end
      object cxGroupBox2: TcxGroupBox
        Left = 971
        Top = 20
        Caption = 'Add to Series...'
        ParentBackground = False
        ParentColor = False
        Style.Color = 15852772
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Height = 230
        Width = 107
        object btnAllCopy: TcxButton
          Left = 16
          Top = 70
          Width = 79
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '...All'
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          TabOrder = 0
          Visible = False
          WordWrap = True
          OnClick = btnAllCopyClick
        end
        object btnSelectedCopy: TcxButton
          Left = 16
          Top = 28
          Width = 79
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '...Selected'
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          TabOrder = 1
          WordWrap = True
          OnClick = btnSelectedCopyClick
        end
      end
      object cxGroupBox4: TcxGroupBox
        Left = 971
        Top = 423
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Series'
        ParentBackground = False
        ParentColor = False
        Style.Color = 16777194
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Height = 82
        Width = 107
        object cbSeriesSize: TcxLookupComboBox
          Left = 6
          Top = 51
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
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
          Properties.ReadOnly = False
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Width = 92
        end
        object btnCopyToSeries: TcxButton
          Left = 6
          Top = 20
          Width = 92
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Copy To Series'
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          ModalResult = 1
          TabOrder = 1
          OnClick = btnCopyToSeriesClick
        end
      end
      object cxGroupBox5: TcxGroupBox
        Left = 971
        Top = 510
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Model'
        ParentBackground = False
        ParentColor = False
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebsUltraFlat
        Style.Color = 15859692
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Height = 81
        Width = 107
        object cbSizeModels: TcxLookupComboBox
          Left = 6
          Top = 51
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Properties.DropDownAutoSize = True
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'MODEL_ID'
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
          Properties.ListSource = CostingDM.dsModels
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Width = 92
        end
        object btnCopyToModel: TcxButton
          Left = 6
          Top = 22
          Width = 94
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Copy To New Model'
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          ModalResult = 1
          TabOrder = 1
          OnClick = btnCopyToModelClick
        end
      end
      object imgModel: TcxDBImage
        Left = 752
        Top = 20
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        DataBinding.DataField = 'MODEL_IMG_BIG'
        DataBinding.DataSource = CostingDM.dsModels
        Properties.GraphicClassName = 'TdxSmartImage'
        Properties.ImmediatePost = True
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
        Height = 230
        Width = 214
      end
    end
    object tsColors: TcxTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Colors'
      ImageIndex = 1
      ExplicitWidth = 1047
      object Label6: TLabel
        Left = 19
        Top = 14
        Width = 76
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Available Colors'
      end
      object Label7: TLabel
        Left = 518
        Top = 14
        Width = 86
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'This Series'#39' Colors'
      end
      object btnAddColor: TcxButton
        Left = 434
        Top = 139
        Width = 67
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Add >'
        LookAndFeel.NativeStyle = False
        TabOrder = 0
        OnClick = btnAddColorClick
      end
      object btnAddAllColors: TcxButton
        Left = 434
        Top = 182
        Width = 67
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Add >>'
        LookAndFeel.NativeStyle = False
        TabOrder = 1
        OnClick = btnAddAllColorsClick
      end
      object gridModelColors: TcxGrid
        Left = 19
        Top = 30
        Width = 403
        Height = 458
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 2
        LookAndFeel.NativeStyle = False
        object vwColors: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsColors
          DataController.KeyFieldNames = 'COLOR_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.ShowEditButtons = gsebAlways
          OptionsView.GroupByBox = False
          OptionsView.HeaderEndEllipsis = True
          Preview.Visible = True
          object vwColorsCOLOR_ID: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'COLOR_ID'
            Width = 34
          end
          object vwColorsCOLOR_NAME: TcxGridDBColumn
            Caption = 'Name'
            DataBinding.FieldName = 'COLOR_NAME'
            Width = 114
          end
          object vwColorsCOLOR_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'COLOR_DESCRIPTION'
            Width = 247
          end
          object vwColorsGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 81
          end
        end
        object lvlColors: TcxGridLevel
          GridView = vwColors
        end
      end
      object gridSColors: TcxGrid
        Left = 518
        Top = 30
        Width = 442
        Height = 458
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 3
        LookAndFeel.NativeStyle = False
        object vwSMColors: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.Prior.Visible = True
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Edit.Enabled = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Refresh.Visible = True
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsSeriesColor
          DataController.KeyFieldNames = 'SC_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object vwSMColorsCOLOR_ID: TcxGridDBColumn
            DataBinding.FieldName = 'SC_ID'
            Width = 37
          end
          object vwSMColorsCOLOR_NAME: TcxGridDBColumn
            Caption = 'Name'
            DataBinding.FieldName = 'COLOR_NAME'
            Width = 110
          end
          object vwSMColorsCOLOR_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'COLOR_DESCRIPTION'
            Width = 200
          end
          object vwSMColorsGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 52
          end
          object vwSMColorsIS_VISIBLE: TcxGridDBColumn
            Caption = 'Visible'
            DataBinding.FieldName = 'IS_VISIBLE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 46
          end
        end
        object lvlSColors: TcxGridLevel
          GridView = vwSMColors
        end
      end
    end
    object tsNailfins: TcxTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Nailfins'
      ImageIndex = 2
      ExplicitWidth = 1047
      object Label8: TLabel
        Left = 25
        Top = 12
        Width = 80
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Available Nailfins'
      end
      object Label9: TLabel
        Left = 520
        Top = 12
        Width = 90
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'This Series'#39' Nailfins'
      end
      object btnAddNailfin: TcxButton
        Left = 438
        Top = 139
        Width = 65
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Add >'
        LookAndFeel.NativeStyle = False
        TabOrder = 0
        OnClick = btnAddNailfinClick
      end
      object btnAddAllNailfins: TcxButton
        Left = 438
        Top = 188
        Width = 65
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Add >>'
        LookAndFeel.NativeStyle = False
        TabOrder = 1
        OnClick = btnAddAllNailfinsClick
      end
      object gridNailfins: TcxGrid
        Left = 24
        Top = 26
        Width = 403
        Height = 458
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 2
        LookAndFeel.NativeStyle = False
        object vwNailfin: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsNailfin
          DataController.KeyFieldNames = 'NAILFIN_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object vwNailfinNAILFIN_ID: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'NAILFIN_ID'
            Width = 53
          end
          object vwNailfinNAILFIN_NAME: TcxGridDBColumn
            Caption = 'Name'
            DataBinding.FieldName = 'NAILFIN_NAME'
            Width = 85
          end
          object vwNailfinNAILFIN_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'NAILFIN_DESCRIPTION'
            Width = 208
          end
          object vwNailfinGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 52
          end
        end
        object cxGridLevel6: TcxGridLevel
          GridView = vwNailfin
        end
      end
      object gridSeriesNailfins: TcxGrid
        Left = 520
        Top = 26
        Width = 462
        Height = 458
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 3
        LookAndFeel.NativeStyle = False
        object vwSMNailfin: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.Prior.Visible = True
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Edit.Enabled = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Refresh.Visible = True
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsSeriesNailfin
          DataController.KeyFieldNames = 'SNF_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object vwSMNailfinNAILFIN_ID: TcxGridDBColumn
            DataBinding.FieldName = 'SNF_ID'
            Width = 42
          end
          object vwSMNailfinNAILFIN_NAME: TcxGridDBColumn
            Caption = 'Name'
            DataBinding.FieldName = 'NAILFIN_NAME'
            Width = 144
          end
          object vwSMNailfinNAILFIN_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'NAILFIN_DESCRIPTION'
            Width = 202
          end
          object vwSMNailfinGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 52
          end
          object vwSMNailfinIS_VISIBLE: TcxGridDBColumn
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
        object lvlSNailfin: TcxGridLevel
          GridView = vwSMNailfin
        end
      end
    end
    object tsCallouts: TcxTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Callouts'
      ImageIndex = 6
      ExplicitWidth = 1047
      object Bevel3: TBevel
        Left = 404
        Top = 241
        Width = 242
        Height = 82
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Shape = bsFrame
        Visible = False
      end
      object gridCallout: TcxGrid
        Left = 11
        Top = 9
        Width = 377
        Height = 562
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object vwCallouts: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsCallouts
          DataController.KeyFieldNames = 'CALLOUTS_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.Visible = True
          NewItemRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object vwCalloutsCALLOUTS: TcxGridDBColumn
            Caption = 'Callout Size'
            DataBinding.FieldName = 'CALLOUTS'
            PropertiesClassName = 'TcxMaskEditProperties'
            Width = 126
          end
          object vwCalloutsNFS_WIDTH: TcxGridDBColumn
            Caption = 'NFS Width'
            DataBinding.FieldName = 'NFS_WIDTH'
            Width = 113
          end
          object vwCalloutsNFS_HEIGHT: TcxGridDBColumn
            Caption = 'NFS Height'
            DataBinding.FieldName = 'NFS_HEIGHT'
            Width = 116
          end
          object vwCalloutsIS_VISIBLE: TcxGridDBColumn
            Caption = 'Visible'
            DataBinding.FieldName = 'IS_VISIBLE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 75
          end
          object vwCalloutsGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'GUI'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 49
          end
        end
        object cxGridLevel7: TcxGridLevel
          GridView = vwCallouts
        end
      end
      object btnCopyModelCallouts: TcxButton
        Left = 417
        Top = 289
        Width = 83
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Copy Model'
        LookAndFeel.NativeStyle = False
        TabOrder = 1
        Visible = False
        OnClick = btnCopyModelCalloutsClick
      end
      object btnCopySeriesCallouts: TcxButton
        Left = 416
        Top = 252
        Width = 84
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Copy Series'
        LookAndFeel.NativeStyle = False
        TabOrder = 2
        Visible = False
        OnClick = btnCopySeriesCalloutsClick
      end
      object cbSeriesCallouts: TcxLookupComboBox
        Left = 507
        Top = 254
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
        Properties.ReadOnly = False
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Visible = False
        Width = 123
      end
      object cbNewModel_Callouts: TcxLookupComboBox
        Left = 507
        Top = 290
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Properties.KeyFieldNames = 'MODEL_ID'
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
        Properties.ListSource = CostingDM.dsModels
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Visible = False
        Width = 123
      end
      object cxGroupBox3: TcxGroupBox
        Left = 404
        Top = 5
        Caption = 'Copy Callouts'
        TabOrder = 5
        Height = 223
        Width = 242
        object Label20: TLabel
          Left = 30
          Top = 30
          Width = 107
          Height = 13
          Margins.Bottom = 2
          Caption = '1. Select Series above'
        end
        object Label21: TLabel
          Left = 30
          Top = 48
          Width = 98
          Height = 13
          Margins.Bottom = 2
          Caption = '2. Select Model here'
        end
        object Label22: TLabel
          Left = 30
          Top = 97
          Width = 107
          Height = 13
          Margins.Bottom = 2
          Caption = '4. Select Series above'
        end
        object Label23: TLabel
          Left = 30
          Top = 115
          Width = 98
          Height = 13
          Margins.Bottom = 2
          Caption = '5. Select Model here'
        end
        object lblCalloutMem: TLabel
          Left = 32
          Top = 183
          Width = 65
          Height = 13
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Copied: N/A'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel2: TBevel
          Left = 126
          Top = 122
          Width = 56
          Height = 6
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Shape = bsTopLine
        end
        object Bevel1: TBevel
          Left = 167
          Top = 72
          Width = 15
          Height = 51
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Shape = bsRightLine
        end
        object cbModelCallout: TcxLookupComboBox
          Left = 126
          Top = 46
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
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
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Width = 98
        end
        object btnCopyCallouts: TcxButton
          Left = 31
          Top = 68
          Width = 119
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '3. Copy to Clipboard'
          LookAndFeel.NativeStyle = False
          TabOrder = 1
          OnClick = btnCopyCalloutsClick
        end
        object btnPasteCallouts: TcxButton
          Left = 31
          Top = 133
          Width = 119
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BiDiMode = bdLeftToRight
          Caption = '6. Paste from Clipboard'
          LookAndFeel.NativeStyle = False
          ParentBiDiMode = False
          TabOrder = 2
          WordWrap = True
          OnClick = btnPasteCalloutsClick
        end
      end
    end
    object tsHanding: TcxTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Handing'
      ImageIndex = 0
      ExplicitWidth = 1047
      object Label2: TLabel
        Left = 19
        Top = 12
        Width = 85
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Available Handing'
      end
      object Label3: TLabel
        Left = 521
        Top = 12
        Width = 104
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'This Model'#39's Handings'
      end
      object Label12: TLabel
        Left = 245
        Top = 76
        Width = 28
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Model'
      end
      object btnAddAllHanding: TcxButton
        Left = 436
        Top = 200
        Width = 67
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Add >>'
        LookAndFeel.NativeStyle = False
        TabOrder = 0
        OnClick = btnAddAllHandingClick
      end
      object btnAddHanding: TcxButton
        Left = 436
        Top = 155
        Width = 67
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Add >'
        LookAndFeel.NativeStyle = False
        TabOrder = 1
        OnClick = btnAddHandingClick
      end
      object gridHanding: TcxGrid
        Left = 19
        Top = 26
        Width = 403
        Height = 449
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 2
        LookAndFeel.NativeStyle = False
        object vwHanding: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsHanding
          DataController.KeyFieldNames = 'HANDING_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.CellEndEllipsis = True
          OptionsView.ShowEditButtons = gsebAlways
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object vwHandingHANDING_ID: TcxGridDBColumn
            DataBinding.FieldName = 'HANDING_ID'
            Visible = False
          end
          object vwHandingHANDING_NAME: TcxGridDBColumn
            Caption = 'Name'
            DataBinding.FieldName = 'HANDING_NAME'
            Width = 111
          end
          object vwHandingHANDING_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'HANDING_DESCRIPTION'
            Width = 162
          end
          object vwHandingVIEWED_FROM: TcxGridDBColumn
            Caption = 'View'
            DataBinding.FieldName = 'VIEWED_FROM'
            Width = 61
          end
          object vwHandingGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 77
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = vwHanding
        end
      end
      object gridModelHanding: TcxGrid
        Left = 523
        Top = 26
        Width = 424
        Height = 449
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 3
        LookAndFeel.NativeStyle = False
        object vwSMHanding: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsSeriesHanding
          DataController.KeyFieldNames = 'HSM_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object vwSMHandingHANDING_ID: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'HANDING_ID'
            Visible = False
            Width = 36
          end
          object vwSMHandingHANDING_NAME: TcxGridDBColumn
            Caption = 'Handing'
            DataBinding.FieldName = 'HANDING_NAME'
            Width = 107
          end
          object vwSMHandingHANDING_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'HANDING_DESCRIPTION'
            Width = 184
          end
          object vwSMHandingGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 76
          end
          object vwSMHandingIS_VISIBLE: TcxGridDBColumn
            Caption = 'Visible'
            DataBinding.FieldName = 'IS_VISIBLE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 71
          end
        end
        object cxGridLevel10: TcxGridLevel
          GridView = vwSMHanding
        end
      end
    end
    object tbScreens: TcxTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Screens'
      ImageIndex = 5
      ExplicitWidth = 1047
      object Label10: TLabel
        Left = 11
        Top = 17
        Width = 84
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Available Screens'
      end
      object Label11: TLabel
        Left = 439
        Top = 17
        Width = 98
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'This Model'#39's Screens'
      end
      object gridScreens: TcxGrid
        Left = 11
        Top = 33
        Width = 339
        Height = 442
        HelpContext = 160
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object vwScreens: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsScreen
          DataController.KeyFieldNames = 'SCREEN_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.CellEndEllipsis = True
          OptionsView.ShowEditButtons = gsebAlways
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object vwScreensSCREEN_ID: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'SCREEN_ID'
            Visible = False
            Width = 30
          end
          object vwScreensSCREEN_NAME: TcxGridDBColumn
            Caption = 'Screen'
            DataBinding.FieldName = 'SCREEN_NAME'
            Width = 68
          end
          object vwScreensSCREEN_DESCRIPTION: TcxGridDBColumn
            Caption = 'Desciption'
            DataBinding.FieldName = 'SCREEN_DESCRIPTION'
            Width = 154
          end
          object vwScreensIS_NO_DIM: TcxGridDBColumn
            Caption = 'No Dim'
            DataBinding.FieldName = 'IS_NO_DIM'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 38
          end
          object vwScreensGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 52
          end
        end
        object cxGridLevel4: TcxGridLevel
          GridView = vwScreens
        end
      end
      object btnAddScreen: TcxButton
        Left = 360
        Top = 142
        Width = 67
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Add >'
        LookAndFeel.NativeStyle = False
        TabOrder = 1
        OnClick = btnAddScreenClick
      end
      object btnAddAllScreens: TcxButton
        Left = 360
        Top = 187
        Width = 67
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Add >>'
        LookAndFeel.NativeStyle = False
        TabOrder = 2
        OnClick = btnAddAllScreensClick
      end
      object gridModelScreens: TcxGrid
        Left = 436
        Top = 33
        Width = 620
        Height = 442
        HelpContext = 160
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 3
        LookAndFeel.NativeStyle = False
        object vwSMScreens: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = True
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsScreen_SM
          DataController.KeyFieldNames = 'SCREEN_SM_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object vwSMScreensColumn1: TcxGridDBColumn
            Caption = 'Sceen_SM_ID'
            DataBinding.FieldName = 'SCREEN_SM_ID'
            Width = 74
          end
          object vwSMScreensSM_ID: TcxGridDBColumn
            DataBinding.FieldName = 'SM_ID'
            PropertiesClassName = 'TcxLabelProperties'
            Visible = False
            Width = 57
          end
          object vwSMScreensSCREEN_ID: TcxGridDBColumn
            DataBinding.FieldName = 'SCREEN_ID'
            Visible = False
            Width = 85
          end
          object vwSMScreensMODEL_NAME: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'SCREEN_ID'
            Visible = False
            Width = 38
          end
          object vwSMScreensSCREEN_NAME: TcxGridDBColumn
            Caption = 'Screen'
            DataBinding.FieldName = 'SCREEN_NAME'
            Width = 61
          end
          object vwSMScreensSCREEN_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'SCREEN_DESCRIPTION'
            Width = 116
          end
          object vwSMScreensCOST: TcxGridDBColumn
            Caption = 'Cost'
            DataBinding.FieldName = 'COST'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.AssignedValues.MinValue = True
            Properties.DecimalPlaces = 3
            Properties.DisplayFormat = '$,0.000;($,0.000)'
            Properties.EditFormat = '$,0.000;($,0.000)'
            Properties.MaxValue = 1.000000000000000000
            Width = 41
          end
          object vwSMScreensQUANTITY: TcxGridDBColumn
            Caption = 'Qty'
            DataBinding.FieldName = 'QUANTITY'
            Width = 25
          end
          object vwSMScreensWIDTH_DIVISOR: TcxGridDBColumn
            Caption = 'W.Divisor'
            DataBinding.FieldName = 'WIDTH_DIVISOR'
            Width = 51
          end
          object vwSMScreensWIDTH_DEDUCT: TcxGridDBColumn
            Caption = 'W.Deduct'
            DataBinding.FieldName = 'WIDTH_DEDUCT'
            Width = 53
          end
          object vwSMScreensHEIGHT_DIVISOR: TcxGridDBColumn
            Caption = 'H.Divisor'
            DataBinding.FieldName = 'HEIGHT_DIVISOR'
            Width = 50
          end
          object vwSMScreensHEIGHT_DEDUCT: TcxGridDBColumn
            Caption = 'H.Deduct'
            DataBinding.FieldName = 'HEIGHT_DEDUCT'
            Width = 50
          end
          object vwSMScreensGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 54
          end
          object vwSMScreensIS_DEFAULT: TcxGridDBColumn
            Caption = 'Default'
            DataBinding.FieldName = 'IS_DEFAULT'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Properties.OnEditValueChanged = viewSScreensIS_DEFAULTPropertiesEditValueChanged
            Width = 40
          end
          object vwSMScreensIS_VISIBLE: TcxGridDBColumn
            Caption = 'Visible'
            DataBinding.FieldName = 'IS_VISIBLE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 35
          end
        end
        object cxGridLevel11: TcxGridLevel
          GridView = vwSMScreens
        end
      end
      object cxLabel1: TcxLabel
        Left = 472
        Top = 496
        Caption = 
          'Screen Cost is in $ per United Inch. For NO SCREEN, use a positi' +
          've but lower number'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Locks'
      ImageIndex = 7
      ExplicitWidth = 1047
      object gridLock: TcxGrid
        Left = 16
        Top = 16
        Width = 500
        Height = 457
        HelpContext = 170
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object vwLock: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsWinLock_SM
          DataController.KeyFieldNames = 'WINLOCK_SM_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object vwLockWINLOCK_NAME: TcxGridDBColumn
            Caption = 'Lock'
            DataBinding.FieldName = 'WINLOCK_NAME'
            Width = 96
          end
          object vwLockWINLOCK_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'WINLOCK_DESCRIPTION'
            Width = 207
          end
          object vwLockCost: TcxGridDBColumn
            Caption = 'Cost'
            DataBinding.FieldName = 'COST'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 3
            Properties.DisplayFormat = '$,0.000;($,0.000)'
            Width = 41
          end
          object vwLockGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 52
          end
          object vwLockIS_DEFAULT: TcxGridDBColumn
            Caption = 'Default'
            DataBinding.FieldName = 'IS_DEFAULT'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Properties.OnEditValueChanged = vwLockIS_DEFAULTPropertiesEditValueChanged
            Width = 40
          end
          object vwLockIS_VISIBLE: TcxGridDBColumn
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
        object cxGridLevel12: TcxGridLevel
          GridView = vwLock
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'Paint'
      ImageIndex = 8
      ExplicitWidth = 1047
      object Label18: TLabel
        Left = 26
        Top = 12
        Width = 115
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Available Paint Schemes'
      end
      object Label19: TLabel
        Left = 521
        Top = 12
        Width = 129
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'This Model'#39's Paint Schemes'
      end
      object btnAddPaint: TcxButton
        Left = 440
        Top = 129
        Width = 66
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Add>'
        LookAndFeel.NativeStyle = False
        TabOrder = 0
        OnClick = btnAddPaintClick
      end
      object btnAddAllPaint: TcxButton
        Left = 440
        Top = 174
        Width = 66
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Add>>'
        LookAndFeel.NativeStyle = False
        TabOrder = 1
        OnClick = btnAddAllPaintClick
      end
      object gridPaint: TcxGrid
        Left = 26
        Top = 27
        Width = 403
        Height = 446
        TabOrder = 2
        LookAndFeel.NativeStyle = False
        object vwPaint: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsPaint
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object vwPaintPAINT_ID: TcxGridDBColumn
            DataBinding.FieldName = 'PAINT_ID'
            Visible = False
          end
          object vwPaintPAINT_NAME: TcxGridDBColumn
            Caption = 'Paint'
            DataBinding.FieldName = 'PAINT_NAME'
            Width = 107
          end
          object vwPaintPAINT_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'PAINT_DESCRIPTION'
            Width = 189
          end
          object vwPaintGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 77
          end
        end
        object gridPaintLevel1: TcxGridLevel
          GridView = vwPaint
        end
      end
      object gridPaintModel: TcxGrid
        Left = 520
        Top = 27
        Width = 499
        Height = 446
        TabOrder = 3
        LookAndFeel.NativeStyle = False
        object viewSPaint: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsPaint_SM
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object viewSPaintPAINT_NAME: TcxGridDBColumn
            Caption = 'Paint'
            DataBinding.FieldName = 'PAINT_NAME'
            Width = 106
          end
          object viewSPaintPAINT_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'PAINT_DESCRIPTION'
            Width = 162
          end
          object viewSPaintCOST: TcxGridDBColumn
            Caption = 'Cost'
            DataBinding.FieldName = 'COST'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Width = 46
          end
          object viewSPaintGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 52
          end
          object viewSPaintIS_DEFAULT: TcxGridDBColumn
            Caption = 'Default'
            DataBinding.FieldName = 'IS_DEFAULT'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Properties.OnEditValueChanged = viewSPaintIS_DEFAULTPropertiesEditValueChanged
            Width = 40
          end
          object viewSPaintIS_VISIBLE: TcxGridDBColumn
            Caption = 'Visible'
            DataBinding.FieldName = 'IS_VISIBLE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 48
          end
        end
        object gridPaintModelLevel1: TcxGridLevel
          GridView = viewSPaint
        end
      end
    end
    object cxTabSheet1: TcxTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Structural'
      ImageIndex = 6
      ExplicitWidth = 1047
      object Label13: TLabel
        Left = 20
        Top = 11
        Width = 74
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Available Rates'
      end
      object Label14: TLabel
        Left = 544
        Top = 11
        Width = 50
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'This Rates'
      end
      object cxGrid1: TcxGrid
        Left = 20
        Top = 25
        Width = 403
        Height = 450
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object vwStrucPerf: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsStruc_Perf
          DataController.KeyFieldNames = 'STRUC_PERF_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.Visible = True
          NewItemRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.CellEndEllipsis = True
          OptionsView.ShowEditButtons = gsebAlways
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object vwStrucPerfSTRUC_PERF_ID: TcxGridDBColumn
            DataBinding.FieldName = 'STRUC_PERF_ID'
            Visible = False
          end
          object vwStrucPerfPERFORMANCE: TcxGridDBColumn
            Caption = 'Performance'
            DataBinding.FieldName = 'PERFORMANCE'
            Width = 118
          end
          object vwStrucPerfDESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'DESCRIPTION'
            Width = 211
          end
          object vwStrucPerfGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 71
          end
        end
        object grdStrucPerformance: TcxGridLevel
          GridView = vwStrucPerf
        end
      end
      object Button1: TcxButton
        Left = 449
        Top = 137
        Width = 67
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Add>'
        LookAndFeel.NativeStyle = False
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TcxButton
        Left = 449
        Top = 181
        Width = 67
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Add>>'
        LookAndFeel.NativeStyle = False
        TabOrder = 2
        OnClick = Button2Click
      end
      object cxGrid2: TcxGrid
        Left = 544
        Top = 25
        Width = 453
        Height = 450
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 3
        LookAndFeel.NativeStyle = False
        object vwSMStrucPerf: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsStruc_Perf_SM
          DataController.KeyFieldNames = 'STRUC_PERF_SM_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object vwSMStrucPerfSTRUC_PERF_SM_ID: TcxGridDBColumn
            DataBinding.FieldName = 'STRUC_PERF_SM_ID'
            Visible = False
          end
          object vwSMStrucPerfSM_ID: TcxGridDBColumn
            DataBinding.FieldName = 'SM_ID'
            Visible = False
          end
          object vwSMStrucPerfSTRUC_PERF_ID: TcxGridDBColumn
            DataBinding.FieldName = 'STRUC_PERF_ID'
            Visible = False
          end
          object vwSMStrucPerfPERFORMANCE: TcxGridDBColumn
            Caption = 'Performance'
            DataBinding.FieldName = 'PERFORMANCE'
            Width = 188
          end
          object vwSMStrucPerfDESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'DESCRIPTION'
            Width = 146
          end
          object vwSMStrucPerfIS_DEFAULT: TcxGridDBColumn
            Caption = 'Default'
            DataBinding.FieldName = 'IS_DEFAULT'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Visible = False
          end
          object vwSMStrucPerfGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 52
          end
          object vwSMStrucPerfIS_VISIBLE: TcxGridDBColumn
            Caption = 'Visible'
            DataBinding.FieldName = 'IS_VISIBLE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 46
          end
        end
        object grdStrucPerf_SM: TcxGridLevel
          GridView = vwSMStrucPerf
        end
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = 'STC'
      ImageIndex = 9
      ExplicitWidth = 1047
      object cxGrid10: TcxGrid
        Left = 16
        Top = 16
        Width = 691
        Height = 461
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object cxGridDBTableView12: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsSTC_SM
          DataController.KeyFieldNames = 'STC_SM_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object cxGridDBTableView11STC: TcxGridDBColumn
            DataBinding.FieldName = 'STC'
          end
          object cxGridDBTableView11GT_OUTER: TcxGridDBColumn
            Caption = 'Glass Type Outer'
            DataBinding.FieldName = 'GT_OUTER'
            Width = 110
          end
          object cxGridDBTableView11GT_MIDDLE: TcxGridDBColumn
            Caption = 'Glass Type Middle'
            DataBinding.FieldName = 'GT_MIDDLE'
            Width = 110
          end
          object cxGridDBTableView11GT_INNER: TcxGridDBColumn
            Caption = 'Glass Type Inner'
            DataBinding.FieldName = 'GT_INNER'
            Width = 98
          end
          object cxGridDBTableView11TYPE_OUTER: TcxGridDBColumn
            Caption = 'TYPE Outer'
            DataBinding.FieldName = 'TYPE_OUTER'
            Width = 72
          end
          object cxGridDBTableView11TYPE_MIDDLE: TcxGridDBColumn
            Caption = 'TYPE Middle'
            DataBinding.FieldName = 'TYPE_MIDDLE'
            Width = 74
          end
          object cxGridDBTableView11TYPE_INNER: TcxGridDBColumn
            Caption = 'TYPE Inner'
            DataBinding.FieldName = 'TYPE_INNER'
            Width = 70
          end
          object cxGridDBColumn4: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 52
          end
          object cxGridDBTableView11OPERATOR: TcxGridDBColumn
            DataBinding.FieldName = 'OPERATOR'
            Visible = False
          end
          object cxGridDBTableView11DATE_SAVED: TcxGridDBColumn
            DataBinding.FieldName = 'DATE_SAVED'
            Visible = False
          end
          object cxGridDBTableView11OPERATOR_LAST_MODIFIED: TcxGridDBColumn
            DataBinding.FieldName = 'OPERATOR_LAST_MODIFIED'
            Visible = False
          end
          object cxGridDBTableView11DATE_LAST_MODIFIED: TcxGridDBColumn
            DataBinding.FieldName = 'DATE_LAST_MODIFIED'
            Visible = False
          end
          object cxGridDBTableView11IS_VISIBLE: TcxGridDBColumn
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
        object cxGridLevel14: TcxGridLevel
          GridView = cxGridDBTableView12
        end
      end
    end
    object cxTabSheet7: TcxTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'BOM Cost Type'
      ImageIndex = 15
      ExplicitWidth = 1047
      object grdBCT: TcxGrid
        Left = 15
        Top = 14
        Width = 403
        Height = 450
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object vwBCT: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsBomCostType
          DataController.KeyFieldNames = 'BCT_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.CellEndEllipsis = True
          OptionsView.ShowEditButtons = gsebAlways
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object vwBCTBCT_NAME: TcxGridDBColumn
            Caption = 'BOM Cost Type'
            DataBinding.FieldName = 'BCT_NAME'
            Width = 430
          end
        end
        object cxGridLevel9: TcxGridLevel
          GridView = vwBCT
        end
      end
    end
    object cxTabSheet6: TcxTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'IGU Lites'
      ImageIndex = 13
      ExplicitWidth = 1047
      object grdIGU: TcxGrid
        Left = 7
        Top = 9
        Width = 774
        Height = 275
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object vwIGULites: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Visible = True
          FilterBox.CustomizeDialog = False
          DataController.DataSource = CostingDM.dsIGU_SM_Lites
          DataController.KeyFieldNames = 'IGU_SM_LITES_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.CellEndEllipsis = True
          OptionsView.ShowEditButtons = gsebAlways
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object vwIGULitesIGU_SM_LITES_ID: TcxGridDBColumn
            DataBinding.FieldName = 'IGU_SM_LITES_ID'
            Visible = False
          end
          object vwIGULitesSM_ID: TcxGridDBColumn
            DataBinding.FieldName = 'SM_ID'
            Width = 54
          end
          object vwIGULitesIGU_POSITION: TcxGridDBColumn
            Caption = 'Position'
            DataBinding.FieldName = 'IGU_POSITION'
            Options.Editing = False
            Options.Filtering = False
            Width = 54
          end
          object vwIGULitesLITE_GLASS_EDGE_ID: TcxGridDBColumn
            Caption = 'Glass Edge'
            DataBinding.FieldName = 'LITE_GLASS_EDGE_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'GLASS_EDGE_ID'
            Properties.ListColumns = <
              item
                FieldName = 'GED_CODE'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = CostingDM.dsGlassEdge
            Width = 85
          end
          object vwIGULitesLITE_GED_CODE: TcxGridDBColumn
            Caption = 'Lite GED Code'
            DataBinding.FieldName = 'LITE_GED_CODE'
            Width = 101
          end
          object vwIGULitesLITE_H: TcxGridDBColumn
            Caption = 'Horiz Multiplier'
            DataBinding.FieldName = 'LITE_H'
            Width = 91
          end
          object vwIGULitesLITE_H_DEDUCT: TcxGridDBColumn
            Caption = 'Horiz Deduct'
            DataBinding.FieldName = 'LITE_H_DEDUCT'
            Width = 79
          end
          object vwIGULitesLITE_V: TcxGridDBColumn
            Caption = 'Vert Multiplier'
            DataBinding.FieldName = 'LITE_V'
            Width = 82
          end
          object vwIGULitesLITE_V_DEDUCT: TcxGridDBColumn
            Caption = 'Vert Deduct'
            DataBinding.FieldName = 'LITE_V_DEDUCT'
            Width = 81
          end
          object vwIGULitesLITE_H_GRID: TcxGridDBColumn
            Caption = 'Horiz Grid'
            DataBinding.FieldName = 'LITE_H_GRID'
            Width = 78
          end
          object vwIGULitesLITE_V_GRID: TcxGridDBColumn
            Caption = 'Vert'
            DataBinding.FieldName = 'LITE_V_GRID'
            Width = 89
          end
        end
        object cxGridLevel5: TcxGridLevel
          GridView = vwIGULites
        end
      end
      object gbSpecDims: TcxGroupBox
        Left = 7
        Top = 327
        Caption = 'Special Dimensions'
        TabOrder = 1
        Height = 254
        Width = 595
        object grdSpecDimCallout: TcxGrid
          Left = 13
          Top = 24
          Width = 264
          Height = 215
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 0
          LookAndFeel.NativeStyle = False
          object vwSP_Callout: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            Navigator.Visible = True
            DataController.DataModeController.GridMode = True
            DataController.DataModeController.SyncMode = False
            DataController.DataSource = CostingDM.dsSPCallout
            DataController.KeyFieldNames = 'SP_CALLOUT_ID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.NavigatorHints = True
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            Preview.Visible = True
            object vwSP_CalloutSP_CALLOUT_ID: TcxGridDBColumn
              DataBinding.FieldName = 'SP_CALLOUT_ID'
              Visible = False
            end
            object vwSP_CalloutSM_ID: TcxGridDBColumn
              DataBinding.FieldName = 'SM_ID'
              Options.Editing = False
              Width = 49
            end
            object vwSP_CalloutSP_CALLOUT_NAME: TcxGridDBColumn
              Caption = 'Special Callout'
              DataBinding.FieldName = 'SP_CALLOUT_NAME'
              Width = 109
            end
            object vwSP_CalloutSP_DIM_AXIS: TcxGridDBColumn
              Caption = 'Dim'
              DataBinding.FieldName = 'SP_DIM_AXIS'
              PropertiesClassName = 'TcxComboBoxProperties'
              Properties.DropDownListStyle = lsEditFixedList
              Properties.Items.Strings = (
                'X'
                'Y')
              Width = 75
            end
          end
          object glvlSP_Callout: TcxGridLevel
            GridView = vwSP_Callout
          end
        end
        object grdSpecDimXY: TcxGrid
          Left = 312
          Top = 24
          Width = 263
          Height = 215
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 1
          LookAndFeel.NativeStyle = False
          object vwSP_DIM: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            Navigator.Visible = True
            DataController.DataModeController.GridMode = True
            DataController.DataModeController.SyncMode = False
            DataController.DataSource = CostingDM.dsSPDIM
            DataController.KeyFieldNames = 'SP_DIM_ID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.FocusFirstCellOnNewRecord = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.NavigatorHints = True
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.ShowEditButtons = gsebAlways
            OptionsView.GroupByBox = False
            Preview.Visible = True
            object vwSP_DIMSP_DIM_ID: TcxGridDBColumn
              DataBinding.FieldName = 'SP_DIM_ID'
              Visible = False
            end
            object vwSP_DIMSP_CALLOUT_ID: TcxGridDBColumn
              DataBinding.FieldName = 'SP_CALLOUT_ID'
              Visible = False
            end
            object vwSP_DIMIGU_POSITION: TcxGridDBColumn
              Caption = 'IGU Position'
              DataBinding.FieldName = 'IGU_POSITION'
              PropertiesClassName = 'TcxComboBoxProperties'
              Properties.DropDownListStyle = lsEditFixedList
              Properties.Items.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
                '6')
              Width = 116
            end
            object vwSP_DIMSP_DIM_VAL: TcxGridDBColumn
              Caption = 'Value'
              DataBinding.FieldName = 'SP_DIM_VAL'
              Width = 91
            end
          end
          object glvlSP_DIM: TcxGridLevel
            GridView = vwSP_DIM
          end
        end
      end
    end
    object tsXpanel_Lites: TcxTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'X Panels'
      ImageIndex = 14
      ExplicitWidth = 1047
      object grdXPanel: TcxGrid
        Left = 4
        Top = 7
        Width = 443
        Height = 275
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object vwXPanel_SM: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Visible = True
          FilterBox.CustomizeDialog = False
          DataController.DataSource = CostingDM.dsXPanel_SM_Lites
          DataController.KeyFieldNames = 'XPANEL_SM_LITES_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.CellEndEllipsis = True
          OptionsView.ShowEditButtons = gsebAlways
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object vwXPanel_SMSM_ID: TcxGridDBColumn
            DataBinding.FieldName = 'SM_ID'
            Width = 64
          end
          object vwXPanel_SMXPANEL_SM_LITES_ID: TcxGridDBColumn
            DataBinding.FieldName = 'XPANEL_SM_LITES_ID'
            Visible = False
          end
          object vwXPanel_SMXP_POSITION: TcxGridDBColumn
            Caption = 'Position'
            DataBinding.FieldName = 'XP_POSITION'
            Width = 64
          end
          object vwXPanel_SMXP_LITE_H: TcxGridDBColumn
            Caption = 'Horiz Multiplier'
            DataBinding.FieldName = 'XP_LITE_H'
            Width = 107
          end
          object vwXPanel_SMXP_LITE_H_DEDUCT: TcxGridDBColumn
            Caption = 'Horiz Deduct'
            DataBinding.FieldName = 'XP_LITE_H_DEDUCT'
            Width = 97
          end
          object vwXPanel_SMXP_LITE_V: TcxGridDBColumn
            Caption = 'Vert Multiplier'
            DataBinding.FieldName = 'XP_LITE_V'
            Width = 108
          end
          object vwXPanel_SMXP_LITE_V_DEDUCT: TcxGridDBColumn
            Caption = 'Vert Deduct'
            DataBinding.FieldName = 'XP_LITE_V_DEDUCT'
            Width = 101
          end
        end
        object cxGridLevel8: TcxGridLevel
          GridView = vwXPanel_SM
        end
      end
    end
    object tsCopySM: TcxTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Copy Tables'
      ImageIndex = 11
      ExplicitWidth = 1047
      object cxGroupBox6: TcxGroupBox
        Left = 16
        Top = 11
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Copy Series Model To:'
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        DesignSize = (
          360
          151)
        Height = 156
        Width = 360
        object Label24: TLabel
          Left = 24
          Top = 37
          Width = 29
          Height = 13
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Series'
        end
        object Label25: TLabel
          Left = 24
          Top = 72
          Width = 28
          Height = 13
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Model'
        end
        object btnCopySeries: TcxButton
          Left = 256
          Top = 120
          Width = 87
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akTop, akRight]
          Caption = 'Copy'
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          ModalResult = 1
          TabOrder = 0
          OnClick = btnCopySeriesClick
        end
        object luTarget_Series: TcxLookupComboBox
          Left = 52
          Top = 35
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
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
          Properties.OnEditValueChanged = cxLookupComboBox1PropertiesEditValueChanged
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 1
          Width = 165
        end
        object luTarget_SModel: TcxLookupComboBox
          Left = 52
          Top = 70
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Properties.DropDownAutoSize = True
          Properties.DropDownSizeable = True
          Properties.HideSelection = False
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'SM_ID'
          Properties.ListColumns = <
            item
              FieldName = 'MODEL_NAME'
            end
            item
              FieldName = 'MODEL_DESCRIPTION'
            end
            item
              MinWidth = 0
              Width = 0
              FieldName = 'MODEL_ID'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = CostingDM.dsSerMod_Lookup
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 2
          Width = 165
        end
      end
    end
    object cxTabSheet5: TcxTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Program Colors'
      ImageIndex = 12
      ExplicitWidth = 1047
      object grdTractColors: TcxGrid
        Left = 16
        Top = 16
        Width = 424
        Height = 465
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object vwTractColors: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsGStatusColor
          DataController.KeyFieldNames = 'GRID_COLOR_STATUS_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.CellEndEllipsis = True
          OptionsView.ShowEditButtons = gsebAlways
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object vwTractColorsGRID_COLOR_STATUS_ID: TcxGridDBColumn
            DataBinding.FieldName = 'GRID_COLOR_STATUS_ID'
            Visible = False
          end
          object vwTractColorsCOLOR: TcxGridDBColumn
            Caption = 'Color'
            DataBinding.FieldName = 'COLOR'
            PropertiesClassName = 'TcxColorComboBoxProperties'
            Properties.AllowSelectColor = True
            Properties.CustomColors = <
              item
                Color = clBlack
              end>
            Properties.DropDownSizeable = True
            Properties.ShowDescriptions = False
            Width = 163
          end
          object vwTractColorsDESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'DESCRIPTION'
            Width = 246
          end
        end
        object grdlvlgrdTractColors: TcxGridLevel
          GridView = vwTractColors
        end
      end
    end
    object tsLog: TcxTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Log'
      ImageIndex = 10
      ExplicitWidth = 1047
      object mlog: TMemo
        Left = 0
        Top = 0
        Width = 1089
        Height = 599
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
        ExplicitWidth = 1047
      end
    end
  end
  object cxGroupBox7: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    TabOrder = 1
    ExplicitWidth = 1199
    DesignSize = (
      1241
      38)
    Height = 38
    Width = 1241
    object Label1: TLabel
      Left = 9
      Top = 14
      Width = 29
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Series'
    end
    object Label17: TLabel
      Left = 216
      Top = 16
      Width = 60
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Series Model'
    end
    object btnClose: TcxButton
      Left = 1147
      Top = 7
      Width = 87
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akTop, akRight]
      Caption = '&Close'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 1
      TabOrder = 0
      OnClick = btnCloseClick
      ExplicitLeft = 1105
    end
    object luSeries: TcxLookupComboBox
      Left = 40
      Top = 11
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Properties.DropDownAutoSize = True
      Properties.DropDownRows = 14
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'SERIES_ID'
      Properties.ListColumns = <
        item
          MinWidth = 60
          FieldName = 'SERIES_NAME'
        end
        item
          MinWidth = 100
          FieldName = 'SERIES_DESCRIPTION'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = CostingDM.dsSeries
      Properties.OnEditValueChanged = cbSeriesPropertiesEditValueChanged
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 164
    end
    object MProgBar: TcxProgressBar
      Left = 40
      Top = 12
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Properties.AnimationSpeed = 5
      Properties.BarStyle = cxbsAnimation
      Properties.BeginColor = 54056
      Properties.PeakValue = 80.000000000000000000
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Transparent = True
      Visible = False
      Width = 149
    end
    object luSerModel: TcxLookupComboBox
      Left = 284
      Top = 11
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.HideSelection = False
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'SM_ID'
      Properties.ListColumns = <
        item
          FieldName = 'MODEL_NAME'
        end
        item
          FieldName = 'MODEL_DESCRIPTION'
        end
        item
          MinWidth = 0
          Width = 0
          FieldName = 'MODEL_ID'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = CostingDM.dsSeriesModel
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Width = 164
    end
    object btnAddSeries: TcxButton
      Left = 961
      Top = 7
      Width = 87
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akTop, akRight]
      Caption = 'Add/Edit Series'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 1
      TabOrder = 4
      OnClick = btnAddSeriesClick
      ExplicitLeft = 919
    end
    object btnDeleteSeries: TcxButton
      Left = 1054
      Top = 7
      Width = 87
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akTop, akRight]
      Caption = 'Delete Series'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 1
      TabOrder = 5
      OnClick = btnDeleteSeriesClick
      ExplicitLeft = 1012
    end
    object cxDBLabel1: TcxDBLabel
      Left = 453
      Top = 14
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataBinding.DataField = 'SM_ID'
      DataBinding.DataSource = CostingDM.dsSeriesModel
      Properties.Alignment.Horz = taLeftJustify
      Transparent = True
      Height = 19
      Width = 59
    end
    object cxDBCheckBox1: TcxDBCheckBox
      Left = 514
      Top = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Special Model'
      DataBinding.DataField = 'IS_SPECIAL_MODEL'
      DataBinding.DataSource = CostingDM.dsSeriesModel
      Properties.DisplayChecked = '1'
      Properties.DisplayUnchecked = '0'
      Properties.NullStyle = nssUnchecked
      Properties.ReadOnly = True
      Properties.ValueChecked = '1'
      Properties.ValueUnchecked = '0'
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 7
      Transparent = True
    end
    object btnXLSExport: TcxButton
      Left = 696
      Top = 7
      Width = 88
      Height = 25
      Caption = 'Export to XLS'
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 8
      OnClick = btnXLSExportClick
    end
  end
end
