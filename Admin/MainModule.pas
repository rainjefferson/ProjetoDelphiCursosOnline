unit MainModule;

interface

uses
  uniGUIMainModule, System.SysUtils, System.Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, System.JSON,
  FireDAC.Comp.Client, System.Actions, Vcl.ActnList, System.ImageList, uniGUITypes,
  Vcl.ImgList, uniImageList, uniGUIBaseClasses, uniGUIClasses, frxClass, Vcl.Controls,
  Interfaces, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, uniImage, IPPeerClient, Datasnap.DBClient,
  REST.Client, REST.Authenticator.OAuth, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Types, Vcl.Consts, Datasnap.Provider, uniProgressBar;

type
  TCarregarVideoAulaVimeo = (cvVideoAula, cvVideoChamada);
  TUploadApostila = (tpApostilaAula, tpApostilaModulo);
  TUploadFotoAlunoUser = (tpFotoUser, tpFotoAluno);

  TUniMainModule = class(TUniGUIMainModule)
    Conn: TFDConnection;
    dsUsers: TDataSource;
    tblUsers: TFDQuery;
    ActionList1: TActionList;
    actCadCursos: TAction;
    actCadProfessores: TAction;
    actCadUsuarios: TAction;
    actAlterarAdmin: TAction;
    tblCursos: TFDQuery;
    tblUsersUSU_ID: TIntegerField;
    tblUsersUSU_LOGIN: TStringField;
    tblUsersUSU_SENHA: TStringField;
    tblUsersUSU_ADMIN: TBooleanField;
    dsCursos: TDataSource;
    tblCursosCUR_ID: TIntegerField;
    tblCursosCUR_NOME: TStringField;
    tblCursosCUR_DATA_CADASTRO: TDateField;
    tblCursosCUR_ATIVO: TBooleanField;
    tblCursosCUR_DESTAQUE: TBooleanField;
    tblCursosCUR_IMG_CAPA: TStringField;
    tblModulos: TFDQuery;
    dsModulos: TDataSource;
    tblModulosMOD_ID: TIntegerField;
    tblModulosCUR_ID: TIntegerField;
    tblModulosMOD_NOME: TStringField;
    tblModulosMOD_DATA_CADASTRO: TDateField;
    tblAulas: TFDQuery;
    dsAulas: TDataSource;
    tblAnexos: TFDQuery;
    dsAnexos: TDataSource;
    tblAnexosANX_ID: TIntegerField;
    tblAnexosAUL_ID: TIntegerField;
    tblAnexosANX_NOME: TStringField;
    tblAnexosANX_LOCAL_MIDIA: TStringField;
    tblAulasAUL_ID: TIntegerField;
    tblAulasMOD_ID: TIntegerField;
    tblAulasAUL_NOME: TStringField;
    tblAulasAUL_DATA_CADASTRO: TDateField;
    tblAulasAUL_VIDEO: TStringField;
    actIncluirUsuario: TAction;
    actExcluirUsuario: TAction;
    actAlterarUsuario: TAction;
    actGravarUsuario: TAction;
    tblUsersUSU_ALUNO: TBooleanField;
    tblUsersUSU_CURSO: TBooleanField;
    tblUsersUSU_FINANCEIRO: TBooleanField;
    tblUsersUSU_SUPORTE: TBooleanField;
    tblCursosCUR_IMG_DESTAQUE: TStringField;
    actCarregarImagemCapa: TAction;
    actCarregarImagemDestaque: TAction;
    actIncluirCurso: TAction;
    actAlterarCurso: TAction;
    actExcluirCurso: TAction;
    actGravarCurso: TAction;
    actIncluirModulo: TAction;
    actAlterarModulo: TAction;
    actExcluirModulo: TAction;
    actGravarModulo: TAction;
    actIncluirAula: TAction;
    actAlterarAula: TAction;
    actExcluirAula: TAction;
    actGravarAula: TAction;
    actIncluirAnexo: TAction;
    actAlterarAnexo: TAction;
    actExcluirAnexo: TAction;
    actGravarAnexo: TAction;
    tblCursosCUR_CONTEUDO_HTML: TMemoField;
    tblAulasAUL_ID_VIDEO_VIMEO: TIntegerField;
    actCarregarConteudoHtml: TAction;
    actCarregarFotoUsuario: TAction;
    tblUsersUSU_FOTO: TStringField;
    tblUsersUSU_EMAIL: TStringField;
    tblUsersUSU_GAMEFICACAO: TBooleanField;
    tblUsersUSU_TRILHAS: TBooleanField;
    tblUsersUSU_DOCUMETOS: TBooleanField;
    tblUsersUSU_RELATORIOS: TBooleanField;
    tblCursosCUR_VALOR: TCurrencyField;
    tblCursosCUR_PAGO: TBooleanField;
    tblCursosCUR_PUBLICADO_EM: TDateField;
    tblCursosCUR_NAO_LISTADO: TBooleanField;
    tblCursosCUR_EM_CRIACAO: TBooleanField;
    tblCursosCUR_DISPONIVEL_ATE: TDateField;
    tblCursosCUR_SEO: TStringField;
    tblCursosCUR_PALAVRAS_CHAVE: TStringField;
    tblAulasAUL_IMG_BANNER: TStringField;
    tblAulasAUL_HIPER_LNK_BANNER: TStringField;
    tblAulasAUL_FILE_APOSTILA: TStringField;
    tblAulasAUL_FILE_AUDIO: TStringField;
    actCarregarImagemBanner: TAction;
    actCarregarVideosVimeo: TAction;
    dsVideosVimeo: TDataSource;
    RESTRequest: TRESTRequest;
    RESTClient: TRESTClient;
    RESTResponse: TRESTResponse;
    OAuth2Authenticator1: TOAuth2Authenticator;
    cdsVideosVimeo: TClientDataSet;
    tblCursosCC_TOTAL_MODULOS: TIntegerField;
    tblModulosCC_TOTAL_AULAS: TIntegerField;
    tblAulasAUL_DATA_LIBERACAO: TDateField;
    tblAulasAUL_DIAS_LIBERACAO: TIntegerField;
    tblAulasAUL_PERMITE_ANTECIPAR: TBooleanField;
    tblCursosCUR_PROVA_HTML: TMemoField;
    tblCursosCUR_CERTIFICADO_HTML: TMemoField;
    actCarregarConteudoHtmlCertificado: TAction;
    actCarregarConteudoHtmlProva: TAction;
    tblProfessores: TFDQuery;
    dsProfessores: TDataSource;
    tblProfessoresPRO_ID: TIntegerField;
    tblProfessoresPRO_NOME: TStringField;
    tblProfessoresPRO_DATA_CADASTRO: TDateField;
    tblProfessoresPRO_FOTO: TStringField;
    tblProfessoresPRO_HTML: TMemoField;
    tblProfessoresPRO_ATIVO: TBooleanField;
    actIncluirProfessor: TAction;
    actExcluirProfessor: TAction;
    actCarregarFotoProfessor: TAction;
    tblCursosCUR_IMG_CHAMADA: TStringField;
    tblCursosCUR_ID_VIDEO_VIMEO_CHAMADA: TIntegerField;
    tblCursosCUR_IMG_MINIATURA: TStringField;
    actCarregarImagemChamadaCurso: TAction;
    actCarregarImagemMiniaturaCurso: TAction;
    tblUsersID_EMPRESA: TIntegerField;
    tblCursosID_EMPRESA: TIntegerField;
    tblModulosID_EMPRESA: TIntegerField;
    tblAulasID_EMPRESA: TIntegerField;
    tblProfessoresID_EMPRESA: TIntegerField;
    tblCursosCUR_URL_YOUTUBE_VID_CHAMADA: TStringField;
    tblAulasAUL_GRATIS: TBooleanField;
    QryAux: TFDQuery;
    actCarregarConteudoHtmlProfessor: TAction;
    tblCursosCC_TOTAL_PROFESSORES: TIntegerField;
    actVincularProfessoresCurso: TAction;
    cdsProfessoresCurso: TClientDataSet;
    dsProfessoresCurso: TDataSource;
    cdsProfessoresCursoCUR_ID: TIntegerField;
    cdsProfessoresCursoPRO_ID: TIntegerField;
    cdsProfessoresCursoMARCADO: TBooleanField;
    cdsProfessoresCursoPRO_NOME: TStringField;
    tblAulasAUL_URL_YOUTUBE: TStringField;
    tblUsersFG_EXCLUIDO: TBooleanField;
    tblCursosFG_EXCLUIDO: TBooleanField;
    tblModulosFG_EXCLUIDO: TBooleanField;
    tblAulasFG_EXCLUIDO: TBooleanField;
    tblProfessoresFG_EXCLUIDO: TBooleanField;
    tblCursosCUR_VALOR_POR_AULA: TCurrencyField;
    tblModulosMOD_FILE_APOSTILA: TStringField;
    tblAulasAUL_ORDEM_POSICAO: TIntegerField;
    tblAulasAUL_EM_CRIACAO: TBooleanField;
    dsAlunos: TDataSource;
    tblAlunos: TFDQuery;
    tblAlunosALU_ID: TIntegerField;
    tblAlunosALU_NOME: TStringField;
    tblAlunosALU_SOBRENOME: TStringField;
    tblAlunosALU_DATA_CADASTRO: TDateField;
    tblAlunosALU_ATIVO: TBooleanField;
    tblAlunosUSU_ID: TIntegerField;
    tblAlunosALU_TELEFONE: TStringField;
    tblAlunosALU_TELEFONE_EXTRA: TStringField;
    tblAlunosALU_EMAIL: TStringField;
    tblAlunosALU_CPF: TStringField;
    tblAlunosALU_RG: TStringField;
    tblAlunosALU_CIDADE: TStringField;
    tblAlunosALU_UF: TStringField;
    tblAlunosALU_CARGO: TStringField;
    tblAlunosALU_CATEGORIA: TStringField;
    tblAlunosFG_EXCLUIDO: TBooleanField;
    tblAlunosID_EMPRESA: TIntegerField;
    actExcluirAlunos: TAction;
    actIncluirAlunos: TAction;
    actCarregarApostila: TAction;
    actCarregarAudio: TAction;
    UniImageListNovoMenu64: TUniImageList;
    actAlterarAlunos: TAction;
    actGravarAlunos: TAction;
    tblAlunosCC_FOTO: TStringField;
    tblUsersCC_FOTO: TStringField;
    tblProfessoresCC_FOTO: TStringField;
    tblAlunosALU_STATUS: TStringField;
    tblAlunosALU_FOTO: TStringField;
    actCarregarFotoAluno: TAction;
    tblAlunosALU_DATA_NASCIMENTO: TDateField;
    tblAlunosALU_LOGRADOURO: TStringField;
    tblAlunosALU_END_NUMERO: TStringField;
    tblAlunosALU_END_COMPLEMENTO: TStringField;
    tblAlunosALU_CEP: TStringField;
    tblAlunosALU_SKYPE: TStringField;
    tblAlunosALU_SENHA: TStringField;
    tblAlunosALU_EMPRESA: TStringField;
    tblAlunosALU_BAIRRO: TStringField;
    tblCursosCC_IMAGEM_CAPA: TStringField;
    tblCursosCC_IMAGEM_CHAMADA: TStringField;
    tblCursosCC_IMAGEM_MINIATURA: TStringField;
    tblCursosCC_IMAGEM_DESTAQUE: TStringField;
    tblCursosCC_TEXTO_HTML: TStringField;
    tblCursosCC_CERTIFICADO_HTML: TStringField;
    tblCursosCC_VIDEO_CHAMADA: TStringField;
    tblCursosCC_PROVA_HTML: TStringField;
    tblProfessoresCC_TEXTO_HTML: TStringField;
    tblModulosCC_APOSTILA: TStringField;
    tblAulasCC_VIDEO: TStringField;
    tblAulasCC_IMG_BANNER: TStringField;
    tblAulasCC_FILE_APOSTILA: TStringField;
    tblAulasCC_FILE_AUDIO: TStringField;
    cdsProfessoresCursoCC_FOTO: TStringField;
    tblCursosCUR_URL_CURSO: TStringField;
    tblAulasAUL_PROVA_HTML: TMemoField;
    tblAulasCC_PROVA_HTML: TStringField;
    tblCursosCC_ATIVO: TStringField;
    tblCursosCC_PAGO: TStringField;
    tblCursosCC_DESTAQUE: TStringField;
    tblCursosCC_NA0_LISTADO: TStringField;
    tblCursosCC_EM_CRIACAO: TStringField;
    tblAulasCC_PERMITE_ANTECIPAR: TStringField;
    tblAulasCC_EM_CRIACAO: TStringField;
    tblProfessoresCC_ATIVO: TStringField;
    tblUsersCC_ADMIN: TStringField;
    tblUsersCC_ALUNOS: TStringField;
    tblUsersCC_FINANCEIRO: TStringField;
    tblUsersCC_CURSOS: TStringField;
    tblUsersCC_SUPORTE: TStringField;
    tblUsersCC_GAMEFICA: TStringField;
    tblUsersCC_DOCUMENTOS: TStringField;
    tblUsersCC_RELATORIOS: TStringField;
    tblUsersCC_TRILHAS: TStringField;
    UniImageListMenuGrud32: TUniImageList;
    tblModulosMOD_ORDEM_POSICAO: TIntegerField;
    tblAlunosCC_STATUS: TStringField;
    tblAulasCC_GRATIS: TStringField;
    cdsProfessoresCursoCC_MARCADO: TStringField;
    tblTrilhas: TFDQuery;
    dsTrilhas: TDataSource;
    tblTrilhasTRI_ID: TIntegerField;
    tblTrilhasTRI_NOME: TStringField;
    tblTrilhasTRI_NOME_INTERNO: TStringField;
    tblTrilhasTRI_PALAVRAS_CHAVE: TStringField;
    tblTrilhasTRI_EM_CRIACAO: TBooleanField;
    tblTrilhasTRI_DATA_CADASTRO: TDateField;
    tblTrilhasTRI_ATIVO: TBooleanField;
    tblTrilhasID_EMPRESA: TIntegerField;
    tblTrilhasFG_EXCLUIDO: TBooleanField;
    tblTrilhasCC_TOTAL_CURSOS: TIntegerField;
    tblTrilhasCC_ATIVO: TStringField;
    tblTrilhasCC_EM_CRIACAO: TStringField;
    actExcluirTrilhas: TAction;
    actExcluirCursosTrilhas: TAction;
    actIncluirTrilha: TAction;
    actIncluirCursosTrilha: TAction;
    tblCursosTrilhas: TFDQuery;
    dsCursosTrilhas: TDataSource;
    tblCursosTrilhasTRI_ID: TIntegerField;
    tblCursosTrilhasCUR_ID: TIntegerField;
    tblCursosTrilhasTRC_ORDEM_POSICAO: TIntegerField;
    tblCursosTrilhasCUR_NOME: TStringField;
    cdsCursosTrilhas: TClientDataSet;
    dsCdsCursosTrilhas: TDataSource;
    cdsCursosTrilhasCUR_ID: TIntegerField;
    cdsCursosTrilhasCUR_NOME: TStringField;
    cdsCursosTrilhasTRI_ID: TIntegerField;
    cdsCursosTrilhasMARCADO: TBooleanField;
    cdsCursosTrilhasCC_MARCADO: TStringField;
    tblTrilhasFixas: TFDQuery;
    dsTrilhasFixas: TDataSource;
    tblTrilhasFixasTRF_ID: TIntegerField;
    tblTrilhasFixasTRF_ORDEM_POSICAO: TIntegerField;
    tblTrilhasFixasTRI_ID: TIntegerField;
    tblTrilhasFixasID_EMPRESA: TIntegerField;
    tblTrilhasFixasFG_EXCLUIDO: TBooleanField;
    tblTrilhasFixasTRI_NOME: TStringField;
    tblTrilhasFixasCC_TOTAL_CURSOS: TIntegerField;
    actExcluirTrilhasFixas: TAction;
    actIncluirTrilhaFixa: TAction;
    cdsTrilhasFixas: TClientDataSet;
    dsCdsTrilhasFixas: TDataSource;
    cdsTrilhasFixasTRI_ID: TIntegerField;
    cdsTrilhasFixasTRI_NOME: TStringField;
    cdsTrilhasFixasMARCADO: TBooleanField;
    cdsTrilhasFixasCC_MARCADO: TStringField;
    cdsCursosTrilhasTRC_ORDEM_POSICAO: TIntegerField;
    SqlApagarVideosVimeo: TFDQuery;
    SqlVideosVimeo: TFDQuery;
    DspVideosVimeo: TDataSetProvider;
    SqlVideosVimeoID_VIDEO: TIntegerField;
    SqlVideosVimeoURI: TStringField;
    SqlVideosVimeoNOME_VIDEO: TStringField;
    SqlVideosVimeoDESCRICAO_VIDEO: TStringField;
    SqlVideosVimeoLINK: TStringField;
    SqlVideosVimeoDURACAO: TIntegerField;
    SqlVideosVimeoTAMANHO_LARGURA: TIntegerField;
    SqlVideosVimeoTAMANHO_ALTURA: TIntegerField;
    SqlVideosVimeoDATA_CRIADO: TStringField;
    SqlVideosVimeoDATA_MODIFICADO: TStringField;
    SqlVideosVimeoDATA_ATUALIZADO: TStringField;
    SqlVideosVimeoID_EMPRESA: TIntegerField;
    SqlVideosVimeoFG_EXCLUIDO: TBooleanField;
    cdsVideosVimeoID_EMPRESA: TIntegerField;
    cdsVideosVimeoFG_EXCLUIDO: TBooleanField;
    cdsVideosVimeoID_VIDEO: TIntegerField;
    cdsVideosVimeoURI: TStringField;
    cdsVideosVimeoNOME_VIDEO: TStringField;
    cdsVideosVimeoDESCRICAO_VIDEO: TStringField;
    cdsVideosVimeoLINK: TStringField;
    cdsVideosVimeoDURACAO: TIntegerField;
    cdsVideosVimeoTAMANHO_LARGURA: TIntegerField;
    cdsVideosVimeoTAMANHO_ALTURA: TIntegerField;
    cdsVideosVimeoDATA_CRIADO: TStringField;
    cdsVideosVimeoDATA_MODIFICADO: TStringField;
    cdsVideosVimeoDATA_ATUALIZADO: TStringField;
    procedure UniGUIMainModuleDestroy(Sender: TObject);
    procedure actCadCursosExecute(Sender: TObject);
    procedure actCadProfessoresExecute(Sender: TObject);
    procedure actCadUsuariosExecute(Sender: TObject);
    procedure UniGUIMainModuleNewComponent(AComponent: TComponent);
    procedure actAlterarAdminExecute(Sender: TObject);
    procedure UniGUIMainModuleCreate(Sender: TObject);
    procedure tblCursosAfterInsert(DataSet: TDataSet);
    procedure tblModulosAfterInsert(DataSet: TDataSet);
    procedure tblAulasAfterInsert(DataSet: TDataSet);
    procedure tblAnexosAfterInsert(DataSet: TDataSet);
    procedure tblUsersAfterInsert(DataSet: TDataSet);
    procedure actIncluirUsuarioExecute(Sender: TObject);
    procedure actExcluirUsuarioExecute(Sender: TObject);
    procedure actAlterarUsuarioExecute(Sender: TObject);
    procedure actGravarUsuarioExecute(Sender: TObject);
    procedure actCarregarImagemCapaExecute(Sender: TObject);
    procedure actCarregarImagemDestaqueExecute(Sender: TObject);
    procedure actIncluirCursoExecute(Sender: TObject);
    procedure actAlterarCursoExecute(Sender: TObject);
    procedure actExcluirCursoExecute(Sender: TObject);
    procedure actGravarCursoExecute(Sender: TObject);
    procedure actIncluirModuloExecute(Sender: TObject);
    procedure actAlterarModuloExecute(Sender: TObject);
    procedure actExcluirModuloExecute(Sender: TObject);
    procedure actGravarModuloExecute(Sender: TObject);
    procedure actIncluirAulaExecute(Sender: TObject);
    procedure actAlterarAulaExecute(Sender: TObject);
    procedure actExcluirAulaExecute(Sender: TObject);
    procedure actGravarAulaExecute(Sender: TObject);
    procedure actIncluirAnexoExecute(Sender: TObject);
    procedure actAlterarAnexoExecute(Sender: TObject);
    procedure actExcluirAnexoExecute(Sender: TObject);
    procedure actGravarAnexoExecute(Sender: TObject);
    procedure actCarregarConteudoHtmlExecute(Sender: TObject);
    procedure actCarregarFotoUsuarioExecute(Sender: TObject);
    procedure actCarregarImagemBannerExecute(Sender: TObject);
    procedure actCarregarVideosVimeoExecute(Sender: TObject);
    procedure RESTRequestHTTPProtocolError(Sender: TCustomRESTRequest);
    procedure tblCursosCalcFields(DataSet: TDataSet);
    procedure tblModulosCalcFields(DataSet: TDataSet);
    procedure actCarregarConteudoHtmlCertificadoExecute(Sender: TObject);
    procedure actCarregarConteudoHtmlProvaExecute(Sender: TObject);
    procedure tblProfessoresAfterInsert(DataSet: TDataSet);
    procedure actIncluirProfessorExecute(Sender: TObject);
    procedure actExcluirProfessorExecute(Sender: TObject);
    procedure actCarregarFotoProfessorExecute(Sender: TObject);
    procedure actCarregarImagemChamadaCursoExecute(Sender: TObject);
    procedure actCarregarImagemMiniaturaCursoExecute(Sender: TObject);
    procedure actCarregarConteudoHtmlProfessorExecute(Sender: TObject);
    procedure actVincularProfessoresCursoExecute(Sender: TObject);
    procedure tblUsersAfterPost(DataSet: TDataSet);
    procedure tblCursosAfterScroll(DataSet: TDataSet);
    procedure tblModulosAfterScroll(DataSet: TDataSet);
    procedure tblModulosAfterPost(DataSet: TDataSet);
    procedure tblAulasAfterPost(DataSet: TDataSet);
    procedure actExcluirAlunosExecute(Sender: TObject);
    procedure actIncluirAlunosExecute(Sender: TObject);
    procedure tblAlunosAfterInsert(DataSet: TDataSet);
    procedure actCarregarApostilaExecute(Sender: TObject);
    procedure actCarregarAudioExecute(Sender: TObject);
    procedure actAlterarAlunosExecute(Sender: TObject);
    procedure actGravarAlunosExecute(Sender: TObject);
    procedure tblAlunosCalcFields(DataSet: TDataSet);
    procedure tblProfessoresCalcFields(DataSet: TDataSet);
    procedure tblUsersCalcFields(DataSet: TDataSet);
    procedure actCarregarFotoAlunoExecute(Sender: TObject);
    procedure tblAulasCalcFields(DataSet: TDataSet);
    procedure cdsProfessoresCursoCalcFields(DataSet: TDataSet);
    procedure tblTrilhasCalcFields(DataSet: TDataSet);
    procedure tblTrilhasAfterInsert(DataSet: TDataSet);
    procedure actExcluirTrilhasExecute(Sender: TObject);
    procedure actExcluirCursosTrilhasExecute(Sender: TObject);
    procedure actIncluirTrilhaExecute(Sender: TObject);
    procedure actIncluirCursosTrilhaExecute(Sender: TObject);
    procedure tblCursosTrilhasAfterInsert(DataSet: TDataSet);
    procedure cdsCursosTrilhasCalcFields(DataSet: TDataSet);
    procedure tblTrilhasAfterScroll(DataSet: TDataSet);
    procedure tblTrilhasFixasCalcFields(DataSet: TDataSet);
    procedure actExcluirTrilhasFixasExecute(Sender: TObject);
    procedure actIncluirTrilhaFixaExecute(Sender: TObject);
    procedure cdsTrilhasFixasCalcFields(DataSet: TDataSet);
  private
    FServicos: IServicos;
    FLogin: string;
    FSenha: string;
    FUsuarioAdministrador: boolean;
    FErroAoProcessarApiVimeo: Boolean;
    FCarregandoVideo: TCarregarVideoAulaVimeo;
    FImagemUsuarioLogado: String;
    FID_Usuario_Logado: Integer;
    FUploadApostila: TUploadApostila;
    FUploadFotoAlunoUser: TUploadFotoAlunoUser;

    procedure SetMobile;
    procedure SetDesktop;
    procedure ProcessarResponse;
    procedure ResetRequest;

    procedure DCallBackExcluirCurso(Sender: TComponent; Res: Integer);
    procedure DCallBackExcluirAula(Sender: TComponent; Res: Integer);
    procedure DCallBackExcluirUsuarios(Sender: TComponent; Res: Integer);
    procedure DCallBackExcluirModulo(Sender: TComponent; Res: Integer);
    procedure DCallBackExcluirProfessor(Sender: TComponent; Res: Integer);
    procedure DCallBackExcluirAluno(Sender: TComponent; Res: Integer);
    procedure DCallBackExcluirTrilha(Sender: TComponent; Res: Integer);
    procedure DCallBackExcluirTrilhaFixa(Sender: TComponent; Res: Integer);
    procedure AtualizarImagemUsuarioLogado;

    procedure ReordenarTrilhasFixas(const PosicaoExcluida: Integer);
    procedure ReordenarCursosTrilhas(const IdTrilha, PosicaoExcluida: Integer);
  public
    function Login(aUsername, aPassword: string; aDesktop: Boolean; var Msg: String): Boolean;

    procedure OnCreateCadastroUsuarios(Sender: TObject);
    procedure OnDestroyCadastroUsuarios(Sender: TObject);
    procedure OnCreateCursos(Sender: TObject);
    procedure OnDestroyCursos(Sender: TObject);
    procedure OnCreateAlunos(Sender: TObject);
    procedure OnDestroyAlunos(Sender: TObject);
    procedure OnCreateCadastroProfessores(Sender: TObject);
    procedure OnDestroyCadastroProfessores(Sender: TObject);
    procedure OnCreateTrilhas(Sender: TObject);
    procedure OnDestroyTrilhas(Sender: TObject);
    procedure OnCreateTrilhasFixas(Sender: TObject);
    procedure OnDestroyTrilhasFixas(Sender: TObject);

    procedure OnCreateVideosVimeo(Sender: TObject);
    procedure OnDestroyVideosVimeo(Sender: TObject);

    procedure OrdenarCursosPor(const NomeColuna: String; const ForcarOrderAsc: Boolean = False);
    procedure OrdenarModulosPor(const NomeColuna: String);
    procedure OrdenarAulasPor(const NomeColuna: String);
    procedure OrdenarUsuariosPor(const NomeColuna: String);
    procedure OrdenarProfessoresPor(const NomeColuna: String);
    procedure OrdenarAlunosPor(const NomeColuna: String; const FiltroExtr: String = '');
    procedure OrdenarTrilhasPor(const NomeColuna: String);
    procedure OrdenarTrilhasCursoPor(const NomeColuna: String);
    procedure OrdenarTrilhasFixasPor(const NomeColuna: String);

    function SalvarImagemCapa(Image: TUniImage; CodigoCurso: Integer; FileName: String): String;
    function SalvarImagemDestaque(Image: TUniImage; CodigoCurso: Integer; FileName: String): String;
    function SalvarImagemMiniaturaCurso(Image: TUniImage; CodigoCurso: Integer; FileName: String): String;
    function SalvarImagemChamadaCurso(Image: TUniImage; CodigoCurso: Integer; FileName: String): String;
    function SalvarImagemBanner(Image: TUniImage; CodigoAula: Integer; FileName: String): String;
    function SalvarVideoDaAula(VideoStream: TFileStream; CodigoAula: Integer; FileName: String): String;
    function SalvarMidiaAnexos(MidiaStream: TFileStream; CodigoAnexo: Integer; FileName: String): String;
    function SalvarApostilaModulo(MidiaStream: TFileStream; CodigoAnexo: Integer; FileName: String): String;
    function SalvarApostilaAula(MidiaStream: TFileStream; CodigoAnexo: Integer; FileName: String): String;
    function SalvarImagemFotoUsuario(Image: TUniImage; CodigoUsuario: Integer; FileName: String): String;
    function SalvarImagemFotoAluno(Image: TUniImage; CodigoAluno: Integer; FileName: String): String;
    function SalvarImagemFotoProfessor(Image: TUniImage; CodigoProfessor: Integer; FileName: String): String;
    function SalvarMidiaAudio(MidiaStream: TFileStream; CodigoAula: Integer; FileName: String): String;

    procedure ObterListaVideosVimeo(ProgressBar: TUniProgressBar);
    procedure SetTipoCarregarVideoAula;
    procedure SetTipoCarregarVideoChamada;
    procedure SetTipoCarregarFotoAluno;
    procedure CarregarProfessoresCurso;
    procedure SalvarProfessoresCurso;
    procedure SetApostilaModulo;
    procedure SetApostilaAula;
    procedure SetMaskEditUniControl(Ed: TUniControl; MaskStr: String);
    procedure CarregarCursosTrilhas;
    procedure SalvarCursosTrilhas;
    procedure CarregarTrilhasFixas;
    procedure SalvarTrilhasFixas;

    procedure DiminuirOrdemModulo(const IdCurso, PosicaoAtual: Integer);
    procedure AumentarOrdemModulo(const IdCurso, PosicaoAtual: Integer);
    procedure DiminuirOrdemAula(const IdModulo, PosicaoAtual: Integer);
    procedure AumentarOrdemAula(const IdModulo, PosicaoAtual: Integer);

    procedure DiminuirOrdemCursoTrilha(const IdTrilha, PosicaoAtual: Integer);
    procedure AumentarOrdemCursoTrilha(const IdTrilha, PosicaoAtual: Integer);

    procedure DiminuirOrdemCursoTrilhaFixa(PosicaoAtual: Integer);
    procedure AumentarOrdemCursoTrilhaFixa(PosicaoAtual: Integer);

    property UsuarioAdministrador: Boolean read FUsuarioAdministrador;
    property ImagemUsuarioLogado: String read FImagemUsuarioLogado;
    property CarregandoVideo: TCarregarVideoAulaVimeo read FCarregandoVideo;
    property UploadApostila: TUploadApostila read FUploadApostila;
    property UploadFotoAlunoUser: TUploadFotoAlunoUser read FUploadFotoAlunoUser;
  end;

