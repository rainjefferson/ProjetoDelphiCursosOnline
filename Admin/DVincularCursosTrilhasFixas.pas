unit DVincularCursosTrilhasFixas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniGUIBaseClasses,
  uniPanel, Data.DB, uniBasicGrid, uniDBGrid, uniEdit;

type
  TDFormVincularCursosTrilhasFixas = class(TUniForm)
    UniPanel1: TUniPanel;
    lblVoltar: TUniLabel;
    UniDBGrid1: TUniDBGrid;
    edtPesquisarTrilhas: TUniEdit;
    procedure UniFormCreate(Sender: TObject);
    procedure edtPesquisarTrilhasChange(Sender: TObject);
    procedure UniDBGrid1CellClick(Column: TUniDBGridColumn);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FAlterandoColuna: Boolean;
    procedure FecharForm(Sender: TObject);
  public
    { Public declarations }
  end;

function DFormVincularCursosTrilhasFixas: TDFormVincularCursosTrilhasFixas;

implementation

uses
  uniGUIApplication, MainModule;

{$R *.dfm}

function DFormVincularCursosTrilhasFixas: TDFormVincularCursosTrilhasFixas;
begin
  Result := TDFormVincularCursosTrilhasFixas(UniMainModule.GetFormInstance(TDFormVincularCursosTrilhasFixas));
end;

procedure TDFormVincularCursosTrilhasFixas.UniDBGrid1CellClick(Column: TUniDBGridColumn);
begin
  ///Vinculado - Marcado
  if Column.Title.Caption = 'Incluir' then
  begin
    try
      if UniMainModule.cdsTrilhasFixas.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.cdsTrilhasFixas.Edit;
        UniMainModule.cdsTrilhasFixasMARCADO.AsBoolean := (not UniMainModule.cdsTrilhasFixasMARCADO.AsBoolean);
        UniMainModule.cdsTrilhasFixas.Post;
      end;
    finally
      FAlterandoColuna := False;
    end
  end;
end;

procedure TDFormVincularCursosTrilhasFixas.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
  UniMainModule.cdsTrilhasFixas.Filter := '';
end;

procedure TDFormVincularCursosTrilhasFixas.UniFormCreate(Sender: TObject);
begin
  FAlterandoColuna := False;
  lblVoltar.Caption := ' <button class="btn btn-primary">« VOLTAR</button>';
  lblVoltar.OnClick := FecharForm;

  Self.Caption := 'Definir as trilhas fixas';

  UniMainModule.CarregarTrilhasFixas;
end;

procedure TDFormVincularCursosTrilhasFixas.edtPesquisarTrilhasChange(Sender: TObject);
begin
  UniMainModule.cdsTrilhasFixas.Filter := 'TRI_NOME LIKE ''%' + edtPesquisarTrilhas.Text + '%''';
end;

procedure TDFormVincularCursosTrilhasFixas.FecharForm(Sender: TObject);
begin
  UniMainModule.SalvarTrilhasFixas;
  Close;
end;

end.
