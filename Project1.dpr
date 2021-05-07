program Project1;

uses
  Vcl.Forms,
  MainMenu in 'MainMenu.pas' {Form1},
  Dostavka in 'Dostavka.pas' {Form3},
  Docladnay in 'Docladnay.pas' {Form2},
  Oplata in 'Oplata.pas' {Form4},
  Otchet in 'Otchet.pas' {Form5},
  Diagramma in 'Diagramma.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
