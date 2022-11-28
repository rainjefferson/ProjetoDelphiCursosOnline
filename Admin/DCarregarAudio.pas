unit DCarregarAudio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniGUIBaseClasses,
  uniPanel, uniImage, uniFileUpload, Data.DB, uniMemo, uniDBMemo, uniHTMLFrame, uniButton;

type
  TDFormCarregarAudio = class(TUniForm)
    UniPanel1: TUniPanel;
    lblVoltar: TUniLabel;
    lblIncluir: TUniLabel;
    UniFileUploadAudio: TUniFileUpload;
    UniHTMLFrame1: TUniHTMLFrame;
    lblPlay: TUniLabel;
    lblPause: TUniLabel;
    lblApagar: TUniLabel;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFileUploadAudioCompleted(Sender: TObject; AStream: TFileStream);
  private
    procedure FecharForm(Sender: TObject);
    procedure CarregarAudio(Sender: TObject);
    procedure ApagarAudio(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

function DFormCarregarAudio: TDFormCarregarAudio;

implementation

uses
  uniGUIApplication, MainModule, ServerModule;

{$R *.dfm}

function DFormCarregarAudio: TDFormCarregarAudio;
begin
  Result := TDFormCarregarAudio(UniMainModule.GetFormInstance(TDFormCarregarAudio));
end;

procedure TDFormCarregarAudio.UniFileUploadAudioCompleted(Sender: TObject; AStream: TFileStream);
var
  FileAudio: String;
begin
  if not (uniMainModule.tblAulas.State in [dsEdit, dsInsert]) then
    uniMainModule.tblAulas.Edit;

  uniMainModule.tblAulasAUL_FILE_AUDIO.AsString :=
    uniMainModule.SalvarMidiaAudio(
      AStream,
      uniMainModule.tblAulasAUL_ID.AsInteger,
      UniFileUploadAudio.FileName);

  {$ifndef UNIGUI_VCL}
  FileAudio := StringReplace(uniMainModule.tblAulasAUL_FILE_AUDIO.AsString, 'files/', 'AdmAcademiaPregadores/files/', [rfIgnoreCase]); ;
  {$else}
  FileAudio := uniMainModule.tblAulasAUL_FILE_AUDIO.AsString;
  {$endif}

  UniHTMLFrame1.HTML.Text := '<audio id="player1" src="' + FileAudio + '"></audio>';

  Self.Caption := 'Audio: ' + ExtractFileName(FileAudio);
end;

procedure TDFormCarregarAudio.UniFormCreate(Sender: TObject);
var
  FileAudio: String;
begin
  if not (uniMainModule.tblCursos.State in [dsEdit, dsInsert]) then
    uniMainModule.tblCursos.Edit;

  lblVoltar.Caption := ' <button class="btn btn-primary">« VOLTAR</button>';
  lblVoltar.OnClick := FecharForm;
  
  lblIncluir.Caption := ' <button class="btn btn-success">CARREGAR</button>';
  lblIncluir.OnClick := CarregarAudio;

  lblApagar.Caption := ' <button class="btn btn-success">APAGAR</button>';
  lblApagar.OnClick := ApagarAudio;

  lblPlay.Caption := ' <button class="btn btn-success">Play</button>';
  lblPause.Caption := ' <button class="btn btn-danger">Stop</button>';

  {$ifndef UNIGUI_VCL}
  FileAudio := StringReplace(uniMainModule.tblAulasAUL_FILE_AUDIO.AsString, 'files/', 'AdmAcademiaPregadores/files/', [rfIgnoreCase]); ;
  {$else}
  FileAudio := uniMainModule.tblAulasAUL_FILE_AUDIO.AsString;
  {$endif}

  UniHTMLFrame1.HTML.Text := '<audio id="player1" src="' + FileAudio + '"></audio>';

  Self.Caption := 'Audio: ' + ExtractFileName(FileAudio);
end;

procedure TDFormCarregarAudio.ApagarAudio(Sender: TObject);
var
   sFileAudio: String;
   PastaArquivos: String;
begin
  {$ifndef UNIGUI_VCL}
  PastaArquivos := StringReplace(UniServerModule.PastaFiles, 'files/', 'AdmAcademiaPregadores/files/', [rfIgnoreCase]);
  {$else}
  PastaArquivos := UniServerModule.PastaFiles;
  {$endif}

  sFileAudio := StringReplace(uniMainModule.tblAulasAUL_FILE_AUDIO.AsString, '/files/' , PastaArquivos, [rfIgnoreCase]);
  if FileExists(sFileAudio) then
  begin
    if not (uniMainModule.tblAulas.State in [dsEdit, dsInsert]) then
      uniMainModule.tblAulas.Edit;

    DeleteFile(sFileAudio);
    uniMainModule.tblAulasAUL_FILE_AUDIO.AsString := '';

    uniMainModule.tblAulas.Post;
  end;
end;

procedure TDFormCarregarAudio.FecharForm(Sender: TObject);
begin
  Close;
end;

procedure TDFormCarregarAudio.CarregarAudio(Sender: TObject);
begin
  UniFileUploadAudio.Execute;
end;

end.
