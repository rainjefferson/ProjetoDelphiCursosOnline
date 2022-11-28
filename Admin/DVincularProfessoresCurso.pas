unit DVincularProfessoresCurso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniGUIBaseClasses,
  uniPanel, Data.DB, uniBasicGrid, uniDBGrid, uniEdit;

type
  TDFormVincularProfessoresCurso = class(TUniForm)
    UniPanel1: TUniPanel;
    lblVoltar: TUniLabel;
    UniDBGrid1: TUniDBGrid;
    lblNomeCurso: TUniLabel;
    edtPesquisarProfessores: TUniEdit;
    procedure UniFormCreate(Sender: TObject);
    procedure edtPesquisarProfessoresChange(Sender: TObject);
    procedure UniDBGrid1CellClick(Column: TUniDBGridColumn);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FAlterandoColuna: Boolean;
    procedure FecharForm(Sender: TObject);
  public
    { Public declarations }
  end;

function DFormVincularProfessoresCurso: TDFormVincularProfessoresCurso;

implementation

uses
  uniGUIApplication, MainModule;

{$R *.dfm}

function DFormVincularProfessoresCurso: TDFormVincularProfessoresCurso;
begin
  Result := TDFormVincularProfessoresCurso(UniMainModule.GetFormInstance(TDFormVincularProfessoresCurso));
end;

procedure TDFormVincularProfessoresCurso.UniDBGrid1CellClick(Column: TUniDBGridColumn);
begin
  ///Vinculado - Marcado
  if Column.Title.Caption = 'Vinculado' then
  begin
    try
      if UniMainModule.cdsProfessoresCurso.IsEmpty then
        Exit;

      if not FAlterandoColuna then
      begin
        FAlterandoColuna := True;
        UniMainModule.cdsProfessoresCurso.Edit;
        UniMainModule.cdsProfessoresCursoMARCADO.AsBoolean := (not UniMainModule.cdsProfessoresCursoMARCADO.AsBoolean);
        UniMainModule.cdsProfessoresCurso.Post;
      end;
    finally
      FAlterandoColuna := False;
    end
  end;
end;

procedure TDFormVincularProfessoresCurso.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
   UniMainModule.cdsProfessoresCurso.Filter := '';
end;

procedure TDFormVincularProfessoresCurso.UniFormCreate(Sender: TObject);
begin
  FAlterandoColuna := False;
  lblVoltar.Caption := ' <button class="btn btn-primary">VOLTAR</button>';
  lblVoltar.OnClick := FecharForm;

  lblNomeCurso.Caption := '';//'Curso "' + UniMainModule.tblCursosCUR_NOME.AsString + '"';

  Self.Caption := 'Vincular professores ao curso "' + UniMainModule.tblCursosCUR_NOME.AsString + '"';

  UniMainModule.CarregarProfessoresCurso;
end;

procedure TDFormVincularProfessoresCurso.edtPesquisarProfessoresChange(Sender: TObject);
begin
  UniMainModule.cdsProfessoresCurso.Filter := 'PRO_NOME LIKE ''%' + edtPesquisarProfessores.Text + '%''';
end;

procedure TDFormVincularProfessoresCurso.FecharForm(Sender: TObject);
begin
  UniMainModule.SalvarProfessoresCurso;
  Close;
end;

end.
