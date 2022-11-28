unit DCarregarApostilaAula;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniGUIBaseClasses,
  uniPanel, uniImage, uniFileUpload, Data.DB, uniURLFrame;

type
  TDFormCarregarApostilaAula = class(TUniForm)
    UniPanel1: TUniPanel;
    lblVoltar: TUniLabel;
    lblIncluir: TUniLabel;
    UniFileUploadApostila: TUniFileUpload;
    UniURLFrame1: TUniURLFrame;
    lblApagar: TUniLabel;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFileUploadApostilaCompleted(Sender: TObject; AStream: TFileStream);
  private
    procedure CarregarApostila(Sender: TObject);
    procedure FecharForm(Sender: TObject);
    procedure ApagarPDF(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

function DFormCarregarApostilaAula: TDFormCarregarApostilaAula;

implementation

uses
  uniGUIApplication, MainModule, ServerModule;

{$R *.dfm}

function DFormCarregarApostilaAula: TDFormCarregarApostilaAula;
begin
  Result := TDFormCarregarApostilaAula(UniMainModule.GetFormInstance(TDFormCarregarApostilaAula));
end;

procedure TDFormCarregarApostilaAula.UniFileUploadApostilaCompleted(Sender: TObject; AStream: TFileStream);
begin
  if UniMainModule.UploadApostila = tpApostilaAula then
  begin
    if not (uniMainModule.tblAulas.State in [dsEdit, dsInsert]) then
      uniMainModule.tblAulas.Edit;

    uniMainModule.tblAulasAUL_FILE_APOSTILA.AsString :=
      uniMainModule.SalvarApostilaAula(
        AStream,
        uniMainModule.tblAulasAUL_ID.AsInteger,
        UniFileUploadApostila.FileName);

    {$ifndef UNIGUI_VCL}
    UniURLFrame1.URL := StringReplace(uniMainModule.tblAulasAUL_FILE_APOSTILA.AsString, 'files/', 'AdmAcademiaPregadores/files/', [rfIgnoreCase]); ;
    {$else}
    UniURLFrame1.URL := uniMainModule.tblAulasAUL_FILE_APOSTILA.AsString;
    {$endif}
  end
  else
  begin
    if not (uniMainModule.tblModulos.State in [dsEdit, dsInsert]) then
      uniMainModule.tblModulos.Edit;

    uniMainModule.tblModulosMOD_FILE_APOSTILA.AsString :=
      uniMainModule.SalvarApostilaModulo(
        AStream,
        uniMainModule.tblModulosMOD_ID.AsInteger,
        UniFileUploadApostila.FileName);

    {$ifndef UNIGUI_VCL}
    UniURLFrame1.URL := StringReplace(uniMainModule.tblModulosMOD_FILE_APOSTILA.AsString, 'files/', 'AdmAcademiaPregadores/files/', [rfIgnoreCase]); ;
    {$else}
    UniURLFrame1.URL := uniMainModule.tblModulosMOD_FILE_APOSTILA.AsString;
    {$endif}
  end;
end;

procedure TDFormCarregarApostilaAula.UniFormCreate(Sender: TObject);
var
  PastaArquivos: String;
begin
  {$ifndef UNIGUI_VCL}
  PastaArquivos := StringReplace(UniServerModule.PastaFiles, 'files/', 'AdmAcademiaPregadores/files/', [rfIgnoreCase]);
  {$else}
  PastaArquivos := UniServerModule.PastaFiles;
  {$endif}

  lblVoltar.Caption := ' <button class="btn btn-primary">« VOLTAR</button>';
  lblVoltar.OnClick := FecharForm;

  lblIncluir.Caption := ' <button class="btn btn-success">CARREGAR</button>';
  lblIncluir.OnClick := CarregarApostila;

  lblApagar.Caption := ' <button class="btn btn-success">APAGAR</button>';
  lblApagar.OnClick := ApagarPDF;

  if UniMainModule.UploadApostila = tpApostilaAula then
  begin
     {$ifndef UNIGUI_VCL}
     UniURLFrame1.URL := StringReplace(uniMainModule.tblAulasAUL_FILE_APOSTILA.AsString, 'files/', 'AdmAcademiaPregadores/files/', [rfIgnoreCase]); ;
     {$else}
     UniURLFrame1.URL := uniMainModule.tblAulasAUL_FILE_APOSTILA.AsString;
     {$endif}
  end
  else
  begin
    {$ifndef UNIGUI_VCL}
    UniURLFrame1.URL := StringReplace(uniMainModule.tblModulosMOD_FILE_APOSTILA.AsString, 'files/', 'AdmAcademiaPregadores/files/', [rfIgnoreCase]); ;
    {$else}
    UniURLFrame1.URL := uniMainModule.tblModulosMOD_FILE_APOSTILA.AsString;
    {$endif}
  end;
end;

procedure TDFormCarregarApostilaAula.ApagarPDF(Sender: TObject);
var
   sFilePDF: String;
   PastaArquivos: String;
begin
  {$ifndef UNIGUI_VCL}
  PastaArquivos := StringReplace(UniServerModule.PastaFiles, 'files/', 'AdmAcademiaPregadores/files/', [rfIgnoreCase]);
  {$else}
  PastaArquivos := UniServerModule.PastaFiles;
  {$endif}

  if UniMainModule.UploadApostila = tpApostilaAula then
    sFilePDF := StringReplace(uniMainModule.tblAulasAUL_FILE_APOSTILA.AsString, '/files/' , PastaArquivos, [rfIgnoreCase])
  else
    sFilePDF := StringReplace(uniMainModule.tblModulosMOD_FILE_APOSTILA.AsString, '/files/' , PastaArquivos, [rfIgnoreCase]);

  if FileExists(sFilePDF) then
  begin
    if UniMainModule.UploadApostila = tpApostilaAula then
    begin
      if not (uniMainModule.tblAulas.State in [dsEdit, dsInsert]) then
        uniMainModule.tblAulas.Edit;
    end
    else
    begin
      if not (uniMainModule.tblModulos.State in [dsEdit, dsInsert]) then
        uniMainModule.tblModulos.Edit;
    end;

    DeleteFile(sFilePDF);

    UniURLFrame1.URL := '';

    if UniMainModule.UploadApostila = tpApostilaAula then
      uniMainModule.tblAulasAUL_FILE_APOSTILA.AsString := ''
    else
      uniMainModule.tblModulosMOD_FILE_APOSTILA.AsString := '';

    if UniMainModule.UploadApostila = tpApostilaAula then
      uniMainModule.tblAulas.Post
    else
      uniMainModule.tblModulos.Post;
  end;
end;

procedure TDFormCarregarApostilaAula.CarregarApostila(Sender: TObject);
begin
  UniFileUploadApostila.Execute;
end;

procedure TDFormCarregarApostilaAula.FecharForm(Sender: TObject);
begin
  Close;
end;

end.
