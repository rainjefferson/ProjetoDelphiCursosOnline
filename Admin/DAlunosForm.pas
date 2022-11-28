unit DAlunosForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniDBNavigator,
  uniGUIBaseClasses, uniPanel, uniToolBar, uniLabel, Data.DB, uniDateTimePicker, uniEdit, uniMultiItem,
  uniComboBox, uniPageControl, uniImage, uniDBEdit, uniGroupBox, uniCheckBox, uniDBCheckBox,
  uniDBDateTimePicker, uniDBComboBox, uniDBLookupComboBox;

type
  TDAlunosForm = class(TUniFrame)
    UniPageControl1: TUniPageControl;
    tabListaAlunos: TUniTabSheet;
    tabCadAlunos: TUniTabSheet;
    UniPanel1: TUniPanel;
    lblVoltar: TUniLabel;
    lblIncluir: TUniLabel;
    lblAlterar: TUniLabel;
    lblExcluir: TUniLabel;
    lblGravar: TUniLabel;
    edtPesquisarAluno: TUniEdit;
    lblFiltrar: TUniLabel;
    cmbStatus: TUniComboBox;
    dbgAlunos: TUniDBGrid;
    UniHiddenPanel1: TUniHiddenPanel;
    edtDataCadastroAluno: TUniDateTimePicker;
    UniPageControl2: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniTabSheet2: TUniTabSheet;
    UniTabSheet3: TUniTabSheet;
    UniPanel2: TUniPanel;
    imgFoto: TUniImage;
    UniGroupBox1: TUniGroupBox;
    UniDBEdit1: TUniDBEdit;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniDBEdit3: TUniDBEdit;
    UniDBEdit4: TUniDBEdit;
    UniDBEdit5: TUniDBEdit;
    UniDBEdit6: TUniDBEdit;
    UniDBEdit7: TUniDBEdit;
    UniDBEdit8: TUniDBEdit;
    UniDBEdit9: TUniDBEdit;
    UniDBEdit10: TUniDBEdit;
    lblGravarAluno: TUniLabel;
    lblVoltarListaAlunos: TUniLabel;
    lblEditarFoto: TUniLabel;
    UniDBComboBox1: TUniDBComboBox;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniDBComboBox2: TUniDBComboBox;
    UniDBEdit12: TUniDBEdit;
    UniDBEdit13: TUniDBEdit;
    UniDBEdit14: TUniDBEdit;
    UniDBEdit15: TUniDBEdit;
    UniDBEdit16: TUniDBEdit;
    UniDBEdit17: TUniDBEdit;
    UniDBEdit18: TUniDBEdit;
    UniDBEdit19: TUniDBEdit;
    UniTabSheet4: TUniTabSheet;
    UniTabSheet5: TUniTabSheet;
    UniTabSheet6: TUniTabSheet;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure dbgAlunosColumnActionClick(Column: TUniDBGridColumn; ButtonId: Integer);
    procedure dbgAlunosCellClick(Column: TUniDBGridColumn);
    procedure edtPesquisarAlunoChange(Sender: TObject);
    procedure dbgAlunosTitleClick(Column: TUniDBGridColumn);
    procedure tabCadAlunosBeforeActivate(Sender: TObject; var AllowActivate: Boolean);
    procedure cmbStatusChange(Sender: TObject);
    procedure dbgAlunosDblClick(Sender: TObject);
  private
    { Private declarations }

    procedure FecharForm(Sender: TObject);
    procedure FiltrarAlunos(Sender: TObject);
    procedure IncluirAluno(Sender: TObject);
    procedure AlterarAluno(Sender: TObject);
    procedure VoltarListaAlunos(Sender: TObject);
    procedure GravarAluno(Sender: TObject);
    procedure CarregarFoto(Sender: TObject);
    procedure AtualizarFoto;
  public
    { Public declarations }
  end;

function DCadDAlunosForm: TDAlunosForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule, Main;

