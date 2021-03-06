unit Dostavka;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Script,
  Datasnap.Provider, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TForm3 = class(TForm)
    Postavchik: TEdit;
    Poluchatel: TEdit;
    DostavkaDate: TDateTimePicker;
    DBGrid1: TDBGrid;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    Button1: TButton;
    FDQuery2: TFDQuery;
    Button2: TButton;
    idedit: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  iddostavka:Integer;

implementation

{$R *.dfm}
uses DateUtils,SqlTimSt,Docladnay;

procedure TForm3.Button1Click(Sender: TObject);
var text1,text2,text3: string;
begin
  text1:=Postavchik.Text;
  text2:=Poluchatel.Text;
  text3:=DateToStr(DostavkaDate.Date);
  FDConnection1.StartTransaction;
  try
  FDQuery2.SQL.Text := 'INSERT INTO DOSTAVKA (POSTAVCHIK, POLUCHATEL, DOSTAVKA_DATE) VALUES (:POSTAVCHIK, :POLUCHATEL, :DOSTAVKA_DATE) returning ID';
  FDQuery2.ParamByName('POSTAVCHIK').AsString := text1;
  FDQuery2.ParamByName('POLUCHATEL').AsString := text2;
  FDQuery2.ParamByName('DOSTAVKA_DATE').AsSQLTimeStamp :=
  Data.SqlTimSt.DateTimeToSQLTimeStamp(System.DateUtils.DateOf(DostavkaDate.DateTime));
  //FDQuery2.ExecSQL;
  FDQuery2.Open;
  idedit.Text:=FDQuery2.Fields[0].Value;
  iddostavka:=FDQuery2.Fields[0].Value;
  //FDQuery2.Free;
  FDQuery2.Connection.Commit;
  FDConnection1.Commit;
  finally
  end;
  Form2.ShowModal;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  FDQuery1.Active:=False;
  FDQuery1.Active:=True;
end;

end.
