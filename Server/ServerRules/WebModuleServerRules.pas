unit WebModuleServerRules;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Datasnap.DSHTTPCommon,
  Datasnap.DSHTTPWebBroker, Datasnap.DSServer,
  Web.WebFileDispatcher, Web.HTTPProd,
  DataSnap.DSAuth,
  Datasnap.DSProxyJavaScript, IPPeerServer, Datasnap.DSMetadata, Datasnap.DSServerMetadata,
  Datasnap.DSClientMetadata, Datasnap.DSCommonServer, Datasnap.DSHTTP,
  Consts_HtmlHome;

type
  TWebModule1 = class(TWebModule)
    DSHTTPWebDispatcher1: TDSHTTPWebDispatcher;
    DSServer1: TDSServer;
   DSAuthenticationManager1: TDSAuthenticationManager;
    DSServerClass1: TDSServerClass;
    Login: TPageProducer;
    Home: TPageProducer;
    WebFileDispatcher1: TWebFileDispatcher;
    DSProxyGenerator1: TDSProxyGenerator;
    DSServerMetaDataProvider1: TDSServerMetaDataProvider;
    UserPlayer: TPageProducer;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSAuthenticationManager1UserAuthorize(Sender: TObject;
      EventObject: TDSAuthorizeEventObject; var valid: Boolean);
    procedure DSAuthenticationManager1UserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
    procedure LoginHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: string; TagParams: TStrings; var ReplaceText: string);
    procedure WebModuleDefaultAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleBeforeDispatch(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebFileDispatcher1BeforeDispatch(Sender: TObject;
      const AFileName: string; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure WebModuleCreate(Sender: TObject);
    procedure UserPlayerHTMLTag(Sender: TObject; Tag: TTag; const TagString: string; TagParams: TStrings;
      var ReplaceText: string);
  private
    { Private declarations }
    FServerFunctionInvokerAction: TWebActionItem;

    function AllowServerFunctionInvoker: Boolean;
    function GetTrilhasHome: String;
    function GetListagemCursosPlayer: String;
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses
  ServerMethodsServerRules, Web.WebReq, udmDados;

procedure TWebModule1.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsServerRules.TSMRegras;
end;

procedure TWebModule1.DSAuthenticationManager1UserAuthenticate(
  Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
var
  IdAluno: Integer;
  UserAux: String;
  IdDevice: String;
begin
  valid := (User = '') and (Password = '');

  if not valid then
  begin
    UserAux := Copy(User, 1, Pos('|', User) -1);
    IdDevice := Copy(User, Pos('|', User), User.Length);

    dmDados.QryTmp.Close;
    dmDados.QryTmp.SQL.Clear;
    dmDados.QryTmp.Open('SELECT ALU_ID FROM ALUNOS ' +
                        'WHERE ALU_EMAIL = ' + QuotedStr(UserAux) +
                        '  AND ALU_SENHA = ' + QuotedStr(Password) +
                        '  AND ALU_ATIVO = 1 ' +
                        '  AND FG_EXCLUIDO = 0 ');

    IdAluno := 0;
    if dmDados.QryTmp.FieldByName('ALU_ID').AsInteger > 0 then
    begin
      IdAluno := dmDados.QryTmp.FieldByName('ALU_ID').AsInteger;
      valid := True;
    end;

    if valid then
    begin
       dmDados.QryTmp.Close;
       dmDados.QryTmp.SQL.Add('UPDATE ALUNOS SET ALU_LOGADO = :ALU_LOGADO, ALU_DISPOSITIVO = :ALU_DISPOSITIVO WHERE ALU_ID = :ALU_ID');
       dmDados.QryTmp.ParamByName('ALU_LOGADO').AsBoolean := True;
       dmDados.QryTmp.ParamByName('ALU_DISPOSITIVO').AsString := IdDevice;
       dmDados.QryTmp.ParamByName('ALU_ID').AsInteger := IdAluno;
       dmDados.QryTmp.ExecSQL;
    end;
  end;

  dmDados.UsuarioLogado := valid;

  dmDados.QryTmp.Close;
end;

procedure TWebModule1.DSAuthenticationManager1UserAuthorize(
  Sender: TObject; EventObject: TDSAuthorizeEventObject; 
  var valid: Boolean);
begin
  valid := True;
end;

procedure TWebModule1.LoginHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: string; TagParams: TStrings; var ReplaceText: string);
begin
  if SameText(TagString, 'urlpath') then
    ReplaceText := string(Request.InternalScriptName)
  else
  if SameText(TagString, 'port') then
    ReplaceText := IntToStr(Request.ServerPort)
  else
  if SameText(TagString, 'host') then
    ReplaceText := string(Request.Host)
  else
  if SameText(TagString, 'classname') then
    ReplaceText := ServerMethodsServerRules.TSMRegras.ClassName
  else
  if SameText(TagString, 'loginrequired') then
    if DSHTTPWebDispatcher1.AuthenticationManager <> nil then
      ReplaceText := 'true'
    else
      ReplaceText := 'false'
  else
  if SameText(TagString, 'serverfunctionsjs') then
    ReplaceText := string(Request.InternalScriptName) + '/js/serverfunctions.js'
  else
  if SameText(TagString, 'servertime') then
    ReplaceText := DateTimeToStr(Now)
  else
  if SameText(TagString, 'Login') then
  begin
    if AllowServerFunctionInvoker then
      ReplaceText :=
      '<div><a href="' + string(Request.InternalScriptName) + '/Login">Login</a></div>'
    else
      ReplaceText := '';
  end
  else
  if SameText(TagString, 'Jeffer') then
     ReplaceText := '<div><a href="http://www.jeffer.com.br">jeffer.com.br</a></div>'
  else
  if SameText(TagString, 'CursosDisponiveisEmFaixas') then
  begin
     ReplaceText := GetTrilhasHome;
  end
  else
  if SameText(TagString, 'BotaoNotificacoesUsuario') then
  begin
     if dmDados.UsuarioLogado then
       ReplaceText := _BOTAO_NOTIFICACOES_USUARIO
     else
       ReplaceText := '';
  end
  else
  if SameText(TagString, 'BotaoAssineAgoraTopo') then
  begin
     if dmDados.UsuarioLogado then
     begin
       if dmDados.StatuAluno <> 'ATIVO' then
         ReplaceText := _BOTAO_ASSINE_AGORA_TOPO
       else
         ReplaceText := '';
     end
     else
       ReplaceText := _BOTAO_ASSINE_AGORA_TOPO;
  end;

end;

function TWebModule1.GetTrilhasHome: String;
var
  CodigoTrilha: Integer;
  CursosDaTrilha,
  BannersDaTrilha: String;
  NomeTrilha,
  CorTituloTrilha,
  CapaCurso,
  NomeAulasCapa,
  BannerCurso,
  IdCursoBanner,
  ClassSection,
  TrilhaContinuarAssistindo: String;
begin
   Result := '';
   dmDados.QryTrilhasHome.Close;
   dmDados.QryTrilhasHome.Open;

   CursosDaTrilha := '';
   BannersDaTrilha := '';

   CodigoTrilha := dmDados.QryTrilhasHome.FieldByName('TRI_ID').AsInteger;
   NomeTrilha := dmDados.QryTrilhasHome.FieldByName('TRI_NOME').AsString;

   while not dmDados.QryTrilhasHome.Eof do
   begin
     /// Montar as capas
     CapaCurso := StringReplace(_CAPA_TRILHA, ':CUR_IMG_CAPA', ExtractFileName(dmDados.QryTrilhasHome.FieldByName('CUR_IMG_CAPA').AsString), [rfReplaceAll, rfIgnoreCase]);
     CapaCurso := StringReplace(CapaCurso, ':QUANT_AULAS', dmDados.QryTrilhasHome.FieldByName('TOT_AULAS').AsString, [rfReplaceAll, rfIgnoreCase]);
     CapaCurso := StringReplace(CapaCurso, ':TOT_HORAS_CURSO', dmDados.QryTrilhasHome.FieldByName('TOT_HORAS_CURSO').AsString, [rfReplaceAll, rfIgnoreCase]);

     NomeAulasCapa := 'Aula';
     if dmDados.QryTrilhasHome.FieldByName('TOT_AULAS').AsInteger > 1 then
       NomeAulasCapa := 'Aulas';

     CapaCurso := StringReplace(CapaCurso, ':NOME_AULAS', NomeAulasCapa, [rfReplaceAll, rfIgnoreCase]);

     IdCursoBanner := 'IdCursoBanner' + dmDados.QryTrilhasHome.RecNo.ToString + dmDados.QryTrilhasHome.FieldByName('CUR_ID').AsString;

     CapaCurso := StringReplace(CapaCurso, ':ID_BANNER_CURSO', IdCursoBanner, [rfReplaceAll, rfIgnoreCase]);

     CapaCurso := StringReplace(CapaCurso, ':ID_VIDEO_VIMEO', dmDados.QryTrilhasHome.FieldByName('CUR_ID_VIDEO_VIMEO_CHAMADA').AsString, [rfReplaceAll, rfIgnoreCase]);

     CursosDaTrilha := CursosDaTrilha + '  ' + CapaCurso;

     /// Montar os Banners
     BannerCurso := StringReplace(_BANNER_DETALHAMENTO_VIDEO, ':CUR_IMG_CHAMADA', ExtractFileName(dmDados.QryTrilhasHome.FieldByName('CUR_IMG_CHAMADA').AsString), [rfReplaceAll, rfIgnoreCase]);
     BannerCurso := StringReplace(BannerCurso, ':ID_BANNER_CURSO', IdCursoBanner, [rfReplaceAll, rfIgnoreCase]);

     BannersDaTrilha := BannersDaTrilha + '  ' + BannerCurso;

     dmDados.QryTrilhasHome.Next;

     if (CodigoTrilha <> dmDados.QryTrilhasHome.FieldByName('TRI_ID').AsInteger) or (dmDados.QryTrilhasHome.Eof) then
     begin
       CorTituloTrilha :=  _COR_TITULO_TRILHA_TOPO;

       ClassSection := _CLASSE_SECTION_NORMAL;
       if (Result = '') and (not dmDados.UsuarioLogado) then
         ClassSection := _CLASSE_SECTION_DESTAQUE;

       if dmDados.QryTrilhasHome.Eof then
         ClassSection := _CLASSE_SECTION_ULTIMA;

       TrilhaContinuarAssistindo := '';

       if (Result = '') and (dmDados.UsuarioLogado) then
       begin
         TrilhaContinuarAssistindo := StringReplace(_TRILHAS_SECAO_NORMAL_INICIO, ':CLASSE_SECTION', _CLASSE_SECTION_DESTAQUE, [rfReplaceAll, rfIgnoreCase]) +
              _FAIXA_TRILHA_INICIO +
              CursosDaTrilha  +
              _FAIXA_TRILHA_FIM +
              BannersDaTrilha +
              _TRILHAS_SECAO_DESTAQUES_FIM;

         /// Linka o detalhamento do curso na parte abaixa retratil
         TrilhaContinuarAssistindo := StringReplace(TrilhaContinuarAssistindo, ':CLASS_COLOR_H2', CorTituloTrilha, [rfReplaceAll, rfIgnoreCase]);
         TrilhaContinuarAssistindo := StringReplace(TrilhaContinuarAssistindo, ':TRI_NOME', 'CONTINUAR ASSISTINDO', [rfReplaceAll, rfIgnoreCase]);
         TrilhaContinuarAssistindo := StringReplace(TrilhaContinuarAssistindo, ':TRI_CODIGO_REF', Integer(0).ToString, [rfReplaceAll, rfIgnoreCase]);
       end;

       Result := Result + TrilhaContinuarAssistindo + '  ' +
        StringReplace(_TRILHAS_SECAO_NORMAL_INICIO, ':CLASSE_SECTION', ClassSection, [rfReplaceAll, rfIgnoreCase]) +
        _FAIXA_TRILHA_INICIO +
        CursosDaTrilha  +
        _FAIXA_TRILHA_FIM +
        BannersDaTrilha +
        _TRILHAS_SECAO_DESTAQUES_FIM;

       /// Linka o detalhamento do curso na parte abaixa retratil
       Result := StringReplace(Result, ':CLASS_COLOR_H2', CorTituloTrilha, [rfReplaceAll, rfIgnoreCase]);
       Result := StringReplace(Result, ':TRI_NOME', NomeTrilha, [rfReplaceAll, rfIgnoreCase]);
       Result := StringReplace(Result, ':TRI_CODIGO_REF', CodigoTrilha.ToString, [rfReplaceAll, rfIgnoreCase]);

       CursosDaTrilha := '';
       BannersDaTrilha := '';
       CodigoTrilha := dmDados.QryTrilhasHome.FieldByName('TRI_ID').AsInteger;
       NomeTrilha := dmDados.QryTrilhasHome.FieldByName('TRI_NOME').AsString;
     end;
   end;
end;

procedure TWebModule1.UserPlayerHTMLTag(Sender: TObject; Tag: TTag; const TagString: string;
  TagParams: TStrings; var ReplaceText: string);
begin
  if SameText(TagString, 'urlpath') then
    ReplaceText := string(Request.InternalScriptName)
  else
  if SameText(TagString, 'port') then
    ReplaceText := IntToStr(Request.ServerPort)
  else
  if SameText(TagString, 'host') then
    ReplaceText := string(Request.Host)
  else
  if SameText(TagString, 'classname') then
    ReplaceText := ServerMethodsServerRules.TSMRegras.ClassName
  else
  if SameText(TagString, 'serverfunctionsjs') then
    ReplaceText := string(Request.InternalScriptName) + '/js/serverfunctions.js'
  else
  if SameText(TagString, 'servertime') then
    ReplaceText := DateTimeToStr(Now)
  else
  if SameText(TagString, 'PainelDireitoCursosModulosAulas') then
    ReplaceText := GetListagemCursosPlayer
  else
      ReplaceText := '';
end;

function TWebModule1.GetListagemCursosPlayer: String;
var
  CodigoCurso,
  CodigoModulo: Integer;
  Curso, Modulo, Aulas: String;
  Cursos, Modulos: String;
  TotalAulasModulo, TotalAulasCurso: Integer;
  Aula, NomeModulo: String;
begin
  Result := '';
  dmDados.QryCursosAlunoPlayer.Close;
  dmDados.QryCursosAlunoPlayer.ParamByName('ALU_ID').AsInteger := dmDados.IdAluno;
  dmDados.QryCursosAlunoPlayer.Open;

  CodigoCurso := dmDados.QryCursosAlunoPlayer.FieldByName('CUR_ID').AsInteger;
  CodigoModulo := dmDados.QryCursosAlunoPlayer.FieldByName('MOD_ID').AsInteger;
  NomeModulo := dmDados.QryCursosAlunoPlayer.FieldByName('MOD_NOME').AsString;

  Curso := '';
  Modulo := '';
  Aulas := '';
  Cursos := '';
  Modulos := '';

  TotalAulasModulo := 0;
  TotalAulasCurso := 0;

  while not dmDados.QryCursosAlunoPlayer.Eof do
  begin
    /// Montar as alulas dos modulos
    Aula := _PLAYER_PAINEL_DIREITO_AULA_MODULO_VERDE;
    Aula := StringReplace(Aula, ':AUL_NOME', dmDados.QryCursosAlunoPlayer.FieldByName('AUL_NOME').AsString, [rfReplaceAll,rfIgnoreCase]);
    Aula := StringReplace(Aula, ':CUR_IMG_MINIATURA', ExtractFileName(dmDados.QryCursosAlunoPlayer.FieldByName('CUR_IMG_MINIATURA').AsString), [rfReplaceAll,rfIgnoreCase]);

    Aulas := Aulas + Aula;

    Inc(TotalAulasModulo);

    dmDados.QryCursosAlunoPlayer.Next;

    if (CodigoCurso <> dmDados.QryCursosAlunoPlayer.FieldByName('CUR_ID').AsInteger) or
       (CodigoModulo <> dmDados.QryCursosAlunoPlayer.FieldByName('MOD_ID').AsInteger) or
       (dmDados.QryCursosAlunoPlayer.Eof) then
    begin
      /// Finaliza Modulo
      if (CodigoModulo <> dmDados.QryCursosAlunoPlayer.FieldByName('MOD_ID').AsInteger) or (dmDados.QryCursosAlunoPlayer.Eof) then
      begin
        Modulo := StringReplace(_PLAYER_PAINEL_DIREITO_MODULO, ':PAINEL_DIREITO_AULAS_MODULO', Aulas, [rfReplaceAll,rfIgnoreCase]);
        Modulo := StringReplace(Modulo, ':MOD_NOME', NomeModulo, [rfReplaceAll,rfIgnoreCase]);
        Modulo := StringReplace(Modulo, ':MOD_ID', dmDados.QryCursosAlunoPlayer.FieldByName('MOD_ID').AsString, [rfReplaceAll,rfIgnoreCase]);
        Modulo := StringReplace(Modulo, ':TOT_AULAS_MOD', TotalAulasModulo.ToString, [rfReplaceAll,rfIgnoreCase]);

        Modulos := Modulos + Modulo;

        Modulo := '';
        NomeModulo := dmDados.QryCursosAlunoPlayer.FieldByName('MOD_NOME').AsString;

        TotalAulasCurso := TotalAulasCurso + TotalAulasModulo;
        TotalAulasModulo := 0;
      end;

      /// Finaliza Curso
      if (CodigoCurso <> dmDados.QryCursosAlunoPlayer.FieldByName('CUR_ID').AsInteger) or (dmDados.QryCursosAlunoPlayer.Eof) then
      begin
        Curso := StringReplace(_PAINEL_CURSO_MODULOS_AULAS, ':PAINEL_DIREITO_MODULOS', Modulos, [rfReplaceAll,rfIgnoreCase]);
        Curso := StringReplace(Curso, ':CUR_NOME', dmDados.QryCursosAlunoPlayer.FieldByName('CUR_NOME').AsString, [rfReplaceAll,rfIgnoreCase]);
        Curso := StringReplace(Curso, ':TOT_AULAS_CUR', TotalAulasCurso.ToString, [rfReplaceAll,rfIgnoreCase]);

        Cursos := Cursos + Curso;

        Modulos := '';
        TotalAulasCurso := 0;
      end;

      Curso := '';
      Aulas := '';
      CodigoCurso := dmDados.QryCursosAlunoPlayer.FieldByName('CUR_ID').AsInteger;
      CodigoModulo := dmDados.QryCursosAlunoPlayer.FieldByName('MOD_ID').AsInteger;
    end;
  end;

   Result := Result + Cursos;
end;

procedure TWebModule1.WebModuleDefaultAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if (Request.InternalPathInfo = '') or (Request.InternalPathInfo = '/')then
    Response.Content := Home.Content
  else
    Response.SendRedirect(Request.InternalScriptName + '/');
end;

procedure TWebModule1.WebModuleBeforeDispatch(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if FServerFunctionInvokerAction <> nil then
    FServerFunctionInvokerAction.Enabled := AllowServerFunctionInvoker;
end;

function TWebModule1.AllowServerFunctionInvoker: Boolean;
begin
  Result := (Request.RemoteAddr = '127.0.0.1') or
    (Request.RemoteAddr = '0:0:0:0:0:0:0:1') or (Request.RemoteAddr = '::1');
end;

procedure TWebModule1.WebFileDispatcher1BeforeDispatch(Sender: TObject;
  const AFileName: string; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  D1, D2: TDateTime;
begin
  Handled := False;
  if SameFileName(ExtractFileName(AFileName), 'serverfunctions.js') then
    if not FileExists(AFileName) or (FileAge(AFileName, D1) and FileAge(WebApplicationFileName, D2) and (D1 < D2)) then
    begin
      DSProxyGenerator1.TargetDirectory := ExtractFilePath(AFileName);
      DSProxyGenerator1.TargetUnitName := ExtractFileName(AFileName);
      DSProxyGenerator1.Write;
    end;
end;

procedure TWebModule1.WebModuleCreate(Sender: TObject);
begin
  FServerFunctionInvokerAction := ActionByName('LoginAction');
end;

initialization

finalization
  Web.WebReq.FreeWebModules;

end.