function UniMainModule: TUniMainModule;

const
  _IMAGEM_ON = 'imagem_on.png';
  _IMAGEM_OFF = 'imagem_off.png';
  _IMAGEM_DESTAQ_ON = 'imagem_destaque.png';
  _DOCUMENTO_ON = 'documento_on.png';
  _DOCUMENTO_OFF = 'documento_off.png';
  _VIMEO_ON = 'vimeo_on.png';
  _VIMEO_OFF = 'vimeo_off.png';
  _AUDIO_ON = 'audio_on.png';
  _AUDIO_OFF = 'audio_off.png';
  _STATUS_ATIVO = 'status_ativo.png';
  _STATUS_INATIVO = 'status_inativo.png';
  _STATUS_LEAD = 'status_lead.png';
  _STATUS_CANCELADO = 'status_cancelado.png';
  _CHECK_MARCADO = 'checkbox_checked.png';
  _CHECK_DESMARCADO = 'checkbox_unchecked.png';

implementation

{$R *.dfm}

uses
  Variants,
  Windows,
  Forms,
  UniGUIVars, ServerModule, uniGUIApplication,
  Messages,
  uniGUIDialogs,
  dskServicos,
  mobServicos,
  DCarregarImagemCapaCurso,
  DCarregarImagemDestaqueCurso,
  DCarregarHtmlConteudoCurso,
  DCarregarImagemUsuario,
  DCarregarImagemBanner,
  DCarregarVideosVimeo,
  DCarregarHtmlCertificadoCurso,
  DCarregarHtmlProvaCurso,
  DCarregarImagemProfessor,
  DCarregarImagemMiniaturaCurso,
  DCarregarImagemChamadaCurso,
  DCarregarHtmlProfessor,
  DVincularProfessoresCurso,
  Main,
  DCarregarApostilaAula,
  DCarregarAudio,
  DVincularCursosTrilhas,
  DVincularCursosTrilhasFixas;

const
  SNewMsgDlgConfirm = 'Confirmação';

var
  SQLCursos, SQLModulos, SQLAulas, SQLUsuarios, SQLProfessores, SQLAlunos, SQLTrilhas,
  SQLCursosTrilhas, SQLTrilhasFixas: String;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

{ TUniMainModule }

