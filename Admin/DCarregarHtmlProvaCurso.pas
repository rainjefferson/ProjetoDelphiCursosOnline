unit DCarregarHtmlProvaCurso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniGUIBaseClasses,
  uniPanel, uniImage, uniFileUpload, Data.DB, uniMemo, uniDBMemo;

type
  TDFormCarregarHtmlProvaCurso = class(TUniForm)
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

function DFormCarregarHtmlProvaCurso: TDFormCarregarHtmlProvaCurso;

implementation

uses
  uniGUIApplication, MainModule;

{$R *.dfm}

function DFormCarregarHtmlProvaCurso: TDFormCarregarHtmlProvaCurso;
begin
  Result := TDFormCarregarHtmlProvaCurso(UniMainModule.GetFormInstance(TDFormCarregarHtmlProvaCurso));
end;

procedure TDFormCarregarHtmlProvaCurso.UniFormCreate(Sender: TObject);
begin
  if not (uniMainModule.tblCursos.State in [dsEdit, dsInsert]) then
    uniMainModule.tblCursos.Edit;

  lblVoltar.Caption := ' <button class="btn btn-primary">« VOLTAR</button>';
  lblVoltar.OnClick := FecharForm;

  lblApagar.Caption := ' <button class="btn btn-success">APAGAR</button>';
  lblApagar.OnClick := ApagarHtml;
end;

procedure TDFormCarregarHtmlProvaCurso.ApagarHtml(Sender: TObject);
begin
  if not (uniMainModule.tblCursos.State in [dsEdit, dsInsert]) then
    uniMainModule.tblCursos.Edit;

  uniMainModule.tblCursosCUR_PROVA_HTML.Clear;
  uniMainModule.tblCursos.Post;
end;

procedure TDFormCarregarHtmlProvaCurso.FecharForm(Sender: TObject);
begin
  Close;
end;

end.
