unit DProfessoresForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, {uniGUIForm,} uniGUIFrame, uniBasicGrid, uniDBGrid, uniDBNavigator,
  uniGUIBaseClasses, uniPanel, uniToolBar, uniLabel, Data.DB, uniDateTimePicker, uniEdit;

type
  TDProfessoresForm = class(TUniFrame)
    dbgProfessores: TUniDBGrid;
    UniPanel1: TUniPanel;
    lblVoltar: TUniLabel;
    lblIncluir: TUniLabel;
    lblAlterar: TUniLabel;
    lblExcluir: TUniLabel;
    lblGravar: TUniLabel;
    UniHiddenPanel1: TUniHiddenPanel;
    edtDataCadastroProfessor: TUniDateTimePicker;
    edtPesquisarProfessor: TUniEdit;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure dbgProfessoresColumnActionClick(Column: TUniDBGridColumn; ButtonId: Integer);
    procedure dbgProfessoresCellClick(Column: TUniDBGridColumn);
    procedure edtPesquisarProfessorChange(Sender: TObject);
    procedure dbgProfessoresTitleClick(Column: TUniDBGridColumn);
  private
    { Private declarations }
    FAlterandoColuna: Boolean;

    procedure FecharForm(Sender: TObject);
  public
    { Public declarations }
  end;

function DCadDProfessoresForm: TDProfessoresForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function DCadDProfessoresForm: TDProfessoresForm;
begin
  Result := TDProfessoresForm(UniMainModule.GetFormInstance(TDProfessoresForm));
end;

procedure TDProfessoresForm.dbgProfessoresCellClick(Column: TUniDBGridColumn);
begin
  ///Ativo
  if Column.Title.Caption = 'Ativo' then
  begin
    try
      if UniMainModule.tblProfessores.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblProfessores.Edit;
        UniMainModule.tblProfessoresPRO_ATIVO.AsBoolean := (not UniMainModule.tblProfessoresPRO_ATIVO.AsBoolean);
        UniMainModule.tblProfessores.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;

  /// Imagem foto do professor
  if Column.Title.Caption = 'FOTO' then
     UniMainModule.actCarregarFotoProfessorExecute(UniMainModule.actCarregarFotoProfessor);

  /// Texto Html
  if Column.Title.Caption = 'Texto Html' then
     UniMainModule.actCarregarConteudoHtmlProfessorExecute(UniMainModule.actCarregarConteudoHtmlProfessor);

  /// Ações de edição
  if Column.ID = dbgProfessores.Columns.Count-1 then  /// Sempre a ultima coluna
  begin
    if UniMainModule.tblProfessores.State in dsEditModes then
      UniMainModule.tblProfessores.Cancel
    else
      UniMainModule.actExcluirProfessorExecute(UniMainModule.actExcluirProfessor);
  end;
end;

procedure TDProfessoresForm.dbgProfessoresColumnActionClick(Column: TUniDBGridColumn; ButtonId: Integer);
begin
  /// Imagem foto do professor
  if Column.Title.Caption = 'Foto' then
     UniMainModule.actCarregarFotoProfessorExecute(UniMainModule.actCarregarFotoProfessor);

  /// Texto Html
  if Column.Title.Caption = 'Texto Html' then
     UniMainModule.actCarregarConteudoHtmlProfessorExecute(UniMainModule.actCarregarConteudoHtmlProfessor);

  /// Ações de edição
  if Column.ID = dbgProfessores.Columns.Count-1 then  /// Sempre a ultima coluna
  begin
    UniMainModule.actExcluirProfessorExecute(UniMainModule.actExcluirProfessor);
  end;
end;

procedure TDProfessoresForm.dbgProfessoresTitleClick(Column: TUniDBGridColumn);
begin
  if Column.Tag <> -1 then
    UniMainModule.OrdenarProfessoresPor(Column.FieldName);
end;

procedure TDProfessoresForm.edtPesquisarProfessorChange(Sender: TObject);
begin
  UniMainModule.tblProfessores.Filter := 'PRO_NOME LIKE ''%' + edtPesquisarProfessor.Text + '%''';
end;

procedure TDProfessoresForm.FecharForm(Sender: TObject);
begin
  //Close;
end;

procedure TDProfessoresForm.UniFormCreate(Sender: TObject);
begin
  FAlterandoColuna := False;

  lblVoltar.Caption := ' <button class="btn btn-primary">VOLTAR</button>';
  lblVoltar.OnClick := FecharForm;

  lblIncluir.Caption := ' <button class="btn btn-success">NOVO PROFESSOR</button>';
  lblIncluir.OnClick := UniMainModule.actIncluirProfessorExecute;

  lblAlterar.Caption := ' <button class="btn btn-warning">ALTEAR</button>';

  lblExcluir.Caption := ' <button class="btn btn-danger">EXCLUIR</button>';
  lblExcluir.OnClick := UniMainModule.actExcluirProfessorExecute;

  lblGravar.Caption := ' <button class="btn btn-info">GRAVAR</button>';

  uniMainModule.OnCreateCadastroProfessores(Sender);
end;

procedure TDProfessoresForm.UniFormDestroy(Sender: TObject);
begin
  UniMainModule.tblProfessores.Filter := '';
  uniMainModule.OnDestroyCadastroProfessores(Sender);
end;

initialization
  RegisterClass(TDProfessoresForm);

end.
