unit DFormCadastroCursos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, {uniGUIForm,} uniGUIFrame, uniGUIBaseClasses, uniPageControl,
  uniPanel, uniToolBar, Data.DB,
  uniLabel, uniBasicGrid, uniDBGrid, uniButton, uniImage,
  uniFileUpload, uniImageList, uniDBText, uniDateTimePicker, uniEdit, uniScreenMask;

type
  //TDFormCadCursos = class(TUniForm)
  TDFormCadCursos = class(TUniFrame)
    UniPageControl1: TUniPageControl;
    tabCursos: TUniTabSheet;
    UniPanel2: TUniPanel;
    dbgCursos: TUniDBGrid;
    tabModulos: TUniTabSheet;
    tabAulas: TUniTabSheet;
    dbgModulos: TUniDBGrid;
    dbgAulas: TUniDBGrid;
    UniFileUploadImage: TUniFileUpload;
    UniFileUploadVideo: TUniFileUpload;
    UniPanel5: TUniPanel;
    lblVoltarCurso: TUniLabel;
    lblIncluirCurso: TUniLabel;
    lblAlterarCurso: TUniLabel;
    lblExcluirCurso: TUniLabel;
    lblGravarCurso: TUniLabel;
    UniPanel6: TUniPanel;
    lblVoltarModulo: TUniLabel;
    lblIncluirModulo: TUniLabel;
    lblAlterarModulo: TUniLabel;
    lblExcluirModulo: TUniLabel;
    lblGravarModulo: TUniLabel;
    UniPanel7: TUniPanel;
    lblVoltarAula: TUniLabel;
    lblIncluirAula: TUniLabel;
    lblAlterarAula: TUniLabel;
    lblExcluirAula: TUniLabel;
    lblGravarAula: TUniLabel;
    UniHiddenPanel1: TUniHiddenPanel;
    edtDataPublicadoEm: TUniDateTimePicker;
    edtDataDisponivelAte: TUniDateTimePicker;
    edtValorCurso: TUniFormattedNumberEdit;
    edtDataCadatro: TUniDateTimePicker;
    UniHiddenPanel2: TUniHiddenPanel;
    edtDataCadastroModulos: TUniDateTimePicker;
    UniHiddenPanel3: TUniHiddenPanel;
    edtDataCadastroAula: TUniDateTimePicker;
    edtDataLiberacaoAula: TUniDateTimePicker;
    edtPesquisarCursos: TUniEdit;
    edtPesquisarModulos: TUniEdit;
    edtPesquisarAulas: TUniEdit;
    edtValorCursoPorAula: TUniFormattedNumberEdit;
    UniPanel1: TUniPanel;
    lblNomeCurso: TUniLabel;
    UniPanel3: TUniPanel;
    lblNomeCursoModulo: TUniLabel;
    UniScreenMask1: TUniScreenMask;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFileUploadVideoCompleted(Sender: TObject; AStream: TFileStream);
    procedure dbgCursosColumnActionClick(Column: TUniDBGridColumn; ButtonId: Integer);
    procedure dbgAulasColumnActionClick(Column: TUniDBGridColumn; ButtonId: Integer);
    procedure dbgCursosSelectionChange(Sender: TObject);
    procedure dbgModulosColumnActionClick(Column: TUniDBGridColumn; ButtonId: Integer);
    procedure dbgModulosSelectionChange(Sender: TObject);
    procedure dbgCursosCellClick(Column: TUniDBGridColumn);
    procedure dbgModulosCellClick(Column: TUniDBGridColumn);
    procedure dbgAulasCellClick(Column: TUniDBGridColumn);
    procedure edtPesquisarCursosChange(Sender: TObject);
    procedure edtPesquisarModulosChange(Sender: TObject);
    procedure edtPesquisarAulasChange(Sender: TObject);
    procedure dbgCursosTitleClick(Column: TUniDBGridColumn);
    procedure dbgModulosTitleClick(Column: TUniDBGridColumn);
    procedure dbgAulasTitleClick(Column: TUniDBGridColumn);
  private
    { Private declarations }
    FAlterandoColuna: Boolean;
    procedure VoltarParaCursos(Sender: TObject);
    procedure VoltarParaModulos(Sender: TObject);
    procedure CriarBotoesControleCursos;
    procedure CriarBotoesControleAulas;
    procedure CriarBotoesControleModulos;
  public
    { Public declarations }
  end;

function DFormCadCursos: TDFormCadCursos;

implementation

{$R *.dfm}

