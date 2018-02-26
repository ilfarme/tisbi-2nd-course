object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 521
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 492
    Width = 788
    Height = 29
    Align = alBottom
    Caption = 'ToolBar1'
    TabOrder = 0
    ExplicitLeft = 528
    ExplicitTop = 448
    ExplicitWidth = 150
    object Button1: TButton
      Left = 0
      Top = 0
      Width = 75
      Height = 22
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 75
      Top = 0
      Width = 75
      Height = 22
      Caption = 'Button2'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 0
    Width = 788
    Height = 492
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 344
    ExplicitTop = 200
    ExplicitWidth = 300
    ExplicitHeight = 150
    ControlData = {
      4C00000071510000DA3200000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
end
