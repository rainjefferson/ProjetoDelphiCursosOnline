object MainmForm: TMainmForm
  Left = 0
  Top = 0
  ClientHeight = 977
  ClientWidth = 600
  Caption = 'Gerenciamento de cursos'
  TitleButtons = <>
  PixelsPerInch = 96
  TextHeight = 13
  DesignOrientation = True
  ScrollPosition = 0
  ScrollHeight = 47
  PlatformData = {}
  object UnimContainerPanel1: TUnimContainerPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 977
    Hint = ''
    Align = alClient
    AlignmentControl = uniAlignmentClient
    object btnEditUsers: TUnimBitBtn
      Left = 0
      Top = 0
      Width = 600
      Height = 169
      Action = UniMainModule.actEditUsers
      Align = alTop
      ScreenMask.Enabled = True
      UI = 'action'
      IconAlign = iaTop
      Caption = 'Cadastro de cursos'
      ImageIndex = 0
    end
    object btnEditOrders: TUnimBitBtn
      Left = 0
      Top = 169
      Width = 600
      Height = 176
      Hint = ''
      Align = alTop
      ScreenMask.Enabled = True
      UI = 'action'
      IconAlign = iaTop
      Caption = 'Cadastro de Professores'
      Images = UniMainModule.UniNativeImageList1
      ImageIndex = 1
      ExplicitTop = 175
    end
  end
end