procedure TUniMainModule.UniGUIMainModuleCreate(Sender: TObject);
begin
  if not UniServerModule.ArquivoIniEncontrado then
    Application.MessageBox(PWideChar('Arquivo de configuração de banco de dados não encontrado!' + sLineBreak + sLineBreak +
      UniServerModule.ArquivoIni), 'Banco de dados', MB_OK + MB_ICONWARNING);

  SQLCursos := tblCursos.SQL.Text;
  SQLModulos := tblModulos.SQL.Text;
  SQLAulas := tblAulas.SQL.Text;
  SQLUsuarios := tblUsers.SQL.Text;
  SQLProfessores := tblProfessores.SQL.Text;
  SQLAlunos := tblAlunos.SQL.Text;
  SQLTrilhas := tblTrilhas.SQL.Text;
  SQLCursosTrilhas := tblCursosTrilhas.SQL.Text;
  SQLTrilhasFixas := tblTrilhasFixas.SQL.Text;

  Conn.Close;
  Conn.Params.Database := UniServerModule.Database;
  Conn.Params.DriverID := UniServerModule.DriverID;
  Conn.Params.UserName := UniServerModule.User_Name;
  Conn.Params.Password := UniServerModule.Password;
  Conn.Params.Values['Server'] := UniServerModule.Server;
  Conn.Open;

  //cdsVideosVimeo.CreateDataSet;
  cdsProfessoresCurso.CreateDataSet;
  cdsCursosTrilhas.CreateDataSet;
  cdsTrilhasFixas.CreateDataSet;
end;

procedure TUniMainModule.UniGUIMainModuleDestroy(Sender: TObject);
begin
  Conn.Close;
end;

function TUniMainModule.Login(aUsername, aPassword: string; aDesktop: Boolean; var Msg: String): Boolean;
var
  UserFound: Boolean;
  IsAdmin: Boolean;
  Sql: String;
begin
  Result := False;

  Sql := Format(
          'SELECT USU_ID, USU_ADMIN, USU_FOTO FROM USUARIOS ' +
          ' WHERE USU_LOGIN = ''%s'' AND USU_SENHA = ''%s'' ' +
          'AND FG_EXCLUIDO = 0 AND ID_EMPRESA = ' + Integer(1).ToString,
          [aUserName, aPassword]);

  QryAux.Close;
  QryAux.Open(Sql);
  try
    UserFound := not QryAux.IsEmpty;

    IsAdmin := QryAux.FieldByName('USU_ADMIN').AsBoolean;
    FImagemUsuarioLogado := Trim(QryAux.FieldByName('USU_FOTO').AsString);
    FID_Usuario_Logado := QryAux.FieldByName('USU_ID').AsInteger;

    if not UserFound then
      Msg := 'Dados do login inválidos!'
    else
    begin
      FLogin := aUsername;
      FSenha := aPassword;

      FUsuarioAdministrador := IsAdmin;

      if aDesktop then
        SetDesktop
      else
        SetMobile;

      Result := True;
    end;
  finally
    QryAux.Close;
  end;
end;

function TUniMainModule.SalvarImagemBanner(Image: TUniImage; CodigoAula: Integer; FileName: String): String;
begin
  Result := UniServerModule.PastaFiles + '_Banner_Aula_' + CodigoAula.ToString + '_' + FileName;
  Image.Picture.SaveToFile(Result);
end;

function TUniMainModule.SalvarImagemCapa(Image: TUniImage; CodigoCurso: Integer; FileName: String): String;
begin
  Result := UniServerModule.PastaFiles + '_CapaCurso_' + CodigoCurso.ToString + '_' + FileName;
  Image.Picture.SaveToFile(Result);
end;

function TUniMainModule.SalvarImagemChamadaCurso(Image: TUniImage; CodigoCurso: Integer;
  FileName: String): String;
begin
  Result := UniServerModule.PastaFiles + '_ChamadaCurso_' + CodigoCurso.ToString + '_' + FileName;
  Image.Picture.SaveToFile(Result);
end;

function TUniMainModule.SalvarImagemDestaque(Image: TUniImage; CodigoCurso: Integer; FileName: String): String;
begin
  Result := UniServerModule.PastaFiles + '_DestaqueCurso_' + CodigoCurso.ToString + '_' + FileName;
  Image.Picture.SaveToFile(Result);
end;

function TUniMainModule.SalvarImagemFotoAluno(Image: TUniImage; CodigoAluno: Integer;
  FileName: String): String;
begin
  Result := UniServerModule.PastaFiles + '_FotoAluno_' + CodigoAluno.ToString + '_' + FileName;
  Image.Picture.SaveToFile(Result);
end;

function TUniMainModule.SalvarImagemFotoProfessor(Image: TUniImage; CodigoProfessor: Integer;
  FileName: String): String;
begin
  Result := UniServerModule.PastaFiles + '_FotoProfessor_' + CodigoProfessor.ToString + '_' + FileName;
  Image.Picture.SaveToFile(Result);
end;

function TUniMainModule.SalvarImagemFotoUsuario(Image: TUniImage; CodigoUsuario: Integer;  FileName: String): String;
begin
  Result := UniServerModule.PastaFiles + '_FotoUsuario_' + CodigoUsuario.ToString + '_' + FileName;
  Image.Picture.SaveToFile(Result);
end;

function TUniMainModule.SalvarImagemMiniaturaCurso(Image: TUniImage; CodigoCurso: Integer;
  FileName: String): String;
begin
  Result := UniServerModule.PastaFiles + '_MiniaturaCurso_' + CodigoCurso.ToString + '_' + FileName;
  Image.Picture.SaveToFile(Result);
end;

function TUniMainModule.SalvarVideoDaAula(VideoStream: TFileStream; CodigoAula: Integer; FileName: String): String;
var
  Arquivo: TFileStream;
begin
  Result := UniServerModule.PastaFiles + '_Aula_' + CodigoAula.ToString + '_' + FileName;

  if FileExists(Result) then
    DeleteFile(PWideChar(Result));

  Arquivo := TFileStream.Create(Result, fmCreate or fmOpenWrite);
  Arquivo.CopyFrom(VideoStream, VideoStream.Size);
  Arquivo.Free;
end;

function TUniMainModule.SalvarMidiaAnexos(MidiaStream: TFileStream; CodigoAnexo: Integer; FileName: String): String;
var
  Arquivo: TFileStream;
begin
  Result := UniServerModule.PastaFiles + '_Apostila_Aula_' + CodigoAnexo.ToString + '_' + FileName;

  if FileExists(Result) then
    DeleteFile(PWideChar(Result));

  Arquivo := TFileStream.Create(Result, fmCreate or fmOpenWrite);
  Arquivo.CopyFrom(MidiaStream, MidiaStream.Size);
  Arquivo.Free;
end;

function TUniMainModule.SalvarApostilaAula(MidiaStream: TFileStream; CodigoAnexo: Integer;
  FileName: String): String;
var
  Arquivo: TFileStream;
  aResult: String;
begin
  Result := UniServerModule.PastaFiles + '_Apostila_Aula_' + CodigoAnexo.ToString + '_' + FileName;
  aResult := '/files/' + '_Apostila_Aula_' + CodigoAnexo.ToString + '_' + FileName;

  if FileExists(Result) then
    DeleteFile(PWideChar(Result));

  Arquivo := TFileStream.Create(Result, fmCreate or fmOpenWrite);
  Arquivo.CopyFrom(MidiaStream, MidiaStream.Size);
  Arquivo.Free;

  Result := aResult;
end;

function TUniMainModule.SalvarApostilaModulo(MidiaStream: TFileStream; CodigoAnexo: Integer; FileName: String): String;
var
  Arquivo: TFileStream;
  aResult: String;
begin
  Result := UniServerModule.PastaFiles + '_Apostila_Modulo_' + CodigoAnexo.ToString + '_' + FileName;
  aResult := '/files/' + '_Apostila_Modulo_' + CodigoAnexo.ToString + '_' + FileName;

  if FileExists(Result) then
    DeleteFile(PWideChar(Result));

  Arquivo := TFileStream.Create(Result, fmCreate or fmOpenWrite);
  Arquivo.CopyFrom(MidiaStream, MidiaStream.Size);
  Arquivo.Free;

  Result := aResult;
end;

procedure TUniMainModule.SalvarCursosTrilhas;
var
  SInsert, SDelete: String;
  CursoCadastrado,
  Posicao: Variant;
  IdTrilha, PosicaoExcluida: Integer;
begin
  if (tblTrilhas.Active) and (tblTrilhasTRI_ID.AsInteger > 0) then
  begin
    QryAux.Close;
    QryAux.SQL.Clear;

    SInsert := 'INSERT INTO TRILHAS_CURSOS (TRI_ID, CUR_ID, TRC_ORDEM_POSICAO) VALUES ' +
     '(' + tblTrilhasTRI_ID.AsInteger.ToString + ', :CUR_ID, :TRC_ORDEM_POSICAO)';
    SDelete := 'DELETE FROM TRILHAS_CURSOS WHERE CUR_ID = :CUR_ID AND TRI_ID = ' + tblTrilhasTRI_ID.AsInteger.ToString;

    if cdsCursosTrilhas.State in dsEditModes then
      cdsCursosTrilhas.Post;

    cdsCursosTrilhas.First;
    while not cdsCursosTrilhas.Eof do
    begin
      CursoCadastrado :=
            Conn.ExecSQLScalar
            (
                'SELECT' +
                '  COUNT(*) as TOT ' +
                'FROM' +
                '  TRILHAS_CURSOS ' +
                'WHERE '+
                '  TRI_ID = ' + tblTrilhasTRI_ID.AsInteger.ToString +
                '  AND ' +
                '  CUR_ID = ' + cdsCursosTrilhasCUR_ID.AsInteger.ToString
            );

      if VarIsNull(CursoCadastrado) then
        CursoCadastrado := 0;

      if CursoCadastrado > 0 then
      begin
        if not cdsCursosTrilhasMARCADO.AsBoolean then
        begin
          // Remove o curso desmarcado da trilha
          IdTrilha :=  tblTrilhasTRI_ID.AsInteger;
          PosicaoExcluida := cdsCursosTrilhasTRC_ORDEM_POSICAO.AsInteger;

          QryAux.SQL.Text := SDelete;
          QryAux.ParamByName('CUR_ID').AsInteger := cdsCursosTrilhasCUR_ID.AsInteger;
          QryAux.ExecSQL;

          ReordenarCursosTrilhas(IdTrilha, PosicaoExcluida);
        end;
      end
      else
      begin
        if cdsCursosTrilhasMARCADO.AsBoolean then
        begin
          /// Pega o proximo numero de posição do curso
          Posicao :=
              Conn.ExecSQLScalar
              (
                  'SELECT' +
                  '  MAX(TRC_ORDEM_POSICAO) ' +
                  'FROM' +
                  '  TRILHAS_CURSOS ' +
                  'WHERE  ' +
                  '  TRI_ID = ' + tblTrilhasTRI_ID.AsInteger.ToString
              );

            if VarIsNull(Posicao) then
              Posicao := 0;

          /// Insere novo registro do curso na trilha
          QryAux.SQL.Text := SInsert;
          QryAux.ParamByName('CUR_ID').AsInteger := cdsCursosTrilhasCUR_ID.AsInteger;
          QryAux.ParamByName('TRC_ORDEM_POSICAO').AsInteger := Posicao+1;
          QryAux.ExecSQL;
        end;
      end;

      cdsCursosTrilhas.Next;
    end;
    tblTrilhas.Refresh;
    OrdenarTrilhasCursoPor('TRC_ORDEM_POSICAO');
  end;
end;
function TUniMainModule.SalvarMidiaAudio(MidiaStream: TFileStream; CodigoAula: Integer;
  FileName: String): String;
var
  Arquivo: TFileStream;
  aResult: String;
begin
  Result := UniServerModule.PastaFiles + 'audios\_Audio_Aula_' + CodigoAula.ToString + '_' + FileName;

  if not DirectoryExists(UniServerModule.PastaFiles + 'audios') then
    ForceDirectories(UniServerModule.PastaFiles + 'audios');

  aResult := '/files/audios/' + '_Audio_Aula_' + CodigoAula.ToString + '_' + FileName;

  if FileExists(Result) then
    DeleteFile(PWideChar(Result));

  Arquivo := TFileStream.Create(Result, fmCreate or fmOpenWrite);
  Arquivo.CopyFrom(MidiaStream, MidiaStream.Size);
  Arquivo.Free;

  Result := aResult;
end;

procedure TUniMainModule.SalvarProfessoresCurso;
begin
  if (tblCursos.Active) and (tblCursosCUR_ID.AsInteger > 0) then
  begin
    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add('DELETE FROM CURSOS_PROFESSORES WHERE CUR_ID = ' + tblCursosCUR_ID.AsInteger.ToString);
    QryAux.ExecSQL;

    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add('INSERT INTO CURSOS_PROFESSORES VALUES ' +
      '(' + tblCursosCUR_ID.AsInteger.ToString + ', :PRO_ID)');

    if cdsProfessoresCurso.State in dsEditModes then
      cdsProfessoresCurso.Post;

    cdsProfessoresCurso.First;
    while not cdsProfessoresCurso.Eof do
    begin
      if cdsProfessoresCursoMARCADO.AsBoolean then
      begin
        QryAux.ParamByName('PRO_ID').AsInteger := cdsProfessoresCursoPRO_ID.AsInteger;
        QryAux.ExecSQL;
      end;

      cdsProfessoresCurso.Next;
    end;
    tblCursos.Refresh;
  end;
end;

procedure TUniMainModule.SalvarTrilhasFixas;
var
  Posicao, Id: Variant;
begin
  QryAux.Close;
  QryAux.SQL.Text := 'INSERT INTO TRILHAS_FIXAS (TRF_ID, TRF_ORDEM_POSICAO, TRI_ID, ID_EMPRESA, FG_EXCLUIDO) ' +
    'VALUES (:TRF_ID, :TRF_ORDEM_POSICAO, :TRI_ID, :ID_EMPRESA, :FG_EXCLUIDO)';

  if cdsTrilhasFixas.State in dsEditModes then
    cdsTrilhasFixas.Post;

  cdsTrilhasFixas.First;
  while not cdsTrilhasFixas.Eof do
  begin
    if cdsTrilhasFixasMARCADO.AsBoolean then
      begin
        Id :=
            Conn.ExecSQLScalar
            (
              'SELECT' +
              '  MAX(TRF_ID) ' +
              'FROM' +
              '  TRILHAS_FIXAS '
            );

        if VarIsNull(Id) then
          Id:= 0;

        Posicao :=
              Conn.ExecSQLScalar
              (
                  'SELECT' +
                  '  MAX(TRF_ORDEM_POSICAO) ' +
                  'FROM' +
                  '  TRILHAS_FIXAS ' +
                  'WHERE ' +
                  '  ID_EMPRESA = 1 AND FG_EXCLUIDO = 0 '
              );

        if VarIsNull(Posicao) then
          Posicao := 0;

        QryAux.ParamByName('TRF_ID').AsInteger := Id+1;
        QryAux.ParamByName('TRF_ORDEM_POSICAO').AsInteger := Posicao+1;
        QryAux.ParamByName('TRI_ID').AsInteger := cdsTrilhasFixasTRI_ID.AsInteger;
        QryAux.ParamByName('ID_EMPRESA').AsInteger := 1;
        QryAux.ParamByName('FG_EXCLUIDO').AsBoolean := False;
        QryAux.ExecSQL;
      end;
     cdsTrilhasFixas.Next;
  end;
  OrdenarTrilhasFixasPor('TRF_ORDEM_POSICAO');
end;

procedure TUniMainModule.SetApostilaAula;
begin
  FUploadApostila := tpApostilaAula;
end;

procedure TUniMainModule.SetApostilaModulo;
begin
  FUploadApostila := tpApostilaModulo;
end;

procedure TUniMainModule.SetDesktop;
begin
  FServicos := TDServicos.Create;
end;

procedure TUniMainModule.SetMaskEditUniControl(Ed: TUniControl; MaskStr: String);
begin
  //if WebMode then
  //begin
    // to version 0.90 UniGui...
    UniSession.AddJS
      (Format('jQuery(function(){jQuery("#%s_id-inputEl").mask("%s");});',
      [Ed.JSName, MaskStr]));
  //end;
end;

procedure TUniMainModule.SetMobile;
begin
  FServicos := TMServicos.Create;
end;

procedure TUniMainModule.SetTipoCarregarFotoAluno;
begin
  FUploadFotoAlunoUser := tpFotoAluno;
end;

