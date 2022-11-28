object DFormCarregarHtmlConteudoCurso: TDFormCarregarHtmlConteudoCurso
  Left = 0
  Top = 0
  ClientHeight = 556
  ClientWidth = 694
  Caption = 'Carregar Texto Html do Curso'
  OldCreateOrder = False
  BorderIcons = [biMaximize]
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
    object lblApagar: TUniLabel
      AlignWithMargins = True
      Left = 107
      Top = 8
      Width = 35
      Height = 13
      Hint = ''
      TextConversion = txtHTML
      Caption = 'Apagar'
      TabOrder = 2
    end
  end
  object UniDBHTMLMemo1: TUniDBHTMLMemo
    Left = 0
    Top = 75
    Width = 694
    Height = 481
    Hint = ''
    DataField = 'CUR_CONTEUDO_HTML'
    DataSource = UniMainModule.dsCursos
    Align = alClient
    TabOrder = 1
    Color = clWindow
  end
end
