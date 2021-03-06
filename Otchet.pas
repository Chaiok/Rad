unit Otchet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TForm5 = class(TForm)
    Button1: TButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ListBox1: TListBox;
    Postavchik: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses ComObj,SqlTimSt,DateUtils;

procedure TForm5.Button1Click(Sender: TObject);
var  text1,text2: TDateTime;
Application: variant;
  I: Integer;
  S,O: double;
  Range1: variant;
  text3: string;
begin
  Application:= ComObj.CreateOleObject('Word.Application');
  //Application.Documents.Add;
  //Application.Documents.Item(1).Activate;
  if (DateTimePicker1.DateTime<DateTimePicker2.DateTime) then
  begin
    text1:=DateTimePicker1.DateTime;
    text2:=DateTimePicker2.DateTime;
  end
  else begin
    text1:=DateTimePicker2.DateTime;
    text2:=DateTimePicker1.DateTime;
  end;
  Application.Documents.Open('C:\Users\shaku\Downloads\test.docx');
  Application.Documents.Item(1).Activate;
  //Application.ActiveDocument.Paragraphs.Add;
  //Range1:=Application.ActiveDocument.Paragraphs.Item(1).Range;
  //Range1.InsertAfter('??? ????? InsertAfter');
  Application.ActiveDocument.Paragraphs.Add.Range.InsertAfter('?????????  ????? ?????????');
  for I := 0 to ListBox1.Count-1 do begin
    FDQuery1.SQL.Text :=
    'select id from DOSTAVKA where (postavchik=:postavchik and dostavka_date BETWEEN :text1 and :text2)';
    FDQuery1.ParamByName('postavchik').AsString := ListBox1.Items[I];
    FDQuery1.ParamByName('text1').AsSQLTimeStamp :=
    Data.SqlTimSt.DateTimeToSQLTimeStamp(System.DateUtils.DateOf(text1));
    FDQuery1.ParamByName('text2').AsSQLTimeStamp :=
    Data.SqlTimSt.DateTimeToSQLTimeStamp(System.DateUtils.DateOf(text2));
    FDQuery1.Open;

    S:=0;
    O:=0;
    while not FDQuery1.Eof do begin
      FDQuery2.SQL.Text :=
      'select summa,oplacheno from oplata where id=:id';
      FDQuery2.ParamByName('id').AsInteger := FDQuery1.FieldByName('ID').AsInteger;
      FDQuery2.Open;

      S:=S+FDQuery2.FieldByName('summa').AsFloat;
      O:=O+FDQuery2.FieldByName('oplacheno').AsFloat;
      
      FDQuery1.Next;
    end;

    text3:= ListBox1.Items[I]+' '+S.ToString+'  '+(S-O).ToString;
    Application.ActiveDocument.Paragraphs.Add.Range.InsertAfter(text3);
    
  end;
  

  //Application.ActiveDocument.Paragraphs.Add;
  Application.ActiveDocument.Close;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  ListBox1.Items.Add(Postavchik.Text);
end;

end.
