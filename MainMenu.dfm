object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'form'
  ClientHeight = 651
  ClientWidth = 807
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 256
    Top = 32
    Width = 225
    Height = 187
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=44442222a'
      'Database=D:\radfiribbd\CHAIOKDB.FDB'
      'Protocol=TCPIP'
      'Server=localhost'
      'DriverID=IB')
    Left = 32
    Top = 16
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from dostavka')
    Left = 32
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 32
    Top = 144
  end
  object MainMenu1: TMainMenu
    Left = 608
    Top = 16
    object magazin: TMenuItem
      Caption = 'magazin'
      object dostavka: TMenuItem
        Caption = 'dostavka'
        OnClick = dostavkaClick
      end
      object oplata: TMenuItem
        Caption = 'oplata'
        OnClick = oplataClick
      end
    end
    object otchet: TMenuItem
      Caption = 'otchet'
      OnClick = otchetClick
    end
    object diagramma: TMenuItem
      Caption = 'diagramma'
      OnClick = diagrammaClick
    end
  end
end