procedure TUniMainModule.SetTipoCarregarVideoAula;
begin
  FCarregandoVideo := cvVideoAula;
end;

procedure TUniMainModule.SetTipoCarregarVideoChamada;
begin
  FCarregandoVideo := cvVideoChamada;
end;

procedure TUniMainModule.tblAlunosAfterInsert(DataSet: TDataSet);
var
  Id: Variant;
begin
  Id :=
    Conn.ExecSQLScalar
    (
        'SELECT' +
        '  MAX(ALU_ID) ' +
        'FROM' +
        '  ALUNOS '
    );

  if VarIsNull(Id) then
    Id := 0;

  tblAlunosALU_ID.AsInteger :=  Id + 1;
  tblAlunosALU_DATA_CADASTRO.AsDateTime := Now;
  tblAlunosALU_ATIVO.AsBoolean := True;
  tblAlunosID_EMPRESA.AsInteger := 1;
  tblAlunosFG_EXCLUIDO.AsBoolean := False;
  tblAlunosALU_STATUS.AsString := 'ATIVO';
end;

procedure TUniMainModule.tblAlunosCalcFields(DataSet: TDataSet);
begin
  if (Trim(tblAlunosALU_FOTO.AsString) <> '') and FileExists(tblAlunosALU_FOTO.AsString)  then
    tblAlunosCC_FOTO.Value := '<img style="border-radius: 50%;" width=32 height=32 src="files/' + ExtractFileName(tblAlunosALU_FOTO.AsString) + '"/>'
  else
    tblAlunosCC_FOTO.Value := '<img style="border-radius: 50%;" width=32 height=32 src="files/sem-foto.png"/>';

  /// Status
  if (tblAlunosALU_STATUS.AsString = 'ATIVO') then
    tblAlunosCC_STATUS.AsString := '<img style="height: auto;" width=80 height=32 src="files/' + _STATUS_ATIVO + '"/>'
  else
  if (tblAlunosALU_STATUS.AsString = 'INATIVO') then
    tblAlunosCC_STATUS.AsString := '<img style="height: auto;" width=80 height=32 src="files/' + _STATUS_INATIVO + '"/>'
  else
  if (tblAlunosALU_STATUS.AsString = 'LEAD') then
    tblAlunosCC_STATUS.AsString := '<img style="height: auto;" width=80 height=32 src="files/' + _STATUS_LEAD + '"/>'
  else
    tblAlunosCC_STATUS.AsString := '<img style="height: auto;" width=80 height=32 src="files/' + _STATUS_CANCELADO + '"/>';
end;

procedure TUniMainModule.tblAnexosAfterInsert(DataSet: TDataSet);
var
  Id: Variant;
begin
  Id :=
    Conn.ExecSQLScalar
    (
        'SELECT' +
        '  MAX(ANX_ID) ' +
        'FROM' +
        '  AULAS_ANEXOS '
    );

  if VarIsNull(Id) then
    Id:= 0;

   tblAnexosANX_ID.AsInteger :=  Id+1;
end;

procedure TUniMainModule.tblAulasAfterInsert(DataSet: TDataSet);
var
  Id: Variant;
  Posicao: Variant;
begin
  Id :=
    Conn.ExecSQLScalar
    (
        'SELECT' +
        '  MAX(AUL_ID) ' +
        'FROM' +
        '  AULAS_MODULOS '
    );

  Posicao :=
    Conn.ExecSQLScalar
    (
        'SELECT' +
        '  MAX(AUL_ORDEM_POSICAO) ' +
        'FROM' +
        '  AULAS_MODULOS ' +
        'WHERE  ' +
        '  MOD_ID = ' + tblModulosMOD_ID.AsInteger.ToString +
        ' AND ID_EMPRESA = 1 AND FG_EXCLUIDO = 0 '

    );

  if VarIsNull(Id) then
    Id := 0;

  if VarIsNull(Posicao) then
    Posicao := 0;

  tblAulasMOD_ID.AsInteger := tblModulosMOD_ID.AsInteger;
  tblAulasAUL_ID.AsInteger := Id+1;
  tblAulasAUL_DATA_CADASTRO.AsDateTime := Now;
  tblAulasID_EMPRESA.AsInteger := 1;
  tblAulasFG_EXCLUIDO.AsBoolean := False;
  tblAulasAUL_ORDEM_POSICAO.AsInteger := Posicao+1;
end;

procedure TUniMainModule.tblAulasAfterPost(DataSet: TDataSet);
begin
  tblModulosCalcFields(tblModulos);
  OrdenarAulasPor('AUL_ORDEM_POSICAO');
end;

procedure TUniMainModule.tblAulasCalcFields(DataSet: TDataSet);
var
  sFileApostila: String;
  sFileAudio: String;
begin
 /// Video
  if (tblAulasAUL_ID_VIDEO_VIMEO.AsString <> '') then
    tblAulasCC_VIDEO.AsString := '<img style="height: auto;" width=32 height=32 src="files/' + _VIMEO_ON + '"/>'
  else
    tblAulasCC_VIDEO.AsString := '<img style="height: auto;" width=32 height=32 src="files/' + _VIMEO_OFF + '"/>';

 /// Imagem banner
  if (tblAulasAUL_IMG_BANNER.AsString <> '') and (FileExists(tblAulasAUL_IMG_BANNER.AsString)) then
    tblAulasCC_IMG_BANNER.AsString := '<img style="height: auto;" width=32 height=32 src="files/' + _IMAGEM_ON + '"/>'
  else
    tblAulasCC_IMG_BANNER.AsString := '<img style="height: auto;" width=32 height=32 src="files/' + _IMAGEM_OFF + '"/>';

  /// Apostila da aula
  sFileApostila := StringReplace(tblAulasAUL_FILE_APOSTILA.AsString, '/files/' , UniServerModule.PastaFiles, [rfIgnoreCase]);
  if (tblAulasAUL_FILE_APOSTILA.AsString <> '') and FileExists(sFileApostila) then
    tblAulasCC_FILE_APOSTILA.AsString := '<img style="width: auto;" width=32 height=32 src="files/' + _DOCUMENTO_ON + '"/>'
  else
    tblAulasCC_FILE_APOSTILA.AsString := '<img style="width: auto;" width=32 height=32 src="files/' + _DOCUMENTO_OFF + '"/>';

  /// Audio da aula
  sFileAudio := StringReplace(tblAulasAUL_FILE_AUDIO.AsString, '/files/' , UniServerModule.PastaFiles, [rfIgnoreCase]);
  if (tblAulasAUL_FILE_AUDIO.AsString <> '') and FileExists(sFileAudio) then
    tblAulasCC_FILE_AUDIO.AsString := '<img style="width: auto;" width=32 height=32 src="files/' + _AUDIO_ON + '"/>'
  else
    tblAulasCC_FILE_AUDIO.AsString := '<img style="width: auto;" width=32 height=32 src="files/' + _AUDIO_OFF + '"/>';

  /// Prova
  if (tblAulasAUL_PROVA_HTML.AsString <> '') then
    tblAulasCC_PROVA_HTML.AsString := '<img style="width: auto;" width=32 height=32 src="files/' + _DOCUMENTO_ON + '"/>'
  else
    tblAulasCC_PROVA_HTML.AsString := '<img style="width: auto;" width=32 height=32 src="files/' + _DOCUMENTO_OFF + '"/>';

  /// Permite antecipar
  if (tblAulasAUL_PERMITE_ANTECIPAR.AsBoolean) then
    tblAulasCC_PERMITE_ANTECIPAR.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    tblAulasCC_PERMITE_ANTECIPAR.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';

  /// Em criacao
  if (tblAulasAUL_EM_CRIACAO.AsBoolean) then
    tblAulasCC_EM_CRIACAO.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    tblAulasCC_EM_CRIACAO.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';

  /// Gratis
  if (tblAulasAUL_GRATIS.AsBoolean) then
    tblAulasCC_GRATIS.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    tblAulasCC_GRATIS.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';
end;

procedure TUniMainModule.tblCursosAfterInsert(DataSet: TDataSet);
var
  Id: Variant;
begin
  Id :=
    Conn.ExecSQLScalar
    (
      'SELECT' +
      '  MAX(CUR_ID) ' +
      'FROM' +
      '  CURSOS '
    );

  if VarIsNull(Id) then
    Id:= 0;

  tblCursosCUR_ID.AsInteger := Id+1;
  tblCursosCUR_DATA_CADASTRO.AsDateTime := Now;
  tblCursosCUR_ATIVO.AsBoolean := True;
  tblCursosID_EMPRESA.AsInteger := 1;
  tblCursosFG_EXCLUIDO.AsBoolean := False;
end;

procedure TUniMainModule.tblCursosAfterScroll(DataSet: TDataSet);
begin
  if tblModulos.State in dsEditModes then
    tblModulos.Post;

  /// Filtra Modulos
  tblModulos.ParamByName('ID_EMPRESA').AsInteger := 1;
  tblModulos.ParamByName('CUR_ID').AsInteger := tblCursosCUR_ID.AsInteger;
  OrdenarModulosPor('MOD_ORDEM_POSICAO');
end;

procedure TUniMainModule.tblCursosCalcFields(DataSet: TDataSet);
var
  vTotMod: Variant;
  vTotProf: Variant;
begin
  vTotMod :=
    Conn.ExecSQLScalar
    (
        'SELECT' +
        '  COUNT(MOD_ID) ' +
        'FROM' +
        '  MODULOS ' +
        'WHERE FG_EXCLUIDO = 0 ' +
        '  AND CUR_ID = ' + tblCursosCUR_ID.AsInteger.ToString
    );

  if VarIsNull(vTotMod) then
    vTotMod:= 0;

  vTotProf :=
    Conn.ExecSQLScalar
    (
        'SELECT' +
        '  COUNT(PRO_ID) ' +
        'FROM' +
        '  CURSOS_PROFESSORES ' +
        'WHERE CUR_ID = ' + tblCursosCUR_ID.AsInteger.ToString
    );

  if VarIsNull(vTotProf) then
    vTotProf:= 0;

  if tblCursos.State = dsBrowse then
    tblCursos.Edit;

  tblCursosCC_TOTAL_MODULOS.AsInteger := vTotMod;
  tblCursosCC_TOTAL_PROFESSORES.AsInteger := vTotProf;

  /// Imagem capa
  if (tblCursosCUR_IMG_CAPA.AsString <> '') and (FileExists(tblCursosCUR_IMG_CAPA.AsString)) then
    tblCursosCC_IMAGEM_CAPA.AsString := '<img style="height: auto;" width=32 height=32 src="files/' + _IMAGEM_ON + '"/>'
  else
    tblCursosCC_IMAGEM_CAPA.AsString := '<img style="height: auto;" width=32 height=32 src="files/' + _IMAGEM_OFF + '"/>';

  /// Imagem Chamada
  if (tblCursosCUR_IMG_CHAMADA.AsString <> '') and (FileExists(tblCursosCUR_IMG_CHAMADA.AsString)) then
    tblCursosCC_IMAGEM_CHAMADA.AsString := '<img style="height: auto;" width=32 height=32 src="files/' + _IMAGEM_ON + '"/>'
  else
    tblCursosCC_IMAGEM_CHAMADA.AsString := '<img style="height: auto;" width=32 height=32 src="files/' + _IMAGEM_OFF + '"/>';

  /// Imagem Miniatura
  if (tblCursosCUR_IMG_MINIATURA.AsString <> '') and (FileExists(tblCursosCUR_IMG_MINIATURA.AsString)) then
    tblCursosCC_IMAGEM_MINIATURA.AsString := '<img style="height: auto;" width=32 height=32 src="files/' + _IMAGEM_ON + '"/>'
  else
    tblCursosCC_IMAGEM_MINIATURA.AsString := '<img style="height: auto;" width=32 height=32 src="files/' + _IMAGEM_OFF + '"/>';

  /// Imagem Destaque
  if (tblCursosCUR_IMG_DESTAQUE.AsString <> '') and (FileExists(tblCursosCUR_IMG_DESTAQUE.AsString)) then
    tblCursosCC_IMAGEM_DESTAQUE.AsString := '<img style="height: auto;" width=32 height=32 src="files/' + _IMAGEM_DESTAQ_ON + '"/>'
  else
    tblCursosCC_IMAGEM_DESTAQUE.AsString := '<img style="height: auto;" width=32 height=32 src="files/' + _IMAGEM_OFF + '"/>';

  /// Texto Html
  if (tblCursosCUR_CONTEUDO_HTML.AsString <> '') then
    tblCursosCC_TEXTO_HTML.AsString := '<img style="width: auto;" width=32 height=32 src="files/' + _DOCUMENTO_ON + '"/>'
  else
    tblCursosCC_TEXTO_HTML.AsString := '<img style="width: auto;" width=32 height=32 src="files/' + _DOCUMENTO_OFF + '"/>';

  /// Certificado Html
  if (tblCursosCUR_CERTIFICADO_HTML.AsString <> '') then
    tblCursosCC_CERTIFICADO_HTML.AsString := '<img style="width: auto;" width=32 height=32 src="files/' + _DOCUMENTO_ON + '"/>'
  else
    tblCursosCC_CERTIFICADO_HTML.AsString := '<img style="width: auto;" width=32 height=32 src="files/' + _DOCUMENTO_OFF + '"/>';

  /// Video Chamada
  if (tblCursosCUR_ID_VIDEO_VIMEO_CHAMADA.AsString <> '') then
    tblCursosCC_VIDEO_CHAMADA.AsString := '<img style="height: auto;" width=32 height=32 src="files/' + _VIMEO_ON + '"/>'
  else
    tblCursosCC_VIDEO_CHAMADA.AsString := '<img style="height: auto;" width=32 height=32 src="files/' + _VIMEO_OFF + '"/>';

  /// Prova
  if (tblCursosCUR_PROVA_HTML.AsString <> '') then
    tblCursosCC_PROVA_HTML.AsString := '<img style="width: auto;" width=32 height=32 src="files/' + _DOCUMENTO_ON + '"/>'
  else
    tblCursosCC_PROVA_HTML.AsString := '<img style="width: auto;" width=32 height=32 src="files/' + _DOCUMENTO_OFF + '"/>';

  /// Ativo
  if (tblCursosCUR_ATIVO.AsBoolean) then
    tblCursosCC_ATIVO.AsString := '<img style="height: auto;" width=80 height=32 src="files/' + _STATUS_ATIVO + '"/>'
  else
    tblCursosCC_ATIVO.AsString := '<img style="height: auto;" width=80 height=32 src="files/' + _STATUS_INATIVO + '"/>';

  /// Pago
  if (tblCursosCUR_PAGO.AsBoolean) then
    tblCursosCC_PAGO.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    tblCursosCC_PAGO.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';

  /// Destaque
  if (tblCursosCUR_DESTAQUE.AsBoolean) then
    tblCursosCC_DESTAQUE.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    tblCursosCC_DESTAQUE.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';

  /// Não listado
  if (tblCursosCUR_NAO_LISTADO.AsBoolean) then
    tblCursosCC_NA0_LISTADO.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    tblCursosCC_NA0_LISTADO.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';

  /// Em criação
  if (tblCursosCUR_EM_CRIACAO.AsBoolean) then
    tblCursosCC_EM_CRIACAO.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    tblCursosCC_EM_CRIACAO.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';

end;

procedure TUniMainModule.tblCursosTrilhasAfterInsert(DataSet: TDataSet);
var
  Posicao: Variant;
begin
  Posicao :=
    Conn.ExecSQLScalar
    (
        'SELECT' +
        '  MAX(TRC_ORDEM_POSICAO) ' +
        'FROM' +
        '  TRILHAS_CURSOS ' +
        'WHERE  ' +
        '  TRI_ID = ' + tblTrilhasTRI_ID.AsInteger.ToString
    );

  if VarIsNull(Posicao) then
    Posicao := 0;

  tblCursosTrilhasTRI_ID.AsInteger := tblTrilhasTRI_ID.AsInteger;
  tblCursosTrilhasTRC_ORDEM_POSICAO.AsInteger := Posicao+1;
end;

procedure TUniMainModule.tblModulosAfterInsert(DataSet: TDataSet);
var
  Id: Variant;
  Posicao: Variant;
