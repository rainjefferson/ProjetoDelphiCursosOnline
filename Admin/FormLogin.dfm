object UniLoginForm1: TUniLoginForm1
  Left = 0
  Top = 0
  ClientHeight = 333
  ClientWidth = 523
  Caption = 'Acesso a '#225'rea administrativa'
  OnShow = UniLoginFormShow
  Color = 2500134
  BorderStyle = bsNone
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  ClientEvents.UniEvents.Strings = (
    
      'window.beforeInit=function window.beforeInit(sender, config)'#13#10'{'#13 +
      #10'  config.cls = "LoginBordaRedonda";'#13#10'}')
  Font.Color = 2500134
  Font.Name = 'CircularStd'
  PixelsPerInch = 96
  TextHeight = 14
  object UniFieldContainer1: TUniFieldContainer
    Left = 0
    Top = 0
    Width = 523
    Height = 57
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 0
    object UniLabel2: TUniLabel
      Left = 43
      Top = 8
      Width = 263
      Height = 25
      Hint = ''
      Caption = 'Acesso a '#225'rea administrativa'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -20
      Font.Name = 'CircularStd'
      ClientEvents.UniEvents.Strings = (
        
          'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.cls ' +
          '= "FonteNormal";'#13#10'}')
      TabOrder = 1
    end
    object UniLabel3: TUniLabel
      Left = 43
      Top = 25
      Width = 446
      Height = 7
      Hint = ''
      TextConversion = txtHTML
      AutoSize = False
      Caption = '<hr>'
      ParentFont = False
      Font.Color = clWhite
      Font.Name = 'CircularStd'
      ParentColor = False
      Color = clWhite
      TabOrder = 2
    end
  end
  object UniFieldContainer2: TUniFieldContainer
    Left = 0
    Top = 272
    Width = 523
    Height = 61
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      523
      61)
    object btnConfirmar: TUniButton
      Left = 501
      Top = -18
      Width = 19
      Height = 34
      Hint = ''
      Visible = False
      Caption = 'Confirmar'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -15
      Font.Name = 'CircularStd'
      Font.Style = [fsBold]
      TabOrder = 1
      OnClick = btnConfirmarClick
    end
    object UniLabel1: TUniLabel
      Left = 48
      Top = 6
      Width = 153
      Height = 20
      Hint = ''
      TextConversion = txtHTML
      Caption = 'Esqueci minha senha'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'CircularStd'
      ClientEvents.UniEvents.Strings = (
        
          'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.cls ' +
          '= "FonteNormal";'#13#10'}')
      TabOrder = 2
    end
    object imgBotaoConfirmar: TUniImage
      Left = 391
      Top = 6
      Width = 93
      Height = 34
      Cursor = crHandPoint
      Hint = ''
      Transparent = True
      OnClick = btnConfirmarClick
    end
  end
  object UniFieldContainer3: TUniFieldContainer
    Left = 0
    Top = 57
    Width = 523
    Height = 215
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 2
    ExplicitTop = 123
    ExplicitHeight = 149
    object edtLogin: TUniEdit
      Left = 48
      Top = 104
      Width = 436
      Height = 35
      Hint = ''
      BorderStyle = ubsFrameLowered
      Text = ''
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'CircularStd'
      TabOrder = 1
      Color = 2500134
      EmptyText = 'Login'
      ClearButton = True
    end
    object edtSenha: TUniEdit
      Left = 48
      Top = 146
      Width = 436
      Height = 35
      Hint = ''
      PasswordChar = '*'
      BorderStyle = ubsFrameLowered
      Text = ''
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'CircularStd'
      TabOrder = 2
      Color = 2500134
      EmptyText = 'Senha'
      ClearButton = True
      OnKeyPress = edtSenhaKeyPress
    end
    object imgLogo: TUniImage
      Left = 0
      Top = 19
      Width = 523
      Height = 58
      Hint = ''
      Center = True
      Transparent = True
    end
    object UniLabel4: TUniLabel
      Left = 43
      Top = 187
      Width = 446
      Height = 7
      Hint = ''
      TextConversion = txtHTML
      AutoSize = False
      Caption = '<hr>'
      ParentFont = False
      Font.Color = clWhite
      Font.Name = 'CircularStd'
      ParentColor = False
      Color = clWhite
      TabOrder = 4
    end
  end
end
