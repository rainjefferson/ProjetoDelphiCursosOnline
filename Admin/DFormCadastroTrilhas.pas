unit DFormCadastroTrilhas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPageControl,
  uniPanel, uniToolBar, Data.DB,
  uniLabel, uniBasicGrid, uniDBGrid, uniButton, uniImage,
  uniImageList, uniDBText, uniDateTimePicker, uniEdit;

type
  //TDFormCadCursos = class(TUniForm)
  TDFormCadTrilhas = class(TUniFrame)
    UniPageControl1: TUniPageControl;
    tabTrilhas: TUniTabSheet;
    UniPanel2: TUniPanel;
    dbgTrilhas: TUniDBGrid;
    tabCursosTrilhas: TUniTabSheet;
    dbgCursosTrilhas: TUniDBGrid;
    UniPanel5: TUniPanel;
    lblIncluirTrilha: TUniLabel;
    UniPanel6: TUniPanel;
    lblVoltarTrilhas: TUniLabel;
    lblIncluirCursoEmTrilhas: TUniLabel;
    UniHiddenPanel1: TUniHiddenPanel;
    edtDataCadatro: TUniDateTimePicker;
    edtPesquisarTrilhas: TUniEdit;
    edtPesquisarCursosTrilhas: TUniEdit;
    UniPanel1: TUniPanel;
    lblNomeTrilha: TUniLabel;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure dbgTrilhasColumnActionClick(Column: TUniDBGridColumn; ButtonId: Integer);
    procedure dbgTrilhasSelectionChange(Sender: TObject);
    procedure dbgCursosTrilhasColumnActionClick(Column: TUniDBGridColumn; ButtonId: Integer);
    procedure dbgTrilhasCellClick(Column: TUniDBGridColumn);
    procedure edtPesquisarTrilhasChange(Sender: TObject);
    procedure dbgTrilhasTitleClick(Column: TUniDBGridColumn);
    procedure edtPesquisarCursosTrilhasChange(Sender: TObject);
  private
    { Private declarations }
    FAlterandoColuna: Boolean;

    procedure VoltarParaTrilhas(Sender: TObject);
    procedure CriarBotoesControleTrilhas;
    procedure CriarBotoesControleCursosTrilhas;
  public
    { Public declarations }
  end;

function DFormCadTrilhas: TDFormCadTrilhas;

implementation

{$R *.dfm}

uses
  uniGUIApplication, MainModule;

function DFormCadTrilhas: TDFormCadTrilhas;
begin
  Result := TDFormCadTrilhas(UniMainModule.GetFormInstance(TDFormCadTrilhas));
end;

procedure TDFormCadTrilhas.dbgTrilhasCellClick(Column: TUniDBGridColumn);
begin
  if UniMainModule.tblTrilhas.IsEmpty then
    Exit;

  ///Ativo
  if Column.Title.Caption = 'Ativo' then
  begin
    try
      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.tblTrilhas.Edit;
        UniMainModule.tblTrilhasTRI_ATIVO.AsBoolean := (not UniMainModule.tblTrilhasTRI_ATIVO.AsBoolean);
        UniMainModule.tblTrilhas.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;

  ///Em Criação
  if Column.Title.Caption = 'Em Criação' then
  begin
    try
      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;

        UniMainModule.tblTrilhas.Edit;
        UniMainModule.tblTrilhasTRI_EM_CRIACAO.AsBoolean := (not UniMainModule.tblTrilhasTRI_EM_CRIACAO.AsBoolean);
        UniMainModule.tblTrilhas.Post;
      end;
    finally
      FAlterandoColuna := False;
    end;
  end;

  /// Cursos da trilha
  if Column.Title.Caption = 'Cursos' then
    UniPageControl1.ActivePage := tabCursosTrilhas;

  /// Ações de edição
  if Column.ID = dbgTrilhas.Columns.Count-1 then
  begin
    if UniMainModule.tblTrilhas.State in dsEditModes then
      UniMainModule.tblTrilhas.Cancel
    else
      UniMainModule.actExcluirTrilhasExecute(UniMainModule.actExcluirTrilhas);
  end;
end;

