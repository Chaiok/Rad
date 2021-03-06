unit Oplata;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Vcl.StdCtrls,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TForm4 = class(TForm)
    DBGrid1: TDBGrid;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    iddostavki: TEdit;
    Button1: TButton;
    Oplata: TEdit;
    Button2: TButton;
    Button3: TButton;
    FDQuery2: TFDQuery;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses DateUtils,SqlTimSt;

procedure TForm4.Button1Click(Sender: TObject);
var
    text1: double;
    text2: TDateTime;
begin
  FDQuery2.SQL.Text :='select dostavka_date from dostavka where id=:iddostavka';
  FDQuery2.ParamByName('iddostavka').AsInteger := StrToInt(iddostavki.Text);
  FDQuery2.Open;
  text2:=FDQuery2.FieldByName('dostavka_date').AsDateTime;
  FDQuery2.Close;

  FDQuery2.SQL.Text :='select summa from docladnay where iddostavka=:iddostavka';
  FDQuery2.ParamByName('iddostavka').AsInteger := StrToInt(iddostavki.Text);
  FDQuery2.Open;
  text1:=0;
  while not FDQuery2.Eof do begin
    text1:=text1+FDQuery2.FieldByName('summa').AsFloat;
    FDQuery2.Next;
  end;
  FDQuery2.Close;

  FDQuery2.SQL.Text :=
  'INSERT INTO OPLATA (id, summa, oplacheno, dostavka_date) VALUES (:id, :summa, :oplacheno, :dostavkadate)';
  FDQuery2.ParamByName('id').AsInteger := StrToInt(iddostavki.Text);
  FDQuery2.ParamByName('summa').AsFloat := text1;
  FDQuery2.ParamByName('oplacheno').AsFloat := 0;
  FDQuery2.ParamByName('dostavkadate').AsSQLTimeStamp :=
  Data.SqlTimSt.DateTimeToSQLTimeStamp(System.DateUtils.DateOf(text2));
  FDQuery2.ExecSQL;
  //FDQuery2.Open;
  FDQuery2.Connection.Commit;
  FDConnection1.Commit;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  FDQuery2.SQL.Text :=
  'UPDATE OPLATA SET oplacheno=:oplacheno where id=:iddostavka';
  FDQuery2.ParamByName('iddostavka').AsInteger := StrToInt(iddostavki.Text);
  FDQuery2.ParamByName('oplacheno').AsFloat := StrToFloat(Oplata.Text);
  FDQuery2.ExecSQL;
  FDQuery2.Connection.Commit;
  FDConnection1.Commit;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
  FDQuery1.Active:=False;
  FDQuery1.SQL.Text := 'select * from OPLATA where id=:iddostavka';
  FDQuery1.ParamByName('iddostavka').AsInteger := StrToInt(iddostavki.Text);
  {FDQuery1.Open;}
  FDQuery1.Active:=True;
end;

end.
