unit mobServicos;

interface

uses
  Classes,
  Interfaces;

type

  TMServicos = class(TInterfacedObject, IServicos)

    procedure CadastroProfessores;
    procedure CadastrosCursos;
    procedure CadastrosUsuarios;
  end;

implementation

uses
  Vcl.Controls,
  uniGUImForm;

{ TMServicos }

procedure TMServicos.CadastroProfessores;
begin
  //Chamar cadastro de Professores Mobile
end;

procedure TMServicos.CadastrosCursos;
begin
  ////Chamar cadastro de cursos Mobile
end;

procedure TMServicos.CadastrosUsuarios;
begin

end;

end.