function DCadDAlunosForm: TDAlunosForm;
begin
  Result := TDAlunosForm(UniMainModule.GetFormInstance(TDAlunosForm));
end;

procedure TDAlunosForm.cmbStatusChange(Sender: TObject);
begin
  FiltrarAlunos(Sender);
end;

procedure TDAlunosForm.dbgAlunosCellClick(Column: TUniDBGridColumn);
begin
  /// Ações de edição
  if AnsiUpperCase(Column.Title.Caption) = 'EXCLUIR' then
  begin
    if UniMainModule.tblAlunos.State in dsEditModes then
      UniMainModule.tblAlunos.Cancel
    else
      UniMainModule.actExcluirAlunosExecute(UniMainModule.actExcluirAlunos);
  end;
end;

procedure TDAlunosForm.dbgAlunosColumnActionClick(Column: TUniDBGridColumn; ButtonId: Integer);
begin
  /// Ações de edição
  if Column.ID = dbgAlunos.Columns.Count-1 then  /// Sempre a ultima coluna
  begin
    UniMainModule.actExcluirAlunosExecute(UniMainModule.actExcluirAlunos);
  end;
end;

procedure TDAlunosForm.dbgAlunosDblClick(Sender: TObject);
begin
  AlterarAluno(Sender);
end;

procedure TDAlunosForm.dbgAlunosTitleClick(Column: TUniDBGridColumn);
begin
  if Column.Tag <> -1 then
    UniMainModule.OrdenarAlunosPor(Column.FieldName, '');
end;

procedure TDAlunosForm.edtPesquisarAlunoChange(Sender: TObject);
begin
  /// tem que buscar por nome, parte do telefone, celular, email e cpf
  UniMainModule.tblAlunos.Filter := '(ALU_NOME LIKE ''%' + edtPesquisarAluno.Text + '%'') or ' +
                                    '(ALU_TELEFONE LIKE ''%' + edtPesquisarAluno.Text + '%'') or ' +
                                    '(ALU_TELEFONE_EXTRA LIKE ''%' + edtPesquisarAluno.Text + '%'') or ' +
                                    '(ALU_EMAIL LIKE ''%' + edtPesquisarAluno.Text + '%'') or ' +
                                    '(ALU_CPF LIKE ''%' + edtPesquisarAluno.Text + '%'') ';
end;

procedure TDAlunosForm.FecharForm(Sender: TObject);
begin
  //Close;
end;

procedure TDAlunosForm.UniFormCreate(Sender: TObject);
begin
  lblVoltar.Caption := ' <button class="btn btn-primary">VOLTAR  wssd</button>';
  lblVoltar.OnClick := FecharForm;

  //lblIncluir.Caption := ' <button class="btn btn-success"><i class="fa fa-plus">&nbsp;&nbsp;Novo Aluno </i></button>';
  lblIncluir.Caption := ' <button class="btn btn-success">NOVO ALUNO</button>';
  lblIncluir.OnClick := IncluirAluno;

  //lblAlterar.Caption := ' <button class="btn btn-warning"><i class="fa fa-pencil">&nbsp;&nbsp; Alterar </i></button>';
  lblAlterar.Caption := ' <button class="btn btn-warning">EXPORTAR</button>';
  //lblAlterar.OnClick := AlterarAluno;

  lblExcluir.Caption := ' <button class="btn btn-danger">EXCLUIR</button>';
  lblExcluir.OnClick := UniMainModule.actExcluirAlunosExecute;

  lblGravar.Caption := ' <button class="btn btn-info">GRAVAR</button>';

  lblFiltrar.Caption := ' <button class="btn btn-primary">FILTRAR</button>';
  lblFiltrar.OnClick := FiltrarAlunos;

  /// Tela/Aba Edição Cadastro de alunos
  //lblVoltarListaAlunos.Caption := '<button class="btn btn-primary"><i class="fa fa-arrow-left"><br> Voltar </i></button>';
  lblVoltarListaAlunos.Caption := '<button class="btn btn-primary">VOLTAR</button>';
  lblVoltarListaAlunos.OnClick := VoltarListaAlunos;

  //lblGravarAluno.Caption := ' <button class="btn btn-info"><i class="fa fa-floppy-o"><br> Gravar </i></button>';
  lblGravarAluno.Caption := ' <button class="btn btn-info">SALVAR</button>';
  lblGravarAluno.OnClick := GravarAluno;

  lblEditarFoto.Caption := ' <button class="btn btn-info">EDITAR FOTO</button>';
  lblEditarFoto.OnClick := CarregarFoto;

  uniMainModule.OnCreateAlunos(Sender);
  uniMainModule.OnCreateCadastroUsuarios(Sender);

  /// CPF
  UniMainModule.SetMaskEditUniControl(UniDBEdit3, '999.999.999-99');
  /// Telefone
  UniMainModule.SetMaskEditUniControl(UniDBEdit7, '(99) 9999-9999');
  /// Celular
  UniMainModule.SetMaskEditUniControl(UniDBEdit8, '(99) 9 9999-9999');
  /// Cep
  UniMainModule.SetMaskEditUniControl(UniDBEdit18, '99.999-999');
