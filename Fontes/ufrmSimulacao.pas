unit ufrmSimulacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmSimulacao = class(TForm)
    DBGrid_Simulador: TDBGrid;
    Panel_Calculo: TPanel;
    Panel_Dados: TPanel;
    GroupBox_Dados: TGroupBox;
    Edit_Capital: TEdit;
    Label1: TLabel;
    Edit_TaxaJuros: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit_Meses: TEdit;
    pnl_cancelar: TPanel;
    SpeedButton_Cancelar: TSpeedButton;
    Panel1: TPanel;
    SpeedButton_Calcular: TSpeedButton;
    Panel_Totais: TPanel;
    Panel2: TPanel;
    Edit_TotalJuros: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit_TotalPagamento: TEdit;
    FDMemTable_Calculos: TFDMemTable;
    DataSource_Calculos: TDataSource;
    FDMemTable_Calculosn: TIntegerField;
    FDMemTable_CalculosJuros: TCurrencyField;
    FDMemTable_CalculosDevedor: TCurrencyField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pLimparCampos;
    procedure SpeedButton_CancelarClick(Sender: TObject);
    procedure Edit_CapitalKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_TaxaJurosKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_MesesKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton_CalcularClick(Sender: TObject);
    function  fValidarCamposVazios:Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSimulacao: TfrmSimulacao;

implementation

{$R *.dfm}

uses cJuros;

procedure TfrmSimulacao.Edit_CapitalKeyPress(Sender: TObject; var Key: Char);
begin

  if key in ['0','1','2','3','4','5','6','7','8','9',',',#8] = false then
  begin
  key:=#0;
  end;

end;

procedure TfrmSimulacao.Edit_MesesKeyPress(Sender: TObject; var Key: Char);
begin

  if key in ['0','1','2','3','4','5','6','7','8','9',#8] = false then
  begin
  key:=#0;
  end;

end;

procedure TfrmSimulacao.Edit_TaxaJurosKeyPress(Sender: TObject; var Key: Char);
begin

  if key in ['0','1','2','3','4','5','6','7','8','9',',',#8] = false then
  begin
  key:=#0;
  end;

end;

procedure TfrmSimulacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {Limpar o formulario da memoria ao fecha-lo..}
  Action := TCloseAction.caFree;
  frmSimulacao := nil;
  {Fim}
end;

function TfrmSimulacao.fValidarCamposVazios: Boolean;
begin

  Result := true;

  if (StrToCurr(Edit_Capital.Text) <= 0) or (StrToCurr(Edit_Meses.Text) <= 0)
  or (StrToCurr(Edit_TaxaJuros.Text) <= 0) then
  begin
    Result := false;
  end;

end;

procedure TfrmSimulacao.pLimparCampos;
begin
  Edit_Capital.Text        := '0,00';
  Edit_TaxaJuros.Text      := '0,00';
  Edit_Meses.Text         := '0';
  Edit_TotalJuros.Text     := '0,00';
  Edit_TotalJuros.Text     := '0,00';
  Edit_TotalPagamento.Text := '0,00';
  FDMemTable_Calculos.Active := false;
  FDMemTable_Calculos.Active := true;
end;

procedure TfrmSimulacao.SpeedButton_CalcularClick(Sender: TObject);
var
  classeJuros : TJuros;
  vCapital : Currency;
  vTaxaJuros : Currency;
  vMeses : integer;
begin

  if not fValidarCamposVazios then
  begin
    ShowMessage('Aten??o, os dados para calculo n?o podem ser vazios..');
    exit;
  end;

  vCapital   := StrToCurr(Edit_Capital.Text);
  vTaxaJuros := StrToCurr(Edit_TaxaJuros.Text);
  vMeses    := StrToInt(Edit_Meses.Text);

  classeJuros := TJuros.Create(vCapital,vTaxaJuros,vMeses);
  try

   FDMemTable_Calculos.Active := false;
   FDMemTable_Calculos.Active := true;

    if not classeJuros.fCalcularPagamentoUnico(FDMemTable_Calculos) then
    begin
    ShowMessage('Falha ao simular juros, solicite suporte..');
    exit;
    end;

   Edit_TotalJuros.Text     := FormatFloat('#,,0.00', classeJuros.Tot_Juros);
   Edit_TotalPagamento.Text := FormatFloat('#,,0.00', classeJuros.Tot_Pag);

  finally
  classeJuros.DisposeOf;
  end;

end;

procedure TfrmSimulacao.SpeedButton_CancelarClick(Sender: TObject);
begin
  pLimparCampos;
end;

end.
