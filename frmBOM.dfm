object BOMfrm: TBOMfrm
  Left = 32
  Top = 98
  Caption = 'Bill of Materials'
  ClientHeight = 648
  ClientWidth = 1291
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
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    TabOrder = 0
    DesignSize = (
      1291
      70)
    Height = 70
    Width = 1291
    object Label1: TLabel
      Left = 11
      Top = 14
      Width = 29
      Height = 13
      Margins.Bottom = 2
      Caption = 'Series'
    end
    object Label2: TLabel
      Left = 11
      Top = 40
      Width = 28
      Height = 13
      Margins.Bottom = 2
      Caption = 'Model'
    end
    object Label9: TLabel
      Left = 276
      Top = 15
      Width = 25
      Height = 13
      Margins.Bottom = 2
      Caption = 'Color'
    end
    object Label3: TLabel
      Left = 272
      Top = 41
      Width = 29
      Height = 13
      Margins.Bottom = 2
      Caption = 'Nailfin'
    end
    object Label4: TLabel
      Left = 169
      Top = 15
      Width = 84
      Height = 13
      Margins.Bottom = 2
      Caption = 'Series_Model_ID:'
    end
    object cbSeries: TcxLookupComboBox
      Left = 41
      Top = 12
      Properties.DropDownWidth = 200
      Properties.KeyFieldNames = 'SERIES_ID'
      Properties.ListColumns = <
        item
          MinWidth = 80
          SortOrder = soAscending
          Width = 80
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
      TabOrder = 0
      Width = 124
    end
    object cbModel: TcxLookupComboBox
      Left = 41
      Top = 38
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
      TabOrder = 1
      Width = 124
    end
    object cbColor: TcxLookupComboBox
      Left = 303
      Top = 12
      Properties.KeyFieldNames = 'SC_ID'
      Properties.ListColumns = <
        item
          MinWidth = 40
          FieldName = 'COLOR_NAME'
        end
        item
          MinWidth = 70
          FieldName = 'COLOR_DESCRIPTION'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = CostingDM.dsSeriesColor
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Width = 124
    end
    object btnFilter: TcxButton
      Left = 457
      Top = 7
      Width = 93
      Height = 26
      Caption = '&Filter'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 3
      OnClick = SetFilter1Click
    end
    object cbNailfin: TcxLookupComboBox
      Left = 303
      Top = 38
      Properties.KeyFieldNames = 'SNF_ID'
      Properties.ListColumns = <
        item
          MinWidth = 40
          FieldName = 'NAILFIN_NAME'
        end
        item
          MinWidth = 70
          FieldName = 'NAILFIN_DESCRIPTION'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = CostingDM.dsSeriesNailfin
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 4
      Width = 124
    end
    object btnTools: TcxButton
      Left = 566
      Top = 38
      Width = 93
      Height = 26
      Caption = 'Copy >'
      DropDownMenu = PopupMenu1
      Kind = cxbkDropDown
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 5
    end
    object btnClose: TcxButton
      Left = 1188
      Top = 38
      Width = 93
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 1
      TabOrder = 6
      OnClick = btnCloseClick
    end
    object cxButton1: TcxButton
      Left = 457
      Top = 38
      Width = 93
      Height = 26
      Caption = '&Print'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 1
      TabOrder = 7
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 1090
      Top = 38
      Width = 92
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = 'Open Inventory'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 1
      TabOrder = 8
      OnClick = cxButton2Click
    end
    object btnAdd: TcxButton
      Left = 566
      Top = 7
      Width = 93
      Height = 26
      Caption = '&Add >'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 9
      OnClick = btnAddClick
    end
    object btnXLSExport: TcxButton
      Left = 990
      Top = 38
      Width = 94
      Height = 26
      Caption = 'Export to XLS'
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 10
      OnClick = btnXLSExportClick
    end
    object cxDBLabel1: TcxDBLabel
      Left = 169
      Top = 40
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataBinding.DataField = 'SM_ID'
      DataBinding.DataSource = CostingDM.dsSeriesModel
      Properties.Alignment.Horz = taLeftJustify
      Transparent = True
      Height = 15
      Width = 64
    end
    object btnUpdatePrices: TcxButton
      Left = 674
      Top = 24
      Width = 127
      Height = 40
      Hint = 'Update Pricing Table for this SM, Color, NF'
      Anchors = [akRight, akBottom]
      Caption = 'Update Prices'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 1
      OptionsImage.Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000D1217003A5171005D
        82BA00709EE80077ABFC0075A6FC006A99E800567BBA00344A70000B0F160000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000070A0C00526E8B007FB1F60080B3FF007E
        B1FF007DB0FF0077AAFF0073A6FF0070A3FF006EA1FF006EA1FF006D9FF60043
        61890006080B0000000000000000000000000000000000000000000000000000
        0000000000000000000000192228007CA5D80091C4FF0097CAFF009ACDFF0097
        CAFF0096C9FF0094C7FF008DC1FF0083B6FF0075A8FF006C9FFF006C9FFF006C
        9FFF00618DD700131B2600000000000000000000000000000000000000000000
        000000000000001A23270088B8E9009DD0FF009FD2FF009ED1FF009DD0FF009C
        CFFF00A2D6FF28CEFAFF2DD3FDFF009DD1FF0092C5FF0087BAFF006FA2FF006B
        9EFF006B9EFF006897E700131C26000000000000000000000000000000000000
        000000080B0C0183AED904A3D6FF00A5D8FF00A4D7FF00A3D6FF00A3D6FF00A6
        DAFF00ABE3FF96E4F9FFACECFCFF00ADE5FF00A3D7FF0093C6FF0090C3FF0075
        A8FF006A9DFF006B9EFF00628ED60006080B0000000000000000000000000000
        0000005D7C8F18ABDAFF00A9DDFF00A9DCFF00A9DCFF00AADDFF00AFE4FF5BD1
        F2FFA9E7F8FFECFAFDFFF2FCFEFFB6EEFCFF6DDFFCFF00C0F5FF009CD0FF0091
        C4FF0075A8FF006B9EFF006EA1FF0045638B0000000000000000000000000012
        181A09A0D1F823BAE5FF00AEE1FF00AFE2FF00AFE2FF00AFE3FFDCF1F8FFFFFF
        FDFFFFFEFCFFFFFFFEFFFFFFFDFFFFFFFFFFFFFFFFFFE8FAFFFF01C6FAFF0099
        CDFF0091C4FF006FA2FF006DA0FF0072A3F6000C11170000000000000000004B
        64772EBAE2FF14B9E8FF00B4E7FF00B5E8FF00AEE3FF9FDDEEFFFFFDFAFFFFFB
        FAFFFCF9FBFFCDEDF7FFC5ECF8FFBDEBF8FFFFFFFEFFFFFFFFFFACECFDFF00B2
        E6FF0094C7FF0085B8FF006DA0FF0072A5FF00374E730000000000000000007C
        A3C04FCCF0FF0CBDEDFF00BAEDFF00BCEFFF00A8DFFFF3F4F5FFFFFEF9FFFFFF
        FBFF6ED1EEFF89DAF1FFA4E2F5FF00B0EAFFFFFFFCFFFFFCFCFFFFFFFDFF00BC
        F1FF0097CAFF0096C9FF0071A4FF0071A4FF005B80BC000000000000000004A0
        CFEF5ED6F6FF0BC2F2FF00C0F3FF00C2F5FF00AADDFF00A5DCFF00A6DCFF12B3
        E2FF00ACE2FF8DD8EFFFA8E1F2FF74D5F1FFFFFDFBFFFFFAFAFFFFFFFCFF00B9
        EDFF009BCEFF0099CCFF0080B3FF0072A5FF0072A1EA00000000000000000FB2
        E3FE61DAF9FF12C9F8FF00C6F9FF00C7FBFF00C9FCFF00CAFEFF00B7EAFF02AC
        E0FF63CAE9FFDCEDF4FFFFFAF8FFFFFAF7FFFFF8F8FFFFFCFAFFC1EAF7FF00AE
        E3FF009FD2FF009BCEFF008BBEFF0075A8FF007BAFFD00000000000000000DB5
        E5FE64DFFEFF24D2FDFF00CCFFFF00CEFFFF00D1FFFF00AEE4FF70C7E3FFFFF8
        F6FFFFF8F5FFFFF5F4FFFFF6F5FFFFF8F7FFFFFAF7FFEAF2F5FF0AB9EAFF00A6
        D9FF00A1D4FF009ED1FF0093C6FF0078ABFF0080B2FD000000000000000006A7
        D7ED65E3FFFF42DCFFFF00D3FFFF00D6FFFF00C8F4FF2FACD6FFFFF9F4FFFFF3
        F3FFFFF3F2FFFFF5F4FFFFF4F4FFB9E1EEFF51C8EAFF00B2E7FF00ADE1FF00A9
        DCFF00A4D7FF009FD2FF0097CAFF007CAFFF0077A6E800000000000000000082
        AABD5BE2FEFF6BE8FFFF00DBFFFF00DEFFFF00BAE6FF85C7E0FFFFF2F0FFFFF1
        F0FFE2E8EDFFB5DCEBFF9FD6EBFF00A3DEFF00ABE3FF00B0E5FF00B1E4FF00AD
        E1FF00A6D9FF00A2D5FF0099CCFF0080B3FF006388B900000000000000000051
        69733AD3F6FF6FEDFFFF2CE6FFFF00E6FFFF00BCE5FF7EC3DDFFFFF1EFFFFFF0
        EFFF8CCEE5FF7FCBE5FF9CD5E8FF7FCDE7FFD7E7EEFFA7DAEDFF52C6E9FF00AF
        E3FF00A8DBFF00A2D5FF0098CBFF0087BAFF003D536E00000000000000000011
        16170CB8E6F66AF1FFFF6FF1FFFF00ECFFFF00D8F3FF1B9CCDFFFFF1EDFFFFEC
        ECFFFFEEEDFFE6E6EAFFF2EAECFFFFF2F0FFFFF3F1FFFFF8F2FF4EC3E6FF00AF
        E2FF00A9DCFF00A5D8FF0095C8FF008ABCF4000C101400000000000000000000
        0000006785873DDAF6FF6FF7FFFF5BF6FFFF00F7FFFF00B4DDFF50ACD3FFFFEA
        E9FFFFEEEAFFFFEDEBFFFFEDECFFFFF0EDFFFFF2EDFF75C8E5FF00ADE3FF00B1
        E4FF00AADDFF00A5D8FF0095C8FF00526D830000000000000000000000000000
        0000000809090099C5D357EFFCFF71FDFFFF58FBFFFF00F9FFFF00C8E9FF009D
        D0FF3AAAD3FFC5D6E2FFD3DCE5FF3DB2DAFF00A8DCFF00B4E7FF00B7EAFF00B0
        E3FF00ACDFFF00A1D4FF007EA8D0000407080000000000000000000000000000
        000000000000001B212104A9D6E357F2FCFF6EFFFFFF6AFAFFFF21F2FFFF00EA
        FFFF00CBF3FF16A5D2FF1CA9D7FF00BEF3FF00C4F8FF00BDF0FF00B6E9FF00B1
        E4FF00A9DCFF008BB8E100161C1F000000000000000000000000000000000000
        00000000000000000000001B2020009AC3D03EDEF7FF68F9FFFF6DF5FFFF5EED
        FFFF30E5FFFF10DCFFFF00D0FFFF00C8FCFF00C2F6FF03BDEFFF12BCEBFF08AC
        DFFF0082ADCE00161C1E00000000000000000000000000000000000000000000
        00000000000000000000000000000006070700617E7E0DB8E5F03AD8F7FF59E8
        FCFF60EAFFFF5FE4FFFF5CE0FFFF53DBFCFF47D0F5FF2ABFE8FF07A3D1F00056
        707C000406070000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000C0F1000495D65007C
        9FAE06A0CBDC0DB3E1F40DB1DFF4069AC6DC007698AE00425764000B0E0F0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnClick = btnUpdatePricesClick
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 70
    Align = alLeft
    Caption = 'Inventory'
    TabOrder = 1
    Height = 578
    Width = 224
    object gridInvShadow: TcxGrid
      Left = 2
      Top = 18
      Width = 220
      Height = 558
      Align = alClient
      TabOrder = 0
      LookAndFeel.NativeStyle = False
      object vwInvShadow: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.DataSource = CostingDM.dsInvShadow
        DataController.KeyFieldNames = 'INV_SHADOW_ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.Visible = True
        NewItemRow.Visible = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.NavigatorHints = True
        OptionsData.Appending = True
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.GroupByBox = False
        Preview.Visible = True
        object vwInvShadowINV_SHADOW_ID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'INV_SHADOW_ID'
          Width = 50
        end
        object vwInvShadowPART_NUMBER: TcxGridDBColumn
          Caption = 'Part'
          DataBinding.FieldName = 'PART_NUMBER'
          Width = 82
        end
        object vwInvShadowDESCRIPTION: TcxGridDBColumn
          Caption = 'Description'
          DataBinding.FieldName = 'DESCRIPTION'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.BlobPaintStyle = bpsText
          Properties.MemoScrollBars = ssBoth
          Properties.ShowExPopupItems = False
          Properties.ShowPicturePopup = False
          Width = 217
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = vwInvShadow
      end
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 232
    Top = 70
    Align = alClient
    Caption = 'Bill of Materials'
    TabOrder = 2
    Height = 578
    Width = 1059
    object gridBOM: TcxGrid
      Left = 2
      Top = 18
      Width = 1055
      Height = 558
      Align = alClient
      TabOrder = 0
      LookAndFeel.NativeStyle = False
      object viewBOM: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Prior.Visible = True
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Edit.Enabled = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = True
        Navigator.Buttons.Refresh.Visible = True
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.DataSource = CostingDM.dsBOM
        DataController.KeyFieldNames = 'BOM_ID'
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '$,0.000;($,0.000)'
            Kind = skSum
            FieldName = 'WIN_COST'
          end>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.Visible = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.NavigatorHints = True
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.Footer = True
        OptionsView.Indicator = True
        Preview.Visible = True
        object viewBOMINV_SHADOW_ID: TcxGridDBColumn
          Caption = 'INV_ID'
          DataBinding.FieldName = 'INV_SHADOW_ID'
          Width = 65
        end
        object viewBOMBOM_ID: TcxGridDBColumn
          DataBinding.FieldName = 'BOM_ID'
          Visible = False
        end
        object viewBOMBOM_NAME: TcxGridDBColumn
          Caption = 'BOM'
          DataBinding.FieldName = 'BOM_NAME'
        end
        object viewBOMBOM_DESCRIPTION: TcxGridDBColumn
          Caption = 'BOM Description'
          DataBinding.FieldName = 'BOM_DESCRIPTION'
          Width = 149
        end
        object viewBOMSERIES_NAME: TcxGridDBColumn
          Caption = 'Series'
          DataBinding.FieldName = 'SERIES_NAME'
          Width = 76
        end
        object viewBOMMODEL_NAME: TcxGridDBColumn
          Caption = 'Model'
          DataBinding.FieldName = 'MODEL_NAME'
          Width = 69
        end
        object viewBOMCOLOR_NAME: TcxGridDBColumn
          Caption = 'Color'
          DataBinding.FieldName = 'COLOR_NAME'
          Width = 73
        end
        object viewBOMNAILFIN_NAME: TcxGridDBColumn
          Caption = 'Nailfin'
          DataBinding.FieldName = 'NAILFIN_NAME'
          Width = 68
        end
        object viewBOMSERIES_ID: TcxGridDBColumn
          DataBinding.FieldName = 'SERIES_ID'
          Visible = False
        end
        object viewBOMMODEL_ID: TcxGridDBColumn
          DataBinding.FieldName = 'MODEL_ID'
          Visible = False
        end
        object viewBOMCOLOR_ID: TcxGridDBColumn
          DataBinding.FieldName = 'COLOR_ID'
          Visible = False
        end
        object viewBOMNAILFIN_ID: TcxGridDBColumn
          DataBinding.FieldName = 'NAILFIN_ID'
          Visible = False
        end
        object viewBOMSUBASSEMBLY: TcxGridDBColumn
          Caption = 'Sub Assembly'
          DataBinding.FieldName = 'SUBASSEMBLY'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Items.Strings = (
            'Frame'
            'Sash 1'
            'Sash 2'
            'Hardware'
            'Glass'
            'Screen'
            'Sash 3'
            'Sash 4'
            'Sash 5'
            'Sash 6')
          Width = 108
        end
        object viewBOMBCT_ID: TcxGridDBColumn
          Caption = 'SA Cost'
          DataBinding.FieldName = 'BCT_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'BCT_ID'
          Properties.ListColumns = <
            item
              FieldName = 'BCT_NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = CostingDM.dsBomCostType
          Width = 65
        end
        object viewBOMPART_NUMBER: TcxGridDBColumn
          Caption = 'Part No'
          DataBinding.FieldName = 'PART_NUMBER'
          Width = 66
        end
        object viewBOMDESCRIPTION: TcxGridDBColumn
          Caption = 'Inventory Desc'
          DataBinding.FieldName = 'DESCRIPTION'
          Width = 124
        end
        object viewBOMQUANTITY: TcxGridDBColumn
          Caption = 'Qty'
          DataBinding.FieldName = 'QUANTITY'
          Width = 42
        end
        object viewBOMDIMENSION_TYPE: TcxGridDBColumn
          Caption = 'Dim Type'
          DataBinding.FieldName = 'DIMENSION_TYPE'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Items.Strings = (
            'H'
            'V'
            'A'
            'P')
          Width = 76
        end
        object viewBOMWIDTH_DIVISOR: TcxGridDBColumn
          Caption = 'W Divisor'
          DataBinding.FieldName = 'WIDTH_DIVISOR'
          Width = 79
        end
        object viewBOMWIDTH_DEDUCT: TcxGridDBColumn
          Caption = 'W Deduct'
          DataBinding.FieldName = 'WIDTH_DEDUCT'
          Width = 73
        end
        object viewBOMHEIGHT_DIVISOR: TcxGridDBColumn
          Caption = 'H Divisor'
          DataBinding.FieldName = 'HEIGHT_DIVISOR'
          Width = 71
        end
        object viewBOMHEIGHT_DEDUCT: TcxGridDBColumn
          Caption = 'H Deduct'
          DataBinding.FieldName = 'HEIGHT_DEDUCT'
          Width = 82
        end
        object viewBOMBASE_COST: TcxGridDBColumn
          Caption = 'Inv Cost'
          DataBinding.FieldName = 'BASE_COST'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 4
          Properties.DisplayFormat = '$,0.000;($,0.000)'
          Width = 76
        end
        object viewBOMWASTE: TcxGridDBColumn
          Caption = 'Waste'
          DataBinding.FieldName = 'WASTE'
          Width = 62
        end
        object viewBOMSELECTED_COPY: TcxGridDBColumn
          Caption = 'Sel Copy'
          DataBinding.FieldName = 'SELECTED_COPY'
          Visible = False
        end
        object viewBOMWIN_COST: TcxGridDBColumn
          Caption = 'Win Cost'
          DataBinding.FieldName = 'WIN_COST'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 4
          Properties.DisplayFormat = '$,0.000;($,0.000)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 80
        end
        object viewBOMWORKCELL_TYPE_ID: TcxGridDBColumn
          Caption = 'Work Cell'
          DataBinding.FieldName = 'WORKCELL_TYPE_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownAutoSize = True
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'WORKCELL_TYPE_ID'
          Properties.ListColumns = <
            item
              FieldName = 'WORKCELL_TYPE'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = CostingDM.dsWorkCell_Type
          Width = 78
        end
      end
      object cxGridLevel3: TcxGridLevel
        GridView = viewBOM
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 224
    Top = 70
    Width = 8
    Height = 578
    HotZoneClassName = 'TcxSimpleStyle'
    AllowHotZoneDrag = False
    AutoPosition = False
    PositionAfterOpen = 200
    AutoSnap = True
    MinSize = 20
    ResizeUpdate = True
    Control = cxGroupBox1
    ShowHint = True
    ParentShowHint = False
  end
  object PopupMenu1: TPopupMenu
    Left = 580
    Top = 69
    object N2: TMenuItem
      Caption = '-'
    end
    object CopyAll: TMenuItem
      Caption = 'Copy This Page'
      OnClick = CopyAllClick
    end
    object CopySelected: TMenuItem
      Caption = 'Copy Selected'
      OnClick = CopyAllClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PasteSeries1: TMenuItem
      Caption = 'Paste Items'
      Enabled = False
      OnClick = PasteSeries1Click
    end
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = BOMPrinterLink
    Version = 0
    Left = 704
    Top = 307
    object BOMPrinterLink: TdxGridReportLink
      Active = True
      Component = gridBOM
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 5
      PrinterPage.Footer = 340
      PrinterPage.GrayShading = True
      PrinterPage.Header = 340
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.CenterTitle.Strings = (
        '[User Name] on [Machine Name]')
      PrinterPage.PageFooter.Font.Charset = ANSI_CHARSET
      PrinterPage.PageFooter.Font.Color = clBlack
      PrinterPage.PageFooter.Font.Height = -11
      PrinterPage.PageFooter.Font.Name = 'Times New Roman'
      PrinterPage.PageFooter.Font.Style = []
      PrinterPage.PageFooter.LeftTitle.Strings = (
        '[Page # of Pages #]')
      PrinterPage.PageFooter.RightTitle.Strings = (
        '[Date & Time Printed]')
      PrinterPage.PageHeader.CenterTitle.Strings = (
        '')
      PrinterPage.PageHeader.Font.Charset = ANSI_CHARSET
      PrinterPage.PageHeader.Font.Color = clBlack
      PrinterPage.PageHeader.Font.Height = -19
      PrinterPage.PageHeader.Font.Name = 'Times New Roman'
      PrinterPage.PageHeader.Font.Style = [fsBold]
      PrinterPage.PageHeader.LeftTitle.Strings = (
        'BILL OF MATERIALS')
      PrinterPage.PageHeader.RightTitle.Strings = (
        '')
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 14000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.Caption = 'Bill of Materials'
      ReportDocument.CreationDate = 42279.981443217590000000
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      OptionsOnEveryPage.FilterBar = False
      OptionsSize.AutoWidth = True
      OptionsView.FilterBar = False
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
    Left = 724
    Top = 402
  end
end
