object DFormCadTrilhasFixas: TDFormCadTrilhasFixas
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
          Top = 93
          Width = 967
          Height = 445
          Hint = ''
          BodyRTL = True
          HeaderTitleAlign = taCenter
          DataSource = UniMainModule.dsTrilhasFixas
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTitleClick, dgAutoRefreshRow]
          WebOptions.Paged = False
          LoadMask.Message = 'Carregando...'
          Images = UniMainModule.UniImageListMenuGrud32
          BorderStyle = ubsNone
          Align = alClient
          Font.Name = 'CircularStd'
          ParentFont = False
          TabOrder = 1
          OnCellClick = dbgTrilhasCellClick
          OnColumnActionClick = dbgTrilhasColumnActionClick
          Columns = <
            item
              FieldName = 'TRI_NOME'
              Title.Alignment = taCenter
              Title.Caption = 'Nome da Trilha'
              Width = 259
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
              Width = 100
              Font.Name = 'CircularStd'
              Alignment = taCenter
            end
            item
              ActionColumn.Enabled = True
              ActionColumn.Buttons = <
                item
                  ButtonId = 1
                  Hint = 'Excluir trilha fixa'
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
            Left = 269
            Top = 13
            Width = 419
            Height = 30
            Hint = ''
            Text = ''
            TabOrder = 2
            EmptyText = 'Pequisar por: Nome da trilha'
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
        object UniPanel3: TUniPanel
          Left = 1
          Top = 51
          Width = 967
          Height = 42
          Hint = ''
          Align = alTop
          TabOrder = 4
          Caption = ''
          object UniLabel1: TUniLabel
            AlignWithMargins = True
            Left = 90
            Top = 11
            Width = 724
            Height = 19
            Hint = ''
            Margins.Right = 30
            Alignment = taRightJustify
            TextConversion = txtHTML
            Caption = 
              '<p class="text-primary">Trilhas que ser'#227'o exibidas fixadas na te' +
              'la inicial do aluno</p>'
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
end
