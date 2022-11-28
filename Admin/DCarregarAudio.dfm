object DFormCarregarAudio: TDFormCarregarAudio
  Left = 0
  Top = 0
  ClientHeight = 82
  ClientWidth = 704
  Caption = 'Carregar audio'
  BorderStyle = bsSingle
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
    Width = 704
    Height = 84
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
      Left = 104
      Top = 8
      Width = 29
      Height = 13
      Hint = ''
      TextConversion = txtHTML
      Caption = 'Incluir'
      TabOrder = 2
    end
    object UniHTMLFrame1: TUniHTMLFrame
      Left = 568
      Top = 3
      Width = 105
      Height = 25
      Hint = ''
      Visible = False
      HTML.Strings = (
        '<audio id="player1" src="files/audios/audio.mp3"></audio>')
    end
    object lblPlay: TUniLabel
      AlignWithMargins = True
      Left = 362
      Top = 8
      Width = 20
      Height = 13
      Hint = ''
      TextConversion = txtHTML
      Caption = 'Play'
      ClientEvents.ExtEvents.Strings = (
        
          'click=function OnClick(sender, e)'#13#10'{'#13#10'  var ael = document.getEl' +
          'ementById("player1");'#13#10'  ael.load();'#13#10'  ael.play();'#13#10'}')
      TabOrder = 4
    end
    object lblPause: TUniLabel
      AlignWithMargins = True
      Left = 422
      Top = 8
      Width = 29
      Height = 13
      Hint = ''
      TextConversion = txtHTML
      Caption = 'Pause'
      ClientEvents.ExtEvents.Strings = (
        
          'click=function OnClick(sender, e)'#13#10'{'#13#10'  var ael = document.getEl' +
          'ementById("player1");     '#13#10'  ael.pause();'#13#10'}')
      TabOrder = 5
    end
    object lblApagar: TUniLabel
      AlignWithMargins = True
      Left = 214
      Top = 8
      Width = 35
      Height = 13
      Hint = ''
      TextConversion = txtHTML
      Caption = 'Apagar'
      TabOrder = 6
    end
  end
  object UniFileUploadAudio: TUniFileUpload
    OnCompleted = UniFileUploadAudioCompleted
    Filter = 'audio/*'
    Title = 'Selecione o arquivo de audio'
    TimeoutSecs = 600
    Messages.Uploading = 'Transferindo...'
    Messages.PleaseWait = 'Aguarde...'
    Messages.Cancel = 'Cancelar...'
    Messages.Processing = 'Processando...'
    Messages.UploadError = 'Erro ao carregar'
    Messages.Upload = 'Confirmar'
    Messages.NoFileError = 'Por favor selecione o arquivo de audio'
    Messages.BrowseText = 'Procurar...'
    Left = 612
    Top = 32
  end
end
