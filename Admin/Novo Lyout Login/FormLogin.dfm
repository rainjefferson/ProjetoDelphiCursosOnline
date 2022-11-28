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
  Font.Color = 2500134
  PixelsPerInch = 96
  TextHeight = 13
  object UniFieldContainer1: TUniFieldContainer
    Left = 0
    Top = 0
    Width = 523
    Height = 123
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 552
    object imgLogo: TUniImage
      Left = 0
      Top = 59
      Width = 552
      Height = 58
      Hint = ''
      Center = True
      Transparent = True
    end
    object UniLabel2: TUniLabel
      Left = 16
      Top = 8
      Width = 263
      Height = 25
      Hint = ''
      Caption = 'Acesso a '#225'rea administrativa'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -20
      Font.Name = 'CircularStd'
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
    TabOrder = 2
    ExplicitTop = 264
    ExplicitWidth = 552
    DesignSize = (
      523
      61)
    object btnConfirmar: TUniButton
      Left = 406
      Top = 15
      Width = 110
      Height = 34
      Hint = ''
      Caption = 'Confirmar'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -15
      Font.Name = 'CircularStd'
      Font.Style = [fsBold]
      TabOrder = 1
      OnClick = btnConfirmarClick
      ExplicitLeft = 435
    end
    object UniLabel1: TUniLabel
      Left = 31
      Top = 15
      Width = 122
      Height = 16
      Hint = ''
      TextConversion = txtHTML
      Caption = 'Esqueci minha senha'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'CircularStd'
      TabOrder = 2
    end
  end
  object UniFieldSet1: TUniFieldSet
    Left = 0
    Top = 123
    Width = 523
    Height = 149
    Hint = ''
    Title = '.'
    Align = alClient
    Layout = 'form'
    TabOrder = 0
    ExplicitWidth = 552
    ExplicitHeight = 141
    object edtLogin: TUniEdit
      Left = 194
      Top = 48
      Width = 169
      Height = 29
      Hint = ''
      BorderStyle = ubsFrameLowered
      Text = ''
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'CircularStd'
      TabOrder = 0
      Color = 2500134
      EmptyText = 'Login'
      ClearButton = True
    end
    object edtSenha: TUniEdit
      Left = 194
      Top = 83
      Width = 169
      Height = 28
      Hint = ''
      PasswordChar = '*'
      BorderStyle = ubsFrameLowered
      Text = ''
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'CircularStd'
      TabOrder = 1
      Color = 2500134
      EmptyText = 'Senha'
      ClearButton = True
      OnKeyPress = edtSenhaKeyPress
    end
  end
end
