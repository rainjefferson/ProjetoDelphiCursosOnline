object DFormCadCursos: TDFormCadCursos
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
    ActivePage = tabCursos
    TabBarVisible = False
    Align = alClient
    TabOrder = 0
    object tabCursos: TUniTabSheet
      Hint = ''
      Caption = 'Cursos'
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
        object dbgCursos: TUniDBGrid
          Left = 1
          Top = 51
          Width = 967
          Height = 487
          Hint = ''
          BodyRTL = True
          HeaderTitleAlign = taCenter
          DataSource = UniMainModule.dsCursos
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTitleClick, dgAutoRefreshRow]
          WebOptions.Paged = False
          LoadMask.Message = 'Carregando...'
          Images = UniMainModule.UniImageListMenuGrud32
          BorderStyle = ubsNone
          Align = alClient
          Font.Name = 'CircularStd'
          ParentFont = False
          TabOrder = 1
          OnSelectionChange = dbgCursosSelectionChange
          OnCellClick = dbgCursosCellClick
          OnTitleClick = dbgCursosTitleClick
          OnColumnActionClick = dbgCursosColumnActionClick
          Columns = <
            item
              FieldName = 'CUR_NOME'
              Title.Alignment = taCenter
              Title.Caption = 'Nome do curso'
              Width = 172
              Font.Name = 'CircularStd'
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CC_TOTAL_MODULOS'
              Title.Alignment = taCenter
              Title.Caption = 'M'#211'DULOS'
              Width = 96
              Font.Color = 4234574
              Font.Height = -19
              Font.Name = 'CircularStd'
              Font.Style = [fsBold]
              Tag = -1
              Alignment = taCenter
              ReadOnly = True
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              ShowToolTipAlways = False
              FieldName = 'CC_TOTAL_PROFESSORES'
              Title.Alignment = taCenter
              Title.Caption = 'Professores'
              Width = 124
              Font.Color = 4234574
              Font.Height = -19
              Font.Name = 'CircularStd'
              Font.Style = [fsBold]
              Tag = -1
              Alignment = taCenter
              ReadOnly = True
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CUR_DATA_CADASTRO'
              Title.Alignment = taCenter
              Title.Caption = 'Data de cadastro'
              Width = 163
              Font.Name = 'CircularStd'
              Alignment = taCenter
              Editor = edtDataCadatro
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
              FieldName = 'CC_DESTAQUE'
              Title.Alignment = taCenter
              Title.Caption = 'Destaque'
              Width = 105
              Font.Name = 'CircularStd'
              Tag = -1
              Alignment = taCenter
              ReadOnly = True
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CUR_VALOR'
              Title.Alignment = taCenter
              Title.Caption = 'Valor'
              Width = 91
              Font.Name = 'CircularStd'
              Editor = edtValorCurso
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CUR_VALOR_POR_AULA'
              Title.Alignment = taCenter
              Title.Caption = 'Valor por aula'
              Width = 148
              Font.Name = 'CircularStd'
              Editor = edtValorCursoPorAula
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CC_PAGO'
              Title.Alignment = taCenter
              Title.Caption = 'Pago'
              Width = 100
              Font.Name = 'CircularStd'
              Tag = -1
              Alignment = taCenter
              ReadOnly = True
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CUR_PUBLICADO_EM'
              Title.Alignment = taCenter
              Title.Caption = 'Publicado Em'
              Width = 124
              Font.Name = 'CircularStd'
              Alignment = taCenter
              Editor = edtDataPublicadoEm
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CUR_DISPONIVEL_ATE'
              Title.Alignment = taCenter
              Title.Caption = 'Dispon'#237'vel At'#233
              Width = 129
              Font.Name = 'CircularStd'
              Alignment = taCenter
              Editor = edtDataDisponivelAte
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CC_NA0_LISTADO'
              Title.Alignment = taCenter
              Title.Caption = 'N'#227'o Listado'
              Width = 129
              Font.Name = 'CircularStd'
              Tag = -1
              Alignment = taCenter
              ReadOnly = True
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CC_EM_CRIACAO'
              Title.Alignment = taCenter
              Title.Caption = 'Em Cria'#231#227'o'
              Width = 129
              Font.Name = 'CircularStd'
              Tag = -1
              Alignment = taCenter
              ReadOnly = True
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CUR_SEO'
              Title.Alignment = taCenter
              Title.Caption = 'SEO'
              Width = 134
              Font.Name = 'CircularStd'
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CUR_PALAVRAS_CHAVE'
              Title.Alignment = taCenter
              Title.Caption = 'Palavras Chave'
              Width = 192
              Font.Name = 'CircularStd'
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CC_IMAGEM_CAPA'
              Title.Alignment = taCenter
              Title.Caption = 'Imagem da capa'
              Width = 137
              Font.Name = 'CircularStd'
              Tag = -1
              Alignment = taCenter
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CC_IMAGEM_DESTAQUE'
              Title.Alignment = taCenter
              Title.Caption = 'Imagem de destaque'
              Width = 171
              Font.Name = 'CircularStd'
              Tag = -1
              Alignment = taCenter
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CC_TEXTO_HTML'
              Title.Alignment = taCenter
              Title.Caption = 'Texto Html'
              Width = 108
              Font.Name = 'CircularStd'
              Tag = -1
              Alignment = taCenter
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CC_CERTIFICADO_HTML'
              Title.Alignment = taCenter
              Title.Caption = 'Certificado Html'
              Width = 153
              Font.Name = 'CircularStd'
              Tag = -1
              Alignment = taCenter
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CC_PROVA_HTML'
              Title.Alignment = taCenter
              Title.Caption = 'Prova'
              Width = 103
              Font.Name = 'CircularStd'
              Tag = -1
              Alignment = taCenter
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CC_IMAGEM_CHAMADA'
              Title.Alignment = taCenter
              Title.Caption = 'Imagem Chamada'
              Width = 158
              Font.Name = 'CircularStd'
              Tag = -1
              Alignment = taCenter
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CUR_URL_YOUTUBE_VID_CHAMADA'
              Title.Alignment = taCenter
              Title.Caption = 'Link Youtube V'#237'deo Chamada'
              Width = 241
              Font.Name = 'CircularStd'
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CUR_ID_VIDEO_VIMEO_CHAMADA'
              Title.Alignment = taCenter
              Title.Caption = 'Id V'#237'deo Vimeo Chamada'
              Width = 194
              Font.Name = 'CircularStd'
              Alignment = taCenter
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CC_VIDEO_CHAMADA'
              Title.Alignment = taCenter
              Title.Caption = 'V'#237'deo Vimeo Chamada'
              Width = 190
              Font.Name = 'CircularStd'
              Tag = -1
              Alignment = taCenter
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CC_IMAGEM_MINIATURA'
              Title.Alignment = taCenter
              Title.Caption = 'Imagem Miniatura'
              Width = 152
              Font.Name = 'CircularStd'
              Tag = -1
              Alignment = taCenter
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'CUR_URL_CURSO'
              Title.Alignment = taCenter
              Title.Caption = 'Url Curso'
              Width = 111
              Font.Name = 'CircularStd'
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              ActionColumn.Enabled = True
              ActionColumn.Buttons = <
                item
                  ButtonId = 1
                  Hint = 'Excluir o curso'
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
          object lblVoltarCurso: TUniLabel
            AlignWithMargins = True
            Left = 663
            Top = 31
            Width = 28
            Height = 13
            Hint = ''
            Visible = False
            TextConversion = txtHTML
            Caption = 'Voltar'
            TabOrder = 1
          end
          object lblIncluirCurso: TUniLabel
            AlignWithMargins = True
            Left = 10
            Top = 10
            Width = 29
            Height = 13
            Hint = ''
            TextConversion = txtHTML
            Caption = 'Incluir'
            TabOrder = 2
          end
          object lblAlterarCurso: TUniLabel
            AlignWithMargins = True
            Left = 663
            Top = 31
            Width = 33
            Height = 13
            Hint = ''
            Visible = False
            TextConversion = txtHTML
            Caption = 'Alterar'
            TabOrder = 3
          end
          object lblExcluirCurso: TUniLabel
            AlignWithMargins = True
            Left = 663
            Top = 30
            Width = 31
            Height = 13
            Hint = ''
            Visible = False
            TextConversion = txtHTML
            Caption = 'Excluir'
            TabOrder = 4
          end
          object lblGravarCurso: TUniLabel
            AlignWithMargins = True
            Left = 663
            Top = 34
            Width = 33
            Height = 13
            Hint = ''
            Visible = False
            TextConversion = txtHTML
            Caption = 'Gravar'
            TabOrder = 5
          end
          object edtPesquisarCursos: TUniEdit
            Left = 270
            Top = 10
            Width = 300
            Height = 30
            Hint = ''
            Text = ''
            TabOrder = 6
            EmptyText = 'Pesquisar Cursos'
            CheckChangeDelay = 10
            OnChange = edtPesquisarCursosChange
          end
        end
        object UniHiddenPanel1: TUniHiddenPanel
          Left = 184
          Top = 144
          Width = 160
          Height = 177
          Hint = ''
          Visible = True
          object edtDataPublicadoEm: TUniDateTimePicker
            Left = 16
            Top = 24
            Width = 120
            Hint = ''
            DateTime = 43504.000000000000000000
            DateFormat = 'dd/mm/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 1
          end
          object edtDataDisponivelAte: TUniDateTimePicker
            Left = 16
            Top = 52
            Width = 120
            Hint = ''
            DateTime = 43504.000000000000000000
            DateFormat = 'dd/mm/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 2
          end
          object edtValorCurso: TUniFormattedNumberEdit
            Left = 16
            Top = 108
            Width = 121
            Hint = ''
            Alignment = taRightJustify
            TabOrder = 3
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object edtDataCadatro: TUniDateTimePicker
            Left = 16
            Top = 80
            Width = 120
            Hint = ''
            DateTime = 43504.000000000000000000
            DateFormat = 'dd/mm/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 4
          end
          object edtValorCursoPorAula: TUniFormattedNumberEdit
            Left = 16
            Top = 136
            Width = 121
            Hint = ''
            Alignment = taRightJustify
            TabOrder = 5
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
        end
      end
    end
    object tabModulos: TUniTabSheet
      Hint = ''
      Caption = 'M'#243'dulos'
      object dbgModulos: TUniDBGrid
        Left = 0
        Top = 92
        Width = 969
        Height = 447
        Hint = ''
        DataSource = UniMainModule.dsModulos
        WebOptions.Paged = False
        LoadMask.Message = 'Carregando...'
        Images = UniMainModule.UniImageListMenuGrud32
        Align = alClient
        ParentFont = False
        TabOrder = 0
        OnSelectionChange = dbgModulosSelectionChange
        OnCellClick = dbgModulosCellClick
        OnTitleClick = dbgModulosTitleClick
        OnColumnActionClick = dbgModulosColumnActionClick
        Columns = <
          item
            FieldName = 'MOD_NOME'
            Title.Alignment = taCenter
            Title.Caption = 'Nome do m'#243'dulo'
            Width = 300
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'MOD_DATA_CADASTRO'
            Title.Alignment = taCenter
            Title.Caption = 'Data de cadastro'
            Width = 172
            Alignment = taCenter
            Editor = edtDataCadastroModulos
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'CC_APOSTILA'
            Title.Alignment = taCenter
            Title.Caption = 'Apostila'
            Width = 96
            Alignment = taCenter
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
            Title.Caption = 'ORDEM'
            Width = 111
            Alignment = taCenter
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'CC_TOTAL_AULAS'
            Title.Alignment = taCenter
            Title.Caption = 'AULAS'
            Width = 78
            Font.Color = 4234574
            Font.Height = -19
            Font.Style = [fsBold]
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
                Hint = 'Excluir o m'#243'dulo'
                ImageIndex = 2
              end>
            Title.Alignment = taCenter
            Title.Caption = 'Excluir'
            Width = 88
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
        object lblVoltarModulo: TUniLabel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 33
          Height = 13
          Hint = ''
          TextConversion = txtHTML
          Caption = 'Cursos'
          TabOrder = 1
        end
        object lblIncluirModulo: TUniLabel
          AlignWithMargins = True
          Left = 121
          Top = 10
          Width = 29
          Height = 13
          Hint = ''
          ParentRTL = False
          TextConversion = txtHTML
          Caption = 'Incluir'
          TabOrder = 2
        end
        object lblAlterarModulo: TUniLabel
          AlignWithMargins = True
          Left = 804
          Top = 31
          Width = 33
          Height = 13
          Hint = ''
          Visible = False
          TextConversion = txtHTML
          Caption = 'Alterar'
          TabOrder = 3
        end
        object lblExcluirModulo: TUniLabel
          AlignWithMargins = True
          Left = 728
          Top = 31
          Width = 31
          Height = 13
          Hint = ''
          Visible = False
          TextConversion = txtHTML
          Caption = 'Excluir'
          TabOrder = 4
        end
        object lblGravarModulo: TUniLabel
          AlignWithMargins = True
          Left = 765
          Top = 31
          Width = 33
          Height = 13
          Hint = ''
          Visible = False
          TextConversion = txtHTML
          Caption = 'Gravar'
          TabOrder = 5
        end
        object edtPesquisarModulos: TUniEdit
          Left = 270
          Top = 10
          Width = 300
          Height = 30
          Hint = ''
          Text = ''
          TabOrder = 6
          EmptyText = 'Pesquisar M'#243'dulos'
          CheckChangeDelay = 10
          OnChange = edtPesquisarModulosChange
        end
      end
      object UniHiddenPanel2: TUniHiddenPanel
        Left = 216
        Top = 144
        Width = 160
        Height = 121
        Hint = ''
        Visible = True
        object edtDataCadastroModulos: TUniDateTimePicker
          Left = 16
          Top = 24
          Width = 120
          Hint = ''
          DateTime = 43504.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 1
        end
      end
      object UniPanel1: TUniPanel
        Left = 0
        Top = 50
        Width = 969
        Height = 42
        Hint = ''
        Align = alTop
        TabOrder = 3
        Caption = ''
        object lblNomeCurso: TUniLabel
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
    object tabAulas: TUniTabSheet
      Hint = ''
      Caption = 'Aulas'
      object dbgAulas: TUniDBGrid
        Left = 0
        Top = 92
        Width = 969
        Height = 447
        Hint = ''
        DataSource = UniMainModule.dsAulas
        WebOptions.Paged = False
        LoadMask.Message = 'Carregando...'
        Images = UniMainModule.UniImageListMenuGrud32
        Align = alClient
        ParentFont = False
        TabOrder = 0
        OnCellClick = dbgAulasCellClick
        OnTitleClick = dbgAulasTitleClick
        OnColumnActionClick = dbgAulasColumnActionClick
        Columns = <
          item
            FieldName = 'AUL_NOME'
            Title.Alignment = taCenter
            Title.Caption = 'Nome da aula'
            Width = 272
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'AUL_DATA_CADASTRO'
            Title.Alignment = taCenter
            Title.Caption = 'Data de cadastro'
            Width = 157
            Alignment = taCenter
            Editor = edtDataCadastroAula
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'AUL_DATA_LIBERACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Data Libera'#231#227'o'
            Width = 141
            Alignment = taCenter
            Editor = edtDataLiberacaoAula
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'AUL_DIAS_LIBERACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Dias Libera'#231#227'o'
            Width = 135
            Alignment = taCenter
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'CC_PERMITE_ANTECIPAR'
            Title.Alignment = taCenter
            Title.Caption = 'Permite Antecipar'
            Width = 163
            Alignment = taCenter
            ReadOnly = True
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'CC_GRATIS'
            Title.Alignment = taCenter
            Title.Caption = 'Gr'#225'tis'
            Width = 100
            Alignment = taCenter
            ReadOnly = True
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'AUL_ORDEM_POSICAO'
            Title.Alignment = taCenter
            Title.Caption = 'Posi'#231#227'o da aula'
            Width = 145
            Visible = False
            Alignment = taCenter
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'CC_EM_CRIACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Em Cria'#231#227'o'
            Width = 105
            Alignment = taCenter
            ReadOnly = True
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'AUL_ID_VIDEO_VIMEO'
            Title.Alignment = taCenter
            Title.Caption = 'ID V'#237'deo Vimeo'
            Width = 147
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'CC_VIDEO'
            Title.Alignment = taCenter
            Title.Caption = 'V'#237'deo'
            Width = 87
            Alignment = taCenter
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'AUL_URL_YOUTUBE'
            Title.Alignment = taCenter
            Title.Caption = 'Link V'#237'deo Youtube'
            Width = 204
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'AUL_HIPER_LNK_BANNER'
            Title.Alignment = taCenter
            Title.Caption = 'Hiperlink banner'
            Width = 200
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'CC_IMG_BANNER'
            Title.Alignment = taCenter
            Title.Caption = 'Imagem banner'
            Width = 137
            Alignment = taCenter
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'CC_FILE_APOSTILA'
            Title.Alignment = taCenter
            Title.Caption = 'Apostila'
            Width = 95
            Alignment = taCenter
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'CC_FILE_AUDIO'
            Title.Alignment = taCenter
            Title.Caption = 'Audio'
            Width = 85
            Alignment = taCenter
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'CC_PROVA_HTML'
            Title.Alignment = taCenter
            Title.Caption = 'Prova'
            Width = 100
            Alignment = taCenter
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
            Title.Caption = 'ORDEM'
            Width = 111
            Alignment = taCenter
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            ActionColumn.Enabled = True
            ActionColumn.Buttons = <
              item
                ButtonId = 1
                Hint = 'Excluir a aula'
                ImageIndex = 2
              end>
            Title.Alignment = taCenter
            Title.Caption = 'Excluir'
            Width = 94
            Alignment = taCenter
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end>
      end
      object UniPanel7: TUniPanel
        Left = 0
        Top = 0
        Width = 969
        Height = 50
        Hint = ''
        Align = alTop
        TabOrder = 1
        Caption = ''
        object lblVoltarAula: TUniLabel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 39
          Height = 13
          Hint = ''
          TextConversion = txtHTML
          Caption = 'Modulos'
          TabOrder = 1
        end
        object lblIncluirAula: TUniLabel
          AlignWithMargins = True
          Left = 130
          Top = 10
          Width = 29
          Height = 13
          Hint = ''
          TextConversion = txtHTML
          Caption = 'Incluir'
          TabOrder = 2
        end
        object lblAlterarAula: TUniLabel
          AlignWithMargins = True
          Left = 664
          Top = 31
          Width = 33
          Height = 13
          Hint = ''
          Visible = False
          TextConversion = txtHTML
          Caption = 'Alterar'
          TabOrder = 3
        end
        object lblExcluirAula: TUniLabel
          AlignWithMargins = True
          Left = 661
          Top = 16
          Width = 31
          Height = 13
          Hint = ''
          Visible = False
          TextConversion = txtHTML
          Caption = 'Excluir'
          TabOrder = 4
        end
        object lblGravarAula: TUniLabel
          AlignWithMargins = True
          Left = 698
          Top = 31
          Width = 33
          Height = 13
          Hint = ''
          Visible = False
          TextConversion = txtHTML
          Caption = 'Gravar'
          TabOrder = 5
        end
        object edtPesquisarAulas: TUniEdit
          Left = 270
          Top = 10
          Width = 300
          Height = 30
          Hint = ''
          Text = ''
          TabOrder = 6
          EmptyText = 'Pesquisar Aulas'
          CheckChangeDelay = 10
          OnChange = edtPesquisarAulasChange
        end
      end
      object UniHiddenPanel3: TUniHiddenPanel
        Left = 248
        Top = 137
        Width = 160
        Height = 121
        Hint = ''
        Visible = True
        object edtDataCadastroAula: TUniDateTimePicker
          Left = 16
          Top = 24
          Width = 120
          Hint = ''
          DateTime = 43504.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 1
        end
        object edtDataLiberacaoAula: TUniDateTimePicker
          Left = 16
          Top = 52
          Width = 120
          Hint = ''
          DateTime = 43504.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 2
        end
      end
      object UniPanel3: TUniPanel
        Left = 0
        Top = 50
        Width = 969
        Height = 42
        Hint = ''
        Align = alTop
        TabOrder = 3
        Caption = ''
        object lblNomeCursoModulo: TUniLabel
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
  object UniFileUploadImage: TUniFileUpload
    Filter = 'image/*'
    Title = 'Seleciona a imagem'
    Messages.Uploading = 'Transferindo...'
    Messages.PleaseWait = 'Por favor aguarde...'
    Messages.Cancel = 'Cancelar'
    Messages.Processing = 'Processando...'
    Messages.UploadError = 'Erro ao carregar'
    Messages.Upload = 'Confirmar'
    Messages.NoFileError = 'Por favor selecione uma imagem'
    Messages.BrowseText = 'Procurar...'
    Left = 460
    Top = 184
  end
  object UniFileUploadVideo: TUniFileUpload
    OnCompleted = UniFileUploadVideoCompleted
    Filter = 'video/*'
    Title = 'Upload'
    Messages.Uploading = 'Uploading...'
    Messages.PleaseWait = 'Please Wait'
    Messages.Cancel = 'Cancel'
    Messages.Processing = 'Processing...'
    Messages.UploadError = 'Upload Error'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Please Select a File'
    Messages.BrowseText = 'Browse...'
    Left = 580
    Top = 168
  end
  object UniScreenMask1: TUniScreenMask
    Enabled = True
    DisplayMessage = 'Aguarde... Carregando V'#237'deos'
    TargetControl = Owner
    Left = 764
    Top = 144
  end
end
