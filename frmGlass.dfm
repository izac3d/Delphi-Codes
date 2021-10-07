object Glassfrm: TGlassfrm
  Left = 127
  Top = 134
  BorderStyle = bsDialog
  Caption = 'Glass'
  ClientHeight = 588
  ClientWidth = 1037
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    1037
    588)
  PixelsPerInch = 96
  TextHeight = 13
  object pgcGlass: TcxPageControl
    Left = 0
    Top = 0
    Width = 1037
    Height = 544
    HelpContext = 260
    Align = alTop
    Color = clBtnFace
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    Properties.ActivePage = tsGlassKind
    Properties.CustomButtons.Buttons = <>
    Properties.Options = [pcoFixedTabWidthWhenRotated, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize]
    Properties.Rotate = True
    Properties.Style = 9
    Properties.TabPosition = tpLeft
    Properties.TabSlants.Positions = [spLeft, spRight]
    Properties.TabWidth = 130
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabSlants.Positions = [spLeft, spRight]
    OnChange = pgcGlassChange
    ClientRectBottom = 544
    ClientRectLeft = 131
    ClientRectRight = 1037
    ClientRectTop = 0
    object tsGlassKind: TcxTabSheet
      Caption = 'Glass Kind'
      ImageIndex = 7
      object grdGlassKind: TcxGrid
        Left = 0
        Top = 0
        Width = 906
        Height = 544
        HelpContext = 270
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        object vwGlassKind: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsGlassKind
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object vwGlassKindGLASS_KIND_ID: TcxGridDBColumn
            Caption = 'Kind ID'
            DataBinding.FieldName = 'GLASS_KIND_ID'
            Width = 52
          end
          object vwGlassKindGLASS_KIND: TcxGridDBColumn
            Caption = 'Glass Kind'
            DataBinding.FieldName = 'GLASS_KIND'
            Width = 123
          end
          object vwGlassKindDESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'DESCRIPTION'
            Width = 213
          end
          object vwGlassKindIS_VISIBLE_INNER: TcxGridDBColumn
            Caption = 'Inner'
            DataBinding.FieldName = 'IS_VISIBLE_INNER'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 80
          end
          object vwGlassKindGUI_SEQUENCE_INNER: TcxGridDBColumn
            Caption = 'Inner Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE_INNER'
            Options.Filtering = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Width = 81
          end
          object vwGlassKindIS_VISIBLE_MIDDLE: TcxGridDBColumn
            Caption = 'Middle'
            DataBinding.FieldName = 'IS_VISIBLE_MIDDLE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 79
          end
          object vwGlassKindGUI_SEQUENCE_MIDDLE: TcxGridDBColumn
            Caption = 'Middle Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE_MIDDLE'
            Options.Filtering = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Width = 85
          end
          object vwGlassKindIS_VISIBLE_OUTER: TcxGridDBColumn
            Caption = 'Outer'
            DataBinding.FieldName = 'IS_VISIBLE_OUTER'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 78
          end
          object vwGlassKindGUI_SEQUENCE_OUTER: TcxGridDBColumn
            Caption = 'Outer Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE_OUTER'
            Options.Filtering = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Width = 83
          end
        end
        object lvlGlassKind: TcxGridLevel
          GridView = vwGlassKind
        end
      end
    end
    object tsGlassType: TcxTabSheet
      Caption = 'Glass Type'
      ImageIndex = 6
      object grdGlassType: TcxGrid
        Left = 0
        Top = 0
        Width = 906
        Height = 544
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object vwGlassType: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          FilterBox.Position = fpTop
          DataController.DataSource = CostingDM.dsGlassType
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object vwGlassTypeGLASS_TYPE_ID: TcxGridDBColumn
            Caption = 'Type ID'
            DataBinding.FieldName = 'GLASS_TYPE_ID'
            Width = 46
          end
          object vwGlassTypeColumn1: TcxGridDBColumn
            Caption = 'Kind ID'
            DataBinding.FieldName = 'GLASS_KIND_ID'
            Width = 52
          end
          object vwGlassTypeGLASS_KIND_ID: TcxGridDBColumn
            Caption = 'Glass Kind'
            DataBinding.FieldName = 'GLASS_KIND_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'GLASS_KIND_ID'
            Properties.ListColumns = <
              item
                FieldName = 'DESCRIPTION'
              end>
            Properties.ListSource = CostingDM.dsGlassKind
            Width = 87
          end
          object vwGlassTypeGLASS_NAME: TcxGridDBColumn
            Caption = 'Glass Name'
            DataBinding.FieldName = 'GLASS_NAME'
            Width = 123
          end
          object vwGlassTypeTEMPERED: TcxGridDBColumn
            Caption = 'Temp'
            DataBinding.FieldName = 'TEMPERED'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 31
          end
          object vwGlassTypeDESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'DESCRIPTION'
            Width = 215
          end
          object vwGlassTypeTHICKNESS: TcxGridDBColumn
            Caption = 'Thickness'
            DataBinding.FieldName = 'THICKNESS'
            Width = 62
          end
          object vwGlassTypeAREA: TcxGridDBColumn
            Caption = 'Area'
            DataBinding.FieldName = 'AREA'
            Width = 40
          end
          object vwGlassTypeBASE_COST: TcxGridDBColumn
            Caption = 'Base Cost'
            DataBinding.FieldName = 'BASE_COST'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 3
            Properties.DisplayFormat = '$,0.000;($,0.000)'
            Width = 65
          end
          object vwGlassTypeWASTE: TcxGridDBColumn
            Caption = 'Waste %'
            DataBinding.FieldName = 'WASTE'
            Width = 50
          end
          object vwGlassTypeCOST: TcxGridDBColumn
            Caption = 'Cost'
            DataBinding.FieldName = 'COST'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 3
            Properties.DisplayFormat = '$,0.000;($,0.000)'
            Options.Editing = False
            Styles.Content = CostingDM.grdWindows_Stock_Status
            Width = 39
          end
          object vwGlassTypeGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 52
          end
          object vwGlassTypeIS_VISIBLE: TcxGridDBColumn
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
          object vwGlassTypeGED_CODE: TcxGridDBColumn
            Caption = 'GED Code'
            DataBinding.FieldName = 'GED_CODE'
            Width = 53
          end
        end
        object glvlGlassType: TcxGridLevel
          GridView = vwGlassType
        end
      end
    end
    object tsGlazing: TcxTabSheet
      Caption = 'Glazing'
      ImageIndex = 1
      object grdGlazing: TcxGrid
        Left = 0
        Top = 0
        Width = 906
        Height = 544
        HelpContext = 270
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object vwGlazing: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsGlazing
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsData.Deleting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object vwGlazingColumn1: TcxGridDBColumn
            Caption = 'Glazing ID'
            DataBinding.FieldName = 'GLAZING_ID'
          end
          object vwGlazingGLAZING_NAME: TcxGridDBColumn
            Caption = 'Name'
            DataBinding.FieldName = 'GLAZING_NAME'
            Width = 87
          end
          object vwGlazingGLAZING_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'GLAZING_DESCRIPTION'
            Width = 205
          end
          object vwGlazingNLITES: TcxGridDBColumn
            Caption = 'Lites'
            DataBinding.FieldName = 'NLITES'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.MinValue = 1.000000000000000000
            Width = 27
          end
          object vwGlazingGLASS_LABOR: TcxGridDBColumn
            Caption = 'Glass Labor'
            DataBinding.FieldName = 'GLASS_LABOR'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Width = 88
          end
          object vwGlazingGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 52
          end
          object vwGlazingIS_VISIBLE: TcxGridDBColumn
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
        object grdlvlGlazing: TcxGridLevel
          GridView = vwGlazing
        end
      end
    end
    object tsGridKind: TcxTabSheet
      Caption = 'Grid Kind'
      ImageIndex = 2
      object gridKind: TcxGrid
        Left = 0
        Top = 0
        Width = 906
        Height = 544
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object vwGridKind: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsGridKind
          DataController.KeyFieldNames = 'GKIND_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object vwGridKindColumn1: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'GKIND_ID'
            Visible = False
            Width = 41
          end
          object vwGridKindGKIND_NAME: TcxGridDBColumn
            Caption = 'Name'
            DataBinding.FieldName = 'GKIND_NAME'
            Width = 123
          end
          object vwGridKindGKIND_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'GKIND_DESCRIPTION'
            Width = 305
          end
          object vwGridKindGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            SortIndex = 0
            SortOrder = soAscending
            Width = 70
          end
          object vwGridKindIS_VISIBLE: TcxGridDBColumn
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
          object vwGridKindOPERATOR: TcxGridDBColumn
            DataBinding.FieldName = 'OPERATOR'
            Visible = False
          end
          object vwGridKindDATE_SAVED: TcxGridDBColumn
            DataBinding.FieldName = 'DATE_SAVED'
            Visible = False
          end
          object vwGridKindOPERATOR_LAST_MODIFIED: TcxGridDBColumn
            DataBinding.FieldName = 'OPERATOR_LAST_MODIFIED'
            Visible = False
          end
          object vwGridKindDATE_LAST_MODIFIED: TcxGridDBColumn
            DataBinding.FieldName = 'DATE_LAST_MODIFIED'
            Visible = False
          end
          object vwGridKindGED_CODE: TcxGridDBColumn
            Caption = 'GED Code'
            DataBinding.FieldName = 'GED_CODE'
            Width = 65
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = vwGridKind
        end
      end
    end
    object tsGridPattern: TcxTabSheet
      Caption = 'Grid Pattern'
      ImageIndex = 0
      object cxGrid3: TcxGrid
        Left = 0
        Top = 0
        Width = 906
        Height = 544
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object vwGridPat: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsGridPattern
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object vwGridPatGPAT_ID: TcxGridDBColumn
            Caption = 'Pattern ID'
            DataBinding.FieldName = 'GPAT_ID'
          end
          object vwGridPatGPATTERN_NAME: TcxGridDBColumn
            Caption = 'Name'
            DataBinding.FieldName = 'GPATTERN_NAME'
            Width = 101
          end
          object vwGridPatGPATTERN_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'GPATTERN_DESCRIPTION'
            Width = 209
          end
          object vwGridPatGPAT_GED: TcxGridDBColumn
            Caption = 'GED'
            DataBinding.FieldName = 'GPAT_GED'
            Width = 43
          end
          object vwGridPatGPAT_WIDTH_DIVISOR: TcxGridDBColumn
            Caption = 'Width Divisor'
            DataBinding.FieldName = 'GPAT_WIDTH_DIVISOR'
            Width = 80
          end
          object vwGridPatGPAT_WIDTH_OFFSET: TcxGridDBColumn
            Caption = 'Width Offset'
            DataBinding.FieldName = 'GPAT_WIDTH_OFFSET'
            Width = 79
          end
          object vwGridPatGPAT_HEIGHT_DIVISOR: TcxGridDBColumn
            Caption = 'Height Divisor'
            DataBinding.FieldName = 'GPAT_HEIGHT_DIVISOR'
            Width = 71
          end
          object vwGridPatGPAT_HEIGHT_OFFSET: TcxGridDBColumn
            Caption = 'Height Offset'
            DataBinding.FieldName = 'GPAT_HEIGHT_OFFSET'
            Width = 70
          end
          object vwGridPatGPAT_HEIGHT_MULT: TcxGridDBColumn
            Caption = 'Height Multi'
            DataBinding.FieldName = 'GPAT_HEIGHT_MULT'
            Width = 61
          end
          object vwGridPatGPAT_WIDTH_MULT: TcxGridDBColumn
            Caption = 'Width Multi'
            DataBinding.FieldName = 'GPAT_WIDTH_MULT'
            Width = 70
          end
          object vwGridPatGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            SortIndex = 0
            SortOrder = soAscending
            Width = 80
          end
          object vwGridPatIS_VISIBLE: TcxGridDBColumn
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
        object cxGridLevel3: TcxGridLevel
          GridView = vwGridPat
        end
      end
    end
    object tsGridCost: TcxTabSheet
      Caption = 'Grid Cost'
      ImageIndex = 5
      object gridCost: TcxGrid
        Left = 0
        Top = 0
        Width = 906
        Height = 544
        HelpContext = 250
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object vwGridCost: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsGridCost
          DataController.KeyFieldNames = 'GRIDS_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.IncSearch = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object vwGridCostColumn3: TcxGridDBColumn
            Caption = 'Grids ID'
            DataBinding.FieldName = 'GRIDS_ID'
            Width = 56
          end
          object vwGridCostGKIND_ID: TcxGridDBColumn
            Caption = 'Kind'
            DataBinding.FieldName = 'GKIND_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'GKIND_ID'
            Properties.ListColumns = <
              item
                FieldName = 'GKIND_NAME'
              end>
            Properties.ListSource = CostingDM.dsGridKind
            Width = 107
          end
          object vwGridCostGPAT_ID: TcxGridDBColumn
            Caption = 'Pattern'
            DataBinding.FieldName = 'GPAT_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'GPAT_ID'
            Properties.ListColumns = <
              item
                FieldName = 'GPATTERN_DESCRIPTION'
              end>
            Properties.ListSource = CostingDM.dsGridPattern
            Width = 226
          end
          object vwGridCostBASE_COST: TcxGridDBColumn
            Caption = 'Base Cost'
            DataBinding.FieldName = 'BASE_COST'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 2
            Width = 53
          end
          object vwGridCostWASTE: TcxGridDBColumn
            Caption = 'Waste %'
            DataBinding.FieldName = 'WASTE'
            Width = 62
          end
          object vwGridCostCOST: TcxGridDBColumn
            Caption = 'Cost'
            DataBinding.FieldName = 'COST'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = '$,0.00;($,0.00)'
            Properties.ReadOnly = True
          end
        end
        object gridCostLevel1: TcxGridLevel
          GridView = vwGridCost
        end
      end
    end
    object cxTabSheet1: TcxTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Standard Grids'
      ImageIndex = 8
      object gridStandardGrids: TcxGrid
        Left = 0
        Top = 0
        Width = 906
        Height = 544
        HelpContext = 250
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object vwGridsStd: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          FilterBox.Position = fpTop
          FindPanel.DisplayMode = fpdmAlways
          DataController.DataSource = CostingDM.dsGridsStd
          DataController.KeyFieldNames = 'GRIDS_STD_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.IncSearch = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object vwGridsStdMODEL_ID: TcxGridDBColumn
            Caption = 'Model'
            DataBinding.FieldName = 'MODEL_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'MODEL_ID'
            Properties.ListColumns = <
              item
                FieldName = 'MODEL_NAME'
              end>
            Properties.ListSource = CostingDM.dsModels
            Width = 122
          end
          object vwGridsStdGPAT_ID: TcxGridDBColumn
            Caption = 'Grid Pattern'
            DataBinding.FieldName = 'GPAT_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'GPAT_ID'
            Properties.ListColumns = <
              item
                FieldName = 'GPATTERN_NAME'
              end>
            Properties.ListSource = CostingDM.dsGridPattern
            Width = 128
          end
          object vwGridsStdGRIDS_STD_DIM: TcxGridDBColumn
            Caption = 'Dimension'
            DataBinding.FieldName = 'GRIDS_STD_DIM'
            PropertiesClassName = 'TcxCalcEditProperties'
            Width = 65
          end
          object vwGridsStdGRIDS_ACROSS: TcxGridDBColumn
            Caption = 'Grid Across'
            DataBinding.FieldName = 'GRIDS_ACROSS'
            PropertiesClassName = 'TcxCalcEditProperties'
            Width = 71
          end
          object vwGridsStdGRIDS_UPDOWN: TcxGridDBColumn
            Caption = 'Grid UpDown'
            DataBinding.FieldName = 'GRIDS_UPDOWN'
            PropertiesClassName = 'TcxCalcEditProperties'
            Width = 79
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = vwGridsStd
        end
      end
    end
    object tsSpacer: TcxTabSheet
      Caption = 'Spacer'
      ImageIndex = 6
      object gridGlassEdge: TcxGrid
        Left = 0
        Top = 0
        Width = 906
        Height = 544
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object vwGlassEdge: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsGlassEdge
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object vwGlassEdgeColumn1: TcxGridDBColumn
            Caption = 'Edge ID'
            DataBinding.FieldName = 'GLASS_EDGE_ID'
            Width = 43
          end
          object vwGlassEdgeEDGE: TcxGridDBColumn
            Caption = 'Name'
            DataBinding.FieldName = 'EDGE'
            Width = 106
          end
          object vwGlassEdgeDESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'DESCRIPTION'
            Width = 203
          end
          object vwGlassEdgeBASE_COST: TcxGridDBColumn
            Caption = 'Base Cost'
            DataBinding.FieldName = 'BASE_COST'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 3
            Properties.DisplayFormat = '$,0.000;($,0.000)'
            Width = 85
          end
          object vwGlassEdgeWASTE: TcxGridDBColumn
            Caption = 'Waste'
            DataBinding.FieldName = 'WASTE'
            Width = 45
          end
          object vwGlassEdgeLABOR: TcxGridDBColumn
            Caption = 'Labor'
            DataBinding.FieldName = 'LABOR'
            Width = 50
          end
          object vwGlassEdgeCOST: TcxGridDBColumn
            Caption = 'Cost'
            DataBinding.FieldName = 'COST'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 3
            Properties.DisplayFormat = '$,0.000;($,0.000)'
            Width = 41
          end
          object vwGlassEdgeGED_CODE: TcxGridDBColumn
            Caption = 'GED Code'
            DataBinding.FieldName = 'GED_CODE'
            Width = 66
          end
        end
        object gridGlassEdgeLevel1: TcxGridLevel
          Caption = 'Glass Edge'
          GridView = vwGlassEdge
        end
      end
    end
    object tsGas: TcxTabSheet
      Caption = 'Gas'
      ImageIndex = 7
      object gridGas: TcxGrid
        Left = 0
        Top = 0
        Width = 906
        Height = 544
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object vwGas: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsGas
          DataController.KeyFieldNames = 'GAS_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackgroundDetail
          object vwGasColumn1: TcxGridDBColumn
            Caption = 'Gas ID'
            DataBinding.FieldName = 'GAS_ID'
          end
          object vwGasGAS_NAME: TcxGridDBColumn
            Caption = 'Name'
            DataBinding.FieldName = 'GAS_NAME'
            Width = 138
          end
          object vwGasDescription: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'GAS_DESCRIPTION'
            Width = 229
          end
          object vwGasCOST: TcxGridDBColumn
            Caption = 'Cost'
            DataBinding.FieldName = 'COST'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 3
            Properties.DisplayFormat = '$,0.000;($,0.000)'
            Width = 62
          end
          object vwGasGUI_SEQUENCE: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 52
          end
          object vwGasIS_VISIBLE: TcxGridDBColumn
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
          object vwGasGED_CODE: TcxGridDBColumn
            Caption = 'GED Code'
            DataBinding.FieldName = 'GED_CODE'
            Width = 82
          end
        end
        object gridGasLevel1: TcxGridLevel
          GridView = vwGas
        end
      end
    end
  end
  object btnClose: TcxButton
    Left = 944
    Top = 557
    Width = 87
    Height = 24
    Anchors = [akTop, akRight]
    Caption = '&Close'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    ModalResult = 1
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object btnPrint: TcxButton
    Left = 850
    Top = 556
    Width = 88
    Height = 24
    Caption = '&Print'
    LookAndFeel.NativeStyle = False
    TabOrder = 2
    OnClick = btnPrintClick
  end
  object ComponentPrinter: TdxComponentPrinter
    CurrentLink = ComponentPrinterGlassEdge
    Version = 0
    Left = 264
    Top = 160
    object ComponentPrinterGlassType: TdxGridReportLink
      Active = True
      Component = grdGlassType
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 200
      PrinterPage.GrayShading = True
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.CenterTitle.Strings = (
        '[User Name] on [Machine Name]')
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
        'GLASS TYPES')
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 11000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.CreationDate = 42277.051198807870000000
      OptionsSize.AutoWidth = True
      BuiltInReportLink = True
    end
    object ComponentPrinterGlazing: TdxGridReportLink
      Active = True
      Component = grdGlazing
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 200
      PrinterPage.GrayShading = True
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.CenterTitle.Strings = (
        '[User Name] on [Machine Name]')
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
        'GLAZING TYPES')
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 11000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.CreationDate = 42277.051198819440000000
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      BuiltInReportLink = True
    end
    object ComponentPrinterGridCost: TdxGridReportLink
      Active = True
      Component = gridCost
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 200
      PrinterPage.GrayShading = True
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.CenterTitle.Strings = (
        '[User Name] on [Machine Name]')
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
        'GRID COSTS')
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 11000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.CreationDate = 42277.051198831020000000
      BuiltInReportLink = True
    end
    object ComponentPrinterGlassEdge: TdxGridReportLink
      Component = gridGlassEdge
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 200
      PrinterPage.GrayShading = True
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.CenterTitle.Strings = (
        '[User Name] on [Machine Name]')
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
        'SPACER TYPES')
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 11000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      BuiltInReportLink = True
    end
    object ComponentPrinterGas: TdxGridReportLink
      Active = True
      Component = gridGas
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 200
      PrinterPage.GrayShading = True
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.CenterTitle.Strings = (
        '[User Name] on [Machine Name]')
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
        'GAS TYPES')
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 11000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.CreationDate = 42277.051198842590000000
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      BuiltInReportLink = True
    end
  end
end
