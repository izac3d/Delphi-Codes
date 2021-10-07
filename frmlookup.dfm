object lookupfrm: Tlookupfrm
  Left = 108
  Top = 187
  BorderStyle = bsDialog
  Caption = 'Tables Input'
  ClientHeight = 532
  ClientWidth = 1324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 134
  TextHeight = 18
  object MainTabs: TcxPageControl
    Left = 0
    Top = 0
    Width = 1324
    Height = 483
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = tsGlassType
    Align = alTop
    Color = clBtnFace
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    Options = [pcoFixedTabWidthWhenRotated, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize]
    ParentBackground = False
    ParentColor = False
    ShowFrame = True
    Style = 9
    TabOrder = 0
    TabWidth = 122
    OnChange = MainTabsChange
    ClientRectBottom = 482
    ClientRectLeft = 1
    ClientRectRight = 1323
    ClientRectTop = 25
    object tsGlassKind: TcxTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Glass Kind'
      ImageIndex = 7
      object Label1: TLabel
        Left = 14
        Top = 19
        Width = 54
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Outer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 442
        Top = 24
        Width = 64
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Middle'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 865
        Top = 19
        Width = 52
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Inner'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxGrid7: TcxGrid
        Left = 14
        Top = 54
        Width = 419
        Height = 377
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        object cxGridDBTableView7: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.PriorPage.Visible = False
          NavigatorButtons.NextPage.Visible = False
          NavigatorButtons.Append.Visible = False
          NavigatorButtons.Edit.Visible = False
          NavigatorButtons.Filter.Visible = False
          DataController.DataSource = CostingDM.dsGlassKOuter
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object cxGridDBTableView7GLASS_KIND_ID: TcxGridDBColumn
            DataBinding.FieldName = 'GLASS_KIND_ID'
            Visible = False
          end
          object cxGridDBTableView7GLASS_KIND: TcxGridDBColumn
            Caption = 'Glass Kind'
            DataBinding.FieldName = 'GLASS_KIND'
            Width = 59
          end
          object cxGridDBTableView7DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'DESCRIPTION'
            Width = 127
          end
          object cxGridDBTableView7Column1: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE_OUTER'
            Width = 58
          end
          object cxGridDBTableView7Column2: TcxGridDBColumn
            Caption = 'Visible'
            DataBinding.FieldName = 'IS_VISIBLE_OUTER'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 42
          end
        end
        object cxGridLevel7: TcxGridLevel
          GridView = cxGridDBTableView7
        end
      end
      object cxGrid8: TcxGrid
        Left = 442
        Top = 54
        Width = 416
        Height = 377
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 1
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        object cxGridDBTableView8: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.PriorPage.Visible = False
          NavigatorButtons.NextPage.Visible = False
          NavigatorButtons.Append.Visible = False
          NavigatorButtons.Edit.Visible = False
          NavigatorButtons.Filter.Visible = False
          DataController.DataSource = CostingDM.dsGlassKMiddle
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object cxGridDBColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'GLASS_KIND_ID'
            Visible = False
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = 'Glass Kind'
            DataBinding.FieldName = 'GLASS_KIND'
            Width = 59
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'DESCRIPTION'
            Width = 127
          end
          object cxGridDBTableView8Column1: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE_MIDDLE'
            Width = 57
          end
          object cxGridDBTableView8Column2: TcxGridDBColumn
            Caption = 'Visible'
            DataBinding.FieldName = 'IS_VISIBLE_MIDDLE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 43
          end
        end
        object cxGridLevel8: TcxGridLevel
          GridView = cxGridDBTableView8
        end
      end
      object cxGrid9: TcxGrid
        Left = 865
        Top = 54
        Width = 425
        Height = 377
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 2
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        object cxGridDBTableView9: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.PriorPage.Visible = False
          NavigatorButtons.NextPage.Visible = False
          NavigatorButtons.Append.Visible = False
          NavigatorButtons.Edit.Visible = False
          NavigatorButtons.Filter.Visible = False
          DataController.DataSource = CostingDM.dsGlassKInner
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object cxGridDBColumn4: TcxGridDBColumn
            DataBinding.FieldName = 'GLASS_KIND_ID'
            Visible = False
          end
          object cxGridDBColumn5: TcxGridDBColumn
            Caption = 'Glass Kind'
            DataBinding.FieldName = 'GLASS_KIND'
            Width = 59
          end
          object cxGridDBColumn6: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'DESCRIPTION'
            Width = 127
          end
          object cxGridDBTableView9Column1: TcxGridDBColumn
            Caption = 'Sequence'
            DataBinding.FieldName = 'GUI_SEQUENCE_INNER'
            Width = 61
          end
          object cxGridDBTableView9Column2: TcxGridDBColumn
            Caption = 'Visible'
            DataBinding.FieldName = 'IS_VISIBLE_INNER'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 42
          end
        end
        object cxGridLevel9: TcxGridLevel
          GridView = cxGridDBTableView9
        end
      end
    end
    object tsGlassType: TcxTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Glass Type'
      ImageIndex = 6
      object cxGrid6: TcxGrid
        Left = 0
        Top = 0
        Width = 1322
        Height = 457
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        object cxGridDBTableView6: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.PriorPage.Visible = False
          NavigatorButtons.NextPage.Visible = False
          NavigatorButtons.Append.Visible = False
          NavigatorButtons.Edit.Visible = False
          NavigatorButtons.Filter.Visible = False
          DataController.DataSource = CostingDM.dsGlassType
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object cxGridDBTableView6GLASS_TYPE_ID: TcxGridDBColumn
            DataBinding.FieldName = 'GLASS_TYPE_ID'
            Visible = False
          end
          object cxGridDBTableView6GLASS_KIND_ID: TcxGridDBColumn
            Caption = 'Glass Kind'
            DataBinding.FieldName = 'GLASS_KIND_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownAutoSize = True
            Properties.DropDownSizeable = True
            Properties.DropDownWidth = 170
            Properties.KeyFieldNames = 'GLASS_KIND_ID'
            Properties.ListColumns = <
              item
                Caption = 'Kind'
                Width = 80
                FieldName = 'GLASS_KIND'
              end
              item
                Caption = 'Description'
                FieldName = 'DESCRIPTION'
              end>
            Properties.ListOptions.ShowHeader = False
          end
          object cxGridDBTableView6GLASS_NAME: TcxGridDBColumn
            Caption = 'Glass Name'
            DataBinding.FieldName = 'GLASS_NAME'
          end
          object cxGridDBTableView6TEMPERED: TcxGridDBColumn
            Caption = 'Tempered'
            DataBinding.FieldName = 'TEMPERED'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
          end
          object cxGridDBTableView6DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'DESCRIPTION'
            Width = 200
          end
          object cxGridDBTableView6THICKNESS: TcxGridDBColumn
            Caption = 'Thickness'
            DataBinding.FieldName = 'THICKNESS'
          end
          object cxGridDBTableView6AREA: TcxGridDBColumn
            Caption = 'Area'
            DataBinding.FieldName = 'AREA'
          end
          object cxGridDBTableView6COST: TcxGridDBColumn
            Caption = 'Cost'
            DataBinding.FieldName = 'COST'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object cxGridDBTableView6GUI_SEQUENCE: TcxGridDBColumn
            Caption = 'GUI Seq.'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 53
          end
          object cxGridDBTableView6IS_VISIBLE: TcxGridDBColumn
            Caption = 'Visible'
            DataBinding.FieldName = 'IS_VISIBLE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Width = 47
          end
        end
        object cxGridLevel6: TcxGridLevel
          GridView = cxGridDBTableView6
        end
      end
    end
    object tsGlazing: TcxTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Glazing'
      ImageIndex = 1
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 1322
        Height = 457
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        object cxGridDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.PriorPage.Visible = False
          NavigatorButtons.NextPage.Visible = False
          NavigatorButtons.Append.Visible = False
          NavigatorButtons.Delete.Visible = False
          NavigatorButtons.Edit.Visible = False
          NavigatorButtons.Filter.Visible = False
          DataController.DataSource = CostingDM.dsGlazing
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object cxGridDBTableView1GLAZING_NAME: TcxGridDBColumn
            Caption = 'Name'
            DataBinding.FieldName = 'GLAZING_NAME'
          end
          object cxGridDBTableView1GLAZING_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'GLAZING_DESCRIPTION'
          end
          object cxGridDBTableView1GUI_SEQUENCE: TcxGridDBColumn
            Caption = 'GUI Seq.'
            DataBinding.FieldName = 'GUI_SEQUENCE'
          end
          object cxGridDBTableView1IS_VISIBLE: TcxGridDBColumn
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
          object cxGridDBTableView1OPERATOR: TcxGridDBColumn
            DataBinding.FieldName = 'OPERATOR'
            Visible = False
          end
          object cxGridDBTableView1DATE_SAVED: TcxGridDBColumn
            DataBinding.FieldName = 'DATE_SAVED'
            Visible = False
          end
          object cxGridDBTableView1OPERATOR_LAST_MODIFIED: TcxGridDBColumn
            DataBinding.FieldName = 'OPERATOR_LAST_MODIFIED'
            Visible = False
          end
          object cxGridDBTableView1DATE_LAST_MODIFIED: TcxGridDBColumn
            DataBinding.FieldName = 'DATE_LAST_MODIFIED'
            Visible = False
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
    end
    object tsGridKind: TcxTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Grid Kind'
      ImageIndex = 2
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 1322
        Height = 457
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        object cxGridDBTableView2: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.PriorPage.Visible = False
          NavigatorButtons.NextPage.Visible = False
          NavigatorButtons.Append.Visible = False
          NavigatorButtons.Edit.Visible = False
          NavigatorButtons.Filter.Visible = False
          DataController.DataSource = CostingDM.dsGridKind
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object cxGridDBTableView2Column1: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'GKIND_ID'
            Width = 41
          end
          object cxGridDBTableView2GKIND_NAME: TcxGridDBColumn
            Caption = 'Name'
            DataBinding.FieldName = 'GKIND_NAME'
            Width = 81
          end
          object cxGridDBTableView2GKIND_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'GKIND_DESCRIPTION'
            Width = 98
          end
          object cxGridDBTableView2GUI_SEQUENCE: TcxGridDBColumn
            Caption = 'GUI Seq.'
            DataBinding.FieldName = 'GUI_SEQUENCE'
          end
          object cxGridDBTableView2IS_VISIBLE: TcxGridDBColumn
            Caption = 'Visible'
            DataBinding.FieldName = 'IS_VISIBLE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
          end
          object cxGridDBTableView2OPERATOR: TcxGridDBColumn
            DataBinding.FieldName = 'OPERATOR'
            Visible = False
          end
          object cxGridDBTableView2DATE_SAVED: TcxGridDBColumn
            DataBinding.FieldName = 'DATE_SAVED'
            Visible = False
          end
          object cxGridDBTableView2OPERATOR_LAST_MODIFIED: TcxGridDBColumn
            DataBinding.FieldName = 'OPERATOR_LAST_MODIFIED'
            Visible = False
          end
          object cxGridDBTableView2DATE_LAST_MODIFIED: TcxGridDBColumn
            DataBinding.FieldName = 'DATE_LAST_MODIFIED'
            Visible = False
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBTableView2
        end
      end
    end
    object tsGridPattern: TcxTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Grid Pattern'
      ImageIndex = 0
      object cxGrid3: TcxGrid
        Left = 0
        Top = 0
        Width = 1322
        Height = 457
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        object cxGridDBTableView3: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.PriorPage.Visible = False
          NavigatorButtons.NextPage.Visible = False
          NavigatorButtons.Append.Visible = False
          NavigatorButtons.Edit.Visible = False
          NavigatorButtons.Filter.Visible = False
          DataController.DataSource = CostingDM.dsGridPattern
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object cxGridDBTableView3GPATTERN_NAME: TcxGridDBColumn
            Caption = 'Name'
            DataBinding.FieldName = 'GPATTERN_NAME'
          end
          object cxGridDBTableView3GPATTERN_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'GPATTERN_DESCRIPTION'
          end
          object cxGridDBTableView3GUI_SEQUENCE: TcxGridDBColumn
            Caption = 'GUI Seq.'
            DataBinding.FieldName = 'GUI_SEQUENCE'
          end
          object cxGridDBTableView3IS_VISIBLE: TcxGridDBColumn
            Caption = 'Visible'
            DataBinding.FieldName = 'IS_VISIBLE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
          end
          object cxGridDBTableView3OPERATOR: TcxGridDBColumn
            DataBinding.FieldName = 'OPERATOR'
            Visible = False
          end
          object cxGridDBTableView3DATE_SAVED: TcxGridDBColumn
            DataBinding.FieldName = 'DATE_SAVED'
            Visible = False
          end
          object cxGridDBTableView3OPERATOR_LAST_MODIFIED: TcxGridDBColumn
            DataBinding.FieldName = 'OPERATOR_LAST_MODIFIED'
            Visible = False
          end
          object cxGridDBTableView3DATE_LAST_MODIFIED: TcxGridDBColumn
            DataBinding.FieldName = 'DATE_LAST_MODIFIED'
            Visible = False
          end
        end
        object cxGridLevel3: TcxGridLevel
          GridView = cxGridDBTableView3
        end
      end
    end
    object tsLock: TcxTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Locks'
      ImageIndex = 5
      object gridLock: TcxGrid
        Left = 0
        Top = 4
        Width = 928
        Height = 449
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        BorderStyle = cxcbsNone
        TabOrder = 0
        object cxGridDBTableView4: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.PriorPage.Visible = False
          NavigatorButtons.NextPage.Visible = False
          NavigatorButtons.Append.Visible = False
          NavigatorButtons.Edit.Visible = False
          NavigatorButtons.Filter.Visible = False
          DataController.DataSource = CostingDM.dsWinLock_SM
          DataController.KeyFieldNames = 'WINLOCK_SM_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object cxGridDBTableView4WINLOCK_NAME: TcxGridDBColumn
            Caption = 'Lock'
            DataBinding.FieldName = 'WINLOCK_NAME'
            Width = 104
          end
          object cxGridDBTableView4WINLOCK_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'WINLOCK_DESCRIPTION'
            Width = 234
          end
          object cxGridDBTableView4Cost: TcxGridDBColumn
            Caption = 'Cost'
            DataBinding.FieldName = 'COST'
          end
          object cxGridDBTableView4IS_VISIBLE: TcxGridDBColumn
            Caption = 'Visible'
            DataBinding.FieldName = 'IS_VISIBLE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
          end
          object cxGridDBTableView4GUI_SEQUENCE: TcxGridDBColumn
            Caption = 'GUI Seq.'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 65
          end
          object cxGridDBTableView4OPERATOR: TcxGridDBColumn
            DataBinding.FieldName = 'OPERATOR'
            Visible = False
          end
          object cxGridDBTableView4DATE_SAVED: TcxGridDBColumn
            DataBinding.FieldName = 'DATE_SAVED'
            Visible = False
          end
          object cxGridDBTableView4OPERATOR_LAST_MODIFIED: TcxGridDBColumn
            DataBinding.FieldName = 'OPERATOR_LAST_MODIFIED'
            Visible = False
          end
          object cxGridDBTableView4DATE_LAST_MODIFIED: TcxGridDBColumn
            DataBinding.FieldName = 'DATE_LAST_MODIFIED'
            Visible = False
          end
          object cxGridDBTableView4Column1: TcxGridDBColumn
            Caption = 'Default'
            DataBinding.FieldName = 'IS_DEFAULT'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
          end
        end
        object cxGridLevel4: TcxGridLevel
          GridView = cxGridDBTableView4
        end
      end
    end
    object tsPaint: TcxTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Paint'
      ImageIndex = 8
      object gridPaint: TcxGrid
        Left = 0
        Top = 4
        Width = 901
        Height = 449
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        BorderStyle = cxcbsNone
        TabOrder = 0
        object cxGridDBTableView5: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.PriorPage.Visible = False
          NavigatorButtons.NextPage.Visible = False
          NavigatorButtons.Append.Visible = False
          NavigatorButtons.Edit.Visible = False
          NavigatorButtons.Filter.Visible = False
          DataController.DataSource = CostingDM.dsPaint_SM
          DataController.KeyFieldNames = 'PAINT_SM_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object cxGridDBTableView5PAINT_SM_ID: TcxGridDBColumn
            DataBinding.FieldName = 'PAINT_SM_ID'
            Visible = False
          end
          object cxGridDBTableView5SM_ID: TcxGridDBColumn
            DataBinding.FieldName = 'SM_ID'
            Visible = False
          end
          object cxGridDBTableView5PAINT_ID: TcxGridDBColumn
            Caption = 'Paint'
            DataBinding.FieldName = 'PAINT_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownAutoSize = True
            Properties.DropDownSizeable = True
            Properties.KeyFieldNames = 'PAINT_ID'
            Properties.ListColumns = <
              item
                FieldName = 'PAINT_NAME'
              end
              item
                FieldName = 'PAINT_DESCRIPTION'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = CostingDM.dsPaint
            Width = 121
          end
          object cxGridDBTableView5PAINT_NAME: TcxGridDBColumn
            Caption = 'Paint'
            DataBinding.FieldName = 'PAINT_NAME'
            Visible = False
            Width = 66
          end
          object cxGridDBTableView5PAINT_DESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'PAINT_DESCRIPTION'
            PropertiesClassName = 'TcxLabelProperties'
            Width = 215
          end
          object cxGridDBTableView5COST: TcxGridDBColumn
            Caption = 'Cost'
            DataBinding.FieldName = 'COST'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Width = 79
          end
          object cxGridDBTableView5IS_VISIBLE: TcxGridDBColumn
            Caption = 'Visible'
            DataBinding.FieldName = 'IS_VISIBLE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
          end
          object cxGridDBTableView5GUI_SEQUENCE: TcxGridDBColumn
            Caption = 'GUI Seq.'
            DataBinding.FieldName = 'GUI_SEQUENCE'
          end
          object cxGridDBTableView5OPERATOR: TcxGridDBColumn
            DataBinding.FieldName = 'OPERATOR'
            Visible = False
          end
          object cxGridDBTableView5DATE_SAVED: TcxGridDBColumn
            DataBinding.FieldName = 'DATE_SAVED'
            Visible = False
          end
          object cxGridDBTableView5OPERATOR_LAST_MODIFIED: TcxGridDBColumn
            DataBinding.FieldName = 'OPERATOR_LAST_MODIFIED'
            Visible = False
          end
          object cxGridDBTableView5DATE_LAST_MODIFIED: TcxGridDBColumn
            DataBinding.FieldName = 'DATE_LAST_MODIFIED'
            Visible = False
          end
          object cxGridDBTableView5SERIES_ID: TcxGridDBColumn
            DataBinding.FieldName = 'SERIES_ID'
            Visible = False
          end
          object cxGridDBTableView5MODEL_ID: TcxGridDBColumn
            DataBinding.FieldName = 'MODEL_ID'
            Visible = False
          end
          object cxGridDBTableView5Column1: TcxGridDBColumn
            DataBinding.FieldName = 'SERIES_ID'
            Width = 87
          end
        end
        object cxGridLevel5: TcxGridLevel
          GridView = cxGridDBTableView5
        end
      end
    end
    object tsSTC: TcxTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'STC SM'
      ImageIndex = 8
      object cxGrid10: TcxGrid
        Left = 0
        Top = 4
        Width = 928
        Height = 438
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        BorderStyle = cxcbsNone
        TabOrder = 0
        object cxGridDBTableView11: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.PriorPage.Visible = False
          NavigatorButtons.NextPage.Visible = False
          NavigatorButtons.Append.Visible = False
          NavigatorButtons.Edit.Visible = False
          NavigatorButtons.Filter.Visible = False
          DataController.DataSource = CostingDM.dsSTC_SM
          DataController.KeyFieldNames = 'STC_SM_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = CostingDM.gridBackground
          object cxGridDBTableView11STC: TcxGridDBColumn
            DataBinding.FieldName = 'STC'
          end
          object cxGridDBTableView11GT_INNER: TcxGridDBColumn
            Caption = 'GT Inn.'
            DataBinding.FieldName = 'GT_INNER'
          end
          object cxGridDBTableView11GT_MIDDLE: TcxGridDBColumn
            Caption = 'GT Mid.'
            DataBinding.FieldName = 'GT_MIDDLE'
          end
          object cxGridDBTableView11GT_OUTER: TcxGridDBColumn
            Caption = 'GT Out.'
            DataBinding.FieldName = 'GT_OUTER'
          end
          object cxGridDBTableView11TYPE_INNER: TcxGridDBColumn
            Caption = 'TYPE Inn.'
            DataBinding.FieldName = 'TYPE_INNER'
            Width = 61
          end
          object cxGridDBTableView11TYPE_MIDDLE: TcxGridDBColumn
            Caption = 'TYPE Mid.'
            DataBinding.FieldName = 'TYPE_MIDDLE'
            Width = 66
          end
          object cxGridDBTableView11TYPE_OUTER: TcxGridDBColumn
            Caption = 'TYPE Out.'
            DataBinding.FieldName = 'TYPE_OUTER'
            Width = 64
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
            Width = 82
          end
          object cxGridDBTableView11GUI_SEQUENCE: TcxGridDBColumn
            Caption = 'GUI Seq'
            DataBinding.FieldName = 'GUI_SEQUENCE'
            Width = 72
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
        end
        object cxGridLevel11: TcxGridLevel
          GridView = cxGridDBTableView11
        end
      end
    end
  end
  object btnClose: TcxButton
    Left = 1209
    Top = 492
    Width = 104
    Height = 34
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '&Close'
    LookAndFeel.Kind = lfOffice11
    ModalResult = 1
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object grpSerModel: TcxGroupBox
    Left = 979
    Top = 44
    TabOrder = 2
    Visible = False
    Height = 146
    Width = 334
    object Label7: TLabel
      Left = 28
      Top = 37
      Width = 38
      Height = 18
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Series'
    end
    object Label8: TLabel
      Left = 22
      Top = 90
      Width = 45
      Height = 18
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Models'
    end
    object cbSeries: TcxLookupComboBox
      Left = 71
      Top = 33
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
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = CostingDM.dsSeries
      TabOrder = 0
      Width = 227
    end
    object luSerModel: TcxLookupComboBox
      Left = 71
      Top = 87
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'SM_ID'
      Properties.ListColumns = <
        item
          FieldName = 'MODEL_NAME'
        end
        item
          FieldName = 'MODEL_DESCRIPTION'
        end
        item
          FieldName = 'SM_ID'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = CostingDM.dsSeriesModel
      TabOrder = 1
      Width = 227
    end
  end
end