end;

procedure TDAlunosForm.CarregarFoto(Sender: TObject);
begin
  UniMainModule.actCarregarFotoAlunoExecute(UniMainModule.actCarregarFotoAluno);
  AtualizarFoto;
end;

procedure TDAlunosForm.FiltrarAlunos(Sender: TObject);
var
  Filtro: String;
begin
  Filtro := '';

  if cmbStatus.Text <> 'TODOS' then
     Filtro := ' AND ALU_STATUS = ' + QuotedStr(cmbStatus.Text);

  UniMainModule.OrdenarAlunosPor('ALU_NOME', Filtro);
end;

procedure TDAlunosForm.GravarAluno(Sender: TObject);
begin
  UniMainModule.actGravarAlunosExecute(UniMainModule.actGravarAlunos);
  UniMainModule.OrdenarAlunosPor('ALU_NOME');
  UniPageControl1.ActivePage := tabListaAlunos;
end;

procedure TDAlunosForm.VoltarListaAlunos(Sender: TObject);
begin
  UniMainModule.tblAlunos.Cancel;
  UniPageControl1.ActivePage := tabListaAlunos;
end;

procedure TDAlunosForm.AlterarAluno(Sender: TObject);
begin
  if UniMainModule.tblAlunos.IsEmpty then
    Exit;

  MainForm.OpenFrame('TDEditarAlunosForm',
    UniMainModule.tblAlunosALU_ID.AsString + '.' + UniMainModule.tblAlunosALU_NOME.AsString + ' (ALTERAÇÃO)', True);
end;

procedure TDAlunosForm.IncluirAluno(Sender: TObject);
begin
  MainForm.OpenFrame('TDEditarAlunosForm', 'CADASTRO NOVO ALUNO', True);
end;

procedure TDAlunosForm.tabCadAlunosBeforeActivate(Sender: TObject; var AllowActivate: Boolean);
begin
  AtualizarFoto;
end;

procedure TDAlunosForm.UniFormDestroy(Sender: TObject);
begin
  UniMainModule.tblAlunos.Filter := '';
  uniMainModule.OnDestroyAlunos(Sender);
  uniMainModule.OnDestroyCadastroUsuarios(Sender);
end;

procedure TDAlunosForm.AtualizarFoto;
begin
  if FileExists(UniMainModule.tblAlunosALU_FOTO.AsString) then
    imgFoto.Picture.LoadFromFile(UniMainModule.tblAlunosALU_FOTO.AsString)
  else
    imgFoto.Picture.LoadFromFile(UniServerModule.PastaFiles + 'sem-foto.png');
end;

initialization
  RegisterClass(TDAlunosForm);

end.
