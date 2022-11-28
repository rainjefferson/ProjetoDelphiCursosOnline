unit DCarregarHtmlConteudoCurso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniGUIBaseClasses,
  uniPanel, uniImage, uniFileUpload, Data.DB, uniMemo, uniDBMemo;

type
  TDFormCarregarHtmlConteudoCurso = class(TUniForm)
    UniPanel1: TUniPanel;
    lblVoltar: TUniLabel;
    UniDBHTMLMemo1: TUniDBHTMLMemo;
    lblApagar: TUniLabel;
    procedure UniFormCreate(Sender: TObject);
  private
    procedure FecharForm(Sender: TObject);
    procedure ApagarHtml(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

function DFormCarregarHtmlConteudoCurso: TDFormCarregarHtmlConteudoCurso;

implementation

uses
  uniGUIApplication, MainModule;

{$R *.dfm}

function DFormCarregarHtmlConteudoCurso: TDFormCarregarHtmlConteudoCurso;
begin
  Result := TDFormCarregarHtmlConteudoCurso(UniMainModule.GetFormInstance(TDFormCarregarHtmlConteudoCurso));
end;

procedure TDFormCarregarHtmlConteudoCurso.UniFormCreate(Sender: TObject);
begin
  if not (uniMainModule.tblCursos.State in [dsEdit, dsInsert]) then
    uniMainModule.tblCursos.Edit;

  lblVoltar.Caption := ' <button class="btn btn-primary">« VOLTAR</button>';
  lblVoltar.OnClick := FecharForm;

  lblApagar.Caption := ' <button class="btn btn-success">APAGAR</button>';
  lblApagar.OnClick := ApagarHtml;
end;

procedure TDFormCarregarHtmlConteudoCurso.FecharForm(Sender: TObject);
begin
  Close;
end;

procedure TDFormCarregarHtmlConteudoCurso.ApagarHtml(Sender: TObject);
begin
  if not (uniMainModule.tblCursos.State in [dsEdit, dsInsert]) then
    uniMainModule.tblCursos.Edit;

  uniMainModule.tblCursosCUR_CONTEUDO_HTML.Clear;
  uniMainModule.tblCursos.Post;
end;

end.

