//{$define UNIGUI_VCL} // Comment out this line to turn this project into an ISAPI module

{$ifndef UNIGUI_VCL}
library
{$else}
program
{$endif}
  Admin_Isapi;

uses
  uniGUIISAPI,
  Forms,
  DFormCadastroCursos in 'DFormCadastroCursos.pas' {DFormCadCursos: TUniForm},
  dskServicos in 'dskServicos.pas',
  DUsersForm in 'DUsersForm.pas' {DUsersForm: TUniForm},
  FormLogin in 'FormLogin.pas' {UniLoginForm1: TUniLoginForm},
  Interfaces in 'Interfaces.pas',
  Main in 'Main.pas' {MainForm: TUniForm},
  Mainm in 'Mainm.pas' {MainmForm: TUnimForm},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  MFormLogin in 'MFormLogin.pas' {UnimLoginForm1: TUnimLoginForm},
  mobServicos in 'mobServicos.pas',
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule};

{$R *.res}

{$ifndef UNIGUI_VCL}
exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;
{$endif}

begin
{$ifdef UNIGUI_VCL}
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
{$endif}
end.
