object DAlunosForm: TDAlunosForm
  Left = 0
  Top = 0
  Width = 958
  Height = 556
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  Font.Name = 'CircularStd'
  TabOrder = 0
  ParentFont = False
  object UniPageControl1: TUniPageControl
    Left = 0
    Top = 0
    Width = 958
    Height = 556
    Hint = ''
    ActivePage = tabListaAlunos
    TabBarVisible = False
    Align = alClient
    TabOrder = 0
    object tabListaAlunos: TUniTabSheet
      Hint = ''
      Caption = 'Listagem Alunos'
      Font.Name = 'CircularStd'
      ParentFont = False
      object UniPanel1: TUniPanel
        Left = 0
        Top = 0
        Width = 950
        Height = 60
        Hint = ''
        Align = alTop
        TabOrder = 0
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
          Left = 147
          Top = 10
          Width = 35
          Height = 14
          Hint = ''
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
        object edtPesquisarAluno: TUniEdit
          Left = 419
          Top = 10
          Width = 251
          Height = 30
          Hint = ''
          Text = ''
          TabOrder = 6
          EmptyText = 'Pesquisar alunos'
          CheckChangeDelay = 10
          OnChange = edtPesquisarAlunoChange
        end
        object lblFiltrar: TUniLabel
          AlignWithMargins = True
          Left = 886
          Top = 9
          Width = 30
          Height = 14
          Hint = ''
          Visible = False
          TextConversion = txtHTML
          Caption = 'Filtrar'
          TabOrder = 7
        end
        object cmbStatus: TUniComboBox
          Left = 726
          Top = 10
          Width = 99
          Height = 30
          Hint = ''
          Style = csDropDownList
          Text = 'TODOS'
          Items.Strings = (
            'ATIVO'
            'INATIVO'
            'LEAD'
            'CANCELADO'
            'TODOS')
          ItemIndex = 4
          TabOrder = 8
          ForceSelection = False
          OnChange = cmbStatusChange
        end
      end
      object dbgAlunos: TUniDBGrid
        Left = 0
        Top = 60
        Width = 950
        Height = 467
        Hint = ''
        TitleFont.Name = 'CircularStd'
        DataSource = UniMainModule.dsAlunos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTitleClick, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        Images = UniMainModule.UniImageListMenuGrud32
        LayoutConfig.Region = 'center'
        BorderStyle = ubsNone
        Align = alClient
        Font.Name = 'CircularStd'
        ParentFont = False
        TabOrder = 1
        OnCellClick = dbgAlunosCellClick
        OnDblClick = dbgAlunosDblClick
        OnTitleClick = dbgAlunosTitleClick
        OnColumnActionClick = dbgAlunosColumnActionClick
        Columns = <
          item
            FieldName = 'CC_FOTO'
            Title.Alignment = taCenter
            Title.Caption = 'FOTO'
            Title.Font.Name = 'CircularStd'
            Width = 98
            Font.Name = 'CircularStd'
            Tag = -1
            Alignment = taCenter
            ImageOptions.Visible = True
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'ALU_NOME'
            Title.Alignment = taCenter
            Title.Caption = 'Nome'
            Title.Font.Name = 'CircularStd'
            Width = 212
            Font.Name = 'CircularStd'
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'ALU_TELEFONE'
            Title.Alignment = taCenter
            Title.Caption = 'Telefone fixo'
            Title.Font.Name = 'CircularStd'
            Width = 124
            Font.Name = 'CircularStd'
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'ALU_TELEFONE_EXTRA'
            Title.Alignment = taCenter
            Title.Caption = 'Celular'
            Title.Font.Name = 'CircularStd'
            Width = 144
            Font.Name = 'CircularStd'
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'ALU_EMAIL'
            Title.Alignment = taCenter
            Title.Caption = 'E-mail'
            Title.Font.Name = 'CircularStd'
            Width = 198
            Font.Name = 'CircularStd'
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'ALU_CPF'
            Title.Alignment = taCenter
            Title.Caption = 'CPF'
            Title.Font.Name = 'CircularStd'
            Width = 124
            Font.Name = 'CircularStd'
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'ALU_CIDADE'
            Title.Alignment = taCenter
            Title.Caption = 'Cidade'
            Title.Font.Name = 'CircularStd'
            Width = 246
            Font.Name = 'CircularStd'
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'ALU_UF'
            Title.Alignment = taCenter
            Title.Caption = 'UF'
            Title.Font.Name = 'CircularStd'
            Width = 50
            Font.Name = 'CircularStd'
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'ALU_CARGO'
            Title.Alignment = taCenter
            Title.Caption = 'Cargo'
            Title.Font.Name = 'CircularStd'
            Width = 159
            Font.Name = 'CircularStd'
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'CC_STATUS'
            Title.Alignment = taCenter
            Title.Caption = 'Status'
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
            Title.Font.Name = 'CircularStd'
            Width = 79
            Font.Name = 'CircularStd'
            Alignment = taCenter
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'ALU_DATA_CADASTRO'
            Title.Alignment = taCenter
            Title.Caption = 'Data de cadastro'
            Title.Font.Name = 'CircularStd'
            Width = 159
            Visible = False
            Font.Name = 'CircularStd'
            Alignment = taCenter
            Editor = edtDataCadastroAluno
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'ALU_RG'
            Title.Alignment = taCenter
            Title.Caption = 'RG'
            Title.Font.Name = 'CircularStd'
            Width = 124
            Visible = False
            Font.Name = 'CircularStd'
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'ALU_CATEGORIA'
            Title.Alignment = taCenter
            Title.Caption = 'Categoria'
            Title.Font.Name = 'CircularStd'
            Width = 149
            Visible = False
            Font.Name = 'CircularStd'
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end>
      end
      object UniHiddenPanel1: TUniHiddenPanel
        Left = 208
        Top = 144
        Width = 160
        Height = 129
        Hint = ''
        Visible = True
        object edtDataCadastroAluno: TUniDateTimePicker
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
    object tabCadAlunos: TUniTabSheet
      Hint = ''
      Caption = 'tabCadAlunos'
      OnBeforeActivate = tabCadAlunosBeforeActivate
      object UniPageControl2: TUniPageControl
        Left = 0
        Top = 0
        Width = 950
        Height = 527
        Hint = ''
        ActivePage = UniTabSheet1
        Align = alClient
        TabOrder = 0
        object UniTabSheet1: TUniTabSheet
          Hint = ''
          Caption = 'CADASTRO'
          object UniPanel2: TUniPanel
            Left = 0
            Top = 0
            Width = 942
            Height = 499
            Hint = ''
            Align = alClient
            ParentFont = False
            Font.Name = 'CircularStd'
            TabOrder = 0
            Caption = ''
            DesignSize = (
              942
              499)
            object imgFoto: TUniImage
              Left = 42
              Top = 16
              Width = 81
              Height = 81
              Hint = ''
              Stretch = True
              Transparent = True
              ClientEvents.UniEvents.Strings = (
                
                  'afterCreate=function afterCreate(sender)'#13#10'{'#13#10'  sender.cls = '#39'fot' +
                  'o-redonda'#39';'#13#10'}')
            end
            object UniGroupBox1: TUniGroupBox
              Left = 176
              Top = 8
              Width = 763
              Height = 476
              Hint = ''
              Caption = ''
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 2
              object UniDBEdit1: TUniDBEdit
                Left = 24
                Top = 30
                Width = 347
                Height = 22
                Hint = ''
                DataField = 'ALU_NOME'
                DataSource = UniMainModule.dsAlunos
                TabOrder = 0
                FieldLabel = 'NOME'
                FieldLabelAlign = laTop
              end
              object UniDBDateTimePicker1: TUniDBDateTimePicker
                Left = 566
                Top = 30
                Width = 162
                Hint = ''
                DataField = 'ALU_DATA_CADASTRO'
                DataSource = UniMainModule.dsAlunos
                DateTime = 43536.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                TabOrder = 2
                FieldLabel = 'DATA DE CADASTRO'
                FieldLabelAlign = laTop
              end
              object UniDBEdit3: TUniDBEdit
                Left = 24
                Top = 80
                Width = 162
                Height = 22
                Hint = ''
                DataField = 'ALU_CPF'
                DataSource = UniMainModule.dsAlunos
                TabOrder = 3
                FieldLabel = 'CPF'
                FieldLabelAlign = laTop
              end
              object UniDBEdit4: TUniDBEdit
                Left = 192
                Top = 80
                Width = 170
                Height = 22
                Hint = ''
                DataField = 'ALU_RG'
                DataSource = UniMainModule.dsAlunos
                TabOrder = 4
                FieldLabel = 'RG'
                FieldLabelAlign = laTop
              end
              object UniDBEdit5: TUniDBEdit
                Left = 201
                Top = 133
                Width = 170
                Height = 22
                Hint = ''
                DataField = 'ALU_CARGO'
                DataSource = UniMainModule.dsAlunos
                TabOrder = 6
                FieldLabel = 'CARGO'
                FieldLabelAlign = laTop
              end
              object UniDBEdit6: TUniDBEdit
                Left = 388
                Top = 133
                Width = 340
                Height = 22
                Hint = ''
                DataField = 'ALU_CATEGORIA'
                DataSource = UniMainModule.dsAlunos
                TabOrder = 7
                FieldLabel = 'TAGS'
                FieldLabelAlign = laTop
              end
              object UniDBEdit7: TUniDBEdit
                Left = 24
                Top = 236
                Width = 162
                Height = 22
                Hint = ''
                DataField = 'ALU_TELEFONE'
                DataSource = UniMainModule.dsAlunos
                TabOrder = 9
                FieldLabel = 'TELEFONE'
                FieldLabelAlign = laTop
              end
              object UniDBEdit8: TUniDBEdit
                Left = 201
                Top = 236
                Width = 170
                Height = 22
                Hint = ''
                DataField = 'ALU_TELEFONE_EXTRA'
                DataSource = UniMainModule.dsAlunos
                TabOrder = 10
                FieldLabel = 'CELULAR'
                FieldLabelAlign = laTop
              end
              object UniDBEdit9: TUniDBEdit
                Left = 388
                Top = 236
                Width = 162
                Height = 22
                Hint = ''
                DataField = 'ALU_EMAIL'
                DataSource = UniMainModule.dsAlunos
                CharCase = ecLowerCase
                TabOrder = 11
                FieldLabel = 'E-MAIL'
                FieldLabelAlign = laTop
              end
              object UniDBEdit10: TUniDBEdit
                Left = 294
                Top = 287
                Width = 173
                Height = 22
                Hint = ''
                DataField = 'ALU_CIDADE'
                DataSource = UniMainModule.dsAlunos
                TabOrder = 15
                FieldLabel = 'CIDADE'
                FieldLabelAlign = laTop
              end
              object lblGravarAluno: TUniLabel
                AlignWithMargins = True
                Left = 644
                Top = 414
                Width = 41
                Height = 14
                Hint = ''
                TextConversion = txtHTML
                Caption = 'SALVAR'
                TabOrder = 21
              end
              object UniDBComboBox1: TUniDBComboBox
                Left = 24
                Top = 392
                Width = 145
                Hint = ''
                DataField = 'ALU_STATUS'
                DataSource = UniMainModule.dsAlunos
                Items.Strings = (
                  'ATIVO'
                  'LEAD'
                  'INATIVO'
                  'CANCELADO')
                TabOrder = 20
                FieldLabel = 'STATUS'
                FieldLabelAlign = laTop
                ForceSelection = False
              end
              object UniDBDateTimePicker2: TUniDBDateTimePicker
                Left = 388
                Top = 30
                Width = 162
                Hint = ''
                DataField = 'ALU_DATA_NASCIMENTO'
                DataSource = UniMainModule.dsAlunos
                DateTime = 43536.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                TabOrder = 1
                FieldLabel = 'DATA DE NASCIMENTO'
                FieldLabelAlign = laTop
              end
              object UniDBComboBox2: TUniDBComboBox
                Left = 483
                Top = 287
                Width = 67
                Hint = ''
                DataField = 'ALU_UF'
                DataSource = UniMainModule.dsAlunos
                Style = csDropDownList
                Items.Strings = (
                  'AC'
                  'AL'
                  'AP'
                  'AM'
                  'BA'
                  'CE'
                  'DF'
                  'ES'
                  'GO'
                  'MA'
                  'MT'
                  'MS'
                  'MG'
                  'PA'
                  'PB'
                  'PR'
                  'PE'
                  'PI'
                  'RJ'
                  'RN'
                  'RS'
                  'RO'
                  'RR'
                  'SC'
                  'SP'
                  'SE'
                  'TO')
                TabOrder = 16
                FieldLabel = 'UF'
                FieldLabelAlign = laTop
                ForceSelection = False
              end
              object UniDBEdit12: TUniDBEdit
                Left = 24
                Top = 133
                Width = 162
                Height = 22
                Hint = ''
                DataField = 'ALU_EMPRESA'
                DataSource = UniMainModule.dsAlunos
                TabOrder = 5
                FieldLabel = 'EMPRESA'
                FieldLabelAlign = laTop
              end
              object UniDBEdit13: TUniDBEdit
                Left = 24
                Top = 184
                Width = 162
                Height = 22
                Hint = ''
                DataField = 'ALU_SENHA'
                DataSource = UniMainModule.dsAlunos
                PasswordChar = '*'
                TabOrder = 8
                FieldLabel = 'REDEFINIR SENHA'
                FieldLabelAlign = laTop
              end
              object UniDBEdit14: TUniDBEdit
                Left = 566
                Top = 236
                Width = 162
                Height = 22
                Hint = ''
                DataField = 'ALU_SKYPE'
                DataSource = UniMainModule.dsAlunos
                TabOrder = 12
                FieldLabel = 'SKYPE'
                FieldLabelAlign = laTop
              end
              object UniDBEdit15: TUniDBEdit
                Left = 24
                Top = 287
                Width = 162
                Height = 22
                Hint = ''
                DataField = 'ALU_LOGRADOURO'
                DataSource = UniMainModule.dsAlunos
                TabOrder = 13
                FieldLabel = 'LOGRADOURO'
                FieldLabelAlign = laTop
              end
              object UniDBEdit16: TUniDBEdit
                Left = 201
                Top = 287
                Width = 78
                Height = 22
                Hint = ''
                DataField = 'ALU_END_NUMERO'
                DataSource = UniMainModule.dsAlunos
                TabOrder = 14
                FieldLabel = 'N'#218'MERO'
                FieldLabelAlign = laTop
              end
              object UniDBEdit17: TUniDBEdit
                Left = 566
                Top = 287
                Width = 162
                Height = 22
                Hint = ''
                DataField = 'ALU_END_COMPLEMENTO'
                DataSource = UniMainModule.dsAlunos
                TabOrder = 17
                FieldLabel = 'COMPLEMENTO'
                FieldLabelAlign = laTop
              end
              object UniDBEdit18: TUniDBEdit
                Left = 24
                Top = 337
                Width = 162
                Height = 22
                Hint = ''
                DataField = 'ALU_CEP'
                DataSource = UniMainModule.dsAlunos
                TabOrder = 18
                FieldLabel = 'CEP'
                FieldLabelAlign = laTop
              end
              object UniDBEdit19: TUniDBEdit
                Left = 201
                Top = 337
                Width = 184
                Height = 22
                Hint = ''
                DataField = 'ALU_BAIRRO'
                DataSource = UniMainModule.dsAlunos
                TabOrder = 19
                FieldLabel = 'BAIRRO'
                FieldLabelAlign = laTop
              end
            end
            object lblVoltarListaAlunos: TUniLabel
              AlignWithMargins = True
              Left = 26
              Top = 157
              Width = 29
              Height = 14
              Hint = ''
              TextConversion = txtHTML
              Caption = 'Voltar'
              TabOrder = 3
            end
            object lblEditarFoto: TUniLabel
              AlignWithMargins = True
              Left = 26
              Top = 117
              Width = 55
              Height = 14
              Hint = ''
              HelpType = htKeyword
              TextConversion = txtHTML
              Caption = 'Editar Foto'
              TabOrder = 4
            end
          end
        end
        object UniTabSheet2: TUniTabSheet
          Hint = ''
          Caption = 'PROGRESSO'
          Font.Name = 'CircularStd'
          ParentFont = False
        end
        object UniTabSheet3: TUniTabSheet
          Hint = ''
          Caption = 'MATR'#205'CULAS'
          Font.Name = 'CircularStd'
          ParentFont = False
        end
        object UniTabSheet4: TUniTabSheet
          Hint = ''
          Caption = 'HIST. ACAD'#202'MICO'
        end
        object UniTabSheet5: TUniTabSheet
          Hint = ''
          Caption = 'PAGAMENTOS'
        end
        object UniTabSheet6: TUniTabSheet
          Hint = ''
          Caption = 'CR'#201'DITOS'
        end
      end
    end
  end
end
