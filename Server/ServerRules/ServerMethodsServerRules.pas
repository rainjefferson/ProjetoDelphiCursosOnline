unit ServerMethodsServerRules;

interface

uses
  System.SysUtils, System.Classes, System.Json,
  DataSnap.DSProviderDataModuleAdapter,
  Datasnap.DSServer, Datasnap.DSAuth;

type
  TSMRegras = class(TDSServerModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    function UrlVideoAula: String;
    function UrlTelaUserPlayer: String;
    function UsuarioLogado(Value: String): Boolean;
    function AutenticarUsuario(User, Password, IdDevice: String): Boolean;
    procedure AdicionarCursoFavorito(User, IdCurso: String);
    procedure Sair(User: String);
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


uses
  System.StrUtils, udmDados;

function TSMRegras.AutenticarUsuario(User, Password, IdDevice: String): Boolean;
var
  IdAluno: Integer;
  Status: String;
begin
   Result := False;

   dmDados.QryTmp.Close;
   dmDados.QryTmp.SQL.Clear;
   dmDados.QryTmp.Open('SELECT ALU_ID, ALU_STATUS FROM ALUNOS ' +
                       'WHERE ALU_EMAIL = ' + QuotedStr(User) +
                       '  AND ALU_SENHA = ' + QuotedStr(Password) +
                       '  AND ALU_ATIVO = 1 ' +
                       '  AND FG_EXCLUIDO = 0');

   IdAluno := 0;
   Status := '';
   if dmDados.QryTmp.FieldByName('ALU_ID').AsInteger > 0 then
   begin
     IdAluno := dmDados.QryTmp.FieldByName('ALU_ID').AsInteger;
     Status := dmDados.QryTmp.FieldByName('ALU_STATUS').AsString;
     Result := True;
   end;

   if Result then
   begin
     dmDados.QryTmp.Close;
     dmDados.QryTmp.SQL.Clear;
     dmDados.QryTmp.SQL.Add('UPDATE ALUNOS SET ALU_LOGADO = :ALU_LOGADO, ALU_DISPOSITIVO = :ALU_DISPOSITIVO WHERE ALU_ID = :ALU_ID');
     dmDados.QryTmp.ParamByName('ALU_LOGADO').AsBoolean := True;
     dmDados.QryTmp.ParamByName('ALU_DISPOSITIVO').AsString := IdDevice;
     dmDados.QryTmp.ParamByName('ALU_ID').AsInteger := IdAluno;
     dmDados.QryTmp.ExecSQL;
   end;

  dmDados.UsuarioLogado := Result;
  dmDados.StatuAluno := Status;
  dmDados.IdAluno := IdAluno;

  dmDados.QryTmp.Close;
end;

function TSMRegras.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TSMRegras.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TSMRegras.UrlTelaUserPlayer: String;
begin
  Result := 'http://localhost:8080/UserPlayer';
end;

function TSMRegras.UrlVideoAula: String;
begin
  Result := 'https://api.vimeo.com';
end;

function TSMRegras.UsuarioLogado(Value: String): Boolean;
begin
  dmDados.QryTmp.Close;
  dmDados.QryTmp.SQL.Clear;
  dmDados.QryTmp.Open('SELECT ALU_ID, ALU_LOGADO FROM ALUNOS ' +
                      'WHERE ALU_DISPOSITIVO = ' + QuotedStr(Value));
  Result := (dmDados.QryTmp.FieldByName('ALU_ID').AsInteger > 0) and dmDados.QryTmp.FieldByName('ALU_LOGADO').AsBoolean;

  dmDados.UsuarioLogado := Result;
  dmDados.IdAluno := dmDados.QryTmp.FieldByName('ALU_ID').AsInteger;
end;

procedure TSMRegras.AdicionarCursoFavorito(User, IdCurso: String);
begin
  /// Adicionar o curso favorito na tabela ALUNOS_CURSOS_FAVORITOS
end;

procedure TSMRegras.Sair(User: String);
begin
  dmDados.UsuarioLogado := False;
  dmDados.StatuAluno := '';

  dmDados.QryTmp.Close;
  dmDados.QryTmp.SQL.Clear;
  dmDados.QryTmp.SQL.Add('UPDATE ALUNOS SET ALU_LOGADO = :ALU_LOGADO, ALU_DISPOSITIVO = :ALU_DISPOSITIVO');
  dmDados.QryTmp.ParamByName('ALU_LOGADO').AsBoolean := False;
  dmDados.QryTmp.ParamByName('ALU_DISPOSITIVO').AsString := '';
  dmDados.QryTmp.ExecSQL;
end;

end.

