object BOMfrmold: TBOMfrmold
  Left = 119
  Top = 77
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Bill of Materials'
  ClientHeight = 461
  ClientWidth = 787
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 29
    Height = 13
    Caption = 'Series'
  end
  object Label2: TLabel
    Left = 241
    Top = 13
    Width = 28
    Height = 13
    Caption = 'Model'
  end
  object Label9: TLabel
    Left = 476
    Top = 13
    Width = 25
    Height = 13
    Caption = 'Color'
  end
  object cxPageControl2: TcxPageControl
    Left = 8
    Top = 56
    Width = 633
    Height = 405
    ActivePage = cxTabSheet6
    LookAndFeel.Kind = lfOffice11
    Options = [pcoAlwaysShowGoDialogButton, pcoFixedTabWidthWhenRotated, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize]
    ShowFrame = True
    Style = 9
    TabOrder = 0
    TabSlants.Positions = [spLeft, spRight]
    TabWidth = 140
    ClientRectBottom = 404
    ClientRectLeft = 1
    ClientRectRight = 632
    ClientRectTop = 20
    object cxTabSheet6: TcxTabSheet
      Caption = 'Linear Components'
      ImageIndex = 0
      object Label4: TLabel
        Left = 8
        Top = 24
        Width = 48
        Height = 13
        Caption = 'Inventory'
      end
      object Label5: TLabel
        Left = 295
        Top = 24
        Width = 22
        Height = 13
        Caption = 'BOM'
      end
      object gridLookupModels: TcxGrid
        Left = 8
        Top = 46
        Width = 230
        Height = 330
        TabOrder = 0
        object cxGridDBTableView2: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DetailKeyFieldNames = 'LOOKUP_ID'
          DataController.KeyFieldNames = 'LOOKUP_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.Visible = True
          OptionsData.Appending = True
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object cxGridDBTableView2Column1: TcxGridDBColumn
            Caption = 'Part'
            DataBinding.FieldName = 'LOOKUP'
          end
          object cxGridDBTableView2Column2: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'DESCRIPTION'
            Width = 155
          end
          object colLOOKUP_ID: TcxGridDBColumn
            DataBinding.FieldName = 'LOOKUP_ID'
            Visible = False
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBTableView2
        end
      end
      object gridSeriesModel: TcxGrid
        Left = 295
        Top = 46
        Width = 322
        Height = 330
        TabOrder = 1
        object cxGridDBTableView3: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.Prior.Visible = True
          NavigatorButtons.Insert.Visible = False
          NavigatorButtons.Edit.Enabled = False
          NavigatorButtons.Post.Visible = False
          NavigatorButtons.Refresh.Visible = False
          NavigatorButtons.SaveBookmark.Visible = False
          DataController.DetailKeyFieldNames = 'SERIES_MODEL_ID'
          DataController.KeyFieldNames = 'SERIES_MODEL_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.Visible = True
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object cxGridDBTableView3Column4: TcxGridDBColumn
            Caption = 'Subassembly'
            Width = 68
          end
          object cxGridDBTableView3Column1: TcxGridDBColumn
            Caption = 'Quantity'
            DataBinding.FieldName = 'SERIES_ID'
            Width = 47
          end
          object cxGridDBTableView3Column3: TcxGridDBColumn
            Caption = 'Divisor'
            Width = 42
          end
          object cxGridDBTableView3Column2: TcxGridDBColumn
            Caption = 'Length'
            DataBinding.FieldName = 'MODEL_ID'
            Width = 47
          end
          object colModel: TcxGridDBColumn
            Caption = 'Part'
            DataBinding.FieldName = 'MODEL_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.GridMode = True
            Properties.KeyFieldNames = 'LOOKUP_ID'
            Properties.ListColumns = <
              item
                FieldName = 'LOOKUP'
              end>
            Properties.ReadOnly = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 50
          end
          object colDesc: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'MODEL_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'LOOKUP_ID'
            Properties.ListColumns = <
              item
                FieldName = 'DESCRIPTION'
              end>
            Properties.ReadOnly = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 168
          end
        end
        object cxGridLevel3: TcxGridLevel
          GridView = cxGridDBTableView3
        end
      end
      object btnAddModel: TButton
        Left = 244
        Top = 148
        Width = 45
        Height = 25
        Caption = 'Add>'
        TabOrder = 2
      end
    end
    object cxTabSheet7: TcxTabSheet
      Caption = '2D Components'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label3: TLabel
        Left = 7
        Top = 24
        Width = 79
        Height = 13
        Caption = 'Available Models'
      end
      object Label6: TLabel
        Left = 350
        Top = 24
        Width = 22
        Height = 13
        Caption = 'BOM'
      end
      object cxGrid1: TcxGrid
        Left = 9
        Top = 46
        Width = 230
        Height = 330
        TabOrder = 0
        object cxGridDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DetailKeyFieldNames = 'LOOKUP_ID'
          DataController.KeyFieldNames = 'LOOKUP_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.Visible = True
          OptionsData.Appending = True
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = 'Model'
            DataBinding.FieldName = 'LOOKUP'
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'DESCRIPTION'
            Width = 155
          end
          object cxGridDBColumn3: TcxGridDBColumn
            DataBinding.FieldName = 'LOOKUP_ID'
            Visible = False
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
      object cxGrid2: TcxGrid
        Left = 350
        Top = 46
        Width = 239
        Height = 330
        TabOrder = 1
        object cxGridDBTableView4: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.Prior.Visible = True
          NavigatorButtons.Insert.Visible = False
          NavigatorButtons.Edit.Enabled = False
          NavigatorButtons.Post.Visible = False
          NavigatorButtons.Refresh.Visible = False
          NavigatorButtons.SaveBookmark.Visible = False
          DataController.DetailKeyFieldNames = 'SERIES_MODEL_ID'
          DataController.KeyFieldNames = 'SERIES_MODEL_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object cxGridDBColumn4: TcxGridDBColumn
            DataBinding.FieldName = 'SERIES_ID'
            Visible = False
            Width = 77
          end
          object cxGridDBColumn5: TcxGridDBColumn
            DataBinding.FieldName = 'MODEL_ID'
            Visible = False
            Width = 47
          end
          object cxGridDBColumn6: TcxGridDBColumn
            Caption = 'Model'
            DataBinding.FieldName = 'MODEL_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.GridMode = True
            Properties.KeyFieldNames = 'LOOKUP_ID'
            Properties.ListColumns = <
              item
                FieldName = 'LOOKUP'
              end>
            Properties.ReadOnly = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 50
          end
          object cxGridDBColumn7: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'MODEL_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'LOOKUP_ID'
            Properties.ListColumns = <
              item
                FieldName = 'DESCRIPTION'
              end>
            Properties.ReadOnly = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 168
          end
        end
        object cxGridLevel4: TcxGridLevel
          GridView = cxGridDBTableView4
        end
      end
      object Button1: TButton
        Left = 275
        Top = 148
        Width = 45
        Height = 25
        Caption = 'Add>'
        TabOrder = 2
      end
    end
    object cxTabSheet8: TcxTabSheet
      Caption = 'Discrete Components'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label7: TLabel
        Left = 6
        Top = 24
        Width = 79
        Height = 13
        Caption = 'Available Models'
      end
      object Label8: TLabel
        Left = 349
        Top = 27
        Width = 22
        Height = 13
        Caption = 'BOM'
      end
      object cxGrid3: TcxGrid
        Left = 8
        Top = 46
        Width = 230
        Height = 330
        TabOrder = 0
        object cxGridDBTableView5: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DetailKeyFieldNames = 'LOOKUP_ID'
          DataController.KeyFieldNames = 'LOOKUP_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.Visible = True
          OptionsData.Appending = True
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object cxGridDBColumn8: TcxGridDBColumn
            Caption = 'Model'
            DataBinding.FieldName = 'LOOKUP'
          end
          object cxGridDBColumn9: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'DESCRIPTION'
            Width = 155
          end
          object cxGridDBColumn10: TcxGridDBColumn
            DataBinding.FieldName = 'LOOKUP_ID'
            Visible = False
          end
        end
        object cxGridLevel5: TcxGridLevel
          GridView = cxGridDBTableView5
        end
      end
      object cxGrid4: TcxGrid
        Left = 349
        Top = 46
        Width = 239
        Height = 330
        TabOrder = 1
        object cxGridDBTableView6: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.Prior.Visible = True
          NavigatorButtons.Insert.Visible = False
          NavigatorButtons.Edit.Enabled = False
          NavigatorButtons.Post.Visible = False
          NavigatorButtons.Refresh.Visible = False
          NavigatorButtons.SaveBookmark.Visible = False
          DataController.DetailKeyFieldNames = 'SERIES_MODEL_ID'
          DataController.KeyFieldNames = 'SERIES_MODEL_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object cxGridDBColumn11: TcxGridDBColumn
            DataBinding.FieldName = 'SERIES_ID'
            Visible = False
            Width = 77
          end
          object cxGridDBColumn12: TcxGridDBColumn
            DataBinding.FieldName = 'MODEL_ID'
            Visible = False
            Width = 47
          end
          object cxGridDBColumn13: TcxGridDBColumn
            Caption = 'Model'
            DataBinding.FieldName = 'MODEL_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.GridMode = True
            Properties.KeyFieldNames = 'LOOKUP_ID'
            Properties.ListColumns = <
              item
                FieldName = 'LOOKUP'
              end>
            Properties.ReadOnly = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 50
          end
          object cxGridDBColumn14: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'MODEL_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'LOOKUP_ID'
            Properties.ListColumns = <
              item
                FieldName = 'DESCRIPTION'
              end>
            Properties.ReadOnly = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 168
          end
        end
        object cxGridLevel6: TcxGridLevel
          GridView = cxGridDBTableView6
        end
      end
      object Button4: TButton
        Left = 274
        Top = 148
        Width = 45
        Height = 25
        Caption = 'Add>'
        TabOrder = 2
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = 'Buyouts'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label10: TLabel
        Left = 15
        Top = 19
        Width = 22
        Height = 13
        Caption = 'BOM'
      end
      object cxGrid5: TcxGrid
        Left = 3
        Top = 38
        Width = 625
        Height = 330
        TabOrder = 0
        object cxGridDBTableView7: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.Prior.Visible = True
          NavigatorButtons.Insert.Visible = False
          NavigatorButtons.Edit.Enabled = False
          NavigatorButtons.Post.Visible = False
          NavigatorButtons.Refresh.Visible = False
          NavigatorButtons.SaveBookmark.Visible = False
          DataController.DetailKeyFieldNames = 'SERIES_MODEL_ID'
          DataController.KeyFieldNames = 'SERIES_MODEL_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.Visible = True
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object cxGridDBColumn15: TcxGridDBColumn
            Caption = 'Subassembly'
            Width = 68
          end
          object cxGridDBColumn16: TcxGridDBColumn
            Caption = 'Quantity'
            DataBinding.FieldName = 'SERIES_ID'
            Width = 47
          end
          object cxGridDBColumn17: TcxGridDBColumn
            Caption = 'W Divisor'
            Width = 50
          end
          object cxGridDBColumn18: TcxGridDBColumn
            Caption = 'Length'
            DataBinding.FieldName = 'MODEL_ID'
            Width = 40
          end
          object cxGridDBTableView7Column1: TcxGridDBColumn
            Caption = 'H Divisor'
            Width = 50
          end
          object cxGridDBTableView7Column2: TcxGridDBColumn
            Caption = 'Height'
            Width = 40
          end
          object cxGridDBColumn19: TcxGridDBColumn
            Caption = 'Part'
            DataBinding.FieldName = 'MODEL_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.GridMode = True
            Properties.KeyFieldNames = 'LOOKUP_ID'
            Properties.ListColumns = <
              item
                FieldName = 'LOOKUP'
              end>
            Properties.ReadOnly = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 50
          end
          object cxGridDBTableView7Column3: TcxGridDBColumn
            Caption = 'Base Cost'
          end
          object cxGridDBTableView7Column4: TcxGridDBColumn
            Caption = 'W Cost'
            Width = 44
          end
          object cxGridDBTableView7Column5: TcxGridDBColumn
            Caption = 'H Cost'
            Width = 41
          end
          object cxGridDBColumn20: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'MODEL_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'LOOKUP_ID'
            Properties.ListColumns = <
              item
                FieldName = 'DESCRIPTION'
              end>
            Properties.ReadOnly = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 168
          end
        end
        object cxGridLevel7: TcxGridLevel
          GridView = cxGridDBTableView7
        end
      end
    end
  end
  object Button2: TButton
    Left = 647
    Top = 68
    Width = 121
    Height = 25
    Caption = 'Open BOM Inventory'
    TabOrder = 1
  end
  object btnCopySeries: TButton
    Left = 647
    Top = 99
    Width = 121
    Height = 25
    Caption = 'Copy Series'
    TabOrder = 2
  end
  object Button3: TButton
    Left = 647
    Top = 130
    Width = 121
    Height = 25
    Caption = 'Copy Model'
    TabOrder = 3
  end
  object Button5: TButton
    Left = 647
    Top = 161
    Width = 121
    Height = 25
    Caption = 'Copy Color'
    TabOrder = 4
  end
  object cbSeries: TcxLookupComboBox
    Left = 46
    Top = 10
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
    TabOrder = 5
    Width = 176
  end
  object MProgBar: TcxProgressBar
    Left = 46
    Top = 10
    Properties.AnimationSpeed = 5
    Properties.BarStyle = cxbsAnimation
    Properties.BeginColor = 54056
    Properties.PeakValue = 80.000000000000000000
    Style.Shadow = False
    TabOrder = 6
    Transparent = True
    Visible = False
    Width = 159
  end
  object Button6: TButton
    Left = 647
    Top = 192
    Width = 121
    Height = 25
    Caption = 'Reports'
    TabOrder = 7
  end
  object cxLookupComboBox1: TcxLookupComboBox
    Left = 279
    Top = 10
    Properties.ListColumns = <
      item
        FieldName = 'MODEL_NAME'
      end
      item
        FieldName = 'MODEL_DESCRIPTION'
      end>
    Properties.ListSource = CostingDM.dsModels
    TabOrder = 8
    Width = 176
  end
  object cxLookupComboBox2: TcxLookupComboBox
    Left = 507
    Top = 10
    Properties.ListColumns = <
      item
        FieldName = 'COLOR_NAME'
      end
      item
        FieldName = 'COLOR_DESCRIPTION'
      end>
    Properties.ListSource = CostingDM.dsColors
    TabOrder = 9
    Width = 176
  end
  object cxProgressBar1: TcxProgressBar
    Left = 279
    Top = 10
    Properties.AnimationSpeed = 5
    Properties.BarStyle = cxbsAnimation
    Properties.BeginColor = 54056
    Properties.PeakValue = 80.000000000000000000
    Style.Shadow = False
    TabOrder = 10
    Transparent = True
    Visible = False
    Width = 159
  end
  object cxProgressBar2: TcxProgressBar
    Left = 507
    Top = 10
    Properties.AnimationSpeed = 5
    Properties.BarStyle = cxbsAnimation
    Properties.BeginColor = 54056
    Properties.PeakValue = 80.000000000000000000
    Style.Shadow = False
    TabOrder = 11
    Transparent = True
    Visible = False
    Width = 159
  end
end
