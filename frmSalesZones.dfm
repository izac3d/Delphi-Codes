object SalesZonesfrm: TSalesZonesfrm
  Left = 369
  Top = 265
  BorderStyle = bsDialog
  Caption = 'Sales Zones'
  ClientHeight = 352
  ClientWidth = 524
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
  object btnCancel: TcxButton
    Left = 438
    Top = 319
    Width = 83
    Height = 24
    Caption = 'Cance&l'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    ModalResult = 2
    TabOrder = 0
  end
  object btnSave: TcxButton
    Left = 358
    Top = 319
    Width = 78
    Height = 24
    Caption = '&Save'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    ModalResult = 1
    TabOrder = 1
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 7
    Width = 513
    Height = 304
    Hint = 'Click on email address to send email'
    TabOrder = 2
    object vwSZones: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      DataController.DataSource = CostingDM.dsSalesZone
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsData.Deleting = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object vwSZonesZONE_NO: TcxGridDBColumn
        Caption = 'Zone Number'
        DataBinding.FieldName = 'ZONE_NO'
        Width = 73
      end
      object vwSZonesZONE_DESCRIPTION: TcxGridDBColumn
        Caption = 'Zone Area'
        DataBinding.FieldName = 'ZONE_DESCRIPTION'
        Width = 185
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = vwSZones
    end
  end
  object btnDelete: TcxButton
    Left = 267
    Top = 319
    Width = 83
    Height = 24
    Caption = '&Delete'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 3
    OnClick = btnDeleteClick
  end
  object btnAdd: TcxButton
    Left = 181
    Top = 319
    Width = 83
    Height = 24
    Caption = '&Add'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 4
    OnClick = btnAddClick
  end
end