uses
  uniGUIApplication, MainModule;

function DFormCadCursos: TDFormCadCursos;
begin
  Result := TDFormCadCursos(UniMainModule.GetFormInstance(TDFormCadCursos));
end;

procedure TDFormCadCursos.dbgCursosCellClick(Column: TUniDBGridColumn);
begin
  ///Ativo
  if Column.Title.Caption = 'Ativo' then
  begin
    try
      if UniMainModule.tblCursos.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblCursos.Edit;
        UniMainModule.tblCursosCUR_ATIVO.AsBoolean := (not UniMainModule.tblCursosCUR_ATIVO.AsBoolean);
        UniMainModule.tblCursos.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;

  ///Pago
  if Column.Title.Caption = 'Pago' then
  begin
    try
      if UniMainModule.tblCursos.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblCursos.Edit;
        UniMainModule.tblCursosCUR_PAGO.AsBoolean := (not UniMainModule.tblCursosCUR_PAGO.AsBoolean);
        UniMainModule.tblCursos.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;

  ///Destaque
  if Column.Title.Caption = 'Destaque' then
  begin
    try
      if UniMainModule.tblCursos.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblCursos.Edit;
        UniMainModule.tblCursosCUR_DESTAQUE.AsBoolean := (not UniMainModule.tblCursosCUR_DESTAQUE.AsBoolean);
        UniMainModule.tblCursos.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;

  ///Não Listado
  if Column.Title.Caption = 'Não Listado' then
  begin
    try
      if UniMainModule.tblCursos.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblCursos.Edit;
        UniMainModule.tblCursosCUR_NAO_LISTADO.AsBoolean := (not UniMainModule.tblCursosCUR_NAO_LISTADO.AsBoolean);
        UniMainModule.tblCursos.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;

  ///Em Criação
  if Column.Title.Caption = 'Em Criação' then
  begin
    try
      if UniMainModule.tblCursos.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblCursos.Edit;
        UniMainModule.tblCursosCUR_EM_CRIACAO.AsBoolean := (not UniMainModule.tblCursosCUR_EM_CRIACAO.AsBoolean);
        UniMainModule.tblCursos.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;

  /// Imagem Capa
  if Column.Title.Caption = 'Imagem da capa' then
     UniMainModule.actCarregarImagemCapaExecute(UniMainModule.actCarregarImagemCapa);

  /// imagem destaque
  if Column.Title.Caption = 'Imagem de destaque' then
     UniMainModule.actCarregarImagemDestaqueExecute(UniMainModule.actCarregarImagemDestaque);

  /// Html conteúdo
  if Column.Title.Caption = 'Texto Html' then
     UniMainModule.actCarregarConteudoHtmlExecute(UniMainModule.actCarregarConteudoHtml);

  /// módulos
  if Column.Title.Caption = 'MÓDULOS' then
    UniPageControl1.ActivePage := tabModulos;

  /// Professores
  if Column.Title.Caption = 'Professores' then
    UniMainModule.actVincularProfessoresCursoExecute(UniMainModule.actVincularProfessoresCurso);

  /// Certificado 16
  if Column.Title.Caption = 'Certificado Html' then
    UniMainModule.actCarregarConteudoHtmlCertificadoExecute(UniMainModule.actCarregarConteudoHtmlCertificado);

//  /// Prova 17
//  if Column.ID = 17 then
//    UniMainModule.actCarregarConteudoHtmlProvaExecute(UniMainModule.actCarregarConteudoHtmlProva);

  /// Imagem chamada
  if Column.Title.Caption = 'Imagem Chamada' then
    UniMainModule.actCarregarImagemChamadaCursoExecute(UniMainModule.actCarregarImagemChamadaCurso);

  /// Video da chamada
  if Column.Title.Caption = 'Vídeo Vimeo Chamada' then
  begin
    UniMainModule.SetTipoCarregarVideoChamada;
    UniMainModule.actCarregarVideosVimeoExecute(UniMainModule.actCarregarVideosVimeo);
  end;

  /// Imagem miniatura do curso - módulo
  if Column.Title.Caption = 'Imagem Miniatura' then
    UniMainModule.actCarregarImagemMiniaturaCursoExecute(UniMainModule.actCarregarImagemMiniaturaCurso);

  /// Ações de edição
  if Column.ID = dbgCursos.Columns.Count-1 then
  begin
    if UniMainModule.tblCursos.State in dsEditModes then
      UniMainModule.tblCursos.Cancel
    else
      UniMainModule.actExcluirCursoExecute(UniMainModule.actExcluirCurso);
  end;
