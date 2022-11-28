object DFormCarregarImagemDestaqueCurso: TDFormCarregarImagemDestaqueCurso
  Left = 0
  Top = 0
  ClientHeight = 556
  ClientWidth = 694
  Caption = 'Carregar imagem de destaque'
  WindowState = wsMaximized
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
    Width = 694
    Height = 75
    Hint = ''
    Align = alTop
    TabOrder = 0
    Caption = ''
    object lblVoltar: TUniLabel
      AlignWithMargins = True
      Left = 6
      Top = 8
      Width = 28
      Height = 13
      Hint = ''
      TextConversion = txtHTML
      Caption = 'Voltar'
      TabOrder = 1
    end
    object lblIncluir: TUniLabel
      AlignWithMargins = True
      Left = 108
      Top = 8
      Width = 29
      Height = 13
      Hint = ''
      TextConversion = txtHTML
      Caption = 'Incluir'
      TabOrder = 2
    end
    object lblApagar: TUniLabel
      AlignWithMargins = True
      Left = 216
      Top = 8
      Width = 35
      Height = 13
      Hint = ''
      TextConversion = txtHTML
      Caption = 'Apagar'
      TabOrder = 3
    end
  end
  object UniImage1: TUniImage
    Left = 0
    Top = 75
    Width = 694
    Height = 481
    Hint = ''
    Center = True
    Align = alClient
  end
  object UniFileUploadImage: TUniFileUpload
    OnCompleted = UniFileUploadImageCompleted
    Filter = 'image/*'
    Title = 'Selecione a imagem'
    Messages.Uploading = 'Carregando...'
    Messages.PleaseWait = 'Aguarde...'
    Messages.Cancel = 'Cancelar'
    Messages.Processing = 'Processando...'
    Messages.UploadError = 'Erro ao carregar'
    Messages.Upload = 'Confirmar'
    Messages.NoFileError = 'Por favor selecione um arquivo'
    Messages.BrowseText = 'Procurar...'
    Left = 460
    Top = 160
  end
end
