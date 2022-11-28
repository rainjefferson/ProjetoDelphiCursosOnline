unit DCarregarImagemProfessor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniGUIBaseClasses,
  uniPanel, uniImage, uniFileUpload, Data.DB;

type
  TDFormCarregarImagemProfessor = class(TUniForm)
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

function DFormCarregarImagemProfessor: TDFormCarregarImagemProfessor;

implementation

uses
  uniGUIApplication, MainModule;

{$R *.dfm}

function DFormCarregarImagemProfessor: TDFormCarregarImagemProfessor;
begin
  Result := TDFormCarregarImagemProfessor(UniMainModule.GetFormInstance(TDFormCarregarImagemProfessor));
end;

procedure TDFormCarregarImagemProfessor.UniFileUploadImageCompleted(Sender: TObject; AStream: TFileStream);
begin
  UniImage1.LoadFromStream(AStream);

  if not (uniMainModule.tblProfessores.State in [dsEdit, dsInsert]) then
    uniMainModule.tblProfessores.Edit;

  uniMainModule.tblProfessoresPRO_FOTO.AsString :=
    uniMainModule.SalvarImagemFotoProfessor(
      UniImage1,
      uniMainModule.tblProfessoresPRO_ID.AsInteger,
      UniFileUploadImage.FileName);
end;

procedure TDFormCarregarImagemProfessor.UniFormCreate(Sender: TObject);
begin
  lblVoltar.Caption := ' <button class="btn btn-primary">« VOLTAR</button>';
  lblVoltar.OnClick := FecharForm;

  lblIncluir.Caption := ' <button class="btn btn-success">CARREGAR</button>';
  lblIncluir.OnClick := CarregarImagem;

  lblApagar.Caption := ' <button class="btn btn-success">APAGAR</button>';
  lblApagar.OnClick := ApagarImagem;

  if FileExists(uniMainModule.tblProfessoresPRO_FOTO.AsString) then
     UniImage1.Picture.LoadFromFile(uniMainModule.tblProfessoresPRO_FOTO.AsString);
end;

procedure TDFormCarregarImagemProfessor.ApagarImagem(Sender: TObject);
begin
  if FileExists(uniMainModule.tblProfessoresPRO_FOTO.AsString) then
  begin
    if not (uniMainModule.tblProfessores.State in [dsEdit, dsInsert]) then
      uniMainModule.tblProfessores.Edit;

    DeleteFile(uniMainModule.tblProfessoresPRO_FOTO.AsString);
    uniMainModule.tblProfessoresPRO_FOTO.AsString := '';
    UniImage1.Picture.Assign(nil);
    uniMainModule.tblProfessores.Post;
  end;
end;

procedure TDFormCarregarImagemProfessor.CarregarImagem(Sender: TObject);
begin
  UniFileUploadImage.Execute;
end;

procedure TDFormCarregarImagemProfessor.FecharForm(Sender: TObject);
begin
  Close;
end;

end.