end;

procedure TDFormCadCursos.dbgCursosColumnActionClick(Column: TUniDBGridColumn; ButtonId: Integer);
begin
  //ShowMessage('ColumnActionClick: ' + Column.Title.Caption);

  /// Imagem Capa
  if Column.Title.Caption = 'Imagem da capa' then
     UniMainModule.actCarregarImagemCapaExecute(UniMainModule.actCarregarImagemCapa);

  /// imagem destaque
  if Column.Title.Caption = 'Imagem de destaque' then
     UniMainModule.actCarregarImagemDestaqueExecute(UniMainModule.actCarregarImagemDestaque);

  /// Html conteúdo
  if Column.Title.Caption = 'Texto Html' then
     UniMainModule.actCarregarConteudoHtmlExecute(UniMainModule.actCarregarConteudoHtml);

  /// módulos
  if Column.Title.Caption = 'MÓDULOS' then
    UniPageControl1.ActivePage := tabModulos;

  /// Certificado 16
  if Column.Title.Caption = 'Certificado Html' then
    UniMainModule.actCarregarConteudoHtmlCertificadoExecute(UniMainModule.actCarregarConteudoHtmlCertificado);

//  /// Prova 17
//  if Column.ID = 17 then
//    UniMainModule.actCarregarConteudoHtmlProvaExecute(UniMainModule.actCarregarConteudoHtmlProva);

  /// Imagem chamada
  if Column.Title.Caption = 'Imagem Chamada' then
    UniMainModule.actCarregarImagemChamadaCursoExecute(UniMainModule.actCarregarImagemChamadaCurso);

  /// Video da chamada
  if Column.Title.Caption = 'Vídeo Vimeo Chamada' then
  begin
    UniMainModule.SetTipoCarregarVideoChamada;
    UniMainModule.actCarregarVideosVimeoExecute(UniMainModule.actCarregarVideosVimeo);
  end;

  /// Imagem miniatura do curso - módulo
  if Column.Title.Caption = 'Imagem Miniatura' then
    UniMainModule.actCarregarImagemMiniaturaCursoExecute(UniMainModule.actCarregarImagemMiniaturaCurso);

  /// Ações de edição
  if Column.ID = dbgCursos.Columns.Count-1 then
  begin
    UniMainModule.actExcluirCursoExecute(UniMainModule.actExcluirCurso);
//    case ButtonId of
//      0: UniMainModule.actAlterarCursoExecute(UniMainModule.actAlterarCurso);
//      1: UniMainModule.actExcluirCurs-oExecute(UniMainModule.actExcluirCurso);
//      2: UniMainModule.actGravarCursoExecute(UniMainModule.actGravarCurso);
//    end;
  end;
end;

procedure TDFormCadCursos.dbgCursosSelectionChange(Sender: TObject);
begin
  lblNomeCurso.Caption := '<p class="text-primary">Módulos do Curso "' + UniMainModule.tblCursosCUR_NOME.AsString + '"</p>';
end;

procedure TDFormCadCursos.dbgCursosTitleClick(Column: TUniDBGridColumn);
begin
  if Column.Tag <> -1 then
    UniMainModule.OrdenarCursosPor(Column.FieldName);
end;

procedure TDFormCadCursos.dbgModulosCellClick(Column: TUniDBGridColumn);
begin
  /// Aulas
  if Column.Title.Caption = 'AULAS' then
    UniPageControl1.ActivePage := tabAulas;

  /// Arquivo Apostila do modulo
  if Column.Title.Caption = 'Apostila' then
  begin
    UniMainModule.SetApostilaModulo;
    UniMainModule.actCarregarApostilaExecute(UniMainModule.actCarregarApostila);

//    if (not uniMainModule.tblModulos.Active) or (uniMainModule.tblModulos.IsEmpty) then
//      Exit;
//
//    if not (uniMainModule.tblModulos.State in [dsEdit, dsInsert]) then
//      uniMainModule.tblModulos.Edit;
//
//    UniFileUploadAnexos.Execute;
  end;

  /// Ações de edição
  if Column.ID = dbgModulos.Columns.Count-1 then
  begin
    if UniMainModule.tblModulos.State in dsEditModes then
      UniMainModule.tblModulos.Cancel
    else
      UniMainModule.actExcluirModuloExecute(UniMainModule.actExcluirModulo);
  end;
end;

