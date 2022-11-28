unit DVincularCursosTrilhas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniGUIBaseClasses,
  uniPanel, Data.DB, uniBasicGrid, uniDBGrid, uniEdit;

type
  TDFormVincularCursosTrilhas = class(TUniForm)
    UniPanel1: TUniPanel;
    lblVoltar: TUniLabel;
    UniDBGrid1: TUniDBGrid;
    edtPesquisarCursos: TUniEdit;
    procedure UniFormCreate(Sender: TObject);
    procedure edtPesquisarCursosChange(Sender: TObject);
    procedure UniDBGrid1CellClick(Column: TUniDBGridColumn);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FAlterandoColuna: Boolean;
    procedure FecharForm(Sender: TObject);
  public
    { Public declarations }
  end;

function DFormVincularCursosTrilhas: TDFormVincularCursosTrilhas;

implementation

uses
  uniGUIApplication, MainModule;

{$R *.dfm}

function DFormVincularCursosTrilhas: TDFormVincularCursosTrilhas;
begin
  Result := TDFormVincularCursosTrilhas(UniMainModule.GetFormInstance(TDFormVincularCursosTrilhas));
end;

procedure TDFormVincularCursosTrilhas.UniDBGrid1CellClick(Column: TUniDBGridColumn);
begin
  ///Vinculado - Marcado
  if Column.Title.Caption = 'Vinculado' then
  begin
    try
      if UniMainModule.cdsCursosTrilhas.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.cdsCursosTrilhas.Edit;
        UniMainModule.cdsCursosTrilhasMARCADO.AsBoolean := (not UniMainModule.cdsCursosTrilhasMARCADO.AsBoolean);
        UniMainModule.cdsCursosTrilhas.Post;
      end;
    finally
      FAlterandoColuna := False;
    end
  end;
end;

procedure TDFormVincularCursosTrilhas.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
  UniMainModule.cdsCursosTrilhas.Filter := '';
end;

procedure TDFormVincularCursosTrilhas.UniFormCreate(Sender: TObject);
begin
  FAlterandoColuna := False;
  lblVoltar.Caption := ' <button class="btn btn-primary">« VOLTAR</button>';
  lblVoltar.OnClick := FecharForm;

  Self.Caption := 'Vincular cursos a trilha "' + UniMainModule.tblTrilhasTRI_NOME.AsString + '"';

  UniMainModule.CarregarCursosTrilhas;
end;

procedure TDFormVincularCursosTrilhas.edtPesquisarCursosChange(Sender: TObject);
begin
  UniMainModule.cdsCursosTrilhas.Filter := 'CUR_NOME LIKE ''%' + edtPesquisarCursos.Text + '%''';
end;

procedure TDFormVincularCursosTrilhas.FecharForm(Sender: TObject);
begin
  UniMainModule.SalvarCursosTrilhas;
  Close;
end;

end.
