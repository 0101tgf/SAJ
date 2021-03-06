unit cJuros;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,Math;

type
  TJuros = class
  private
    F_Capital: Currency;
    F_Tx_juros: Currency;
    F_Meses: integer;
    F_Tot_Juros: Currency;
    F_Tot_Pag: Currency;

  public
   constructor Create(pCapital, pTx_Juros:Currency;pMeses:Integer);
   destructor  Destroy; override;
   function    fCalcularPagamentoUnico(out vMemoria:TFDMemTable):Boolean;

  published
  property Capital    :Currency read F_Capital   write F_Capital;
  property Tx_juros   :Currency read F_Tx_juros  write F_Tx_juros;
  property Meses     :integer  read F_Meses    write F_Meses;
  property Tot_Juros  :Currency read F_Tot_Juros write F_Tot_Juros;
  property Tot_Pag    :Currency read F_Tot_Pag   write F_Tot_Pag;
  end;

implementation

{ TJuros }

{Teste Tecnico}

{$region 'CONSTRUTOR E DESTRUIDOR'}
constructor TJuros.Create(pCapital, pTx_Juros: Currency; pMeses: Integer);
begin

 Capital  := pCapital;
 Tx_juros := pTx_Juros;
 Meses   :=  pMeses

end;

destructor TJuros.Destroy;
begin

  inherited;
end;
{$endregion}

{$region 'CRUD'}
function TJuros.fCalcularPagamentoUnico(out vMemoria: TFDMemTable): Boolean;
var
 I : integer;
begin

  Result := true;

  try

    Self.Tx_juros := Self.Tx_juros/100;
    Self.F_Tot_Pag := self.Capital * Power(1+Self.Tx_juros,Self.Meses);
    Self.F_Tot_Juros := Self.F_Tot_Pag - Self.Capital;

    for I := 0 to self.Meses do
    begin

     vMemoria.Append;
     vMemoria.FieldByName('n').AsInteger := I;

     if I = 0 then
     begin
     vMemoria.FieldByName('Juros').AsCurrency :=  self.Capital * Power(1+Self.Tx_juros,I) - self.Capital * Power(1+Self.Tx_juros,I);
     end
     else if I > 0 then
     begin
     vMemoria.FieldByName('Juros').AsCurrency :=  self.Capital * Power(1+Self.Tx_juros,I) - self.Capital * Power(1+Self.Tx_juros,I-1);
     end;

     vMemoria.FieldByName('Devedor').AsCurrency := self.Capital * Power(1+Self.Tx_juros,I);
     vMemoria.Post;

    end;


  except
  Result := false;
  end;


end;
{$endregion}

end.