procedure TDFormCadCursos.dbgModulosColumnActionClick(Column: TUniDBGridColumn; ButtonId: Integer);
begin
  if Column.Title.Caption = 'ORDEM' then
  begin
    if ButtonId = 0 then
      UniMainModule.AumentarOrdemModulo(UniMainModule.tblModulosCUR_ID.AsInteger,UniMainModule.tblModulosMOD_ORDEM_POSICAO.AsInteger)
    else
      UniMainModule.DiminuirOrdemModulo(UniMainModule.tblModulosCUR_ID.AsInteger,UniMainModule.tblModulosMOD_ORDEM_POSICAO.AsInteger);
  end;

  /// Ações de edição
  if Column.ID = dbgAulas.Columns.Count-1 then
  begin
    UniMainModule.actExcluirModuloExecute(UniMainModule.actExcluirModulo);
//    case ButtonId of
//      0: UniMainModule.actAlterarModuloExecute(UniMainModule.actAlterarModulo);
//      1: UniMainModule.actExcluirModuloExecute(UniMainModule.actExcluirModulo);
//      2: UniMainModule.actGravarModuloExecute(UniMainModule.actGravarModulo);
//    end;
  end;
end;

procedure TDFormCadCursos.dbgModulosSelectionChange(Sender: TObject);
begin
  lblNomeCursoModulo.Caption := '<p class="text-primary">Aulas do Módulo "' + UniMainModule.tblModulosMOD_NOME.AsString +
    '" e Curso "' + UniMainModule.tblCursosCUR_NOME.AsString + '"</p>';
end;

procedure TDFormCadCursos.dbgModulosTitleClick(Column: TUniDBGridColumn);
begin
  //if Column.Tag <> -1 then
  //  UniMainModule.OrdenarModulosPor(Column.FieldName);
end;

procedure TDFormCadCursos.edtPesquisarAulasChange(Sender: TObject);
begin
   UniMainModule.tblAulas.Filter := 'AUL_NOME LIKE ''%' + edtPesquisarAulas.Text + '%''';
end;

procedure TDFormCadCursos.edtPesquisarCursosChange(Sender: TObject);
begin
  UniMainModule.tblCursos.Filter := 'CUR_NOME LIKE ''%' + edtPesquisarCursos.Text + '%''';
end;

procedure TDFormCadCursos.edtPesquisarModulosChange(Sender: TObject);
begin
   UniMainModule.tblModulos.Filter := 'MOD_NOME LIKE ''%' + edtPesquisarModulos.Text + '%''';
end;

procedure TDFormCadCursos.dbgAulasCellClick(Column: TUniDBGridColumn);
begin
  ///Permite antecipar
  if Column.Title.Caption = 'Permite Antecipar' then
  begin
    try
      if UniMainModule.tblAulas.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblAulas.Edit;
        UniMainModule.tblAulasAUL_PERMITE_ANTECIPAR.AsBoolean := (not UniMainModule.tblAulasAUL_PERMITE_ANTECIPAR.AsBoolean);
        UniMainModule.tblAulas.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;

  ///Gratis
  if Column.Title.Caption = 'Grátis' then
  begin
    try
      if UniMainModule.tblAulas.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblAulas.Edit;
        UniMainModule.tblAulasAUL_GRATIS.AsBoolean := (not UniMainModule.tblAulasAUL_GRATIS.AsBoolean);
        UniMainModule.tblAulas.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;

  ///Em Criação
  if Column.Title.Caption = 'Em Criação' then
  begin
    try
      if UniMainModule.tblAulas.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblAulas.Edit;
        UniMainModule.tblAulasAUL_EM_CRIACAO.AsBoolean := (not UniMainModule.tblAulasAUL_EM_CRIACAO.AsBoolean);
        UniMainModule.tblAulas.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;

  /// Escolher Video Vimeo
  if Column.Title.Caption = 'Vídeo' then
  begin
    UniMainModule.SetTipoCarregarVideoAula;
    UniMainModule.actCarregarVideosVimeoExecute(UniMainModule.actCarregarVideosVimeo);
  end;

  /// Imagem do banner
  if Column.Title.Caption = 'Imagem banner' then
    UniMainModule.actCarregarImagemBannerExecute(UniMainModule.actCarregarImagemBanner);

  /// Arquivo Apostila da aula
  if Column.Title.Caption = 'Apostila' then
  begin
    UniMainModule.SetApostilaAula;
    UniMainModule.actCarregarApostilaExecute(UniMainModule.actCarregarApostila);

