object DFormCadTrilhas: TDFormCadTrilhas
  Left = 0
  Top = 0
  Width = 977
  Height = 567
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  TabOrder = 0
  object UniPageControl1: TUniPageControl
    Left = 0
    Top = 0
    Width = 977
    Height = 567
    Hint = ''
    ActivePage = tabTrilhas
    TabBarVisible = False
    Align = alClient
    TabOrder = 0
    object tabTrilhas: TUniTabSheet
      Hint = ''
      Caption = 'Trilhas'
      Font.Color = clNavy
      ParentFont = False
      object UniPanel2: TUniPanel
        Left = 0
        Top = 0
        Width = 969
        Height = 539
        Hint = ''
        Align = alClient
        TabOrder = 0
        Caption = ''
        Layout = 'border'
        object dbgTrilhas: TUniDBGrid
          Left = 1
          Top = 51
          Width = 967
          Height = 487
          Hint = ''
          BodyRTL = True
          HeaderTitleAlign = taCenter
          DataSource = UniMainModule.dsTrilhas
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTitleClick, dgAutoRefreshRow]
          WebOptions.Paged = False
          WebOptions.FetchAll = True
          LoadMask.Message = 'Carregando...'
          Images = UniMainModule.UniImageListMenuGrud32
          BorderStyle = ubsNone
          Align = alClient
          Font.Name = 'CircularStd'
          ParentFont = False
          TabOrder = 1
          OnSelectionChange = dbgTrilhasSelectionChange
          OnCellClick = dbgTrilhasCellClick
          OnTitleClick = dbgTrilhasTitleClick
          OnColumnActionClick = dbgTrilhasColumnActionClick
          Columns = <
            item
              FieldName = 'TRI_NOME'
              Title.Alignment = taCenter
              Title.Caption = 'Nome da Trilha'
              Width = 225
              Font.Name = 'CircularStd'
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CC_TOTAL_CURSOS'
              Title.Alignment = taCenter
              Title.Caption = 'Cursos'
              Width = 97
              Font.Color = 4234574
              Font.Height = -19
              Font.Name = 'CircularStd'
              Tag = -1
              Alignment = taCenter
              ReadOnly = True
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'TRI_DATA_CADASTRO'
              Title.Alignment = taCenter
              Title.Caption = 'Data de Cadastro'
              Width = 166
              Font.Name = 'CircularStd'
              Alignment = taCenter
              Editor = edtDataCadatro
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'TRI_NOME_INTERNO'
              Title.Alignment = taCenter
              Title.Caption = 'Nome Interno'
              Width = 200
              Font.Name = 'CircularStd'
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CC_EM_CRIACAO'
              Title.Alignment = taCenter
              Title.Caption = 'Em Cria'#231#227'o'
              Width = 120
              Font.Name = 'CircularStd'
              Tag = -1
              Alignment = taCenter
              ReadOnly = True
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CC_ATIVO'
              Title.Alignment = taCenter
              Title.Caption = 'Ativo'
              Width = 100
              Font.Name = 'CircularStd'
              Tag = -1
              Alignment = taCenter
              ReadOnly = True
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'TRI_PALAVRAS_CHAVE'
              Title.Alignment = taCenter
              Title.Caption = 'Palavras Chave'
              Width = 200
              Font.Name = 'CircularStd'
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              ActionColumn.Enabled = True
              ActionColumn.Buttons = <
                item
                  ButtonId = 1
                  Hint = 'Excluir trilha'
                  ImageIndex = 2
                end>
              Title.Alignment = taCenter
              Title.Caption = 'Excluir'
              Width = 100
              Font.Name = 'CircularStd'
              Alignment = taCenter
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end>
        end
        object UniPanel5: TUniPanel
          Left = 1
          Top = 1
          Width = 967
          Height = 50
          Hint = ''
          Align = alTop
          TabOrder = 2
          Caption = ''
          object lblIncluirTrilha: TUniLabel
            AlignWithMargins = True
            Left = 10
            Top = 10
            Width = 29
            Height = 13
            Hint = ''
            TextConversion = txtHTML
            Caption = 'Incluir'
            TabOrder = 1
          end
          object edtPesquisarTrilhas: TUniEdit
            Left = 270
            Top = 10
            Width = 419
            Height = 30
            Hint = ''
            Text = ''
            TabOrder = 2
            EmptyText = 'Pequisar por: Nome da trilha, Nome interno ou palavras chave'
            CheckChangeDelay = 10
            OnChange = edtPesquisarTrilhasChange
          end
        end
        object UniHiddenPanel1: TUniHiddenPanel
          Left = 184
          Top = 144
          Width = 160
          Height = 105
          Hint = ''
          Visible = True
          object edtDataCadatro: TUniDateTimePicker
            Left = 16
            Top = 16
            Width = 120
            Hint = ''
            DateTime = 43504.000000000000000000
            DateFormat = 'dd/mm/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 1
          end
        end
      end
    end
    object tabCursosTrilhas: TUniTabSheet
      Hint = ''
      Caption = 'Cursos em trilhas'
      object dbgCursosTrilhas: TUniDBGrid
        Left = 0
        Top = 92
        Width = 969
        Height = 447
        Hint = ''
        DataSource = UniMainModule.dsCursosTrilhas
        WebOptions.Paged = False
        LoadMask.Message = 'Carregando...'
        Images = UniMainModule.UniImageListMenuGrud32
        Align = alClient
        ParentFont = False
        TabOrder = 0
        OnColumnActionClick = dbgCursosTrilhasColumnActionClick
        Columns = <
          item
            FieldName = 'CUR_NOME'
            Title.Alignment = taCenter
            Title.Caption = 'NOME DO CURSO'
            Width = 593
            ReadOnly = True
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            ActionColumn.Enabled = True
            ActionColumn.Buttons = <
              item
                ButtonId = 0
                ImageIndex = 0
              end
              item
                ButtonId = 1
                ImageIndex = 1
              end>
            Title.Alignment = taCenter
            Title.Caption = 'Ordem'
            Width = 107
            Alignment = taCenter
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            ActionColumn.Enabled = True
            ActionColumn.Buttons = <
              item
                ButtonId = 1
                Hint = 'Excluir o m'#243'dulo'
                ImageIndex = 2
              end>
            Title.Alignment = taCenter
            Title.Caption = 'Excluir'
            Width = 88
            Visible = False
            Alignment = taCenter
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end>
      end
      object UniPanel6: TUniPanel
        Left = 0
        Top = 0
        Width = 969
        Height = 50
        Hint = ''
        Align = alTop
        TabOrder = 1
        Caption = ''
        object lblVoltarTrilhas: TUniLabel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 31
          Height = 13
          Hint = ''
          TextConversion = txtHTML
          Caption = 'Trilhas'
          TabOrder = 1
        end
        object lblIncluirCursoEmTrilhas: TUniLabel
          AlignWithMargins = True
          Left = 120
          Top = 10
          Width = 29
          Height = 13
          Hint = ''
          ParentRTL = False
          TextConversion = txtHTML
          Caption = 'Incluir'
          TabOrder = 2
        end
        object edtPesquisarCursosTrilhas: TUniEdit
          Left = 270
          Top = 10
          Width = 300
          Height = 30
          Hint = ''
          Text = ''
          TabOrder = 3
          EmptyText = 'Pesquisar por nome do curso'
          CheckChangeDelay = 10
          OnChange = edtPesquisarCursosTrilhasChange
        end
      end
      object UniPanel1: TUniPanel
        Left = 0
        Top = 50
        Width = 969
        Height = 42
        Hint = ''
        Align = alTop
        TabOrder = 2
        Caption = ''
        object lblNomeTrilha: TUniLabel
          AlignWithMargins = True
          Left = 90
          Top = 11
          Width = 73
          Height = 19
          Hint = ''
          Margins.Right = 30
          Alignment = taRightJustify
          TextConversion = txtHTML
          Caption = 'Curso???'
          ParentFont = False
          Font.Color = 16744448
          Font.Height = -16
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
  end
end
