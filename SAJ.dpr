program SAJ;

uses
  Vcl.Forms,
  ufrmPrincipal in 'Fontes\ufrmPrincipal.pas' {frmPrincipal},
  ufrmSimulacao in 'Fontes\ufrmSimulacao.pas' {frmSimulacao},
  cJuros in 'Classes\cJuros.pas',
  UfrmLogin in 'Fontes\UfrmLogin.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
