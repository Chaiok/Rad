object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 636
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TovarName: TEdit
    Left = 16
    Top = 16
    Width = 121
    Height = 21
    MaxLength = 15
    TabOrder = 0
    TextHint = 'TovarName'
  end
  object ID_IZM: TEdit
    Left = 160
    Top = 16
    Width = 121
    Height = 21
    MaxLength = 10
    TabOrder = 1
    TextHint = 'ID_IZM'
  end
  object Price: TEdit
    Left = 448
    Top = 16
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 2
    TextHint = 'Price'
  end
  object Kolvo: TEdit
    Left = 304
    Top = 16
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 3
    TextHint = 'Kolvo'
  end
  object Button1: TButton
    Left = 649
    Top = 8
    Width = 114
    Height = 25
    Caption = 'Press F to INSERT'
    TabOrder = 4
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 56
    Width = 577
    Height = 572
    DataSource = DataSource1
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Refresh: TButton
    Left = 649
    Top = 56
    Width = 75
    Height = 23
    Caption = 'Refresh'
    TabOrder = 6
    OnClick = RefreshClick
  end
  object Button2: TButton
    Left = 649
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Nacladnay'
    TabOrder = 7
    OnClick = Button2Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=44442222a'
      'Database=D:\radfiribbd\CHAIOKDB.FDB'
      'Protocol=TCPIP'
      'Server=localhost'
      'DriverID=IB')
    Connected = True
    Left = 136
    Top = 8
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 280
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 424
    Top = 10
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 568
    Top = 8
  end
  object Rep: TA7Rep
    Left = 656
    Top = 144
  end
end
