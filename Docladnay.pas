unit Docladnay;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, A7Rep,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TForm2 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    TovarName: TEdit;
    ID_IZM: TEdit;
    Price: TEdit;
    Kolvo: TEdit;
    Button1: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Refresh: TButton;
    FDQuery2: TFDQuery;
    Button2: TButton;
    Rep: TA7Rep;
    procedure RefreshClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Dostavka;

procedure TForm2.Button1Click(Sender: TObject);
var text1,text2: string;
    text3,text4: double;
begin
  //FDConnection1.Connected:=False;
  //FDConnection1.Connected:=True;
  text1:=TovarName.Text;
  text2:=ID_IZM.Text;
  text3:=StrToFloat(Price.text);
  text4:=StrToFloat(Kolvo.Text);
  FDQuery2.SQL.Text :=
  'INSERT INTO DOCLADNAY (iddostavka, name, id_izm, kolvo, price) VALUES (:iddostavka, :name, :id_izm, :kolvo, :price)';
  FDQuery2.ParamByName('iddostavka').AsInteger := iddostavka;
  FDQuery2.ParamByName('name').AsString := text1;
  FDQuery2.ParamByName('id_izm').AsString := text2;
  FDQuery2.ParamByName('kolvo').AsFloat := text3;
  FDQuery2.ParamByName('price').AsFloat:=text4;
  FDQuery2.ExecSQL;
  FDQuery2.Connection.Commit;
  FDConnection1.Commit;
end;

procedure TForm2.Button2Click(Sender: TObject);
var f,l: integer;
begin
  Rep.OpenTemplate('C:\Users\shaku\Downloads\?????????.xlsx');

  FDQuery2.SQL.Text := 'select * from DOSTAVKA where id=:iddostavka';
  FDQuery2.ParamByName('iddostavka').AsInteger := iddostavka;
  FDQuery2.Open;
  Rep.PasteBand('A');
  Rep.SetValue('#D#', FDQuery2.FieldByName('DOSTAVKA_DATE').AsString);
  Rep.SetValue('#PB_NAME#', FDQuery2.FieldByName('POSTAVCHIk').AsString);
  Rep.SetValue('#ID#', FDQuery2.FieldByName('ID').AsString);
  FDQuery2.SQL.Text := 'select * from DOCLADNAY where iddostavka=:iddostavka';
  FDQuery2.ParamByName('iddostavka').AsInteger := iddostavka;
  FDQuery2.Open;
  f:=Rep.CurrentLine;
  while not FDQuery2.Eof do begin
    Rep.PasteBand('B');
    Rep.SetValue('#NAME#', FDQuery2.FieldByName('NAME').AsString);
    Rep.SetValue('#ID_IZM#', FDQuery2.FieldByName('ID_IZM').AsString);
    Rep.SetValue('#QUANT#', FDQuery2.FieldByName('KOLVO').AsString);
    Rep.SetValue('#PRICE#', FDQuery2.FieldByName('PRICE').AsString);
    Rep.SetValue('#SUMMA#', FDQuery2.FieldByName('SUMMA').AsString);
    FDQuery2.Next;
  end;
  l:=Rep.CurrentLine-1;

  Rep.PasteBand('C');
  Rep.SetSumFormula('#SUMMA#',f,l);

  Rep.Show;
end;

procedure TForm2.RefreshClick(Sender: TObject);
begin
  FDQuery1.Active:=False;
  FDQuery1.SQL.Text := 'select * from DOCLADNAY where iddostavka=:iddostavka';
  FDQuery1.ParamByName('iddostavka').AsInteger := iddostavka;
  {FDQuery1.Open;}
  FDQuery1.Active:=True;
end;

end.
