object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 447
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Postavchik: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    MaxLength = 10
    TabOrder = 0
    TextHint = 'Postavchik'
  end
  object Poluchatel: TEdit
    Left = 152
    Top = 8
    Width = 121
    Height = 21
    MaxLength = 10
    TabOrder = 1
    TextHint = 'Poluchatel'
  end
  object DostavkaDate: TDateTimePicker
    Left = 296
    Top = 8
    Width = 186
    Height = 21
    Date = 44321.000000000000000000
    Time = 0.811230393519508700
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 43
    Width = 569
    Height = 334
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 502
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 440
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Refresh'
    TabOrder = 5
    OnClick = Button2Click
  end
  object idedit: TEdit
    Left = 296
    Top = 402
    Width = 121
    Height = 21
    TabOrder = 6
    TextHint = 'buttonid'
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\radfiribbd\CHAIOKDB.FDB'
      'User_Name=SYSDBA'
      'Password=44442222a'
      'DriverID=FB')
    Connected = True
    Left = 24
    Top = 392
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from dostavka')
    Left = 104
    Top = 392
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 560
    Top = 392
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 152
    Top = 392
  end
end
