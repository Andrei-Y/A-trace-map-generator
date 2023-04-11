object Form1: TForm1
  Left = 192
  Top = 125
  Width = 798
  Height = 433
  Caption = 'A-trace-map-generator'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 64
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 32
    Top = 88
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 32
    Top = 112
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object Label4: TLabel
    Left = 32
    Top = 136
    Width = 32
    Height = 13
    Caption = 'Label4'
  end
  object Label5: TLabel
    Left = 32
    Top = 160
    Width = 32
    Height = 13
    Caption = 'Label5'
  end
  object Label6: TLabel
    Left = 32
    Top = 184
    Width = 32
    Height = 13
    Caption = 'Label6'
  end
  object Button1: TButton
    Left = 32
    Top = 24
    Width = 75
    Height = 25
    Caption = 'START'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 88
    Top = 64
    Width = 681
    Height = 321
    DefaultColWidth = 38
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 600
    Top = 32
    Width = 50
    Height = 21
    TabOrder = 2
    Text = '43'
  end
  object Edit2: TEdit
    Left = 656
    Top = 32
    Width = 50
    Height = 21
    TabOrder = 3
    Text = '15'
  end
  object Edit3: TEdit
    Left = 712
    Top = 32
    Width = 50
    Height = 21
    TabOrder = 4
    Text = '10'
  end
end
