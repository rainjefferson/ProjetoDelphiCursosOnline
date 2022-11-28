unit DCarregarVideosVimeo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniGUIBaseClasses,
  uniPanel, uniImage, uniFileUpload, Data.DB, uniBasicGrid,
  uniDBGrid, uniEdit, uniScreenMask, uniProgressBar;

type
  TDFormCarregarVideosVimeo = class(TUniForm)
    UniPanel1: TUniPanel;
    lblVoltar: TUniLabel;
    lblAtualizarVideos: TUniLabel;
    UniDBGrid1: TUniDBGrid;
    edtFiltrar: TUniEdit;
    UniScreenMask1: TUniScreenMask;
    UniProgressBar1: TUniProgressBar;
    procedure UniFormCreate(Sender: TObject);
    procedure UniDBGrid1DblClick(Sender: TObject);
    procedure edtFiltrarChange(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarVideos(Sender: TObject);
    procedure FecharForm(Sender: TObject);

  public
    { Public declarations }
  end;

function DFormCarregarVideosVimeo: TDFormCarregarVideosVimeo;

implementation

uses
  uniGUIApplication, MainModule;

{$R *.dfm}

function DFormCarregarVideosVimeo: TDFormCarregarVideosVimeo;
begin
  Result := TDFormCarregarVideosVimeo(UniMainModule.GetFormInstance(TDFormCarregarVideosVimeo));
end;

procedure TDFormCarregarVideosVimeo.UniDBGrid1DblClick(Sender: TObject);
begin
  if UniMainModule.CarregandoVideo = cvVideoAula then
  begin
    if not UniMainModule.tblAulas.IsEmpty then
    begin
      if not (UniMainModule.tblAulas.State in dsEditModes) then
        UniMainModule.tblAulas.Edit;

      UniMainModule.tblAulasAUL_ID_VIDEO_VIMEO.AsInteger := UniMainModule.SqlVideosVimeoID_VIDEO.AsInteger;
      Close;
    end;
  end
  else
  /// Video da chamada do curso
  begin
    if not UniMainModule.tblCursos.IsEmpty then
    begin
      if not (UniMainModule.tblCursos.State in dsEditModes) then
        UniMainModule.tblCursos.Edit;

      UniMainModule.tblCursosCUR_ID_VIDEO_VIMEO_CHAMADA.AsInteger := UniMainModule.SqlVideosVimeoID_VIDEO.AsInteger;
      Close;
    end;
  end;
end;

procedure TDFormCarregarVideosVimeo.UniFormCreate(Sender: TObject);
begin
  lblVoltar.Caption := ' <button class="btn btn-primary">« VOLTAR</button>';
  lblVoltar.OnClick := FecharForm;

  lblAtualizarVideos.Caption := ' <button class="btn btn-success">ATUALIZAR VÍDEOS</button>';
  lblAtualizarVideos.OnClick := CarregarVideos;

  UniMainModule.SqlVideosVimeo.FilterOptions := [foCaseInsensitive];
  UniMainModule.SqlVideosVimeo.Filtered := True;
  UniMainModule.SqlVideosVimeo.Filter := '';

  UniMainModule.OnCreateVideosVimeo(Sender);
end;

procedure TDFormCarregarVideosVimeo.CarregarVideos(Sender: TObject);
begin
  UniMainModule.SqlVideosVimeo.Close;
  UniMainModule.ObterListaVideosVimeo(UniProgressBar1);
end;

procedure TDFormCarregarVideosVimeo.edtFiltrarChange(Sender: TObject);
begin
  UniMainModule.SqlVideosVimeo.Filter := 'Nome_Video LIKE ''%' + edtFiltrar.Text + '%'' or Descricao_Video LIKE ''%' + edtFiltrar.Text + '%''';
end;

procedure TDFormCarregarVideosVimeo.FecharForm(Sender: TObject);
begin
  Close;
end;

end.
