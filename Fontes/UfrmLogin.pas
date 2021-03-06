unit UfrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Imaging.jpeg, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmLogin = class(TForm)
    pnl_central: TPanel;
    pnl_principal: TPanel;
    shp_fundo: TShape;
    pnl_usuario: TPanel;
    lbl_nome_usuario: TLabel;
    edt_cnpj_emp: TEdit;
    pnl_barra_nome: TPanel;
    pnl_senha: TPanel;
    lbl_senha: TLabel;
    edt_senha: TEdit;
    pnl_barra_senha: TPanel;
    pnl_entrar: TPanel;
    btn_entrar: TSpeedButton;
    pnl_cancelar: TPanel;
    btn_cancelar: TSpeedButton;
    pnl_suspenso: TPanel;
    lbl_login: TLabel;
    img_logo_empresa: TImage;
    lbl_texto: TLabel;
    btn_servidor: TSpeedButton;
    btn_ferramentas: TSpeedButton;
    btn_ajuda: TSpeedButton;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_entrarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}


procedure TfrmLogin.btn_entrarClick(Sender: TObject);
begin
  frmLogin.Close;
end;

procedure TfrmLogin.btn_fecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {Limpar o formulario da memoria ao fecha-lo..}
  Action := TCloseAction.caFree;
  frmLogin := nil;
  {Fim}
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = VK_ESCAPE then
  begin
    Application.Terminate;
  end;

  if ((ssAlt in Shift) and (Key = VK_F4)) then
  begin
  Key := 0;
  end;

end;

procedure TfrmLogin.FormResize(Sender: TObject);
begin
  pnl_central.Top  := Round ( frmLogin.Height / 2 - pnl_central.Height / 2 );
  pnl_central.Left := Round ( frmLogin.Width / 2 - pnl_central.Width / 2 );
end;

end.
