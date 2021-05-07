unit MainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Phys.IBDef, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.IBBase, FireDAC.Phys.IB, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, Vcl.Menus;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    magazin: TMenuItem;
    dostavka: TMenuItem;
    otchet: TMenuItem;
    diagramma: TMenuItem;
    oplata: TMenuItem;
    procedure dostavkaClick(Sender: TObject);
    procedure oplataClick(Sender: TObject);
    procedure otchetClick(Sender: TObject);
    procedure diagrammaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Dostavka,Oplata,Otchet,Diagramma;

procedure TForm1.diagrammaClick(Sender: TObject);
begin
  Form6.ShowModal;
end;

procedure TForm1.dostavkaClick(Sender: TObject);
begin
  Form3.ShowModal;
end;

procedure TForm1.oplataClick(Sender: TObject);
begin
  Form4.ShowModal;
end;

procedure TForm1.otchetClick(Sender: TObject);
begin
  Form5.ShowModal;
end;

end.
