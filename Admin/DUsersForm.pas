unit DUsersForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, {uniGUIForm,} uniGUIFrame, uniBasicGrid, uniDBGrid, uniDBNavigator,
  uniGUIBaseClasses, uniPanel, uniToolBar, uniLabel, Data.DB;

type
  //TDUsersForm = class(TUniForm)
  TDUsersForm = class(TUniFrame)
    dbgUsuarios: TUniDBGrid;
    UniPanel1: TUniPanel;
    lblVoltar: TUniLabel;
    lblIncluir: TUniLabel;
    lblAlterar: TUniLabel;
    lblExcluir: TUniLabel;
    lblGravar: TUniLabel;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure dbgUsuariosColumnActionClick(Column: TUniDBGridColumn; ButtonId: Integer);
    procedure dbgUsuariosCellClick(Column: TUniDBGridColumn);
    procedure dbgUsuariosTitleClick(Column: TUniDBGridColumn);
  private
    { Private declarations }
    FAlterandoColuna: Boolean;
    procedure FecharForm(Sender: TObject);
  public
    { Public declarations }
  end;

function DCadDUsersForm: TDUsersForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function DCadDUsersForm: TDUsersForm;
begin
  Result := TDUsersForm(UniMainModule.GetFormInstance(TDUsersForm));
end;

procedure TDUsersForm.dbgUsuariosCellClick(Column: TUniDBGridColumn);
begin
   /// Imagem foto do usuário
  if AnsiUpperCase(Column.Title.Caption) = 'FOTO' then
     UniMainModule.actCarregarFotoUsuarioExecute(UniMainModule.actCarregarFotoUsuario);

  /// Ações de edição
  if Column.ID = dbgUsuarios.Columns.Count-1 then  /// Sempre a ultima coluna
  begin
    if UniMainModule.tblUsers.State in dsEditModes then
      UniMainModule.tblUsers.Cancel;
  end;

  /// - Administrador
  if Column.Title.Caption = 'Administrador' then
  begin
    try
      if UniMainModule.tblUsers.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblUsers.Edit;
        UniMainModule.tblUsersUSU_ADMIN.AsBoolean := (not UniMainModule.tblUsersUSU_ADMIN.AsBoolean);
        UniMainModule.tblUsers.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;


 /// - Alunos
 if Column.Title.Caption = 'Alunos' then
  begin
    try
      if UniMainModule.tblUsers.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblUsers.Edit;
        UniMainModule.tblUsersUSU_ALUNO.AsBoolean := (not UniMainModule.tblUsersUSU_ALUNO.AsBoolean);
        UniMainModule.tblUsers.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;


 /// - Financeiro
 if Column.Title.Caption = 'Financeiro' then
  begin
    try
      if UniMainModule.tblUsers.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblUsers.Edit;
        UniMainModule.tblUsersUSU_FINANCEIRO.AsBoolean := (not UniMainModule.tblUsersUSU_FINANCEIRO.AsBoolean);
        UniMainModule.tblUsers.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;

 /// - Cursos
 if Column.Title.Caption = 'Cursos' then
  begin
    try
      if UniMainModule.tblUsers.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblUsers.Edit;
        UniMainModule.tblUsersUSU_CURSO.AsBoolean := (not UniMainModule.tblUsersUSU_CURSO.AsBoolean);
        UniMainModule.tblUsers.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;

 /// - Suporte
  if Column.Title.Caption = 'Suporte' then
  begin
    try
      if UniMainModule.tblUsers.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblUsers.Edit;
        UniMainModule.tblUsersUSU_SUPORTE.AsBoolean := (not UniMainModule.tblUsersUSU_SUPORTE.AsBoolean);
        UniMainModule.tblUsers.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;

 ///- Gameficação
  if Column.Title.Caption = 'Gameficação' then
  begin
    try
      if UniMainModule.tblUsers.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblUsers.Edit;
        UniMainModule.tblUsersUSU_GAMEFICACAO.AsBoolean := (not UniMainModule.tblUsersUSU_GAMEFICACAO.AsBoolean);
        UniMainModule.tblUsers.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;

 /// - Documentos
  if Column.Title.Caption = 'Documentos' then
  begin
    try
      if UniMainModule.tblUsers.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblUsers.Edit;
        UniMainModule.tblUsersUSU_DOCUMETOS.AsBoolean := (not UniMainModule.tblUsersUSU_DOCUMETOS.AsBoolean);
        UniMainModule.tblUsers.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;

 /// - Relatórios
  if Column.Title.Caption = 'Relatórios' then
  begin
    try
      if UniMainModule.tblUsers.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblUsers.Edit;
        UniMainModule.tblUsersUSU_RELATORIOS.AsBoolean := (not UniMainModule.tblUsersUSU_RELATORIOS.AsBoolean);
        UniMainModule.tblUsers.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;

 ///  - Trilhas
  if Column.Title.Caption = 'Trilhas' then
  begin
    try
      if UniMainModule.tblUsers.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblUsers.Edit;
        UniMainModule.tblUsersUSU_TRILHAS.AsBoolean := (not UniMainModule.tblUsersUSU_TRILHAS.AsBoolean);
        UniMainModule.tblUsers.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;
