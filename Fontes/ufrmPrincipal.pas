unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    pnl_topo: TPanel;
    spb_fechar: TSpeedButton;
    Label_DocumentoSeparadacao: TLabel;
    img_logo: TImage;
    spb_minimizar: TSpeedButton;
    spb_usuario: TSpeedButton;
    spb_Empresa: TSpeedButton;
    lbl_acesso_rapido: TLabel;
    lbl_pesquisar: TLabel;
    pnl_rapido_calcular: TPanel;
    shp_rapido_calcular: TShape;
    spb_rapido_calcular: TSpeedButton;
    pnl_pesquisa: TPanel;
    shp_pesquisa: TShape;
    spb_pesquisa: TSpeedButton;
    edt_pesquisa: TEdit;
    procedure spb_fecharClick(Sender: TObject);
    procedure spb_minimizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spb_rapido_calcularClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses ufrmSimulacao, UfrmLogin;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {Limpar o formulario da memoria ao fecha-lo..}
  Action := TCloseAction.caFree;
  frmPrincipal := nil;
  {Fim}
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin

  if not Assigned(frmLogin) then
  begin
    Application.CreateForm(TfrmLogin,frmLogin);
  end;

  frmLogin.Show;

end;

procedure TfrmPrincipal.spb_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.spb_minimizarClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TfrmPrincipal.spb_rapido_calcularClick(Sender: TObject);
begin

  if not Assigned(frmSimulacao) then
  begin
    Application.CreateForm(TfrmSimulacao,frmSimulacao);
  end;

  frmSimulacao.Show;

end;

end.
