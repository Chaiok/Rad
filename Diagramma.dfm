object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Form6'
  ClientHeight = 350
  ClientWidth = 799
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Chart1: TChart
    Left = 16
    Top = 8
    Width = 489
    Height = 313
    Title.Text.Strings = (
      'TChart')
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Button1: TButton
    Left = 528
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Show'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 528
    Top = 24
    Width = 122
    Height = 21
    Date = 44323.000000000000000000
    Time = 0.954015891205926900
    TabOrder = 2
  end
  object DateTimePicker2: TDateTimePicker
    Left = 528
    Top = 72
    Width = 122
    Height = 21
    Date = 44323.000000000000000000
    Time = 0.954075347224716100
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 664
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 4
    TextHint = 'Tovarname'
  end
  object Button2: TButton
    Left = 664
    Top = 153
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 5
    OnClick = Button2Click
  end
  object ListBox1: TListBox
    Left = 664
    Top = 8
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 6
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\radfiribbd\CHAIOKDB.FDB'
      'User_Name=SYSDBA'
      'Password=44442222a'
      'DriverID=FB')
    Connected = True
    Left = 536
    Top = 208
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from dostavka')
    Left = 600
    Top = 208
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from dostavka')
    Left = 656
    Top = 208
  end
end
