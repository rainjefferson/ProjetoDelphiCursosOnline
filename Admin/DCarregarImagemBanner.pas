unit DCarregarImagemBanner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniGUIBaseClasses,
  uniPanel, uniImage, uniFileUpload, Data.DB;

type
  TDFormCarregarImagemBanner = class(TUniForm)
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

function DFormCarregarImagemBanner: TDFormCarregarImagemBanner;

implementation

uses
  uniGUIApplication, MainModule;

{$R *.dfm}

function DFormCarregarImagemBanner: TDFormCarregarImagemBanner;
begin
  Result := TDFormCarregarImagemBanner(UniMainModule.GetFormInstance(TDFormCarregarImagemBanner));
end;

procedure TDFormCarregarImagemBanner.UniFileUploadImageCompleted(Sender: TObject; AStream: TFileStream);
begin
  UniImage1.LoadFromStream(AStream);

  if not (uniMainModule.tblAulas.State in [dsEdit, dsInsert]) then
    uniMainModule.tblAulas.Edit;

  uniMainModule.tblAulasAUL_IMG_BANNER.AsString :=
    uniMainModule.SalvarImagemBanner(
      UniImage1,
      uniMainModule.tblAulasAUL_ID.AsInteger,
      UniFileUploadImage.FileName);
end;

procedure TDFormCarregarImagemBanner.UniFormCreate(Sender: TObject);
begin
  lblVoltar.Caption := ' <button class="btn btn-primary">« VOLTAR</button>';
  lblVoltar.OnClick := FecharForm;

  lblIncluir.Caption := ' <button class="btn btn-success">CARREGAR</button>';
  lblIncluir.OnClick := CarregarImagem;

  lblApagar.Caption := ' <button class="btn btn-success">APAGAR</button>';
  lblApagar.OnClick := ApagarImagem;

  if FileExists(uniMainModule.tblAulasAUL_IMG_BANNER.AsString) then
     UniImage1.Picture.LoadFromFile(uniMainModule.tblAulasAUL_IMG_BANNER.AsString);
end;

procedure TDFormCarregarImagemBanner.ApagarImagem(Sender: TObject);
begin
  if FileExists(uniMainModule.tblAulasAUL_IMG_BANNER.AsString) then
  begin
    if not (uniMainModule.tblAulas.State in [dsEdit, dsInsert]) then
      uniMainModule.tblAulas.Edit;

    DeleteFile(uniMainModule.tblAulasAUL_IMG_BANNER.AsString);
    uniMainModule.tblAulasAUL_IMG_BANNER.AsString := '';
    UniImage1.Picture.Assign(nil);
    uniMainModule.tblAulas.Post;
  end;
end;

procedure TDFormCarregarImagemBanner.CarregarImagem(Sender: TObject);
begin
  UniFileUploadImage.Execute;
end;

procedure TDFormCarregarImagemBanner.FecharForm(Sender: TObject);
begin
  Close;
end;

end.
