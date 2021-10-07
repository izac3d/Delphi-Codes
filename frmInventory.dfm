object BOMInventoryfrm: TBOMInventoryfrm
  Left = 26
  Top = 130
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'BOM Inventory'
  ClientHeight = 586
  ClientWidth = 643
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
  OnDestroy = FormDestroy
  DesignSize = (
    643
    586)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TBevel
    Left = 11
    Top = 547
    Width = 625
    Height = 7
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object pcBOM: TcxPageControl
    Left = 8
    Top = 8
    Width = 631
    Height = 520
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 0
    Properties.ActivePage = tsBOM
    Properties.CustomButtons.Buttons = <>
    Properties.HotTrack = True
    Properties.NavigatorPosition = npLeftBottom
    Properties.ShowFrame = True
    Properties.Style = 11
    Properties.TabSlants.Positions = [spLeft, spRight]
    Properties.TabWidth = 150
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabSlants.Positions = [spLeft, spRight]
    ClientRectBottom = 518
    ClientRectLeft = 2
    ClientRectRight = 629
    ClientRectTop = 25
    object tsBOM: TcxTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Bill of Materials Inventory'
      ImageIndex = 0
      object Label8: TLabel
        Left = 4
        Top = 14
        Width = 36
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Locate:'
      end
      object gridBOMInventory: TcxGrid
        Left = 7
        Top = 42
        Width = 613
        Height = 456
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object vwInvBOM: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.Prior.Visible = True
          Navigator.Buttons.Insert.Visible = True
          Navigator.Buttons.Edit.Enabled = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = True
          Navigator.Buttons.Cancel.Visible = True
          Navigator.Buttons.Refresh.Visible = True
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsInvShadow
          DataController.KeyFieldNames = 'INV_SHADOW_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object vwInvBOMColumn1: TcxGridDBColumn
            Caption = 'INV_ID'
            DataBinding.FieldName = 'INV_SHADOW_ID'
            Width = 49
          end
          object vwInvBOMPART_NUMBER: TcxGridDBColumn
            Caption = 'Part No'
            DataBinding.FieldName = 'PART_NUMBER'
            Width = 96
          end
          object vwInvBOMDESCRIPTION: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'DESCRIPTION'
            PropertiesClassName = 'TcxBlobEditProperties'
            Properties.BlobEditKind = bekMemo
            Properties.BlobPaintStyle = bpsText
            Properties.ReadOnly = False
            Width = 301
          end
          object vwInvBOMPO_UNIT_PRICE: TcxGridDBColumn
            Caption = 'PO Price'
            DataBinding.FieldName = 'PO_UNIT_PRICE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = '$,0.000;($,0.000)'
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 45
          end
          object vwInvBOMPriceBOM: TcxGridDBColumn
            Caption = 'Price BOM'
            DataBinding.FieldName = 'PRICE_BOM'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = '$,0.000;($,0.000)'
            Width = 53
          end
          object vwInvBOMUOM_BOM: TcxGridDBColumn
            Caption = 'UOM BOM'
            DataBinding.FieldName = 'UOM_BOM'
            Width = 53
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = vwInvBOM
        end
      end
      object cbInvShadow: TcxLookupComboBox
        Left = 44
        Top = 11
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Properties.KeyFieldNames = 'INV_SHADOW_ID'
        Properties.ListColumns = <
          item
            FieldName = 'PART_NUMBER'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = CostingDM.dsInvShadow
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 176
      end
      object cxButton4: TcxButton
        Left = 226
        Top = 7
        Width = 28
        Height = 27
        Hint = 'Adjust Price'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        OptionsImage.Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          08000000000040020000120B0000120B0000000100000000000000000000FFFF
          FF00D0CFD30097969900BEBDC000A8A7AA00E1E0E300D4D3D600A7A6A8009A99
          9B00CAC9CB00C6C5C700B8B7B900B4B3B500B0AFB100ACABAD00A6A4A7009D9B
          9E00C9C7CA00C5C3C600FF00FF00A3A2A3009796970092919200619F6100E6FF
          E600DFFFE000E3FFE400D9FFDD00DDFFE100D3FFD900CBFFD300D7FFDD00C5FF
          CF00CBFFD400B5FFC500BCFFCA00C3FFD000ACFFC000B4FFC60088FFA70091FF
          AD009AFFB400A2FFB900A3FFBA00ABFFC00065FC90006DFF950076FF9B007FFF
          A20088FFA8004BF5800054F785005DFA8B00A4FFFF009B9D9D00C1C2C200A3A4
          A4009D9E9E00A8AAAB0097999A00E1E3E400D0D2D300A2A3A400999A9B009596
          9700B0B1B3009A9B9D00D8D9DB00D6D7D900CFD0D200C6C7C9000020FF00B9B9
          BC00B5B5B800ACACAF009F9FA200E1E1E400DDDDE000DCDCDF00D9D9DC00D4D4
          D700D3D3D600CFCFD200CBCBCE00C7C7CA00C3C3C600A8A8AA00929294008E8E
          9000E4E4E600E3E3E500DFDFE100DBDBDD00D2D2D400CDCDCF00CBCBCD00C9C9
          CB00BABABC00B7B7B900B5B5B700B3B3B500AFAFB1007A7A7B00CFCFD000C2C2
          C300C0C0C100BDBDBE00BCBCBD00B8B8B900ACACAD00AAAAAB00A6A6A700A1A1
          A2009E9E9F00959596009494950091919200878788009B9B9B00838383006D6D
          6D003D3D3D000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000141414147A7A
          7A7A7A7A7A7A7A7A7A7A7A7A7A7A141414141414147A655168126962654B104C
          4073755959677A1414141414147A4F7878785678787805787878587979797A14
          14141414147A4E3636780B3636783B363679583636797A1414141414147A5C78
          7878557878780F787878743636797A1414141414147A063636780A3636784B36
          3679733636797A1414141414147A06787878547878780E787878167878797A14
          14141414147A3D3636785F363678423636793C3636797A1414141414147A5B78
          7878687878780D787878097878797A1414141414147A5A363678023636786436
          3679433636797A1414141414147A5A787878527878780C7878783A7878797A14
          14141414147A5A4848780748487849484879724848797A1414141414147A5A5B
          5C5D454661696C644B08714341177A1414141414147A5A5A064F453E60566B4A
          66573F1103587A1414141414147A5A1818181818181818181818181818747A14
          14141414147A5A18221E201A1B1919191919191918737A1414141414147A5A18
          2C26272425221E1C1D1B191918167A1414141414147A5A18303132292A2B2D23
          24211F1E18037A1414141414147A5A183334352E2F303128292A2B2D18097A14
          14141414147A5A1818181818181818181818181818777A1414141414147A5A5A
          5A5A064F455E60130463665715377A1414141414147A5A5A5A5A4D4E44525F47
          6A6D426F39727A1414141414147A625A5A5A5B5C5051531238620D6E70767A14
          1414141414147A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A14141414}
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = cxButton4Click
      end
      object btnSingleBom: TcxButton
        Left = 259
        Top = 7
        Width = 83
        Height = 27
        Hint = 'Update BOM Base Cost'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Single BOM'
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
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
        TabOrder = 3
        OnClick = btnSingleBomClick
      end
      object btnAllBom: TcxButton
        Left = 347
        Top = 7
        Width = 83
        Height = 27
        Hint = 'Update BOM Base Cost'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'All BOM'
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
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
        TabOrder = 4
        OnClick = btnSingleBomClick
      end
      object btnPrint: TcxButton
        Left = 523
        Top = 8
        Width = 80
        Height = 26
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Print'
        DropDownMenu = PopupMenu1
        Kind = cxbkDropDownButton
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        PopupMenu = PopupMenu1
        TabOrder = 5
      end
    end
    object tsEdit: TcxTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Edit'
      ImageIndex = 1
      object Label7: TLabel
        Left = 40
        Top = 14
        Width = 40
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Part No:'
      end
      object Label5: TLabel
        Left = 221
        Top = 12
        Width = 57
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Description:'
      end
      object Label4: TLabel
        Left = 38
        Top = 82
        Width = 44
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'PO Price:'
      end
      object Label11: TLabel
        Left = 217
        Top = 178
        Width = 58
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Conversion:'
      end
      object Label1: TLabel
        Left = 220
        Top = 150
        Width = 52
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Price BOM:'
      end
      object Label2: TLabel
        Left = 217
        Top = 121
        Width = 52
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'UOM BOM:'
      end
      object Label3: TLabel
        Left = 38
        Top = 47
        Width = 44
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'UOM PO:'
      end
      object lblConversion: TLabel
        Left = 389
        Top = 120
        Width = 151
        Height = 13
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Conversion of Units of Measure'
      end
      object Bevel2: TBevel
        Left = 40
        Top = 108
        Width = 567
        Height = 5
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Shape = bsTopLine
      end
      object clcConversion: TcxDBCalcEdit
        Left = 274
        Top = 176
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataBinding.DataField = 'UOM_CONVERSION'
        DataBinding.DataSource = CostingDM.dsInvShadow
        Properties.OnEditValueChanged = clcConversionPropertiesEditValueChanged
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 112
      end
      object cxDBLabel2: TcxDBLabel
        Left = 83
        Top = 43
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataBinding.DataField = 'UOM_INV'
        DataBinding.DataSource = CostingDM.dsInvShadow
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Style.BorderStyle = ebsUltraFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.TextColor = clBlue
        Style.TextStyle = []
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        Height = 21
        Width = 111
        AnchorY = 54
      end
      object cxDBMemo1: TcxDBMemo
        Left = 279
        Top = 9
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataBinding.DataField = 'DESCRIPTION'
        DataBinding.DataSource = CostingDM.dsInvShadow
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Height = 24
        Width = 327
      end
      object cxDBLabel1: TcxDBLabel
        Left = 83
        Top = 77
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataBinding.DataField = 'PO_UNIT_PRICE'
        DataBinding.DataSource = CostingDM.dsInvShadow
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Style.BorderStyle = ebsUltraFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.TextColor = clBlue
        Style.TextStyle = []
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        Height = 21
        Width = 111
        AnchorY = 88
      end
      object edtUOMBOM: TcxDBTextEdit
        Left = 274
        Top = 118
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataBinding.DataField = 'UOM_BOM'
        DataBinding.DataSource = CostingDM.dsInvShadow
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 112
      end
      object cxDBMemo2: TcxDBMemo
        Left = 279
        Top = 30
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataBinding.DataField = 'PURCH_ORDER_EXT'
        DataBinding.DataSource = CostingDM.dsInvShadow
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Height = 68
        Width = 327
      end
      object cxDBLabel4: TcxDBLabel
        Left = 83
        Top = 12
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataBinding.DataField = 'PART_NUMBER'
        DataBinding.DataSource = CostingDM.dsInvShadow
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Style.BorderStyle = ebsUltraFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.TextColor = clBlue
        Style.TextStyle = []
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        Height = 20
        Width = 111
        AnchorY = 22
      end
      object cxDBCurrencyEdit1: TcxDBCurrencyEdit
        Left = 274
        Top = 147
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        DataBinding.DataField = 'PRICE_BOM'
        DataBinding.DataSource = CostingDM.dsInvShadow
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = '$,0.000;($,0.000)'
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 7
        Width = 112
      end
      object btnAdjustPrice: TcxButton
        Left = 394
        Top = 168
        Width = 142
        Height = 34
        Hint = 'Adjust Price'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Adjust Price'
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        OptionsImage.Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          08000000000040020000120B0000120B0000000100000000000000000000FFFF
          FF00D0CFD30097969900BEBDC000A8A7AA00E1E0E300D4D3D600A7A6A8009A99
          9B00CAC9CB00C6C5C700B8B7B900B4B3B500B0AFB100ACABAD00A6A4A7009D9B
          9E00C9C7CA00C5C3C600FF00FF00A3A2A3009796970092919200619F6100E6FF
          E600DFFFE000E3FFE400D9FFDD00DDFFE100D3FFD900CBFFD300D7FFDD00C5FF
          CF00CBFFD400B5FFC500BCFFCA00C3FFD000ACFFC000B4FFC60088FFA70091FF
          AD009AFFB400A2FFB900A3FFBA00ABFFC00065FC90006DFF950076FF9B007FFF
          A20088FFA8004BF5800054F785005DFA8B00A4FFFF009B9D9D00C1C2C200A3A4
          A4009D9E9E00A8AAAB0097999A00E1E3E400D0D2D300A2A3A400999A9B009596
          9700B0B1B3009A9B9D00D8D9DB00D6D7D900CFD0D200C6C7C9000020FF00B9B9
          BC00B5B5B800ACACAF009F9FA200E1E1E400DDDDE000DCDCDF00D9D9DC00D4D4
          D700D3D3D600CFCFD200CBCBCE00C7C7CA00C3C3C600A8A8AA00929294008E8E
          9000E4E4E600E3E3E500DFDFE100DBDBDD00D2D2D400CDCDCF00CBCBCD00C9C9
          CB00BABABC00B7B7B900B5B5B700B3B3B500AFAFB1007A7A7B00CFCFD000C2C2
          C300C0C0C100BDBDBE00BCBCBD00B8B8B900ACACAD00AAAAAB00A6A6A700A1A1
          A2009E9E9F00959596009494950091919200878788009B9B9B00838383006D6D
          6D003D3D3D000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000141414147A7A
          7A7A7A7A7A7A7A7A7A7A7A7A7A7A141414141414147A655168126962654B104C
          4073755959677A1414141414147A4F7878785678787805787878587979797A14
          14141414147A4E3636780B3636783B363679583636797A1414141414147A5C78
          7878557878780F787878743636797A1414141414147A063636780A3636784B36
          3679733636797A1414141414147A06787878547878780E787878167878797A14
          14141414147A3D3636785F363678423636793C3636797A1414141414147A5B78
          7878687878780D787878097878797A1414141414147A5A363678023636786436
          3679433636797A1414141414147A5A787878527878780C7878783A7878797A14
          14141414147A5A4848780748487849484879724848797A1414141414147A5A5B
          5C5D454661696C644B08714341177A1414141414147A5A5A064F453E60566B4A
          66573F1103587A1414141414147A5A1818181818181818181818181818747A14
          14141414147A5A18221E201A1B1919191919191918737A1414141414147A5A18
          2C26272425221E1C1D1B191918167A1414141414147A5A18303132292A2B2D23
          24211F1E18037A1414141414147A5A183334352E2F303128292A2B2D18097A14
          14141414147A5A1818181818181818181818181818777A1414141414147A5A5A
          5A5A064F455E60130463665715377A1414141414147A5A5A5A5A4D4E44525F47
          6A6D426F39727A1414141414147A625A5A5A5B5C5051531238620D6E70767A14
          1414141414147A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A14141414}
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = btnAdjustPriceClick
      end
      object cxDBRadioGroup1: TcxDBRadioGroup
        Left = 40
        Top = 118
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Convert By:'
        DataBinding.DataField = 'UOM_METHOD'
        DataBinding.DataSource = CostingDM.dsInvShadow
        Properties.DefaultValue = 'M'
        Properties.Items = <
          item
            Caption = 'Multiply'
            Value = 'M'
          end
          item
            Caption = 'Divide'
            Value = 'D'
          end>
        Properties.OnEditValueChanged = clcConversionPropertiesEditValueChanged
        Style.BorderStyle = ebsUltraFlat
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 9
        Transparent = True
        Height = 76
        Width = 157
      end
    end
    object tsHistory: TcxTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'History'
      ImageIndex = 2
      object grdHistory: TcxGrid
        Left = 4
        Top = 4
        Width = 622
        Height = 491
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object vwInvHistory: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.Prior.Visible = True
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Edit.Enabled = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = True
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Visible = True
          DataController.DataSource = CostingDM.dsInvShadowArch
          DataController.KeyFieldNames = 'INV_SHADOW_ARCH_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.NavigatorHints = True
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          Preview.Visible = True
          object vwInvHistoryColumn2: TcxGridDBColumn
            Caption = 'Date'
            DataBinding.FieldName = 'DATE_SAVED'
            Width = 63
          end
          object vwInvHistoryColumn1: TcxGridDBColumn
            Caption = 'Operator'
            DataBinding.FieldName = 'USER_OPERATOR'
            Width = 53
          end
          object cxGridDBColumn4: TcxGridDBColumn
            Caption = 'Part No'
            DataBinding.FieldName = 'PART_NUMBER'
            Width = 80
          end
          object cxGridDBColumn5: TcxGridDBColumn
            Caption = 'Description'
            DataBinding.FieldName = 'DESCRIPTION'
            Width = 207
          end
          object cxGridDBColumn7: TcxGridDBColumn
            Caption = 'Price BOM'
            DataBinding.FieldName = 'PRICE_BOM'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Width = 53
          end
          object cxGridDBColumn8: TcxGridDBColumn
            Caption = 'UOM BOM'
            DataBinding.FieldName = 'UOM_BOM'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = '$,0.000;($,0.000)'
            Width = 65
          end
          object vwInvHistoryColumn3: TcxGridDBColumn
            Caption = 'Conversion'
            DataBinding.FieldName = 'UOM_CONVERSION'
            Width = 59
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = vwInvHistory
        end
      end
    end
  end
  object cxButton1: TcxButton
    Left = 436
    Top = 554
    Width = 94
    Height = 26
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akRight, akBottom]
    Caption = 'Cance&l'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 1
    OnClick = cxButton1Click
  end
  object btnSave: TcxButton
    Left = 329
    Top = 554
    Width = 94
    Height = 26
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akRight, akBottom]
    Caption = '&Save'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 2
    OnClick = btnSaveClick
  end
  object btnDelete: TcxButton
    Left = 222
    Top = 554
    Width = 94
    Height = 26
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akRight, akBottom]
    Caption = '&Delete'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 3
    OnClick = btnDeleteClick
  end
  object cxButton2: TcxButton
    Left = 544
    Top = 554
    Width = 94
    Height = 26
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akRight, akBottom]
    Caption = '&Close'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 4
    OnClick = cxButton2Click
  end
  object cxButton3: TcxButton
    Left = 115
    Top = 554
    Width = 94
    Height = 26
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Add'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 5
    OnClick = cxButton3Click
  end
  object cxButton5: TcxButton
    Left = 8
    Top = 554
    Width = 93
    Height = 26
    Caption = '&Print'
    Kind = cxbkDropDownButton
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    ModalResult = 1
    TabOrder = 6
  end
  object ComponentPrinter: TdxComponentPrinter
    CurrentLink = ComponentPrinterHistory
    Version = 0
    Left = 368
    Top = 120
    object ComponentPrinterBOM: TdxGridReportLink
      Component = gridBOMInventory
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 200
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.PageFooter.CenterTitle.Strings = (
        '[User Name] on [Machine Name]')
      PrinterPage.PageFooter.LeftTitle.Strings = (
        '[Page # of Pages #]')
      PrinterPage.PageFooter.RightTitle.Strings = (
        '[Date & Time Printed]')
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 11000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      BuiltInReportLink = True
    end
    object ComponentPrinterEdit: TdxCustomContainerReportLink
      Active = True
      Component = tsEdit
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 200
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.PageFooter.CenterTitle.Strings = (
        '[User Name] on [Machine Name]')
      PrinterPage.PageFooter.LeftTitle.Strings = (
        '[Page # of Pages #]')
      PrinterPage.PageFooter.RightTitle.Strings = (
        '[Date & Time Printed]')
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 11000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportDocument.CreationDate = 42184.779600914350000000
      BuiltInReportLink = True
      HiddenComponents = {}
      ExcludedComponents = {}
      AggregatedReportLinks = {}
    end
    object ComponentPrinterHistory: TdxGridReportLink
      Component = grdHistory
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 200
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.PageFooter.CenterTitle.Strings = (
        '[User Name] on [Machine Name]')
      PrinterPage.PageFooter.LeftTitle.Strings = (
        '[Page # of Pages #]')
      PrinterPage.PageFooter.RightTitle.Strings = (
        '[Date & Time Printed]')
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 11000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      BuiltInReportLink = True
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 456
    Top = 120
    object BOM1: TMenuItem
      Caption = '&BOM'
      OnClick = BOM1Click
    end
    object Edit1: TMenuItem
      Caption = '&Edit'
      OnClick = Edit1Click
    end
    object History1: TMenuItem
      Caption = '&History'
      OnClick = History1Click
    end
  end
end
