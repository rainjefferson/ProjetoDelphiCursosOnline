object DEditarAlunosForm: TDEditarAlunosForm
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
    ActivePage = tabCadAlunos
    TabBarVisible = False
    Align = alClient
    TabOrder = 0
    object tabCadAlunos: TUniTabSheet
      Hint = ''
      Caption = 'tabCadAlunos'
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
              Top = 8
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
              Height = 474
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
                Style = csDropDownList
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
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
                DataSource = dsAlunos
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
  object tblAlunos: TFDQuery
    AfterInsert = tblAlunosAfterInsert
    Filtered = True
    Connection = UniMainModule.Conn
    SQL.Strings = (
      'SELECT A.*'
      'FROM ALUNOS A '
      'WHERE'
      '  A.ID_EMPRESA = :ID_EMPRESA'
      'AND'
      '  A.FG_EXCLUIDO = 0'
      '')
    Left = 48
    Top = 304
    ParamData = <
      item
        Name = 'ID_EMPRESA'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
    object tblAlunosALU_ID: TIntegerField
      FieldName = 'ALU_ID'
      Origin = 'ALU_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tblAlunosALU_NOME: TStringField
      FieldName = 'ALU_NOME'
      Origin = 'ALU_NOME'
      Size = 100
    end
    object tblAlunosALU_SOBRENOME: TStringField
      FieldName = 'ALU_SOBRENOME'
      Origin = 'ALU_SOBRENOME'
      Size = 100
    end
    object tblAlunosALU_DATA_CADASTRO: TDateField
      FieldName = 'ALU_DATA_CADASTRO'
      Origin = 'ALU_DATA_CADASTRO'
    end
    object tblAlunosALU_ATIVO: TBooleanField
      FieldName = 'ALU_ATIVO'
      Origin = 'ALU_ATIVO'
    end
    object tblAlunosUSU_ID: TIntegerField
      FieldName = 'USU_ID'
      Origin = 'USU_ID'
    end
    object tblAlunosALU_TELEFONE: TStringField
      FieldName = 'ALU_TELEFONE'
      Origin = 'ALU_TELEFONE'
    end
    object tblAlunosALU_TELEFONE_EXTRA: TStringField
      FieldName = 'ALU_TELEFONE_EXTRA'
      Origin = 'ALU_TELEFONE_EXTRA'
    end
    object tblAlunosALU_EMAIL: TStringField
      FieldName = 'ALU_EMAIL'
      Origin = 'ALU_EMAIL'
      Size = 100
    end
    object tblAlunosALU_CPF: TStringField
      FieldName = 'ALU_CPF'
      Origin = 'ALU_CPF'
    end
    object tblAlunosALU_RG: TStringField
      FieldName = 'ALU_RG'
      Origin = 'ALU_RG'
    end
    object tblAlunosALU_CIDADE: TStringField
      FieldName = 'ALU_CIDADE'
      Origin = 'ALU_CIDADE'
      Size = 100
    end
    object tblAlunosALU_UF: TStringField
      FieldName = 'ALU_UF'
      Origin = 'ALU_UF'
      FixedChar = True
      Size = 2
    end
    object tblAlunosALU_CARGO: TStringField
      FieldName = 'ALU_CARGO'
      Origin = 'ALU_CARGO'
      Size = 100
    end
    object tblAlunosALU_CATEGORIA: TStringField
      FieldName = 'ALU_CATEGORIA'
      Origin = 'ALU_CATEGORIA'
      Size = 100
    end
    object tblAlunosFG_EXCLUIDO: TBooleanField
      FieldName = 'FG_EXCLUIDO'
      Origin = 'FG_EXCLUIDO'
    end
    object tblAlunosID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
    end
    object tblAlunosCC_FOTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CC_FOTO'
      Size = 250
      Calculated = True
    end
    object tblAlunosALU_STATUS: TStringField
      FieldName = 'ALU_STATUS'
      Origin = 'ALU_STATUS'
      Size = 10
    end
    object tblAlunosALU_FOTO: TStringField
      FieldName = 'ALU_FOTO'
      Origin = 'ALU_FOTO'
      Size = 500
    end
    object tblAlunosALU_DATA_NASCIMENTO: TDateField
      FieldName = 'ALU_DATA_NASCIMENTO'
      Origin = 'ALU_DATA_NASCIMENTO'
    end
    object tblAlunosALU_LOGRADOURO: TStringField
      FieldName = 'ALU_LOGRADOURO'
      Origin = 'ALU_LOGRADOURO'
      Size = 100
    end
    object tblAlunosALU_END_NUMERO: TStringField
      FieldName = 'ALU_END_NUMERO'
      Origin = 'ALU_END_NUMERO'
      Size = 50
    end
    object tblAlunosALU_END_COMPLEMENTO: TStringField
      FieldName = 'ALU_END_COMPLEMENTO'
      Origin = 'ALU_END_COMPLEMENTO'
      Size = 100
    end
    object tblAlunosALU_CEP: TStringField
      FieldName = 'ALU_CEP'
      Origin = 'ALU_CEP'
      Size = 10
    end
    object tblAlunosALU_SKYPE: TStringField
      FieldName = 'ALU_SKYPE'
      Origin = 'ALU_SKYPE'
      Size = 100
    end
    object tblAlunosALU_SENHA: TStringField
      FieldName = 'ALU_SENHA'
      Origin = 'ALU_SENHA'
      Size = 50
    end
    object tblAlunosALU_EMPRESA: TStringField
      FieldName = 'ALU_EMPRESA'
      Origin = 'ALU_EMPRESA'
      Size = 50
    end
    object tblAlunosALU_BAIRRO: TStringField
      FieldName = 'ALU_BAIRRO'
      Origin = 'ALU_BAIRRO'
      Size = 100
    end
    object tblAlunosCC_STATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CC_STATUS'
      Size = 250
      Calculated = True
    end
  end
  object dsAlunos: TDataSource
    DataSet = tblAlunos
    Left = 136
    Top = 304
  end
end
