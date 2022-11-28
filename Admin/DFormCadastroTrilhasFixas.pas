unit DFormCadastroTrilhasFixas;

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
  TDFormCadTrilhasFixas = class(TUniFrame)
    UniPageControl1: TUniPageControl;
    tabTrilhas: TUniTabSheet;
    UniPanel2: TUniPanel;
    dbgTrilhas: TUniDBGrid;
    UniPanel5: TUniPanel;
    lblIncluirTrilha: TUniLabel;
    UniHiddenPanel1: TUniHiddenPanel;
    edtDataCadatro: TUniDateTimePicker;
    edtPesquisarTrilhas: TUniEdit;
    UniPanel3: TUniPanel;
    UniLabel1: TUniLabel;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure dbgTrilhasColumnActionClick(Column: TUniDBGridColumn; ButtonId: Integer);
    procedure dbgTrilhasCellClick(Column: TUniDBGridColumn);
    procedure edtPesquisarTrilhasChange(Sender: TObject);
  private
    { Private declarations }
    FAlterandoColuna: Boolean;

    procedure CriarBotoesControleTrilhas;
  public
    { Public declarations }
  end;

function DFormCadTrilhasFixas: TDFormCadTrilhasFixas;

implementation

{$R *.dfm}

uses
  uniGUIApplication, MainModule;

function DFormCadTrilhasFixas: TDFormCadTrilhasFixas;
begin
  Result := TDFormCadTrilhasFixas(UniMainModule.GetFormInstance(TDFormCadTrilhasFixas));
end;

procedure TDFormCadTrilhasFixas.dbgTrilhasCellClick(Column: TUniDBGridColumn);
begin
  if UniMainModule.tblTrilhasFixas.IsEmpty then
    Exit;

  /// Ações de edição
  if Column.ID = dbgTrilhas.Columns.Count-1 then
  begin
    if UniMainModule.tblTrilhasFixas.State in dsEditModes then
      UniMainModule.tblTrilhasFixas.Cancel
    else
      UniMainModule.actExcluirTrilhasFixasExecute(UniMainModule.actExcluirTrilhasFixas);
  end;
end;

procedure TDFormCadTrilhasFixas.dbgTrilhasColumnActionClick(Column: TUniDBGridColumn; ButtonId: Integer);
begin
  if Column.Title.Caption = 'Ordem' then
  begin
    if ButtonId = 0 then
      UniMainModule.AumentarOrdemCursoTrilhaFixa(UniMainModule.tblTrilhasFixasTRF_ORDEM_POSICAO.AsInteger)
    else
      UniMainModule.DiminuirOrdemCursoTrilhaFixa(UniMainModule.tblTrilhasFixasTRF_ORDEM_POSICAO.AsInteger);
  end;

  /// Ações de edição
  if Column.ID = dbgTrilhas.Columns.Count-1 then
  begin
    UniMainModule.actExcluirTrilhasFixasExecute(UniMainModule.actExcluirTrilhasFixas);
  end;
end;

procedure TDFormCadTrilhasFixas.edtPesquisarTrilhasChange(Sender: TObject);
begin
  UniMainModule.tblTrilhasFixas.Filter := '(TRI_NOME LIKE ''%' + edtPesquisarTrilhas.Text + '%'')';
end;

procedure TDFormCadTrilhasFixas.UniFormCreate(Sender: TObject);
begin
  FAlterandoColuna := False;
  CriarBotoesControleTrilhas;

  uniMainModule.OnCreateTrilhasFixas(Sender);
end;

procedure TDFormCadTrilhasFixas.UniFormDestroy(Sender: TObject);
begin
  UniMainModule.tblTrilhasFixas.Filter := '';
  uniMainModule.OnDestroyTrilhasFixas(Sender);
end;

procedure TDFormCadTrilhasFixas.CriarBotoesControleTrilhas;
begin
  lblIncluirTrilha.Caption := ' <button class="btn btn-primary">NOVA TRILHA</button>';
  lblIncluirTrilha.OnClick := UniMainModule.actIncluirTrilhaFixaExecute;
end;

initialization
  RegisterClass(TDFormCadTrilhasFixas);

end.