procedure TDFormCadTrilhas.dbgTrilhasColumnActionClick(Column: TUniDBGridColumn; ButtonId: Integer);
begin
  /// Ações de edição
  if Column.ID = dbgTrilhas.Columns.Count-1 then
  begin
    UniMainModule.actExcluirTrilhasExecute(UniMainModule.actExcluirTrilhas);
  end;
end;

procedure TDFormCadTrilhas.dbgTrilhasSelectionChange(Sender: TObject);
begin
  lblNomeTrilha.Caption := '<p class="text-primary">Cursos da trilha "' + UniMainModule.tblTrilhasTRI_NOME.AsString + '"</p>';
end;

procedure TDFormCadTrilhas.dbgTrilhasTitleClick(Column: TUniDBGridColumn);
begin
  if Column.Tag <> -1 then
    UniMainModule.OrdenarTrilhasPor(Column.FieldName);
end;

procedure TDFormCadTrilhas.dbgCursosTrilhasColumnActionClick(Column: TUniDBGridColumn; ButtonId: Integer);
begin
  if Column.Title.Caption = 'Ordem' then
  begin
    if ButtonId = 0 then
      UniMainModule.AumentarOrdemCursoTrilha(UniMainModule.tblTrilhasTRI_ID.AsInteger,UniMainModule.tblCursosTrilhasTRC_ORDEM_POSICAO.AsInteger)
    else
      UniMainModule.DiminuirOrdemCursoTrilha(UniMainModule.tblTrilhasTRI_ID.AsInteger,UniMainModule.tblCursosTrilhasTRC_ORDEM_POSICAO.AsInteger);
  end;

  /// Ações de edição
  if Column.ID = dbgCursosTrilhas.Columns.Count-1 then
  begin
    UniMainModule.actExcluirCursosTrilhasExecute(UniMainModule.actExcluirCursosTrilhas);
  end;
end;

procedure TDFormCadTrilhas.edtPesquisarCursosTrilhasChange(Sender: TObject);
begin
  UniMainModule.tblCursosTrilhas.Filter := 'CUR_NOME LIKE ''%' + edtPesquisarCursosTrilhas.Text + '%''';
end;

procedure TDFormCadTrilhas.edtPesquisarTrilhasChange(Sender: TObject);
begin
  UniMainModule.tblTrilhas.Filter := '(TRI_NOME LIKE ''%' + edtPesquisarTrilhas.Text + '%'') or ' +
                                     '(TRI_NOME_INTERNO LIKE ''%' + edtPesquisarTrilhas.Text + '%'') or ' +
                                     '(TRI_PALAVRAS_CHAVE LIKE ''%' + edtPesquisarTrilhas.Text + '%'')';
end;

procedure TDFormCadTrilhas.UniFormCreate(Sender: TObject);
begin
  FAlterandoColuna := False;
  CriarBotoesControleTrilhas;
  CriarBotoesControleCursosTrilhas;

  uniMainModule.OnCreateTrilhas(Sender);
end;

procedure TDFormCadTrilhas.UniFormDestroy(Sender: TObject);
begin
  UniMainModule.tblTrilhas.Filter := '';
  uniMainModule.OnDestroyTrilhas(Sender);
end;

procedure TDFormCadTrilhas.CriarBotoesControleTrilhas;
begin
  lblIncluirTrilha.Caption := ' <button class="btn btn-primary">NOVA TRILHA</button>';
  lblIncluirTrilha.OnClick := UniMainModule.actIncluirTrilhaExecute;
end;

procedure TDFormCadTrilhas.CriarBotoesControleCursosTrilhas;
begin
  lblVoltarTrilhas.Caption := ' <button class="btn btn-primary">« TRILHAS</button>';
  lblVoltarTrilhas.OnClick := VoltarParaTrilhas;

  lblIncluirCursoEmTrilhas.Caption := ' <button class="btn btn-success">CURSOS</button>';
  lblIncluirCursoEmTrilhas.OnClick := UniMainModule.actIncluirCursosTrilhaExecute;
end;

procedure TDFormCadTrilhas.VoltarParaTrilhas(Sender: TObject);
begin
  if UniMainModule.tblCursosTrilhas.State in dsEditModes then
    UniMainModule.tblCursosTrilhas.Post;

  UniPageControl1.ActivePage := tabTrilhas;
end;

initialization
  RegisterClass(TDFormCadTrilhas);

end.
