program Project1;

uses
  Vcl.Forms,
  MainMenu in 'MainMenu.pas' {Form1},
  Dostavka in 'Dostavka.pas' {Form3},
  Docladnay in 'Docladnay.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
