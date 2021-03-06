object frmSimulacao: TfrmSimulacao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Simula'#231#227'o de financiamento'
  ClientHeight = 355
  ClientWidth = 767
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 140
    Top = 9
    Width = 30
    Height = 13
    Caption = 'Juros:'
  end
  object DBGrid_Simulador: TDBGrid
    Left = 0
    Top = 57
    Width = 767
    Height = 247
    Align = alClient
    DataSource = DataSource_Calculos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'n'
        Title.Caption = 'Parcela'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Juros'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Devedor'
        Title.Caption = 'Saldo devedor'
        Width = 226
        Visible = True
      end>
  end
  object Panel_Calculo: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object GroupBox_Dados: TGroupBox
      AlignWithMargins = True
      Left = 124
      Top = 3
      Width = 362
      Height = 51
      Align = alLeft
      TabOrder = 0
      object Label1: TLabel
        Left = 13
        Top = 5
        Width = 57
        Height = 13
        Caption = 'Capital (R$)'
      end
      object Label2: TLabel
        Left = 120
        Top = 5
        Width = 88
        Height = 13
        Caption = 'Taxa de juros (%)'
      end
      object Label3: TLabel
        Left = 231
        Top = 5
        Width = 45
        Height = 13
        Caption = 'N'#176' meses'
      end
      object Edit_Capital: TEdit
        Left = 13
        Top = 21
        Width = 100
        Height = 21
        TabOrder = 0
        Text = '0,00'
        OnKeyPress = Edit_CapitalKeyPress
      end
      object Edit_TaxaJuros: TEdit
        Left = 121
        Top = 21
        Width = 100
        Height = 21
        TabOrder = 1
        Text = '0,00'
        OnKeyPress = Edit_TaxaJurosKeyPress
      end
      object Edit_Meses: TEdit
        Left = 231
        Top = 21
        Width = 100
        Height = 21
        TabOrder = 2
        Text = '0'
        OnKeyPress = Edit_MesesKeyPress
      end
    end
    object pnl_cancelar: TPanel
      AlignWithMargins = True
      Left = 637
      Top = 10
      Width = 120
      Height = 37
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alRight
      BevelOuter = bvNone
      Color = 16024898
      ParentBackground = False
      TabOrder = 1
      object SpeedButton_Cancelar: TSpeedButton
        Left = 0
        Top = 0
        Width = 120
        Height = 37
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Cancelar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton_CancelarClick
        ExplicitLeft = -7
        ExplicitTop = 4
      end
    end
    object Panel_Dados: TPanel
      Left = 0
      Top = 0
      Width = 121
      Height = 57
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Dados p/ Calculo'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 502
      Top = 10
      Width = 120
      Height = 37
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 5
      Margins.Bottom = 10
      Align = alRight
      BevelOuter = bvNone
      Color = 16024898
      ParentBackground = False
      TabOrder = 3
      object SpeedButton_Calcular: TSpeedButton
        Left = 0
        Top = 0
        Width = 120
        Height = 37
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Calcular'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton_CalcularClick
        ExplicitLeft = 2
        ExplicitTop = 4
      end
    end
  end
  object Panel_Totais: TPanel
    Left = 0
    Top = 304
    Width = 767
    Height = 51
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label4: TLabel
      Left = 131
      Top = 5
      Width = 75
      Height = 13
      Caption = 'Total juros (R$)'
    end
    object Label6: TLabel
      Left = 252
      Top = 5
      Width = 105
      Height = 13
      Caption = 'Total pagamento (R$)'
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 121
      Height = 51
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Totais:'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object Edit_TotalJuros: TEdit
      Left = 131
      Top = 23
      Width = 110
      Height = 21
      ReadOnly = True
      TabOrder = 1
      Text = '0,00'
    end
    object Edit_TotalPagamento: TEdit
      Left = 250
      Top = 23
      Width = 110
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Text = '0,00'
    end
  end
  object FDMemTable_Calculos: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'n'
        DataType = ftInteger
      end
      item
        Name = 'Juros'
        DataType = ftCurrency
        Precision = 19
      end
      item
        Name = 'Devedor'
        DataType = ftCurrency
        Precision = 19
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 616
    Top = 184
    object FDMemTable_Calculosn: TIntegerField
      FieldName = 'n'
    end
    object FDMemTable_CalculosJuros: TCurrencyField
      FieldName = 'Juros'
    end
    object FDMemTable_CalculosDevedor: TCurrencyField
      FieldName = 'Devedor'
    end
  end
  object DataSource_Calculos: TDataSource
    DataSet = FDMemTable_Calculos
    Left = 616
    Top = 120
  end
end
