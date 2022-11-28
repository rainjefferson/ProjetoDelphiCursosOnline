object DUsersForm: TDUsersForm
  Left = 0
  Top = 0
  Width = 958
  Height = 480
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  Font.Name = 'CircularStd'
  TabOrder = 0
  ParentFont = False
  object dbgUsuarios: TUniDBGrid
    Left = 0
    Top = 50
    Width = 958
    Height = 430
    Hint = ''
    DataSource = UniMainModule.dsUsers
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    Images = UniMainModule.UniImageListMenuGrud32
    LayoutConfig.Region = 'center'
    BorderStyle = ubsNone
    Align = alClient
    TabOrder = 0
    OnCellClick = dbgUsuariosCellClick
    OnTitleClick = dbgUsuariosTitleClick
    OnColumnActionClick = dbgUsuariosColumnActionClick
    Columns = <
      item
        FieldName = 'CC_FOTO'
        Title.Alignment = taCenter
        Title.Caption = 'Foto'
        Width = 76
        Font.Name = 'CircularStd'
        Tag = -1
        Alignment = taCenter
        ReadOnly = True
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'USU_LOGIN'
        Title.Alignment = taCenter
        Title.Caption = 'Login'
        Width = 112
        Font.Name = 'CircularStd'
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'USU_SENHA'
        Title.Alignment = taCenter
        Title.Caption = 'Senha'
        Width = 85
        Font.Name = 'CircularStd'
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'USU_EMAIL'
        Title.Alignment = taCenter
        Title.Caption = ' E-mail'
        Width = 123
        Font.Name = 'CircularStd'
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'CC_ADMIN'
        Title.Alignment = taCenter
        Title.Caption = 'Administrador'
        Width = 135
        Font.Name = 'CircularStd'
        Tag = -1
        Alignment = taCenter
        ReadOnly = True
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'CC_ALUNOS'
        Title.Alignment = taCenter
        Title.Caption = 'Alunos'
        Width = 100
        Font.Name = 'CircularStd'
        Tag = -1
        Alignment = taCenter
        ReadOnly = True
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'CC_FINANCEIRO'
        Title.Alignment = taCenter
        Title.Caption = 'Financeiro'
        Width = 105
        Font.Name = 'CircularStd'
        Tag = -1
        Alignment = taCenter
        ReadOnly = True
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'CC_CURSOS'
        Title.Alignment = taCenter
        Title.Caption = 'Cursos'
        Width = 100
        Font.Name = 'CircularStd'
        Tag = -1
        Alignment = taCenter
        ReadOnly = True
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'CC_SUPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Suporte'
        Width = 100
        Font.Name = 'CircularStd'
        Tag = -1
        Alignment = taCenter
        ReadOnly = True
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'CC_GAMEFICA'
        Title.Alignment = taCenter
        Title.Caption = 'Gamefica'#231#227'o'
        Width = 127
        Font.Name = 'CircularStd'
        Tag = -1
        Alignment = taCenter
        ReadOnly = True
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'CC_DOCUMENTOS'
        Title.Alignment = taCenter
        Title.Caption = 'Documentos'
        Width = 118
        Font.Name = 'CircularStd'
        Tag = -1
        Alignment = taCenter
        ReadOnly = True
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'CC_RELATORIOS'
        Title.Alignment = taCenter
        Title.Caption = 'Relat'#243'rios'
        Width = 113
        Font.Name = 'CircularStd'
        Tag = -1
        Alignment = taCenter
        ReadOnly = True
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'CC_TRILHAS'
        Title.Alignment = taCenter
        Title.Caption = 'Trilhas'
        Width = 100
        Font.Name = 'CircularStd'
        Tag = -1
        Alignment = taCenter
        ReadOnly = True
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
      Top = 8
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
  end
end
