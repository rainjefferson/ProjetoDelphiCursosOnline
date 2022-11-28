unit DCarregarImagemCapaCurso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniGUIBaseClasses,
  uniPanel, uniImage, uniFileUpload, Data.DB;

type
  TDFormCarregarImagemCapaCurso = class(TUniForm)
    UniPanel1: TUniPanel;
    lblVoltar: TUniLabel;
    lblIncluir: TUniLabel;
    UniImage1: TUniImage;
    UniFileUploadImage: TUniFileUpload;
    lblApagar: TUniLabel;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFileUploadImageCompleted(Sender: TObject; AStream: TFileStream);
  private
    procedure CarregarImagem(Sender: TObject);
    procedure FecharForm(Sender: TObject);
    procedure ApagarImagem(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

function DFormCarregarImagemCapaCurso: TDFormCarregarImagemCapaCurso;

implementation

uses
  uniGUIApplication, MainModule;

{$R *.dfm}

function DFormCarregarImagemCapaCurso: TDFormCarregarImagemCapaCurso;
begin
  Result := TDFormCarregarImagemCapaCurso(UniMainModule.GetFormInstance(TDFormCarregarImagemCapaCurso));
end;

procedure TDFormCarregarImagemCapaCurso.UniFileUploadImageCompleted(Sender: TObject; AStream: TFileStream);
begin
  UniImage1.LoadFromStream(AStream);

  if not (uniMainModule.tblCursos.State in [dsEdit, dsInsert]) then
    uniMainModule.tblCursos.Edit;

  uniMainModule.tblCursosCUR_IMG_CAPA.AsString :=
    uniMainModule.SalvarImagemCapa(
      UniImage1,
      uniMainModule.tblCursosCUR_ID.AsInteger,
      UniFileUploadImage.FileName);
end;

procedure TDFormCarregarImagemCapaCurso.UniFormCreate(Sender: TObject);
begin
  lblVoltar.Caption := ' <button class="btn btn-primary">« VOLTAR</button>';
  lblVoltar.OnClick := FecharForm;

  lblIncluir.Caption := ' <button class="btn btn-success">CARREGAR</button>';
  lblIncluir.OnClick := CarregarImagem;

  lblApagar.Caption := ' <button class="btn btn-success">APAGAR</button>';
  lblApagar.OnClick := ApagarImagem;

  if FileExists(uniMainModule.tblCursosCUR_IMG_CAPA.AsString) then
     UniImage1.Picture.LoadFromFile(uniMainModule.tblCursosCUR_IMG_CAPA.AsString);
end;

procedure TDFormCarregarImagemCapaCurso.ApagarImagem(Sender: TObject);
begin
  if FileExists(uniMainModule.tblCursosCUR_IMG_CAPA.AsString) then
  begin
    if not (uniMainModule.tblCursos.State in [dsEdit, dsInsert]) then
      uniMainModule.tblCursos.Edit;

    DeleteFile(uniMainModule.tblCursosCUR_IMG_CAPA.AsString);
    uniMainModule.tblCursosCUR_IMG_CAPA.AsString := '';
    UniImage1.Picture.Assign(nil);
    uniMainModule.tblCursos.Post;
  end;
end;

procedure TDFormCarregarImagemCapaCurso.CarregarImagem(Sender: TObject);
begin
  UniFileUploadImage.Execute;
end;

procedure TDFormCarregarImagemCapaCurso.FecharForm(Sender: TObject);
begin
  Close;
end;

end.
