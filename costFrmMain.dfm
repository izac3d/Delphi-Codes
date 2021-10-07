object Mainfrm: TMainfrm
  Left = 584
  Top = 250
  HelpContext = 1
  BorderIcons = [biSystemMenu]
  Caption = 'Costing'
  ClientHeight = 288
  ClientWidth = 262
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnFrames: TcxButton
    Left = 9
    Top = 7
    Width = 113
    Height = 39
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '&Frames'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 0
    OnClick = btnFramesClick
  end
  object btnBOM: TcxButton
    Left = 141
    Top = 54
    Width = 113
    Height = 38
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '&BOM'
    Colors.Hot = 8240895
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 3
    OnClick = btnBOMClick
  end
  object btnInventory: TcxButton
    Left = 9
    Top = 54
    Width = 113
    Height = 38
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '&Inventory'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 2
    OnClick = btnInventoryClick
  end
  object btnExit: TcxButton
    Left = 141
    Top = 239
    Width = 113
    Height = 38
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'E&xit'
    Colors.Hot = 8240895
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 5
    OnClick = btnExitClick
  end
  object btnPricing: TcxButton
    Left = 9
    Top = 100
    Width = 113
    Height = 39
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '&Pricing'
    Colors.Hot = 8240895
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 4
    OnClick = btnPricingClick
  end
  object btnGlass: TcxButton
    Left = 141
    Top = 9
    Width = 113
    Height = 37
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '&Glass'
    Colors.Hot = 8240895
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 1
    OnClick = btnGlassClick
  end
  object btnReference: TcxButton
    Left = 141
    Top = 100
    Width = 113
    Height = 39
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '&Reference'
    Colors.Hot = 8240895
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 6
    OnClick = btnReferenceClick
  end
  object cxButton1: TcxButton
    Left = 9
    Top = 146
    Width = 113
    Height = 39
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Help'
    Colors.Hot = 8240895
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 7
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 141
    Top = 146
    Width = 113
    Height = 39
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Import Zip Codes'
    Colors.Hot = 8240895
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 8
    OnClick = cxButton2Click
  end
  object cxButton3: TcxButton
    Left = 7
    Top = 193
    Width = 114
    Height = 39
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'DB Path'
    Colors.Hot = 8240895
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 9
    OnClick = cxButton3Click
  end
  object cxButton4: TcxButton
    Left = 141
    Top = 193
    Width = 113
    Height = 39
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Reset Grid settings'
    Colors.Hot = 8240895
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 10
    OnClick = cxButton4Click
  end
  object cxButton6: TcxButton
    Left = 9
    Top = 239
    Width = 113
    Height = 38
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Sales Zones'
    Colors.Hot = 8240895
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 11
    OnClick = cxButton6Click
  end
  object dxSkinController1: TdxSkinController
    SkinName = 'LondonLiquidSky'
    Left = 172
    Top = 65527
  end
end