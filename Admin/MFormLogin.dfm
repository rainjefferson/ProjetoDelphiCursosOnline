object UnimLoginForm1: TUnimLoginForm1
  Left = 0
  Top = 0
  ClientHeight = 480
  ClientWidth = 306
  Caption = 'Acesso administrativo'
  BorderIcons = []
  TitleButtons = <>
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 47
  PlatformData = {}
  object UnimFieldSet1: TUnimFieldSet
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 296
    Height = 406
    Hint = ''
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Title = 'Informe os dados para entrar'
    Align = alClient
    ExplicitWidth = 273
    object UnimContainerPanel2: TUnimContainerPanel
      Left = 0
      Top = 0
      Width = 296
      Height = 105
      Hint = ''
      Align = alTop
      ExplicitWidth = 273
      object UnimImage1: TUnimImage
        Left = 13
        Top = 24
        Width = 121
        Height = 57
        Hint = ''
        Stretch = True
      end
    end
    object UnimContainerPanel3: TUnimContainerPanel
      Left = 0
      Top = 105
      Width = 296
      Height = 301
      Hint = ''
      Align = alClient
      ExplicitWidth = 273
      DesignSize = (
        296
        301)
      object edtLogin: TUnimEdit
        AlignWithMargins = True
        Left = 30
        Top = 88
        Width = 235
        Height = 47
        Hint = ''
        Margins.Left = 15
        Margins.Top = 50
        Margins.Right = 15
        Margins.Bottom = 5
        Anchors = [akLeft, akRight]
        Text = ''
        EmptyText = 'digite o seu login'
        FieldLabelAlign = laTop
        ParentFont = False
        TabOrder = 1
        ExplicitWidth = 212
      end
      object edtSenha: TUnimEdit
        AlignWithMargins = True
        Left = 30
        Top = 150
        Width = 235
        Height = 47
        Hint = ''
        Margins.Left = 15
        Margins.Top = 10
        Margins.Right = 15
        Margins.Bottom = 5
        Anchors = [akLeft, akRight]
        Text = ''
        PasswordChar = '*'
        EmptyText = 'digite sua senha'
        FieldLabelAlign = laTop
        ParentFont = False
        TabOrder = 2
        ExplicitWidth = 212
      end
    end
  end
  object UnimContainerPanel1: TUnimContainerPanel
    Left = 0
    Top = 416
    Width = 306
    Height = 64
    Hint = ''
    Align = alBottom
    ExplicitWidth = 283
    DesignSize = (
      306
      64)
    object btnOK: TUnimButton
      Left = 196
      Top = 3
      Width = 105
      Height = 57
      Hint = ''
      Anchors = [akTop, akRight]
      Caption = 'OK'
      UI = 'confirm'
      Font.Height = -19
      OnClick = btnOKClick
      ExplicitLeft = 173
    end
    object btnCancel: TUnimButton
      Left = 3
      Top = 4
      Width = 110
      Height = 57
      Hint = ''
      Caption = 'Cancelar'
      ModalResult = 2
      UI = 'decline'
      Font.Height = -19
    end
  end
end