//    if (not uniMainModule.tblAulas.Active) or (uniMainModule.tblAulas.IsEmpty) then
//      Exit;
//
//    if not (uniMainModule.tblAulas.State in [dsEdit, dsInsert]) then
//      uniMainModule.tblAulas.Edit;
//
//    UniFileUploadAnexos.Execute;
  end;

  /// Arquivo Audio
  if Column.Title.Caption = 'Audio' then
  begin
     UniMainModule.actCarregarAudioExecute(UniMainModule.actCarregarAudio);

//     if (not uniMainModule.tblAulas.Active) or (uniMainModule.tblAulas.IsEmpty) then
//       Exit;
//
//      if not (uniMainModule.tblAulas.State in dsEditModes) then
//        uniMainModule.tblAulas.Edit;
//
//      UniFileUploadAudio.Execute;
  end;

  /// Ações de edição
  if Column.ID = dbgAulas.Columns.Count-1 then
  begin
    if uniMainModule.tblAulas.State in dsEditModes then
      uniMainModule.tblAulas.Cancel
    else
      UniMainModule.actExcluirAulaExecute(UniMainModule.actExcluirAula);
  end;
end;

procedure TDFormCadCursos.dbgAulasColumnActionClick(Column: TUniDBGridColumn; ButtonId: Integer);
begin
  if Column.Title.Caption = 'ORDEM' then
  begin
    if ButtonId = 0 then
      UniMainModule.AumentarOrdemAula(UniMainModule.tblAulasMOD_ID.AsInteger,UniMainModule.tblAulasAUL_ORDEM_POSICAO.AsInteger)
    else
      UniMainModule.DiminuirOrdemAula(UniMainModule.tblAulasMOD_ID.AsInteger,UniMainModule.tblAulasAUL_ORDEM_POSICAO.AsInteger);
  end;

  /// Escolher Video Vimeo
  if Column.Title.Caption = 'Vídeo' then
  begin
    UniMainModule.SetTipoCarregarVideoAula;
    UniMainModule.actCarregarVideosVimeoExecute(UniMainModule.actCarregarVideosVimeo);
  end;

  /// Imagem do banner
  if Column.Title.Caption = 'Imagem banner' then
    UniMainModule.actCarregarImagemBannerExecute(UniMainModule.actCarregarImagemBanner);

  /// Arquivo Apostila da aula
  if Column.Title.Caption = 'Apostila' then
  begin
    UniMainModule.SetApostilaAula;
    UniMainModule.actCarregarApostilaExecute(UniMainModule.actCarregarApostila);
//     if (not uniMainModule.tblAulas.Active) or (uniMainModule.tblAulas.IsEmpty) then
//       Exit;
//
//      if not (uniMainModule.tblAulas.State in [dsEdit, dsInsert]) then
//        uniMainModule.tblAulas.Edit;
//
//      UniFileUploadAnexos.Execute;
  end;

  /// Arquivo Audio
  if Column.Title.Caption = 'Audio' then
  begin
    UniMainModule.actCarregarAudioExecute(UniMainModule.actCarregarAudio);

//     if (not uniMainModule.tblAulas.Active) or (uniMainModule.tblAulas.IsEmpty) then
//       Exit;
//
//      if not (uniMainModule.tblAulas.State in dsEditModes) then
//        uniMainModule.tblAulas.Edit;
//
//      UniFileUploadAudio.Execute;
  end;

  /// Ações de edição
  if Column.ID = dbgAulas.Columns.Count-1 then
  begin
    UniMainModule.actExcluirAulaExecute(UniMainModule.actExcluirAula);
//    case ButtonId of
//      0: UniMainModule.actAlterarAulaExecute(UniMainModule.actAlterarAula);
//      1: UniMainModule.actExcluirAulaExecute(UniMainModule.actExcluirAula);
//      2: UniMainModule.actGravarAulaExecute(UniMainModule.actGravarAula);
//    end;
  end;
end;

procedure TDFormCadCursos.dbgAulasTitleClick(Column: TUniDBGridColumn);
begin
  //UniMainModule.OrdenarAulasPor(Column.FieldName);
end;

procedure TDFormCadCursos.UniFileUploadVideoCompleted(Sender: TObject; AStream: TFileStream);
begin
  if not (uniMainModule.tblAulas.State in [dsEdit, dsInsert]) then
    uniMainModule.tblAulas.Edit;

  uniMainModule.tblAulasAUL_VIDEO.AsString :=
    uniMainModule.SalvarVideoDaAula(
      AStream,
      uniMainModule.tblAulasAUL_ID.AsInteger,
      UniFileUploadVideo.FileName);
