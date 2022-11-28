object DFormCarregarVideosVimeo: TDFormCarregarVideosVimeo
  Left = 0
  Top = 0
  ClientHeight = 556
  ClientWidth = 696
  Caption = 'Carregar Videos Vimeo'
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  Font.Name = 'CircularStd'
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 696
    Height = 49
    Hint = ''
    Align = alTop
    TabOrder = 0
    Caption = ''
    object lblVoltar: TUniLabel
      AlignWithMargins = True
      Left = 6
      Top = 8
      Width = 29
      Height = 14
      Hint = ''
      TextConversion = txtHTML
      Caption = 'Voltar'
      TabOrder = 1
    end
    object lblAtualizarVideos: TUniLabel
      AlignWithMargins = True
      Left = 108
      Top = 8
      Width = 45
      Height = 14
      Hint = ''
      TextConversion = txtHTML
      Caption = 'Atualizar'
      TabOrder = 2
    end
    object UniProgressBar1: TUniProgressBar
      Left = 432
      Top = 23
      Width = 244
      Height = 19
      Hint = ''
      Visible = False
      Text = 'Baixando v'#237'deos do vimeo'
      TabOrder = 3
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 77
    Width = 696
    Height = 479
    Hint = ''
    ParentCustomHint = False
    DataSource = UniMainModule.dsVideosVimeo
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAutoRefreshRow]
    WebOptions.Paged = False
    WebOptions.PageSize = 2
    WebOptions.FetchAll = True
    LoadMask.Enabled = False
    LoadMask.Message = 'Aguarde... Carregando v'#237'deos...'
    Align = alClient
    TabOrder = 1
    OnDblClick = UniDBGrid1DblClick
    Columns = <
      item
        FieldName = 'NOME_VIDEO'
        Title.Alignment = taCenter
        Title.Caption = 'NOME V'#205'DEO'
        Width = 476
        Font.Name = 'CircularStd'
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'DURACAO'
        Title.Alignment = taCenter
        Title.Caption = 'DURA'#199#195'O (Seg)'
        Width = 185
        Font.Name = 'CircularStd'
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'ID_VIDEO'
        Title.Alignment = taCenter
        Title.Caption = 'ID V'#205'DEO'
        Width = 82
        Visible = False
        Font.Name = 'CircularStd'
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'DESCRICAO_VIDEO'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O DO V'#205'DEO'
        Width = 342
        Visible = False
        Font.Name = 'CircularStd'
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'LINK'
        Title.Alignment = taCenter
        Title.Caption = 'LINK'
        Width = 150
        Visible = False
        Font.Name = 'CircularStd'
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'URI'
        Title.Alignment = taCenter
        Title.Caption = 'URI'
        Width = 114
        Visible = False
        Font.Name = 'CircularStd'
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'TAMANHO_LARGURA'
        Title.Alignment = taCenter
        Title.Caption = 'LARGURA'
        Width = 64
        Visible = False
        Font.Name = 'CircularStd'
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'TAMANHO_ALTURA'
        Title.Alignment = taCenter
        Title.Caption = 'ALTURA'
        Width = 64
        Visible = False
        Font.Name = 'CircularStd'
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'DATA_CRIADO'
        Title.Alignment = taCenter
        Title.Caption = 'CRIADO'
        Width = 173
        Visible = False
        Font.Name = 'CircularStd'
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'DATA_MODIFICADO'
        Title.Alignment = taCenter
        Title.Caption = 'MODIFICADO'
        Width = 124
        Visible = False
        Font.Name = 'CircularStd'
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'DATA_ATUALIZADO'
        Title.Alignment = taCenter
        Title.Caption = 'ATUALIZADO'
        Width = 124
        Visible = False
        Font.Name = 'CircularStd'
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end>
  end
  object edtFiltrar: TUniEdit
    AlignWithMargins = True
    Left = 20
    Top = 52
    Width = 656
    Hint = ''
    Margins.Left = 20
    Margins.Right = 20
    Text = ''
    Align = alTop
    TabOrder = 2
    EmptyText = 'Pesquisar'
    CheckChangeDelay = 100
    OnChange = edtFiltrarChange
  end
  object UniScreenMask1: TUniScreenMask
    AttachedControl = lblAtualizarVideos
    Enabled = False
    DisplayMessage = 'Aguarde... Carregando v'#237'deos...'
    TargetControl = UniDBGrid1
    Left = 432
    Top = 240
  end
end
