object DFormVincularCursosTrilhasFixas: TDFormVincularCursosTrilhasFixas
  Left = 0
  Top = 0
  ClientHeight = 556
  ClientWidth = 694
  Caption = 'Definir trilhas fixas'
  OldCreateOrder = False
  OnClose = UniFormClose
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 694
    Height = 49
    Hint = ''
    Align = alTop
    TabOrder = 0
    Caption = ''
    object lblVoltar: TUniLabel
      AlignWithMargins = True
      Left = 6
      Top = 10
      Width = 28
      Height = 13
      Hint = ''
      TextConversion = txtHTML
      Caption = 'Voltar'
      TabOrder = 1
    end
    object edtPesquisarTrilhas: TUniEdit
      Left = 102
      Top = 10
      Width = 235
      Height = 30
      Hint = ''
      Text = ''
      TabOrder = 2
      EmptyText = 'Pesquisar trilhas'
      CheckChangeDelay = 10
      OnChange = edtPesquisarTrilhasChange
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 49
    Width = 694
    Height = 507
    Hint = ''
    DataSource = UniMainModule.dsCdsTrilhasFixas
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 1
    OnCellClick = UniDBGrid1CellClick
    Columns = <
      item
        FieldName = 'CC_MARCADO'
        Title.Alignment = taCenter
        Title.Caption = 'Incluir'
        Width = 114
        Alignment = taCenter
        ReadOnly = True
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'TRI_NOME'
        Title.Alignment = taCenter
        Title.Caption = 'Nome da Trilha'
        Width = 450
        ReadOnly = True
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end>
  end
end