begin
  Id :=
    Conn.ExecSQLScalar
    (
        'SELECT' +
        '  MAX(MOD_ID) ' +
        'FROM' +
        '  MODULOS '
    );

  Posicao :=
    Conn.ExecSQLScalar
    (
        'SELECT' +
        '  MAX(MOD_ORDEM_POSICAO) ' +
        'FROM' +
        '  MODULOS ' +
        'WHERE  ' +
        '  CUR_ID = ' + tblCursosCUR_ID.AsInteger.ToString +
        ' AND ID_EMPRESA = 1 AND FG_EXCLUIDO = 0 '

    );

  if VarIsNull(Id) then
    Id := 0;

  if VarIsNull(Posicao) then
    Posicao := 0;

  tblModulosCUR_ID.AsInteger := tblCursosCUR_ID.AsInteger;
  tblModulosMOD_ID.AsInteger := Id+1;
  tblModulosMOD_DATA_CADASTRO.AsDateTime := Now;
  tblModulosID_EMPRESA.AsInteger := 1;
  tblModulosFG_EXCLUIDO.AsBoolean := False;
  tblModulosMOD_ORDEM_POSICAO.AsInteger := Posicao+1;
end;

procedure TUniMainModule.tblModulosAfterPost(DataSet: TDataSet);
begin
  tblCursosCalcFields(tblCursos);
  OrdenarModulosPor('MOD_ORDEM_POSICAO');
end;

procedure TUniMainModule.tblModulosAfterScroll(DataSet: TDataSet);
begin
  if tblAulas.State in dsEditModes then
    tblAulas.Post;

  /// Filtra Modulos
  tblAulas.ParamByName('ID_EMPRESA').AsInteger := 1;
  tblAulas.ParamByName('MOD_ID').AsInteger := tblModulosMOD_ID.AsInteger;
  OrdenarAulasPor('AUL_ORDEM_POSICAO');
end;

procedure TUniMainModule.tblModulosCalcFields(DataSet: TDataSet);
var
  vTotAul: Variant;
  sFileApostila: String;
begin
  vTotAul := Conn.ExecSQLScalar
    (
        'SELECT' +
        '  COUNT(AUL_ID) ' +
        'FROM' +
        '  AULAS_MODULOS ' +
        'WHERE FG_EXCLUIDO = 0 ' +
        ' AND MOD_ID = ' + tblModulosMOD_ID.AsInteger.ToString
    );

  if VarIsNull(vTotAul) then
    vTotAul:= 0;

  if tblModulos.State = dsBrowse then
    tblModulos.Edit;

  tblModulosCC_TOTAL_AULAS.AsInteger := vTotAul;

  /// Apostila do modulo
  sFileApostila := StringReplace(tblModulosMOD_FILE_APOSTILA.AsString, '/files/' , UniServerModule.PastaFiles, [rfIgnoreCase]);
  if (tblModulosMOD_FILE_APOSTILA.AsString <> '') and FileExists(sFileApostila) then
    tblModulosCC_APOSTILA.AsString := '<img style="width: auto;" width=32 height=32 src="files/' + _DOCUMENTO_ON + '"/>'
  else
    tblModulosCC_APOSTILA.AsString := '<img style="width: auto;" width=32 height=32 src="files/' + _DOCUMENTO_OFF + '"/>';
end;

procedure TUniMainModule.tblProfessoresAfterInsert(DataSet: TDataSet);
var
  Id: Variant;
begin
  Id :=
    Conn.ExecSQLScalar
    (
        'SELECT' +
        '  MAX(PRO_ID) ' +
        'FROM' +
        '  PROFESSORES '
    );

  if VarIsNull(Id) then
    Id:= 0;

  tblProfessoresPRO_ID.AsInteger :=  Id+1;
  tblProfessoresPRO_DATA_CADASTRO.AsDateTime := Now;
  tblProfessoresPRO_ATIVO.AsBoolean := True;
  tblProfessoresID_EMPRESA.AsInteger := 1;
  tblProfessoresFG_EXCLUIDO.AsBoolean := False;
end;

procedure TUniMainModule.tblProfessoresCalcFields(DataSet: TDataSet);
begin
  if (Trim(tblProfessoresPRO_FOTO.AsString) <> '') and FileExists(tblProfessoresPRO_FOTO.AsString)  then
    tblProfessoresCC_FOTO.Value := '<img style="border-radius: 50%;" width=32 height=32 src="files/' + ExtractFileName(tblProfessoresPRO_FOTO.AsString) + '"/>'
  else
    tblProfessoresCC_FOTO.Value := '<img style="border-radius: 50%;" width=32 height=32 src="files/sem-foto.png"/>';

  /// Texto Html
  if (tblProfessoresPRO_HTML.AsString <> '') then
    tblProfessoresCC_TEXTO_HTML.AsString := '<img style="width: auto;" width=32 height=32 src="files/' + _DOCUMENTO_ON + '"/>'
  else
    tblProfessoresCC_TEXTO_HTML.AsString := '<img style="width: auto;" width=32 height=32 src="files/' + _DOCUMENTO_OFF + '"/>';

  /// Ativo
  if (tblProfessoresPRO_ATIVO.AsBoolean) then
    tblProfessoresCC_ATIVO.AsString := '<img style="height: auto;" width=80 height=32 src="files/' + _STATUS_ATIVO + '"/>'
  else
    tblProfessoresCC_ATIVO.AsString := '<img style="height: auto;" width=80 height=32 src="files/' + _STATUS_INATIVO + '"/>';
end;

procedure TUniMainModule.tblTrilhasAfterInsert(DataSet: TDataSet);
var
  Id: Variant;
begin
  Id :=
    Conn.ExecSQLScalar
    (
      'SELECT' +
      '  MAX(TRI_ID) ' +
      'FROM' +
      '  TRILHAS '
    );

  if VarIsNull(Id) then
    Id:= 0;

  tblTrilhasTRI_ID.AsInteger := Id+1;
  tblTrilhasTRI_DATA_CADASTRO.AsDateTime := Now;
  tblTrilhasTRI_ATIVO.AsBoolean := True;
  tblTrilhasID_EMPRESA.AsInteger := 1;
  tblTrilhasFG_EXCLUIDO.AsBoolean := False;
end;

procedure TUniMainModule.tblTrilhasAfterScroll(DataSet: TDataSet);
begin
  OrdenarTrilhasCursoPor('TRC_ORDEM_POSICAO');
end;

procedure TUniMainModule.tblTrilhasCalcFields(DataSet: TDataSet);
var
  vTotCursos: Variant;
begin
  vTotCursos :=
    Conn.ExecSQLScalar
    (
        'SELECT' +
        '  COUNT(CUR_ID) ' +
        'FROM' +
        '  TRILHAS_CURSOS ' +
        'WHERE ' +
        '  TRI_ID = ' + tblTrilhasTRI_ID.AsInteger.ToString
    );
  if VarIsNull(vTotCursos) then
    vTotCursos:= 0;

  if tblTrilhas.State = dsBrowse then
    tblTrilhas.Edit;

  tblTrilhasCC_TOTAL_CURSOS.AsInteger := vTotCursos;

  /// Ativo
  if (tblTrilhasTRI_ATIVO.AsBoolean) then
    tblTrilhasCC_ATIVO.AsString := '<img style="height: auto;" width=80 height=32 src="files/' + _STATUS_ATIVO + '"/>'
  else
    tblTrilhasCC_ATIVO.AsString := '<img style="height: auto;" width=80 height=32 src="files/' + _STATUS_INATIVO + '"/>';

  /// Em criacao
  if (tblTrilhasTRI_EM_CRIACAO.AsBoolean) then
    tblTrilhasCC_EM_CRIACAO.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    tblTrilhasCC_EM_CRIACAO.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';

end;

procedure TUniMainModule.tblTrilhasFixasCalcFields(DataSet: TDataSet);
var
  vTotCursos: Variant;
begin
  vTotCursos :=
    Conn.ExecSQLScalar
    (
        'SELECT' +
        '  COUNT(CUR_ID) ' +
        'FROM' +
        '  TRILHAS_CURSOS ' +
        'WHERE ' +
        '  TRI_ID = ' + tblTrilhasFixasTRI_ID.AsInteger.ToString
    );
  if VarIsNull(vTotCursos) then
    vTotCursos:= 0;

  if tblTrilhasFixas.State = dsBrowse then
    tblTrilhasFixas.Edit;

  tblTrilhasFixasCC_TOTAL_CURSOS.AsInteger := vTotCursos;
end;

procedure TUniMainModule.tblUsersAfterInsert(DataSet: TDataSet);
var
  Id: Variant;
begin
  Id :=
    Conn.ExecSQLScalar
    (
        'SELECT' +
        '  MAX(USU_ID) ' +
        'FROM' +
        '  USUARIOS '
    );

  if VarIsNull(Id) then
    Id:= 0;

   tblUsersUSU_ID.AsInteger :=  Id+1;
   tblUsersID_EMPRESA.AsInteger := 1;
   tblUsersFG_EXCLUIDO.AsBoolean := False;
end;

procedure TUniMainModule.tblUsersAfterPost(DataSet: TDataSet);
begin
  AtualizarImagemUsuarioLogado;
end;

procedure TUniMainModule.tblUsersCalcFields(DataSet: TDataSet);
begin
  if (Trim(tblUsersUSU_FOTO.AsString) <> '') and FileExists(tblUsersUSU_FOTO.AsString)  then
    tblUsersCC_FOTO.Value := '<img style="border-radius: 50%;" width=32 height=32 src="files/' + ExtractFileName(tblUsersUSU_FOTO.AsString) + '"/>'
  else
    tblUsersCC_FOTO.Value := '<img style="border-radius: 50%;" width=32 height=32 src="files/sem-foto.png"/>';

  ///  - Administrador
  if (tblUsersUSU_ADMIN.AsBoolean) then
    tblUsersCC_ADMIN.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    tblUsersCC_ADMIN.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';

  ///  - Alunos
  if (tblUsersUSU_ALUNO.AsBoolean) then
    tblUsersCC_ALUNOS.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    tblUsersCC_ALUNOS.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';

  /// - Financeiro
  if (tblUsersUSU_FINANCEIRO.AsBoolean) then
    tblUsersCC_FINANCEIRO.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    tblUsersCC_FINANCEIRO.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';

  ///  - Cursos
  if (tblUsersUSU_CURSO.AsBoolean) then
    tblUsersCC_CURSOS.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    tblUsersCC_CURSOS.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';

  ///  - Suporte
  if (tblUsersUSU_SUPORTE.AsBoolean) then
    tblUsersCC_SUPORTE.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    tblUsersCC_SUPORTE.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';

  /// - Gamefica
  if (tblUsersUSU_GAMEFICACAO.AsBoolean) then
    tblUsersCC_GAMEFICA.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    tblUsersCC_GAMEFICA.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';

  ///  - Documentos
  if (tblUsersUSU_DOCUMETOS.AsBoolean) then
    tblUsersCC_DOCUMENTOS.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    tblUsersCC_DOCUMENTOS.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';

  /// - Relatorios
  if (tblUsersUSU_RELATORIOS.AsBoolean) then
    tblUsersCC_RELATORIOS.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    tblUsersCC_RELATORIOS.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';

  /// -  Trilhas
  if (tblUsersUSU_TRILHAS.AsBoolean) then
    tblUsersCC_TRILHAS.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    tblUsersCC_TRILHAS.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';
end;

procedure TUniMainModule.actCadProfessoresExecute(Sender: TObject);
begin
   FServicos.CadastroProfessores;
end;

procedure TUniMainModule.actAlterarAdminExecute(Sender: TObject);
var
  AdminQty : integer;
begin
  if tblUsers.State <> dsBrowse then
    ShowMessage('Confirme qualquer atualização pendente antes de solicitar alterações de status de administrador!')
  else
  begin
    AdminQty := Conn.ExecSQLScalar('SELECT count(*) FROM USUARIOS WHERE USU_ADMIN = 1');
    if tblUsersUSU_ADMIN.Value and (AdminQty = 1) then
      ShowMessage('You need at least one admin account!')
    else
    begin
      tblUsers.Edit;
      tblUsersUSU_ADMIN.Value := tblUsersUSU_ADMIN.IsNull or not tblUsersUSU_ADMIN.Value;
      tblUsers.Post;
    end;
  end;
end;
procedure TUniMainModule.actAlterarAlunosExecute(Sender: TObject);
begin
  if tblAlunos.State <> dsEdit then
    tblAlunos.Edit;
end;

procedure TUniMainModule.actAlterarAnexoExecute(Sender: TObject);
begin
  if tblAnexos.State <> dsEdit then
    tblAnexos.Edit;
end;

procedure TUniMainModule.actAlterarAulaExecute(Sender: TObject);
begin
  if tblAulas.State <> dsEdit then
    tblAulas.Edit;
end;

procedure TUniMainModule.actAlterarCursoExecute(Sender: TObject);
begin
   if tblCursos.State <> dsEdit then
    tblCursos.Edit;
end;

procedure TUniMainModule.actAlterarModuloExecute(Sender: TObject);
begin
  if tblModulos.State <> dsEdit then
    tblModulos.Edit;
end;

procedure TUniMainModule.actAlterarUsuarioExecute(Sender: TObject);
begin
  if tblUsers.State <> dsEdit then
    tblUsers.Edit;
end;

procedure TUniMainModule.actCadCursosExecute(Sender: TObject);
begin
  FServicos.CadastrosCursos;
end;

procedure TUniMainModule.UniGUIMainModuleNewComponent(AComponent: TComponent);
begin
  if AComponent is TfrxReport then
    (AComponent as TfrxReport).EngineOptions.UseGlobalDataSetList := False;
end;

procedure TUniMainModule.ObterListaVideosVimeo(ProgressBar: TUniProgressBar);
const
  _ID_USER_VIMEO = '53298780';
  _TOKEN_VIMEO = '264bcea90e50afcddd5ae369af795de1';
  _QTDE_VIDEOS_POR_PAG = 100;
var
  JsonResponse: TJSONObject;
  ArrayVideoJson: TJSONArray;
  i: Integer;
  JsonSubObj: TJSONObject;
  Pagina, TotalPaginas: Integer;
