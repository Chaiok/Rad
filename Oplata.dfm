object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 135
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 15
    Top = 24
    Width = 410
    Height = 97
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object iddostavki: TEdit
    Left = 456
    Top = 24
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    TextHint = 'iddostavki'
  end
  object Button1: TButton
    Left = 456
    Top = 64
    Width = 121
    Height = 25
    Caption = 'Insert'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Oplata: TEdit
    Left = 607
    Top = 24
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 3
    TextHint = 'Oplata'
  end
  object Button2: TButton
    Left = 608
    Top = 64
    Width = 120
    Height = 25
    Caption = 'Update'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 560
    Top = 95
    Width = 75
    Height = 25
    Caption = 'Refresh'
    TabOrder = 5
    OnClick = Button3Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\radfiribbd\CHAIOKDB.FDB'
      'User_Name=SYSDBA'
      'Password=44442222a'
      'DriverID=FB')
    Connected = True
    Left = 112
    Top = 48
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 200
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 344
    Top = 48
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 272
    Top = 48
  end
end
