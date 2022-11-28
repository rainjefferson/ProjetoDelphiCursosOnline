object DFormVincularProfessoresCurso: TDFormVincularProfessoresCurso
  Left = 0
  Top = 0
  ClientHeight = 556
  ClientWidth = 694
  Caption = 'Vincular professores ao curso'
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
    DesignSize = (
      694
      49)
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
    object lblNomeCurso: TUniLabel
      AlignWithMargins = True
      Left = 343
      Top = 8
      Width = 348
      Height = 19
      Hint = ''
      Margins.Right = 30
      TextConversion = txtHTML
      AutoSize = False
      Caption = 'Curso???'
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = 16744448
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 2
    end
    object edtPesquisarProfessores: TUniEdit
      Left = 102
      Top = 10
      Width = 235
      Height = 30
      Hint = ''
      Text = ''
      TabOrder = 3
      EmptyText = 'Pesquisar Professores'
      CheckChangeDelay = 10
      OnChange = edtPesquisarProfessoresChange
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 49
    Width = 694
    Height = 507
    Hint = ''
    DataSource = UniMainModule.dsProfessoresCurso
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 1
    OnCellClick = UniDBGrid1CellClick
    Columns = <
      item
        FieldName = 'CC_MARCADO'
        Title.Alignment = taCenter
        Title.Caption = 'Vinculado'
        Width = 114
        Alignment = taCenter
        ReadOnly = True
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'CC_FOTO'
        Title.Alignment = taCenter
        Title.Caption = 'FOTO'
        Width = 103
        Alignment = taCenter
      end
      item
        FieldName = 'PRO_NOME'
        Title.Alignment = taCenter
        Title.Caption = 'Professor'
        Width = 450
        ReadOnly = True
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end>
  end
end
