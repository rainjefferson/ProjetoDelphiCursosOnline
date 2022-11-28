object DProfessoresForm: TDProfessoresForm
  Left = 0
  Top = 0
  Width = 958
  Height = 480
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  Font.Name = 'CircularStd'
  TabOrder = 0
  ParentFont = False
  object dbgProfessores: TUniDBGrid
    Left = 0
    Top = 50
    Width = 958
    Height = 430
    Hint = ''
    DataSource = UniMainModule.dsProfessores
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    Images = UniMainModule.UniImageListMenuGrud32
    LayoutConfig.Region = 'center'
    BorderStyle = ubsNone
    Align = alClient
    Font.Name = 'CircularStd'
    ParentFont = False
    TabOrder = 0
    OnCellClick = dbgProfessoresCellClick
    OnTitleClick = dbgProfessoresTitleClick
    OnColumnActionClick = dbgProfessoresColumnActionClick
    Columns = <
      item
        FieldName = 'CC_FOTO'
        Title.Alignment = taCenter
        Title.Caption = 'FOTO'
        Width = 103
        Font.Name = 'CircularStd'
        Alignment = taCenter
        ReadOnly = True
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'PRO_NOME'
        Title.Alignment = taCenter
        Title.Caption = 'Professor'
        Width = 299
        Font.Name = 'CircularStd'
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'PRO_DATA_CADASTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Data de cadastro'
        Width = 153
        Font.Name = 'CircularStd'
        Alignment = taCenter
        Editor = edtDataCadastroProfessor
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'CC_ATIVO'
        Title.Alignment = taCenter
        Title.Caption = 'Ativo'
        Width = 100
        Font.Name = 'CircularStd'
        Alignment = taCenter
        ReadOnly = True
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'CC_TEXTO_HTML'
        Title.Alignment = taCenter
        Title.Caption = 'Texto Html'
        Width = 107
        Font.Name = 'CircularStd'
        Alignment = taCenter
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        ActionColumn.Enabled = True
        ActionColumn.Buttons = <
          item
            ButtonId = 1
            Hint = 'Excluir o usu'#225'rio'
            ImageIndex = 2
          end>
        Title.Alignment = taCenter
        Title.Caption = 'Excluir'
        Width = 79
        Font.Name = 'CircularStd'
        Alignment = taCenter
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end>
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 958
    Height = 50
    Hint = ''
    Align = alTop
    TabOrder = 1
    Caption = ''
    object lblVoltar: TUniLabel
      AlignWithMargins = True
      Left = 454
      Top = 31
      Width = 29
      Height = 14
      Hint = ''
      Visible = False
      TextConversion = txtHTML
      Caption = 'Voltar'
      TabOrder = 1
    end
    object lblIncluir: TUniLabel
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 31
      Height = 14
      Hint = ''
      TextConversion = txtHTML
      Caption = 'Incluir'
      TabOrder = 2
    end
    object lblAlterar: TUniLabel
      AlignWithMargins = True
      Left = 438
      Top = 27
      Width = 35
      Height = 14
      Hint = ''
      Visible = False
      TextConversion = txtHTML
      Caption = 'Alterar'
      TabOrder = 3
    end
    object lblExcluir: TUniLabel
      AlignWithMargins = True
      Left = 477
      Top = 31
      Width = 34
      Height = 14
      Hint = ''
      Visible = False
      TextConversion = txtHTML
      Caption = 'Excluir'
      TabOrder = 4
    end
    object lblGravar: TUniLabel
      AlignWithMargins = True
      Left = 488
      Top = 31
      Width = 35
      Height = 14
      Hint = ''
      Visible = False
      TextConversion = txtHTML
      Caption = 'Gravar'
      TabOrder = 5
    end
    object edtPesquisarProfessor: TUniEdit
      Left = 270
      Top = 10
      Width = 300
      Height = 30
      Hint = ''
      Text = ''
      TabOrder = 6
      EmptyText = 'Pesquisar Professores'
      CheckChangeDelay = 10
      OnChange = edtPesquisarProfessorChange
    end
  end
  object UniHiddenPanel1: TUniHiddenPanel
    Left = 208
    Top = 144
    Width = 160
    Height = 129
    Hint = ''
    Visible = True
    object edtDataCadastroProfessor: TUniDateTimePicker
      Left = 24
      Top = 16
      Width = 120
      Hint = ''
      DateTime = 43511.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
  end
end
