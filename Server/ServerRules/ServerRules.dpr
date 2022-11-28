program ServerRules;
{$APPTYPE GUI}

{$R *.dres}

uses
  FMX.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FrmPrincipal in '..\FrmPrincipal.pas' {FrPrincipal},
  ServerMethodsServerRules in 'ServerMethodsServerRules.pas' {SMRegras: TDSServerModule},
  WebModuleServerRules in 'WebModuleServerRules.pas' {WebModule1: TWebModule},
  udmDados in '..\udmDados.pas' {dmDados: TDataModule},
  Consts_HtmlHome in 'Consts_HtmlHome.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TFrPrincipal, FrPrincipal);
  Application.Run;
end.
