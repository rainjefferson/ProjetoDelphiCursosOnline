unit DCarregarHtmlProfessor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniGUIBaseClasses,
  uniPanel, uniImage, uniFileUpload, Data.DB, uniMemo, uniDBMemo;

type
  TDFormCarregarHtmlProfessor = class(TUniForm)
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

function DFormCarregarHtmlProfessor: TDFormCarregarHtmlProfessor;

implementation

uses
  uniGUIApplication, MainModule;

{$R *.dfm}

function DFormCarregarHtmlProfessor: TDFormCarregarHtmlProfessor;
begin
  Result := TDFormCarregarHtmlProfessor(UniMainModule.GetFormInstance(TDFormCarregarHtmlProfessor));
end;

procedure TDFormCarregarHtmlProfessor.UniFormCreate(Sender: TObject);
begin
  if not (uniMainModule.tblProfessores.State in [dsEdit, dsInsert]) then
    uniMainModule.tblProfessores.Edit;

  lblVoltar.Caption := ' <button class="btn btn-primary">« VOLTAR</button>';
  lblVoltar.OnClick := FecharForm;

  lblApagar.Caption := ' <button class="btn btn-success">APAGAR</button>';
  lblApagar.OnClick := ApagarHtml;
end;

procedure TDFormCarregarHtmlProfessor.ApagarHtml(Sender: TObject);
begin
  if not (uniMainModule.tblProfessores.State in [dsEdit, dsInsert]) then
    uniMainModule.tblProfessores.Edit;

  uniMainModule.tblProfessoresPRO_HTML.Clear;
  uniMainModule.tblProfessores.Post;
end;

procedure TDFormCarregarHtmlProfessor.FecharForm(Sender: TObject);
begin
  Close;
end;

end.
