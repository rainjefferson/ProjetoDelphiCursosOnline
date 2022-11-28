unit DCarregarImagemMiniaturaCurso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniGUIBaseClasses,
  uniPanel, uniImage, uniFileUpload, Data.DB;

type
  TDFormCarregarImagemMiniaturaCurso = class(TUniForm)
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

function DFormCarregarImagemMiniaturaCurso: TDFormCarregarImagemMiniaturaCurso;

implementation

uses
  uniGUIApplication, MainModule;

{$R *.dfm}

function DFormCarregarImagemMiniaturaCurso: TDFormCarregarImagemMiniaturaCurso;
begin
  Result := TDFormCarregarImagemMiniaturaCurso(UniMainModule.GetFormInstance(TDFormCarregarImagemMiniaturaCurso));
end;

procedure TDFormCarregarImagemMiniaturaCurso.UniFileUploadImageCompleted(Sender: TObject; AStream: TFileStream);
begin
  UniImage1.LoadFromStream(AStream);

  if not (uniMainModule.tblCursos.State in [dsEdit, dsInsert]) then
    uniMainModule.tblCursos.Edit;

  uniMainModule.tblCursosCUR_IMG_MINIATURA.AsString :=
    uniMainModule.SalvarImagemMiniaturaCurso(
      UniImage1,
      uniMainModule.tblCursosCUR_ID.AsInteger,
      UniFileUploadImage.FileName);
end;

procedure TDFormCarregarImagemMiniaturaCurso.UniFormCreate(Sender: TObject);
begin
  lblVoltar.Caption := ' <button class="btn btn-primary">« VOLTAR</button>';
  lblVoltar.OnClick := FecharForm;

  lblIncluir.Caption := ' <button class="btn btn-success">CARREGAR</button>';
  lblIncluir.OnClick := CarregarImagem;

  lblApagar.Caption := ' <button class="btn btn-success">APAGAR</button>';
  lblApagar.OnClick := ApagarImagem;

  if FileExists(uniMainModule.tblCursosCUR_IMG_MINIATURA.AsString) then
     UniImage1.Picture.LoadFromFile(uniMainModule.tblCursosCUR_IMG_MINIATURA.AsString);
end;

procedure TDFormCarregarImagemMiniaturaCurso.ApagarImagem(Sender: TObject);
begin
  if FileExists(uniMainModule.tblCursosCUR_IMG_MINIATURA.AsString) then
  begin
    if not (uniMainModule.tblCursos.State in [dsEdit, dsInsert]) then
      uniMainModule.tblCursos.Edit;

    DeleteFile(uniMainModule.tblCursosCUR_IMG_MINIATURA.AsString);
    uniMainModule.tblCursosCUR_IMG_MINIATURA.AsString := '';
    UniImage1.Picture.Assign(nil);
    uniMainModule.tblCursos.Post;
  end;
end;

procedure TDFormCarregarImagemMiniaturaCurso.CarregarImagem(Sender: TObject);
begin
  UniFileUploadImage.Execute;
end;

procedure TDFormCarregarImagemMiniaturaCurso.FecharForm(Sender: TObject);
begin
  Close;
end;

end.
