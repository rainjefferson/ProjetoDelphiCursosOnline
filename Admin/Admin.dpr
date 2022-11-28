{$define UNIGUI_VCL} // Comment out this line to turn this project into an ISAPI module'

{$ifndef UNIGUI_VCL}
library
{$else}
program
{$endif}
  Admin;

uses
  uniGUIISAPI,
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  Mainm in 'Mainm.pas' {MainmForm: TUnimForm},
  Interfaces in 'Interfaces.pas',
  mobServicos in 'mobServicos.pas',
  dskServicos in 'dskServicos.pas',
  FormLogin in 'FormLogin.pas' {UniLoginForm1: TUniLoginForm},
  MFormLogin in 'MFormLogin.pas' {UnimLoginForm1: TUnimLoginForm},
  DFormCadastroCursos in 'DFormCadastroCursos.pas' {DFormCadCursos: TUniForm},
  DUsersForm in 'DUsersForm.pas' {DUsersForm: TUniForm},
  DCarregarImagemCapaCurso in 'DCarregarImagemCapaCurso.pas' {DFormCarregarImagemCapaCurso: TUniForm},
  DCarregarImagemDestaqueCurso in 'DCarregarImagemDestaqueCurso.pas' {DFormCarregarImagemDestaqueCurso: TUniForm},
  DCarregarHtmlConteudoCurso in 'DCarregarHtmlConteudoCurso.pas' {DFormCarregarHtmlConteudoCurso: TUniForm},
  DCarregarImagemUsuario in 'DCarregarImagemUsuario.pas' {DFormCarregarImagemUsuario: TUniForm},
  DCarregarImagemBanner in 'DCarregarImagemBanner.pas' {DFormCarregarImagemBanner: TUniForm},
  DCarregarVideosVimeo in 'DCarregarVideosVimeo.pas' {DFormCarregarVideosVimeo: TUniForm},
  DCarregarHtmlCertificadoCurso in 'DCarregarHtmlCertificadoCurso.pas' {DFormCarregarHtmlCertificadoCurso: TUniForm},
  DCarregarHtmlProvaCurso in 'DCarregarHtmlProvaCurso.pas' {DFormCarregarHtmlProvaCurso: TUniForm},
  DProfessoresForm in 'DProfessoresForm.pas' {DProfessoresForm: TUniFrame},
  DCarregarImagemProfessor in 'DCarregarImagemProfessor.pas' {DFormCarregarImagemProfessor: TUniForm},
  DCarregarImagemMiniaturaCurso in 'DCarregarImagemMiniaturaCurso.pas' {DFormCarregarImagemMiniaturaCurso: TUniForm},
  DCarregarImagemChamadaCurso in 'DCarregarImagemChamadaCurso.pas' {DFormCarregarImagemChamadaCurso: TUniForm},
  DCarregarHtmlProfessor in 'DCarregarHtmlProfessor.pas' {DFormCarregarHtmlProfessor: TUniForm},
  DVincularProfessoresCurso in 'DVincularProfessoresCurso.pas' {DFormVincularProfessoresCurso: TUniForm},
  uConsts_SQL in 'uConsts_SQL.pas',
  DCarregarApostilaAula in 'DCarregarApostilaAula.pas' {DFormCarregarApostilaAula: TUniForm},
  DCarregarAudio in 'DCarregarAudio.pas' {DFormCarregarAudio: TUniForm},
  DAlunosForm in 'DAlunosForm.pas' {DAlunosForm: TUniFrame},
  DEditarAlunosForm in 'DEditarAlunosForm.pas' {DEditarAlunosForm: TUniFrame},
  DFormCadastroTrilhas in 'DFormCadastroTrilhas.pas' {DFormCadTrilhas: TUniFrame},
  DVincularCursosTrilhas in 'DVincularCursosTrilhas.pas' {DFormVincularCursosTrilhas: TUniForm},
  DFormCadastroTrilhasFixas in 'DFormCadastroTrilhasFixas.pas' {DFormCadTrilhasFixas: TUniFrame},
  DVincularCursosTrilhasFixas in 'DVincularCursosTrilhasFixas.pas' {DFormVincularCursosTrilhasFixas: TUniForm};

{$R *.res}

{$ifndef UNIGUI_VCL}
exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;
{$endif}

begin
{$ifdef UNIGUI_VCL}
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
{$endif}
end.
