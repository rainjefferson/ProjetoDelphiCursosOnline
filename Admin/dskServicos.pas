unit dskServicos;

interface

uses
  Classes,
  Interfaces;

type

  TDServicos = class(TInterfacedObject, IServicos)

    procedure CadastroProfessores;
    procedure CadastrosCursos;
    procedure CadastrosUsuarios;
  end;

implementation

uses
  Vcl.Controls,
  uniGUIForm,
  DFormCadastroCursos,
  DUsersForm;

{ TDServicos }

procedure TDServicos.CadastroProfessores;
begin
  // Chamar aqui o cadastro de professores desktop
end;

procedure TDServicos.CadastrosCursos;
begin
  //DFormCadCursos.ShowModal();   Mudou pra frame
end;

procedure TDServicos.CadastrosUsuarios;
begin
  //DCadDUsersForm.ShowModal(); Mudou pra frame
end;

end.