begin
  ResetRequest;

  OAuth2Authenticator1.AccessToken := _TOKEN_VIMEO;

  RESTClient.Authenticator := OAuth2Authenticator1;

  RESTClient.BaseURL := 'https://api.vimeo.com';
  /// ?field1=hello&field2=goodbye
  RESTRequest.Resource := '/users/' + _ID_USER_VIMEO + '/videos?per_page=' + IntToStr(_QTDE_VIDEOS_POR_PAG);

  RESTClient.ContentType := 'application/json';
  RESTRequest.Method := TRESTRequestMethod.rmGET;

  RESTRequest.Params.AddHeader('Authorization', 'bearer ' + _TOKEN_VIMEO);

  RESTRequest.Execute;

  ProcessarResponse;

  if not FErroAoProcessarApiVimeo then
  begin
    /// Apagar todos os videos da base local
    SqlApagarVideosVimeo.ExecSQL;

    SqlVideosVimeo.Close;

    QryAux.SQL.Text := 'INSERT INTO VIDEOS_VIMEO(ID_VIDEO, URI, NOME_VIDEO, DESCRICAO_VIDEO, LINK, DURACAO, ' +
      'TAMANHO_LARGURA, TAMANHO_ALTURA, DATA_CRIADO, DATA_MODIFICADO, DATA_ATUALIZADO, ID_EMPRESA, FG_EXCLUIDO) ' +
      'VALUES (:ID_VIDEO, :URI, :NOME_VIDEO, :DESCRICAO_VIDEO, :LINK, :DURACAO, ' +
      ':TAMANHO_LARGURA, :TAMANHO_ALTURA, :DATA_CRIADO, :DATA_MODIFICADO, :DATA_ATUALIZADO, :ID_EMPRESA, :FG_EXCLUIDO)';

    /// Tratando lista de videos Json
    JsonResponse := TJSONObject.ParseJSONValue(RESTResponse.Content) as TJSONObject;
    if Assigned(JsonResponse) then
    begin
      if Assigned(JsonResponse.GetValue('data')) then
      begin
        if StrToIntDef(JsonResponse.GetValue('total').ToString, 0) > 0 then
        begin
          TotalPaginas := Trunc(StrToIntDef(JsonResponse.GetValue('total').ToString, 0) / _QTDE_VIDEOS_POR_PAG) + 1;

          ProgressBar.Visible := True;
          ProgressBar.Max := TotalPaginas;
          ProgressBar.Position := 0;

          for Pagina := 1 to TotalPaginas do
          begin
            ArrayVideoJson := JsonResponse.GetValue('data') as TJSONArray;
            if Assigned(ArrayVideoJson) then
            begin
              for i := 0 to ArrayVideoJson.Size - 1 do
              begin
                JsonSubObj := (ArrayVideoJson.Get(i) as TJSONObject);

                //SqlVideosVimeo.Append;
                QryAux.ParamByName('ID_VIDEO').AsString := Copy(StringReplace(JsonSubObj.GetValue('uri').ToString, '"', '', [rfReplaceAll]), 9, 20);
                QryAux.ParamByName('URI').AsString := StringReplace(JsonSubObj.GetValue('uri').ToString, '"', '', [rfReplaceAll]);
                QryAux.ParamByName('NOME_VIDEO').AsString := StringReplace(JsonSubObj.GetValue('name').ToString, '"', '', [rfReplaceAll]);
                QryAux.ParamByName('DESCRICAO_VIDEO').AsString := StringReplace(JsonSubObj.GetValue('description').ToString, '"', '', [rfReplaceAll]);
                QryAux.ParamByName('LINK').AsString := StringReplace(JsonSubObj.GetValue('link').ToString, '"', '', [rfReplaceAll]);
                QryAux.ParamByName('DURACAO').AsString := StringReplace(JsonSubObj.GetValue('duration').ToString, '"', '', [rfReplaceAll]);
                QryAux.ParamByName('TAMANHO_LARGURA').AsString := StringReplace(JsonSubObj.GetValue('width').ToString, '"', '', [rfReplaceAll]);
                QryAux.ParamByName('TAMANHO_ALTURA').AsString := StringReplace(JsonSubObj.GetValue('height').ToString, '"', '', [rfReplaceAll]);
                QryAux.ParamByName('DATA_CRIADO').AsString := StringReplace(JsonSubObj.GetValue('created_time').ToString, '"', '', [rfReplaceAll]);
                QryAux.ParamByName('DATA_MODIFICADO').AsString := StringReplace(JsonSubObj.GetValue('modified_time').ToString, '"', '', [rfReplaceAll]);
                QryAux.ParamByName('DATA_ATUALIZADO').AsString := StringReplace(JsonSubObj.GetValue('release_time').ToString, '"', '', [rfReplaceAll]);
                QryAux.ParamByName('ID_EMPRESA').AsInteger := 1;
                QryAux.ParamByName('FG_EXCLUIDO').AsBoolean := False;

                //QryAux.Post;
                //QryAux.ApplyUpdates(0);
                QryAux.ExecSQL;

                if UniSession.Synchronize(500) then
                  ProgressBar.Position := ProgressBar.Position + 1;
              end;{for}
            end;{assigned}

            /// Busca o proximo pacote
            if (Pagina+1) <= TotalPaginas  then
            begin
              RESTRequest.Resource := '/users/' + _ID_USER_VIMEO + '/videos?per_page=' + IntToStr(_QTDE_VIDEOS_POR_PAG) + '&page=' + Integer(Pagina+1).ToString;
              RESTRequest.Execute;
              ProcessarResponse;
              if FErroAoProcessarApiVimeo then
                Break;

              JsonResponse := TJSONObject.ParseJSONValue(RESTResponse.Content) as TJSONObject;
              if not Assigned(JsonResponse) then
                Break;
            end;
          end; {for}
          SqlVideosVimeo.Open;
          SqlVideosVimeo.First;
          ProgressBar.Visible := False;
        end;{if total paginas > 0}
      end;
    end;
  end;
end;

procedure TUniMainModule.OnCreateAlunos(Sender: TObject);
begin
  tblAlunos.ParamByName('ID_EMPRESA').AsInteger := 1;
  OrdenarAlunosPor('ALU_NOME');
end;

procedure TUniMainModule.OnCreateCadastroProfessores(Sender: TObject);
begin
  tblProfessores.ParamByName('ID_EMPRESA').AsInteger := 1;
  OrdenarProfessoresPor('PRO_NOME');
end;

procedure TUniMainModule.OnCreateCadastroUsuarios(Sender: TObject);
begin
  tblUsers.ParamByName('ID_EMPRESA').AsInteger := 1;
  OrdenarUsuariosPor('USU_LOGIN');
end;

procedure TUniMainModule.OnCreateCursos(Sender: TObject);
begin
  tblCursos.ParamByName('ID_EMPRESA').AsInteger := 1;
  tblModulos.ParamByName('ID_EMPRESA').AsInteger := 1;
  tblAulas.ParamByName('ID_EMPRESA').AsInteger := 1;
  //tblAnexos.ParamByName('ID_EMPRESA').AsInteger := 1;

  //tblCursos.Open;
  //tblModulos.Open;
  //tblAulas.Open;
  //tblAnexos.Open;

  OrdenarCursosPor('CUR_NOME', True);
  //OrdenarModulosPor('MOD_NOME');
  //OrdenarAulasPor('AUL_NOME');
end;

procedure TUniMainModule.OnCreateTrilhas(Sender: TObject);
begin
  tblTrilhas.ParamByName('ID_EMPRESA').AsInteger := 1;
  OrdenarTrilhasPor('TRI_NOME');
end;

procedure TUniMainModule.OnCreateTrilhasFixas(Sender: TObject);
begin
  tblTrilhasFixas.ParamByName('ID_EMPRESA').AsInteger := 1;
  OrdenarTrilhasFixasPor('TRF_ORDEM_POSICAO');
end;

procedure TUniMainModule.OnCreateVideosVimeo(Sender: TObject);
begin
  SqlVideosVimeo.ParamByName('ID_EMPRESA').AsInteger := 1;
  SqlVideosVimeo.Open;
end;

procedure TUniMainModule.OnDestroyAlunos(Sender: TObject);
begin
  if tblAlunos.State in dsEditModes then
    tblAlunos.Post;
  tblAlunos.Close;
end;

procedure TUniMainModule.OnDestroyCadastroProfessores(Sender: TObject);
begin
  if tblProfessores.State in dsEditModes then
    tblProfessores.Post;
  tblProfessores.Close;
end;

procedure TUniMainModule.OnDestroyCadastroUsuarios(Sender: TObject);
begin
  if tblUsers.State in dsEditModes then
    tblUsers.Post;
  tblUsers.Close;
end;

procedure TUniMainModule.OnDestroyCursos(Sender: TObject);
begin
  tblCursos.Close;
  tblModulos.Close;
  tblAulas.Close;
  //tblAnexos.Close;
end;

procedure TUniMainModule.OnDestroyTrilhas(Sender: TObject);
begin
  if tblTrilhas.State in dsEditModes then
    tblTrilhas.Post;
  tblTrilhas.Close;
end;

procedure TUniMainModule.OnDestroyTrilhasFixas(Sender: TObject);
begin
  if tblTrilhasFixas.State in dsEditModes then
    tblTrilhasFixas.Post;
  tblTrilhasFixas.Close;
end;

procedure TUniMainModule.OnDestroyVideosVimeo(Sender: TObject);
begin
  SqlVideosVimeo.Close;
end;

procedure TUniMainModule.OrdenarTrilhasPor(const NomeColuna: String);
var
  Order: String;
begin
  if NomeColuna.Trim = '' then
    Exit;

  if Pos(' ORDER BY ' + NomeColuna + ' ASC', tblTrilhas.SQL.Text) > 0 then
    Order := ' ORDER BY ' + NomeColuna + ' DESC'
  else
    Order := ' ORDER BY ' + NomeColuna + ' ASC';

  tblTrilhas.Close;
  tblTrilhas.SQL.Text := SQLTrilhas + Order;
  tblTrilhas.Open;
end;

procedure TUniMainModule.OrdenarAlunosPor(const NomeColuna: String; const FiltroExtr: String);
var
  Order: String;
begin
  if NomeColuna.Trim = '' then
    Exit;

  if Pos(' ORDER BY ' + NomeColuna + ' ASC', tblAlunos.SQL.Text) > 0 then
    Order := ' ORDER BY ' + NomeColuna + ' DESC'
  else
    Order := ' ORDER BY ' + NomeColuna + ' ASC';

  tblAlunos.Close;
  tblAlunos.SQL.Text := SQLAlunos + FiltroExtr + Order;
  tblAlunos.Open;
end;

procedure TUniMainModule.OrdenarTrilhasCursoPor(const NomeColuna: String);
var
  Order: String;
begin
  if NomeColuna.Trim = '' then
    Exit;

  Order := ' ORDER BY ' + NomeColuna + ' ASC';

  tblCursosTrilhas.Close;
  tblCursosTrilhas.SQL.Text := SQLCursosTrilhas + Order;
  tblCursosTrilhas.ParamByName('TRI_ID').AsInteger := tblTrilhasTRI_ID.AsInteger;
  tblCursosTrilhas.Open;
end;

procedure TUniMainModule.OrdenarTrilhasFixasPor(const NomeColuna: String);
var
  Order: String;
begin
  if NomeColuna.Trim = '' then
    Exit;

  Order := ' ORDER BY ' + NomeColuna + ' ASC';

  tblTrilhasFixas.Close;
  tblTrilhasFixas.SQL.Text := SQLTrilhasFixas + Order;
  tblTrilhasFixas.Open;
end;


procedure TUniMainModule.OrdenarAulasPor(const NomeColuna: String);
var
  Order: String;
begin
  if NomeColuna.Trim = '' then
    Exit;

  //if Pos(' ORDER BY ' + NomeColuna + ' ASC', tblAulas.SQL.Text) > 0 then
  //  Order := ' ORDER BY ' + NomeColuna + ' DESC'
  //else
  Order := ' ORDER BY ' + NomeColuna + ' ASC';

  tblAulas.Close;
  tblAulas.SQL.Text := SQLAulas + Order;
  tblAulas.Open;
end;

procedure TUniMainModule.OrdenarCursosPor(const NomeColuna: String; const ForcarOrderAsc: Boolean);
var
  Order: String;
begin
  if NomeColuna.Trim = '' then
    Exit;

  if ForcarOrderAsc then
    Order := ' ORDER BY ' + NomeColuna + ' ASC'
  else
  if Pos(' ORDER BY ' + NomeColuna + ' ASC', tblCursos.SQL.Text) > 0 then
    Order := ' ORDER BY ' + NomeColuna + ' DESC'
  else
    Order := ' ORDER BY ' + NomeColuna + ' ASC';


  tblCursos.Close;
  tblCursos.SQL.Text := SQLCursos + Order;
  tblCursos.Open;
end;

procedure TUniMainModule.OrdenarModulosPor(const NomeColuna: String);
var
  Order: String;
begin
  if NomeColuna.Trim = '' then
    Exit;

  //if Pos(' ORDER BY ' + NomeColuna + ' ASC', tblModulos.SQL.Text) > 0 then
  //  Order := ' ORDER BY ' + NomeColuna + ' DESC'
  //else
  Order := ' ORDER BY ' + NomeColuna + ' ASC';

  tblModulos.Close;
  tblModulos.SQL.Text := SQLModulos + Order;
  tblModulos.Open;
end;

procedure TUniMainModule.OrdenarProfessoresPor(const NomeColuna: String);
var
  Order: String;
begin
  if NomeColuna.Trim = '' then
    Exit;

  if Pos(' ORDER BY ' + NomeColuna + ' ASC', tblProfessores.SQL.Text) > 0 then
    Order := ' ORDER BY ' + NomeColuna + ' DESC'
  else
    Order := ' ORDER BY ' + NomeColuna + ' ASC';

  tblProfessores.Close;
  tblProfessores.SQL.Text := SQLProfessores + Order;
  tblProfessores.Open;
end;

procedure TUniMainModule.OrdenarUsuariosPor(const NomeColuna: String);
var
  Order: String;
begin
  if NomeColuna.Trim = '' then
    Exit;

  if Pos(' ORDER BY ' + NomeColuna + ' ASC', tblUsers.SQL.Text) > 0 then
    Order := ' ORDER BY ' + NomeColuna + ' DESC'
  else
    Order := ' ORDER BY ' + NomeColuna + ' ASC';

  tblUsers.Close;
  tblUsers.SQL.Text := SQLUsuarios + Order;
  tblUsers.Open;
end;

procedure TUniMainModule.RESTRequestHTTPProtocolError(Sender: TCustomRESTRequest);
begin
  FErroAoProcessarApiVimeo := True;
end;

procedure TUniMainModule.actCadUsuariosExecute(Sender: TObject);
begin
  FServicos.CadastrosUsuarios;
end;

procedure TUniMainModule.actCarregarApostilaExecute(Sender: TObject);
begin
  DFormCarregarApostilaAula.ShowModal();
end;

procedure TUniMainModule.actCarregarAudioExecute(Sender: TObject);
begin
  DFormCarregarAudio.ShowModal();
end;

procedure TUniMainModule.actCarregarConteudoHtmlCertificadoExecute(Sender: TObject);
begin
  DFormCarregarHtmlCertificadoCurso.ShowModal();
end;

procedure TUniMainModule.actCarregarConteudoHtmlExecute(Sender: TObject);
begin
  DFormCarregarHtmlConteudoCurso.ShowModal();
end;

procedure TUniMainModule.actCarregarConteudoHtmlProfessorExecute(Sender: TObject);
begin
  DFormCarregarHtmlProfessor.ShowModal();
end;

procedure TUniMainModule.actCarregarConteudoHtmlProvaExecute(Sender: TObject);
begin
  DFormCarregarHtmlProvaCurso.ShowModal();
end;

procedure TUniMainModule.actCarregarFotoAlunoExecute(Sender: TObject);
begin
  FUploadFotoAlunoUser := tpFotoAluno;
  DFormCarregarImagemUsuario.ShowModal();
end;

procedure TUniMainModule.actCarregarFotoProfessorExecute(Sender: TObject);
begin
  DFormCarregarImagemProfessor.ShowModal();
end;

procedure TUniMainModule.actCarregarFotoUsuarioExecute(Sender: TObject);
begin
  FUploadFotoAlunoUser := tpFotoUser;
  DFormCarregarImagemUsuario.ShowModal();
end;

procedure TUniMainModule.actCarregarImagemBannerExecute(Sender: TObject);
begin
  DFormCarregarImagemBanner.ShowModal();
end;

procedure TUniMainModule.actCarregarImagemCapaExecute(Sender: TObject);
begin
  DFormCarregarImagemCapaCurso.ShowModal();
end;

procedure TUniMainModule.actCarregarImagemDestaqueExecute(Sender: TObject);
begin
  DFormCarregarImagemDestaqueCurso.ShowModal();
end;

procedure TUniMainModule.actCarregarVideosVimeoExecute(Sender: TObject);
begin
  DFormCarregarVideosVimeo.ShowModal();
end;

procedure TUniMainModule.actExcluirAnexoExecute(Sender: TObject);
begin
  if tblAnexos.State = dsBrowse then
  begin
    if not tblAnexos.IsEmpty then
       tblAnexos.Delete;
  end;
end;

procedure TUniMainModule.actExcluirAulaExecute(Sender: TObject);
begin
  if tblAulas.State in dsEditModes then
    tblAulas.Post;

  if not tblAulas.IsEmpty then
    MessageDlg('Deseja realmente excluir aula "' + tblAulasAUL_NOME.AsString +
      '" do módulo "' + tblModulosMOD_NOME.AsString + '" do curso "' + tblCursosCUR_NOME.AsString + '"?', mtConfirmation, mbYesNo, DCallBackExcluirAula);
end;

procedure TUniMainModule.DCallBackExcluirAluno(Sender: TComponent; Res: Integer);
begin
  if Res = mrYes then
  begin
    tblAlunos.Edit;
    tblAlunosFG_EXCLUIDO.AsBoolean := True;
    tblAlunos.Post;
    tblAlunos.Refresh;
  end;
end;

procedure TUniMainModule.DCallBackExcluirAula(Sender: TComponent; Res: Integer);
begin
  if Res = mrYes then
    tblAulas.Delete;
end;

procedure TUniMainModule.actExcluirCursoExecute(Sender: TObject);
begin
  if tblCursos.State in dsEditModes then
    tblCursos.Post;

  if not tblCursos.IsEmpty then
    MessageDlg('Deseja realmente excluir o curso "' + tblCursosCUR_NOME.AsString + '"?', mtConfirmation, mbYesNo, DCallBackExcluirCurso);
end;

procedure TUniMainModule.actExcluirCursosTrilhasExecute(Sender: TObject);
begin
   /// Excluir curso do vinculo com trilhas
end;