end;

procedure TDUsersForm.dbgUsuariosColumnActionClick(Column: TUniDBGridColumn; ButtonId: Integer);
begin
  /// Imagem foto do usuário
  if Column.ID = 12 then
     UniMainModule.actCarregarFotoUsuarioExecute(UniMainModule.actCarregarFotoUsuario);

  /// Ações de edição
  if Column.ID = dbgUsuarios.Columns.Count-1 then  /// Sempre a ultima coluna
  begin
    UniMainModule.actExcluirUsuarioExecute(UniMainModule.actExcluirUsuario);
//    case ButtonId of
//      0: UniMainModule.actAlterarUsuarioExecute(UniMainModule.actAlterarUsuario);
//      1: UniMainModule.actExcluirUsuarioExecute(UniMainModule.actExcluirUsuario);
//      2: UniMainModule.actGravarUsuarioExecute(UniMainModule.actGravarUsuario);
//    end;
  end;
end;

procedure TDUsersForm.dbgUsuariosTitleClick(Column: TUniDBGridColumn);
begin
  if Column.Tag <> -1 then
    UniMainModule.OrdenarUsuariosPor(Column.FieldName);
end;

procedure TDUsersForm.FecharForm(Sender: TObject);
begin
  //Close;
end;

procedure TdUsersForm.UniFormCreate(Sender: TObject);
begin
  FAlterandoColuna := False;
  lblVoltar.Caption := ' <button class="btn btn-primary">VOLTAR</button>';
  lblVoltar.OnClick := FecharForm;

  lblIncluir.Caption := ' <button class="btn btn-success">NOVO USUÁRIO</button>';
  lblIncluir.OnClick := UniMainModule.actIncluirUsuarioExecute;

  lblAlterar.Caption := ' <button class="btn btn-warning">ALTEAR</button>';
  lblAlterar.OnClick := UniMainModule.actAlterarUsuarioExecute;

  lblExcluir.Caption := ' <button class="btn btn-danger">EXCLUIR</button>';
  lblExcluir.OnClick := UniMainModule.actExcluirUsuarioExecute;

  lblGravar.Caption := ' <button class="btn btn-info">GRAVAR</button>';
  lblGravar.OnClick := UniMainModule.actGravarUsuarioExecute;

  uniMainModule.OnCreateCadastroUsuarios(Sender);
end;

procedure TdUsersForm.UniFormDestroy(Sender: TObject);
begin
  uniMainModule.OnDestroyCadastroUsuarios(Sender);
end;

initialization
  RegisterClass(TDUsersForm);

end.