end;

procedure TDFormCadCursos.UniFormCreate(Sender: TObject);
begin
  /// UniScreenMask1.AttachedControl := dbgCursos.Columns.ColumnFromFieldName('CC_VIDEO_CHAMADA');

  FAlterandoColuna := False;
  CriarBotoesControleCursos;
  CriarBotoesControleModulos;
  CriarBotoesControleAulas;

  uniMainModule.OnCreateCursos(Sender);
end;

procedure TDFormCadCursos.UniFormDestroy(Sender: TObject);
begin
  UniMainModule.tblCursos.Filter := '';
  UniMainModule.tblModulos.Filter := '';
  UniMainModule.tblAulas.Filter := '';
  uniMainModule.OnDestroyCursos(Sender);
end;

procedure TDFormCadCursos.CriarBotoesControleCursos;
begin
  lblVoltarCurso.Caption := ' <button class="btn btn-primary">« VOLTAR</button>';
  //lblVoltarCurso.OnClick := FecharForm;

  lblIncluirCurso.Caption := ' <button class="btn btn-success">NOVO CURSO</button>';
  lblIncluirCurso.OnClick := UniMainModule.actIncluirCursoExecute;

  lblAlterarCurso.Caption := ' <button class="btn btn-warning">ALTEAR</button>';
  lblAlterarCurso.OnClick := UniMainModule.actAlterarCursoExecute;

  lblExcluirCurso.Caption := ' <button class="btn btn-danger">EXCLUIR</button>';
  lblExcluirCurso.OnClick := UniMainModule.actExcluirCursoExecute;

  lblGravarCurso.Caption := ' <button class="btn btn-info">GRAVAR</button>';
  lblGravarCurso.OnClick := UniMainModule.actGravarCursoExecute;
end;

procedure TDFormCadCursos.CriarBotoesControleModulos;
begin
  lblVoltarModulo.Caption := ' <button class="btn btn-primary">« CURSOS</button>';
  lblVoltarModulo.OnClick := VoltarParaCursos;

  lblIncluirModulo.Caption := ' <button class="btn btn-success">NOVO MÓDULO</button>';
  lblIncluirModulo.OnClick := UniMainModule.actIncluirModuloExecute;

  lblAlterarModulo.Caption := ' <button class="btn btn-warning">ALTEAR</button>';
  lblAlterarModulo.OnClick := UniMainModule.actAlterarModuloExecute;

  lblExcluirModulo.Caption := ' <button class="btn btn-danger">EXCLUIR</button>';
  lblExcluirModulo.OnClick := UniMainModule.actExcluirModuloExecute;

  lblGravarModulo.Caption := ' <button class="btn btn-info">GRAVAR</button>';
  lblGravarModulo.OnClick := UniMainModule.actGravarModuloExecute;
end;

procedure TDFormCadCursos.CriarBotoesControleAulas;
begin
  lblVoltarAula.Caption := ' <button class="btn btn-primary">« MÓDULOS</button>';
  lblVoltarAula.OnClick := VoltarParaModulos;

  lblIncluirAula.Caption := ' <button class="btn btn-success">NOVA AULA</button>';
  lblIncluirAula.OnClick := UniMainModule.actIncluirAulaExecute;

  lblAlterarAula.Caption := ' <button class="btn btn-warning">ALTEAR</button>';
  lblAlterarAula.OnClick := UniMainModule.actAlterarAulaExecute;

  lblExcluirAula.Caption := ' <button class="btn btn-danger">EXCLUIR</button>';
  lblExcluirAula.OnClick := UniMainModule.actExcluirAulaExecute;

  lblGravarAula.Caption := ' <button class="btn btn-info">GRAVAR</button>';
  lblGravarAula.OnClick := UniMainModule.actGravarAulaExecute;
end;

procedure TDFormCadCursos.VoltarParaCursos(Sender: TObject);
begin
  if UniMainModule.tblModulos.State in dsEditModes then
    UniMainModule.tblModulos.Post;

  UniPageControl1.ActivePage := tabCursos;
end;

procedure TDFormCadCursos.VoltarParaModulos(Sender: TObject);
begin
  if UniMainModule.tblAulas.State in dsEditModes then
    UniMainModule.tblAulas.Post;

  UniPageControl1.ActivePage := tabModulos;
end;

initialization
  RegisterClass(TDFormCadCursos);

end.