procedure TUniMainModule.actExcluirModuloExecute(Sender: TObject);
begin
  if tblModulos.State in dsEditModes then
    tblModulos.Post;

  if not tblModulos.IsEmpty then
    MessageDlg('Deseja realmente excluir o módulo "' + tblModulosMOD_NOME.AsString +
      '" do curso "' + tblCursosCUR_NOME.AsString + '"?', mtConfirmation, mbYesNo, DCallBackExcluirModulo);
end;

procedure TUniMainModule.actExcluirProfessorExecute(Sender: TObject);
begin
  if tblProfessores.State in dsEditModes then
    tblProfessores.Post;

  if not tblProfessores.IsEmpty then
    MessageDlg('Deseja realmente excluir o professor "' + tblProfessoresPRO_NOME.AsString + '" ?', mtConfirmation, mbYesNo, DCallBackExcluirProfessor);
end;

procedure TUniMainModule.actExcluirTrilhasExecute(Sender: TObject);
begin
  if tblTrilhas.State in dsEditModes then
    tblTrilhas.Post;

  if not tblTrilhas.IsEmpty then
    MessageDlg('Deseja realmente excluir a trilha "' + tblTrilhasTRI_NOME.AsString + '"?', mtConfirmation, mbYesNo, DCallBackExcluirTrilha);
end;

procedure TUniMainModule.actExcluirTrilhasFixasExecute(Sender: TObject);
begin
  if tblTrilhasFixas.State in dsEditModes then
    tblTrilhasFixas.Post;

  if not tblTrilhasFixas.IsEmpty then
    MessageDlg('Deseja realmente excluir a trilha fixa "' + tblTrilhasFixasTRI_NOME.AsString + '"?', mtConfirmation, mbYesNo, DCallBackExcluirTrilhaFixa);
end;

procedure TUniMainModule.actExcluirUsuarioExecute(Sender: TObject);
begin
  if tblUsers.State  in dsEditModes then
    tblUsers.Post;

  if not tblUsers.IsEmpty then
    MessageDlg('Deseja realmente excluir o usuário "' + tblUsersUSU_LOGIN.AsString + '"?', mtConfirmation, mbYesNo, DCallBackExcluirUsuarios);
end;

procedure TUniMainModule.actGravarAlunosExecute(Sender: TObject);
begin
  if tblAlunos.State in dsEditModes then
    tblAlunos.Post;
end;

procedure TUniMainModule.actGravarAnexoExecute(Sender: TObject);
begin
  if tblAnexos.State in dsEditModes then
    tblAnexos.Post;
end;

procedure TUniMainModule.actGravarAulaExecute(Sender: TObject);
begin
  if tblAulas.State in dsEditModes then
    tblAulas.Post;
end;

procedure TUniMainModule.actGravarCursoExecute(Sender: TObject);
begin
  if tblCursos.State in dsEditModes then
    tblCursos.Post;
end;

procedure TUniMainModule.actGravarModuloExecute(Sender: TObject);
begin
  if tblModulos.State in dsEditModes then
  begin
    tblModulos.Post;
  end;
end;

procedure TUniMainModule.actGravarUsuarioExecute(Sender: TObject);
begin
  if tblUsers.State in dsEditModes then
  begin
    tblUsers.Post;
  end;
end;

procedure TUniMainModule.actIncluirAlunosExecute(Sender: TObject);
begin
  if tblALunos.State in dsEditModes then
    tblALunos.Post;

 tblALunos.Insert;
end;

procedure TUniMainModule.actIncluirAnexoExecute(Sender: TObject);
begin
  if tblAnexos.State in dsEditModes then
    tblAnexos.Post;

  tblAnexos.Insert;
end;

procedure TUniMainModule.actIncluirAulaExecute(Sender: TObject);
begin
  if tblAulas.State in dsEditModes then
    tblAulas.Post;

 tblAulas.Insert;
end;

procedure TUniMainModule.actIncluirCursoExecute(Sender: TObject);
begin
  if tblCursos.State in dsEditModes then
    tblCursos.Post;

  tblCursos.Insert;
end;

procedure TUniMainModule.actIncluirCursosTrilhaExecute(Sender: TObject);
begin
  /// Incluir cursos trilhas
  if tblCursosTrilhas.State in dsEditModes then
    tblCursosTrilhas.Post;

  DFormVincularCursosTrilhas.ShowModal();
end;

procedure TUniMainModule.actIncluirModuloExecute(Sender: TObject);
begin
  if tblModulos.State in dsEditModes then
    tblModulos.Post;

  tblModulos.Insert;
end;

procedure TUniMainModule.actIncluirProfessorExecute(Sender: TObject);
begin
  if tblProfessores.State in dsEditModes then
    tblProfessores.Post;

  tblProfessores.Insert;
end;

procedure TUniMainModule.actIncluirTrilhaExecute(Sender: TObject);
begin
   if tblTrilhas.State in dsEditModes then
    tblTrilhas.Post;

 tblTrilhas.Insert;
end;

procedure TUniMainModule.actIncluirTrilhaFixaExecute(Sender: TObject);
begin
  /// Incluir trilha fixa aqui
  if tblTrilhasFixas.State in dsEditModes then
    tblTrilhasFixas.Post;

  DFormVincularCursosTrilhasFixas.ShowModal();
end;

procedure TUniMainModule.actIncluirUsuarioExecute(Sender: TObject);
begin
  if tblUsers.State in dsEditModes then
     tblUsers.Post;

  tblUsers.Insert;
end;

procedure TUniMainModule.actVincularProfessoresCursoExecute(Sender: TObject);
begin
  if tblProfessores.State in dsEditModes then
    tblProfessores.Post;

  DFormVincularProfessoresCurso.ShowModal();
end;

procedure TUniMainModule.AtualizarImagemUsuarioLogado;
var
  vImgUserLogado: Variant;
begin
  vImgUserLogado := Conn.ExecSQLScalar
    (
        'SELECT' +
        '  USU_FOTO ' +
        'FROM' +
        '  USUARIOS '+
        'WHERE USU_ID = ' + FID_Usuario_Logado.ToString
    );

  if VarIsNull(vImgUserLogado) then
    vImgUserLogado := '';

  if vImgUserLogado <> FImagemUsuarioLogado then
  begin
    FImagemUsuarioLogado := vImgUserLogado;
    Main.MainForm.CarregarImagemUsuarioLogado;
  end;
end;

procedure TUniMainModule.AumentarOrdemAula(const IdModulo, PosicaoAtual: Integer);
var
  Ultima: Integer;
begin
  /// Aumentar
  QryAux.Close;
  QryAux.SQL.Text := 'SELECT MAX(AUL_ORDEM_POSICAO) AS Ultima FROM AULAS_MODULOS WHERE MOD_ID = ' + IdModulo.ToString;
  QryAux.Open;
  Ultima := QryAux.FieldByName('Ultima').AsInteger;
  QryAux.Close;

  /// Atualiza Posterior - e reserva sequencia
  if PosicaoAtual <> Ultima then
  begin
   /// Atualiza Anterior - e reserva sequencia
    QryAux.SQL.Text := 'UPDATE AULAS_MODULOS SET AUL_ORDEM_POSICAO = -999 ' +
       'WHERE MOD_ID = ' + IdModulo.ToString + ' AND AUL_ORDEM_POSICAO = ' + Integer(PosicaoAtual + 1).ToString;
    QryAux.ExecSQL();

    /// Atualiza Atual
    QryAux.SQL.Text := 'UPDATE AULAS_MODULOS SET AUL_ORDEM_POSICAO = ' + Integer(PosicaoAtual + 1).ToString + ' ' +
       'WHERE MOD_ID = ' + IdModulo.ToString + ' AND AUL_ORDEM_POSICAO = ' + PosicaoAtual.ToString;
    QryAux.ExecSQL();

    /// Ajusta o reservado
    QryAux.SQL.Text := 'UPDATE AULAS_MODULOS SET AUL_ORDEM_POSICAO = ' + PosicaoAtual.ToString + ' ' +
      'WHERE MOD_ID = ' + IdModulo.ToString + ' AND AUL_ORDEM_POSICAO = -999';
    QryAux.ExecSQL();

    /// Executa ordenação
    OrdenarAulasPor('AUL_ORDEM_POSICAO');
  end;
end;

procedure TUniMainModule.AumentarOrdemCursoTrilha(const IdTrilha, PosicaoAtual: Integer);
var
  Ultima: Integer;
begin
  /// Aumentar
  QryAux.Close;
  QryAux.SQL.Text := 'SELECT MAX(TRC_ORDEM_POSICAO) AS Ultima FROM TRILHAS_CURSOS WHERE TRI_ID = ' + IdTrilha.ToString;
  QryAux.Open;
  Ultima := QryAux.FieldByName('Ultima').AsInteger;
  QryAux.Close;

  /// Atualiza Posterior - e reserva sequencia
  if PosicaoAtual <> Ultima then
  begin
    QryAux.SQL.Text := 'UPDATE TRILHAS_CURSOS SET TRC_ORDEM_POSICAO = -888 ' +
       'WHERE TRI_ID = ' + IdTrilha.ToString + ' AND TRC_ORDEM_POSICAO = ' + Integer(PosicaoAtual + 1).ToString;
    QryAux.ExecSQL();

    /// Atualiza Atual
    QryAux.SQL.Text := 'UPDATE TRILHAS_CURSOS SET TRC_ORDEM_POSICAO = ' + Integer(PosicaoAtual + 1).ToString + ' ' +
       'WHERE TRI_ID = ' + IdTrilha.ToString + ' AND TRC_ORDEM_POSICAO = ' + PosicaoAtual.ToString;
    QryAux.ExecSQL();

    /// Ajusta o reservado
    QryAux.SQL.Text := 'UPDATE TRILHAS_CURSOS SET TRC_ORDEM_POSICAO = ' + PosicaoAtual.ToString + ' ' +
      'WHERE TRI_ID = ' + IdTrilha.ToString + ' AND TRC_ORDEM_POSICAO = -888';
    QryAux.ExecSQL();

    /// Executa ordenação
    OrdenarTrilhasCursoPor('TRC_ORDEM_POSICAO');
  end;
end;

procedure TUniMainModule.AumentarOrdemCursoTrilhaFixa(PosicaoAtual: Integer);
var
  Ultima: Integer;
begin
  /// Aumentar
  QryAux.Close;
  QryAux.SQL.Text := 'SELECT MAX(TRF_ORDEM_POSICAO) AS Ultima FROM TRILHAS_FIXAS';
  QryAux.Open;
  Ultima := QryAux.FieldByName('Ultima').AsInteger;
  QryAux.Close;

  /// Atualiza Posterior - e reserva sequencia
  if PosicaoAtual <> Ultima then
  begin
    QryAux.SQL.Text := 'UPDATE TRILHAS_FIXAS SET TRF_ORDEM_POSICAO = -888 ' +
       'WHERE TRF_ORDEM_POSICAO = ' + Integer(PosicaoAtual + 1).ToString;
    QryAux.ExecSQL();

    /// Atualiza Atual
    QryAux.SQL.Text := 'UPDATE TRILHAS_FIXAS SET TRF_ORDEM_POSICAO = ' + Integer(PosicaoAtual + 1).ToString + ' ' +
       'WHERE TRF_ORDEM_POSICAO = ' + PosicaoAtual.ToString;
    QryAux.ExecSQL();

    /// Ajusta o reservado
    QryAux.SQL.Text := 'UPDATE TRILHAS_FIXAS SET TRF_ORDEM_POSICAO = ' + PosicaoAtual.ToString + ' ' +
      'WHERE TRF_ORDEM_POSICAO = -888';
    QryAux.ExecSQL();

    /// Executa ordenação
    OrdenarTrilhasFixasPor('TRF_ORDEM_POSICAO');
  end;
end;
procedure TUniMainModule.AumentarOrdemModulo(const IdCurso, PosicaoAtual: Integer);
var
  Ultima: Integer;
begin
  /// Aumentar
  QryAux.Close;
  QryAux.SQL.Text := 'SELECT MAX(MOD_ORDEM_POSICAO) AS Ultima FROM MODULOS WHERE CUR_ID = ' + IdCurso.ToString;
  QryAux.Open;
  Ultima := QryAux.FieldByName('Ultima').AsInteger;
  QryAux.Close;

  /// Atualiza Posterior - e reserva sequencia
  if PosicaoAtual <> Ultima then
  begin
    QryAux.SQL.Text := 'UPDATE MODULOS SET MOD_ORDEM_POSICAO = -888 ' +
       'WHERE CUR_ID = ' + IdCurso.ToString + ' AND MOD_ORDEM_POSICAO = ' + Integer(PosicaoAtual + 1).ToString;
    QryAux.ExecSQL();

    /// Atualiza Atual
    QryAux.SQL.Text := 'UPDATE MODULOS SET MOD_ORDEM_POSICAO = ' + Integer(PosicaoAtual + 1).ToString + ' ' +
       'WHERE CUR_ID = ' + IdCurso.ToString + ' AND MOD_ORDEM_POSICAO = ' + PosicaoAtual.ToString;
    QryAux.ExecSQL();

    /// Ajusta o reservado
    QryAux.SQL.Text := 'UPDATE MODULOS SET MOD_ORDEM_POSICAO = ' + PosicaoAtual.ToString + ' ' +
      'WHERE CUR_ID = ' + IdCurso.ToString + ' AND MOD_ORDEM_POSICAO = -888';
    QryAux.ExecSQL();

    /// Executa ordenação
    OrdenarModulosPor('MOD_ORDEM_POSICAO');
  end;
end;

procedure TUniMainModule.CarregarCursosTrilhas;
begin
  cdsCursosTrilhas.EmptyDataSet;

  QryAux.Close;
  QryAux.SQL.Clear;

  QryAux.SQL.Add('SELECT ' +
                '   C.CUR_ID,  ' +
                '   C.CUR_NOME,  ' +
                '   ISNULL ((SELECT TRC_ORDEM_POSICAO FROM TRILHAS_CURSOS TC2 ' +
                '            WHERE  ' +
                '                TC2.TRI_ID = ' + tblTrilhasTRI_ID.AsInteger.ToString  +
                '            AND ' +
                '                TC2.CUR_ID = C.CUR_ID), 0) AS TRC_ORDEM_POSICAO, ' +
                '(CASE  ' +
                ' WHEN (SELECT COUNT(*) ' +
                '       FROM ' +
                '          TRILHAS_CURSOS TC ' +
                '       WHERE ' +
                '          TC.CUR_ID = C.CUR_ID ' +
                '       AND ' +
                '          TC.TRI_ID = ' + tblTrilhasTRI_ID.AsInteger.ToString  + ') > 0 THEN  ' +
                '   ''S''  ' +
                ' ELSE   ' +
                '   ''N''  ' +
                ' END) as VINCULADO  ' +
                'FROM   ' +
                '  CURSOS C   ' +
                'WHERE  ' +
                '  C.FG_EXCLUIDO = 0 AND C.ID_EMPRESA = 1   ' +
                'ORDER BY C.CUR_NOME;');

  QryAux.Open;

  while not QryAux.Eof do
  begin
    cdsCursosTrilhas.Append;
    cdsCursosTrilhasTRI_ID.AsInteger := tblTrilhasTRI_ID.AsInteger;
    cdsCursosTrilhasCUR_NOME.AsString := QryAux.FieldByName('CUR_NOME').AsString;
    cdsCursosTrilhasCUR_ID.AsInteger := QryAux.FieldByName('CUR_ID').AsInteger;
    cdsCursosTrilhasMARCADO.AsBoolean := (QryAux.FieldByName('VINCULADO').AsString = 'S');
    cdsCursosTrilhasTRC_ORDEM_POSICAO.AsInteger := QryAux.FieldByName('TRC_ORDEM_POSICAO').AsInteger;
    cdsCursosTrilhas.Post;

    QryAux.Next;
  end;
  cdsCursosTrilhas.First;
end;

