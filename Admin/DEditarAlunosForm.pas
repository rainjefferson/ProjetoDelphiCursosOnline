unit DEditarAlunosForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniDBNavigator,
  uniGUIBaseClasses, uniPanel, uniToolBar, uniLabel, Data.DB, uniDateTimePicker, uniEdit, uniMultiItem,
  uniComboBox, uniPageControl, uniImage, uniDBEdit, uniGroupBox, uniCheckBox, uniDBCheckBox,
  uniDBDateTimePicker, uniDBComboBox, uniDBLookupComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDEditarAlunosForm = class(TUniFrame)
    UniPageControl1: TUniPageControl;
    tabCadAlunos: TUniTabSheet;
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
    tblAlunos: TFDQuery;
    tblAlunosALU_ID: TIntegerField;
    tblAlunosALU_NOME: TStringField;
    tblAlunosALU_SOBRENOME: TStringField;
    tblAlunosALU_DATA_CADASTRO: TDateField;
    tblAlunosALU_ATIVO: TBooleanField;
    tblAlunosUSU_ID: TIntegerField;
    tblAlunosALU_TELEFONE: TStringField;
    tblAlunosALU_TELEFONE_EXTRA: TStringField;
    tblAlunosALU_EMAIL: TStringField;
    tblAlunosALU_CPF: TStringField;
    tblAlunosALU_RG: TStringField;
    tblAlunosALU_CIDADE: TStringField;
    tblAlunosALU_UF: TStringField;
    tblAlunosALU_CARGO: TStringField;
    tblAlunosALU_CATEGORIA: TStringField;
    tblAlunosFG_EXCLUIDO: TBooleanField;
    tblAlunosID_EMPRESA: TIntegerField;
    tblAlunosCC_FOTO: TStringField;
    tblAlunosALU_STATUS: TStringField;
    tblAlunosALU_FOTO: TStringField;
    tblAlunosALU_DATA_NASCIMENTO: TDateField;
    tblAlunosALU_LOGRADOURO: TStringField;
    tblAlunosALU_END_NUMERO: TStringField;
    tblAlunosALU_END_COMPLEMENTO: TStringField;
    tblAlunosALU_CEP: TStringField;
    tblAlunosALU_SKYPE: TStringField;
    tblAlunosALU_SENHA: TStringField;
    tblAlunosALU_EMPRESA: TStringField;
    tblAlunosALU_BAIRRO: TStringField;
    tblAlunosCC_STATUS: TStringField;
    dsAlunos: TDataSource;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure dbgAlunosCellClick(Column: TUniDBGridColumn);
    procedure dbgAlunosTitleClick(Column: TUniDBGridColumn);
    procedure tblAlunosAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }


    procedure VoltarListaAlunos(Sender: TObject);
    procedure GravarAluno(Sender: TObject);
    procedure CarregarFoto(Sender: TObject);
    procedure AtualizarFoto;
  public
    { Public declarations }
    procedure SetEditar(const CodigoAluno: Integer);
    procedure SetInserir;
  end;

function DEditarCadDAlunosForm: TDEditarAlunosForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule, Main, DCarregarImagemUsuario;

function DEditarCadDAlunosForm: TDEditarAlunosForm;
begin
  Result := TDEditarAlunosForm(UniMainModule.GetFormInstance(TDEditarAlunosForm));
end;

procedure TDEditarAlunosForm.dbgAlunosCellClick(Column: TUniDBGridColumn);
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

procedure TDEditarAlunosForm.dbgAlunosTitleClick(Column: TUniDBGridColumn);
begin
  if Column.Tag <> -1 then
    UniMainModule.OrdenarAlunosPor(Column.FieldName, '');
end;

