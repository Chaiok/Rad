unit Diagramma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, VclTee.TeeGDIPlus, Data.DB,
  VCLTee.TeeData, VCLTee.TeEngine, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.Series, Vcl.StdCtrls, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TForm6 = class(TForm)
    Chart1: TChart;
    Button1: TButton;
    Series1: TLineSeries;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    Edit1: TEdit;
    Button2: TButton;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}
uses DateUtils,SqlTimSt;

procedure TForm6.Button1Click(Sender: TObject);
var I: integer;
text1,text2: TDateTime;
S:double;
begin
  if (DateTimePicker1.DateTime<DateTimePicker2.DateTime) then
  begin
    text1:=DateTimePicker1.DateTime;
    text2:=DateTimePicker2.DateTime;
  end
  else begin
    text1:=DateTimePicker2.DateTime;
    text2:=DateTimePicker1.DateTime;
  end;


  for I := 0 to ListBox1.Count-1 do begin
    FDQuery1.SQL.Text :=
    'select id from DOSTAVKA where dostavka_date BETWEEN :text1 and :text2';
    FDQuery1.ParamByName('text1').AsSQLTimeStamp :=
    Data.SqlTimSt.DateTimeToSQLTimeStamp(System.DateUtils.DateOf(text1));
    FDQuery1.ParamByName('text2').AsSQLTimeStamp :=
    Data.SqlTimSt.DateTimeToSQLTimeStamp(System.DateUtils.DateOf(text2));
    FDQuery1.Open;

    S:=0;
    while not FDQuery1.Eof do begin
      FDQuery2.SQL.Text :=
      'select summa from docladnay where name=:name and iddostavka=:id';
      FDQuery2.ParamByName('id').AsInteger := FDQuery1.FieldByName('ID').AsInteger;
      FDQuery2.ParamByName('name').AsString := ListBox1.Items[I];
      FDQuery2.Open;

      S:=S+FDQuery2.FieldByName('summa').AsFloat;

      FDQuery1.Next;
    end;
    With Series1 do
    begin
      Add (S, ListBox1.Items[I], clRed);
    end;
  end;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  ListBox1.Items.Add(Edit1.Text);
end;

end.