procedure TUniMainModule.CarregarProfessoresCurso;
begin
  cdsProfessoresCurso.EmptyDataSet;

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add('SELECT ' +
                 '  PR.PRO_ID, ' +
                 '  PR.PRO_NOME, ' +
                 '  PR.PRO_FOTO, ' +
                 '  (CASE ' +
                 '   WHEN (SELECT COUNT(*) ' +
                 '         FROM ' +
                 '        CURSOS_PROFESSORES CP ' +
                 '     WHERE ' +
                 '        CP.PRO_ID = PR.PRO_ID ' +
                 '     AND ' +
                 '        CP.CUR_ID = ' + tblCursosCUR_ID.AsInteger.ToString + ') > 0 THEN  ' +
                 '     ''S'' ' +
                 '   ELSE ' +
                 '     ''N'' ' +
                 '   END) as VINCULADO ' +
                 'FROM ' +
                 '  PROFESSORES PR ' +
                 'WHERE ' +
                 '  PR.FG_EXCLUIDO = 0 AND PR.ID_EMPRESA = 1 ' +
                 'ORDER BY PR.PRO_NOME');
  QryAux.Open;

  while not QryAux.Eof do
  begin
    cdsProfessoresCurso.Append;
    cdsProfessoresCursoCUR_ID.AsInteger := tblCursosCUR_ID.AsInteger;
    cdsProfessoresCursoPRO_ID.AsInteger := QryAux.FieldByName('PRO_ID').AsInteger;
    cdsProfessoresCursoPRO_NOME.AsString := QryAux.FieldByName('PRO_NOME').AsString;
    cdsProfessoresCursoMARCADO.AsBoolean := (QryAux.FieldByName('VINCULADO').AsString = 'S');

    if (Trim(QryAux.FieldByName('PRO_FOTO').AsString) <> '') and FileExists(QryAux.FieldByName('PRO_FOTO').AsString)  then
      cdsProfessoresCursoCC_FOTO.Value := '<img style="border-radius: 50%;" width=32 height=32 src="files/' + ExtractFileName(QryAux.FieldByName('PRO_FOTO').AsString) + '"/>'
    else
      cdsProfessoresCursoCC_FOTO.Value := '<img style="border-radius: 50%;" width=32 height=32 src="files/sem-foto.png"/>';

    cdsProfessoresCurso.Post;

    QryAux.Next;
  end;
  cdsProfessoresCurso.First;
end;

procedure TUniMainModule.CarregarTrilhasFixas;
begin
  cdsTrilhasFixas.EmptyDataSet;

  QryAux.Close;
  QryAux.SQL.Clear;

  QryAux.SQL.Add('SELECT ' +
                 '  T.TRI_ID, ' +
                 '  T.TRI_NOME ' +
                 ' FROM  ' +
                 '   TRILHAS T ' +
                 ' WHERE ' +
                 '   T.TRI_ID NOT IN (SELECT TF.TRI_ID FROM TRILHAS_FIXAS TF WHERE TF.ID_EMPRESA = 1 AND TF.FG_EXCLUIDO = 0) ' +
                 ' AND T.ID_EMPRESA = 1 AND T.FG_EXCLUIDO = 0 ' +
                 'ORDER BY T.TRI_ID DESC');

  QryAux.Open;

  while not QryAux.Eof do
  begin
    cdsTrilhasFixas.Append;
    cdsTrilhasFixasTRI_ID.AsInteger := QryAux.FieldByName('TRI_ID').AsInteger;
    cdsTrilhasFixasTRI_NOME.AsString := QryAux.FieldByName('TRI_NOME').AsString;
    cdsTrilhasFixasMARCADO.AsBoolean := False;
    cdsTrilhasFixas.Post;

    QryAux.Next;
  end;
  cdsTrilhasFixas.First;
end;

procedure TUniMainModule.cdsCursosTrilhasCalcFields(DataSet: TDataSet);
begin
  /// MARCADO
  if (cdsCursosTrilhasMARCADO.AsBoolean) then
    cdsCursosTrilhasCC_MARCADO.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    cdsCursosTrilhasCC_MARCADO.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';
end;

procedure TUniMainModule.cdsProfessoresCursoCalcFields(DataSet: TDataSet);
begin
  /// MARCADO
  if (cdsProfessoresCursoMARCADO.AsBoolean) then
    cdsProfessoresCursoCC_MARCADO.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    cdsProfessoresCursoCC_MARCADO.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';
end;

procedure TUniMainModule.cdsTrilhasFixasCalcFields(DataSet: TDataSet);
begin
  /// MARCADO
  if (cdsTrilhasFixasMARCADO.AsBoolean) then
    cdsTrilhasFixasCC_MARCADO.AsString := '<img style="width: auto;" width=70 height=32 src="files/' + _CHECK_MARCADO + '"/>'
  else
    cdsTrilhasFixasCC_MARCADO.AsString := '<img style="height: auto;" width=45 height=32 src="files/' + _CHECK_DESMARCADO + '"/>';
end;

procedure TUniMainModule.DCallBackExcluirCurso(Sender: TComponent; Res: Integer);
begin
  if Res = mrYes then
  begin
    tblCursos.Edit;
    tblCursosFG_EXCLUIDO.AsBoolean := True;
    tblCursos.Post;
    tblCursos.Refresh;
  end;
end;

procedure TUniMainModule.DCallBackExcluirUsuarios(Sender: TComponent; Res: Integer);
begin
  if Res = mrYes then
  begin
    tblUsers.Edit;
    tblUsersFG_EXCLUIDO.AsBoolean := True;
    tblUsers.Post;
    tblUsers.Refresh;
  end;
end;

procedure TUniMainModule.DiminuirOrdemAula(const IdModulo, PosicaoAtual: Integer);
begin
  /// Diminuir

  if PosicaoAtual > 1 then
  begin
    QryAux.Close;

    /// Atualiza Anterior - e reserva sequencia
    QryAux.SQL.Text := 'UPDATE AULAS_MODULOS SET AUL_ORDEM_POSICAO = -999 ' +
       'WHERE MOD_ID = ' + IdModulo.ToString + ' AND AUL_ORDEM_POSICAO = ' + Integer(PosicaoAtual - 1).ToString;
    QryAux.ExecSQL();

    /// Atualiza Atual
    QryAux.SQL.Text := 'UPDATE AULAS_MODULOS SET AUL_ORDEM_POSICAO = ' + Integer(PosicaoAtual - 1).ToString + ' ' +
       'WHERE MOD_ID = ' + IdModulo.ToString + ' AND AUL_ORDEM_POSICAO = ' + PosicaoAtual.ToString;
    QryAux.ExecSQL();

    /// Ajusta o reservado
    QryAux.SQL.Text := 'UPDATE AULAS_MODULOS SET AUL_ORDEM_POSICAO = ' + PosicaoAtual.ToString + ' ' +
      'WHERE MOD_ID = ' + IdModulo.ToString + ' AND AUL_ORDEM_POSICAO = -999';
    QryAux.ExecSQL();

    /// Executa ordenação
    OrdenarAulasPor('AUL_ORDEM_POSICAO');
  end;
end;

procedure TUniMainModule.DiminuirOrdemCursoTrilha(const IdTrilha, PosicaoAtual: Integer);
begin
  /// Diminuir
  /// Atualiza Anterior - e reserva sequencia
  if PosicaoAtual > 1 then
  begin
    QryAux.Close;

    QryAux.SQL.Text := 'UPDATE TRILHAS_CURSOS SET TRC_ORDEM_POSICAO = -999 ' +
       'WHERE TRI_ID = ' + IdTrilha.ToString + ' AND TRC_ORDEM_POSICAO = ' + Integer(PosicaoAtual - 1).ToString;
    QryAux.ExecSQL();

    /// Atualiza Atual
    QryAux.SQL.Text := 'UPDATE TRILHAS_CURSOS SET TRC_ORDEM_POSICAO = ' + Integer(PosicaoAtual - 1).ToString + ' ' +
       'WHERE TRI_ID = ' + IdTrilha.ToString + ' AND TRC_ORDEM_POSICAO = ' + PosicaoAtual.ToString;
    QryAux.ExecSQL();

    /// Ajusta o reservado
    QryAux.SQL.Text := 'UPDATE TRILHAS_CURSOS SET TRC_ORDEM_POSICAO = ' + PosicaoAtual.ToString + ' ' +
      'WHERE TRI_ID = ' + IdTrilha.ToString + ' AND TRC_ORDEM_POSICAO = -999';
    QryAux.ExecSQL();

    /// Executa ordenação
    OrdenarTrilhasCursoPor('TRC_ORDEM_POSICAO');
  end;
end;

procedure TUniMainModule.DiminuirOrdemCursoTrilhaFixa(PosicaoAtual: Integer);
begin
  /// Diminuir
  /// Atualiza Anterior - e reserva sequencia
  if PosicaoAtual > 1 then
  begin
    QryAux.Close;

    QryAux.SQL.Text := 'UPDATE TRILHAS_FIXAS SET TRF_ORDEM_POSICAO = -999 ' +
       'WHERE TRF_ORDEM_POSICAO = ' + Integer(PosicaoAtual - 1).ToString;
    QryAux.ExecSQL();

    /// Atualiza Atual
    QryAux.SQL.Text := 'UPDATE TRILHAS_FIXAS SET TRF_ORDEM_POSICAO = ' + Integer(PosicaoAtual - 1).ToString + ' ' +
       'WHERE TRF_ORDEM_POSICAO = ' + PosicaoAtual.ToString;
    QryAux.ExecSQL();

    /// Ajusta o reservado
    QryAux.SQL.Text := 'UPDATE TRILHAS_FIXAS SET TRF_ORDEM_POSICAO = ' + PosicaoAtual.ToString + ' ' +
      'WHERE TRF_ORDEM_POSICAO = -999';
    QryAux.ExecSQL();

    /// Executa ordenação
    OrdenarTrilhasFixasPor('TRF_ORDEM_POSICAO');
  end;
end;

procedure TUniMainModule.DiminuirOrdemModulo(const IdCurso, PosicaoAtual: Integer);
begin
  /// Diminuir
  /// Atualiza Anterior - e reserva sequencia
  if PosicaoAtual > 1 then
  begin
    QryAux.Close;

    QryAux.SQL.Text := 'UPDATE MODULOS SET MOD_ORDEM_POSICAO = -999 ' +
       'WHERE  CUR_ID = ' + IdCurso.ToString + ' AND MOD_ORDEM_POSICAO = ' + Integer(PosicaoAtual - 1).ToString;
    QryAux.ExecSQL();

    /// Atualiza Atual
    QryAux.SQL.Text := 'UPDATE MODULOS SET MOD_ORDEM_POSICAO = ' + Integer(PosicaoAtual - 1).ToString + ' ' +
       'WHERE  CUR_ID = ' + IdCurso.ToString + ' AND MOD_ORDEM_POSICAO = ' + PosicaoAtual.ToString;
    QryAux.ExecSQL();

    /// Ajusta o reservado
    QryAux.SQL.Text := 'UPDATE MODULOS SET MOD_ORDEM_POSICAO = ' + PosicaoAtual.ToString + ' ' +
      'WHERE  CUR_ID = ' + IdCurso.ToString + ' AND MOD_ORDEM_POSICAO = -999';
    QryAux.ExecSQL();

    /// Executa ordenação
    OrdenarModulosPor('MOD_ORDEM_POSICAO');
  end;
end;

procedure TUniMainModule.actExcluirAlunosExecute(Sender: TObject);
begin
  if tblAlunos.State in dsEditModes then
    tblAlunos.Post;

  if not tblAlunos.IsEmpty then
    MessageDlg('Deseja realmente excluir o aluno "' + tblAlunosALU_NOME.AsString + '"?', mtConfirmation, mbYesNo, DCallBackExcluirAluno);
end;

procedure TUniMainModule.DCallBackExcluirModulo(Sender: TComponent; Res: Integer);
begin
  if Res = mrYes then
  begin
    tblModulos.Edit;
    tblModulosFG_EXCLUIDO.AsBoolean := True;
    tblModulos.Post;
    tblModulos.Refresh;
  end;
end;

procedure TUniMainModule.DCallBackExcluirProfessor(Sender: TComponent; Res: Integer);
begin
  if Res = mrYes then
  begin
    tblProfessores.Edit;
    tblProfessoresFG_EXCLUIDO.AsBoolean := True;
    tblProfessores.Post;
    tblProfessores.Refresh;
  end;
end;

procedure TUniMainModule.DCallBackExcluirTrilha(Sender: TComponent; Res: Integer);
begin
    if Res = mrYes then
  begin
    tblTrilhas.Edit;
    tblTrilhasFG_EXCLUIDO.AsBoolean := True;
    tblTrilhas.Post;
    tblTrilhas.Refresh;
  end;
end;

procedure TUniMainModule.DCallBackExcluirTrilhaFixa(Sender: TComponent; Res: Integer);
var
  Posicao: Integer;
begin
  if Res = mrYes then
  begin
    Posicao := tblTrilhasFixasTRF_ORDEM_POSICAO.AsInteger;
    tblTrilhasFixas.Edit;
    tblTrilhasFixasFG_EXCLUIDO.AsBoolean := True;
    tblTrilhasFixas.Post;
    ReordenarTrilhasFixas(Posicao);
    tblTrilhasFixas.Refresh;
  end;
end;

procedure TUniMainModule.actCarregarImagemChamadaCursoExecute(Sender: TObject);
begin
   DFormCarregarImagemChamadaCurso.ShowModal();
end;

procedure TUniMainModule.actCarregarImagemMiniaturaCursoExecute(Sender: TObject);
begin
  DFormCarregarImagemMiniaturaCurso.ShowModal();
end;

procedure TUniMainModule.ReordenarCursosTrilhas(const IdTrilha, PosicaoExcluida: Integer);
begin
  /// Reordena todos
  QryAux.SQL.Text := 'UPDATE TRILHAS_CURSOS SET TRC_ORDEM_POSICAO = (TRC_ORDEM_POSICAO -1)' +
     'WHERE TRI_ID = ' + IdTrilha.ToString + ' AND  TRC_ORDEM_POSICAO <> -888 and TRC_ORDEM_POSICAO <> -999 AND TRC_ORDEM_POSICAO > ' + PosicaoExcluida.ToString;
  QryAux.ExecSQL();

  /// Executa ordenação
  OrdenarTrilhasCursoPor('TRC_ORDEM_POSICAO');
end;

procedure TUniMainModule.ReordenarTrilhasFixas(const PosicaoExcluida: Integer);
begin
  /// Reordena todos
  QryAux.SQL.Text := 'UPDATE TRILHAS_FIXAS SET TRF_ORDEM_POSICAO = (TRF_ORDEM_POSICAO -1)' +
     'WHERE TRF_ORDEM_POSICAO <> -888 and TRF_ORDEM_POSICAO <> -999 AND TRF_ORDEM_POSICAO > ' + PosicaoExcluida.ToString;
  QryAux.ExecSQL();

  /// Executa ordenação
  OrdenarTrilhasFixasPor('TRF_ORDEM_POSICAO');
end;

procedure TUniMainModule.ResetRequest;
begin
  //cdsVideosVimeo.EmptyDataSet;

  FErroAoProcessarApiVimeo := False;

  /// Reseta componentes
  RESTRequest.ResetToDefaults;
  RESTClient.ResetToDefaults;
  RESTResponse.ResetToDefaults;
  RESTRequest.Method := TRESTRequestMethod.rmPOST;
  RESTRequest.Params.Clear;
end;

procedure TUniMainModule.ProcessarResponse;
var
   RespostaJson: TStringList;
   FileRespostaApiVimeo: String;
begin
  RespostaJson := TStringList.Create;
  try
    if FErroAoProcessarApiVimeo then
    begin
       RespostaJson.Add('Erro ao processar!');
       RespostaJson.Add('');
       RespostaJson.Add('Código erro: ' + RESTResponse.StatusCode.ToString +
         ' - Mensagem: ' + RESTResponse.StatusText);
    end
    else
      RespostaJson.Add('Sucesso ao processar!');

    RespostaJson.Add('');
    RespostaJson.Add('Resposta JSON: ');
    RespostaJson.Add(RESTResponse.Content);

    FileRespostaApiVimeo := UniServerModule.PastaFiles + '_Resposta_api_vimeo_' +
      FormatDateTime('ddmmyyyyhhnnss', Now) + '_Codigo_' + RESTResponse.StatusCode.ToString + '_' +
        RESTResponse.StatusText + '.txt';

    RespostaJson.SaveToFile(FileRespostaApiVimeo);
  finally
    RespostaJson.Free;
  end;
end;

procedure HookResourceString(rs: PResStringRec; newStr: PChar);
var
  oldprotect: DWORD;
begin
  VirtualProtect(rs, SizeOf(rs^), PAGE_EXECUTE_READWRITE, @oldprotect);
  rs^.Identifier := Integer(newStr);
  VirtualProtect(rs, SizeOf(rs^), oldprotect, @oldprotect);
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
  HookResourceString(@SMsgDlgConfirm, PChar('Confirmação'));
end.