procedure TDEditarAlunosForm.UniFormCreate(Sender: TObject);
begin
  /// Tela/Aba Edição Cadastro de alunos
  //lblVoltarListaAlunos.Caption := '<button class="btn btn-primary"><i class="fa fa-arrow-left"><br> Voltar </i></button>';
  lblVoltarListaAlunos.Caption := '<button class="btn btn-primary">VOLTAR</button>';
  lblVoltarListaAlunos.OnClick := VoltarListaAlunos;

  //lblGravarAluno.Caption := ' <button class="btn btn-info"><i class="fa fa-floppy-o"><br> Gravar </i></button>';
  lblGravarAluno.Caption := ' <button class="btn btn-info">SALVAR</button>';
  lblGravarAluno.OnClick := GravarAluno;

  lblEditarFoto.Caption := ' <button class="btn btn-info">EDITAR FOTO</button>';
  lblEditarFoto.OnClick := CarregarFoto;

  /// CPF
  UniMainModule.SetMaskEditUniControl(UniDBEdit3, '999.999.999-99');
  /// Telefone
  UniMainModule.SetMaskEditUniControl(UniDBEdit7, '(99) 9999-9999');
  /// Celular
  UniMainModule.SetMaskEditUniControl(UniDBEdit8, '(99) 9 9999-9999');
  /// Cep
  UniMainModule.SetMaskEditUniControl(UniDBEdit18, '99.999-999');

  tblAlunos.Close;
  tblAlunos.ParamByName('ID_EMPRESA').AsInteger := 1;
  tblAlunos.Open;
end;

procedure TDEditarAlunosForm.CarregarFoto(Sender: TObject);
begin
  //UniMainModule.actCarregarFotoAlunoExecute(UniMainModule.actCarregarFotoAluno);

  UniMainModule.SetTipoCarregarFotoAluno;
  DFormCarregarImagemUsuario.tblEditar := tblAlunos;
  DFormCarregarImagemUsuario.ShowModal();

  AtualizarFoto;
end;

procedure TDEditarAlunosForm.GravarAluno(Sender: TObject);
begin
  if tblAlunos.State in dsEditModes then
    tblAlunos.Post;

  uniMainModule.OrdenarAlunosPor('ALU_NOME');

  MainForm.RemoveTabPagina(Self.Owner.Tag);
end;

procedure TDEditarAlunosForm.SetEditar(const CodigoAluno: Integer);
begin
  if tblAlunos.Locate('ALU_ID', CodigoAluno, []) then
    tblAlunos.Edit;

  AtualizarFoto;
end;

procedure TDEditarAlunosForm.SetInserir;
begin
  tblAlunos.Insert;

  AtualizarFoto;
end;

procedure TDEditarAlunosForm.tblAlunosAfterInsert(DataSet: TDataSet);
var
  Id: Variant;
begin
  Id :=
    uniMainModule.Conn.ExecSQLScalar
    (
        'SELECT' +
        '  MAX(ALU_ID) ' +
        'FROM' +
        '  ALUNOS '
    );

  if VarIsNull(Id) then
    Id := 0;

  tblAlunosALU_ID.AsInteger :=  Id + 1;
  tblAlunosALU_DATA_CADASTRO.AsDateTime := Now;
  tblAlunosALU_ATIVO.AsBoolean := True;
  tblAlunosID_EMPRESA.AsInteger := 1;
  tblAlunosFG_EXCLUIDO.AsBoolean := False;
  tblAlunosALU_STATUS.AsString := 'ATIVO';
end;

procedure TDEditarAlunosForm.VoltarListaAlunos(Sender: TObject);
begin
  MainForm.RemoveTabPagina(Self.Owner.Tag);
end;

procedure TDEditarAlunosForm.UniFormDestroy(Sender: TObject);
begin
  if tblAlunos.State in dsEditModes then
    tblAlunos.Post;
end;

procedure TDEditarAlunosForm.AtualizarFoto;
begin
  if FileExists(tblAlunos.FieldByName('ALU_FOTO').AsString) then
    imgFoto.Picture.LoadFromFile(tblAlunos.FieldByName('ALU_FOTO').AsString)
  else
    imgFoto.Picture.LoadFromFile(UniServerModule.PastaFiles + 'sem-foto.png');
end;

initialization
  RegisterClass(TDEditarAlunosForm);

end.
