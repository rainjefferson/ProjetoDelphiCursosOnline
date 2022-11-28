object UniServerModule: TUniServerModule
  OldCreateOrder = True
  OnCreate = UniGUIServerModuleCreate
  TempFolder = 'temp\'
  SessionTimeout = 3600000
  Port = 8191
  Title = 'Admin - Academia Pregadores'
  BGColor = clWhite
  SuppressErrors = []
  Bindings = <>
  MainFormDisplayMode = mfPage
  CustomFiles.Strings = (
    
      'https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awes' +
      'ome.min.css'
    
      'http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min' +
      '.css'
    'files/jq/jquery.mask.js'
    'files/css/AcademiaPregadores.css')
  CustomMeta.Strings = (
    '')
  ServerMessages.UnavailableErrMsg = 'Servidor indispon'#237'vel, por favor tente mais tarde.'
  ServerMessages.LoadingMessage = 'Carregando...'
  ServerMessages.ExceptionTemplate.Strings = (
    '<html>'
    '<body bgcolor="#dfe8f6">'
    
      '<p style="text-align:center;color:#A05050">Uma exce'#231#227'o ocorreu n' +
      'a aplica'#231#227'o:</p>'
    '<p style="text-align:center;color:#0000A0">[###message###]</p>'
    
      '<p style="text-align:center;color:#A05050"><a href="[###url###]"' +
      '>Reiniciar aplica'#231#227'o</a></p>'
    '</body>'
    '</html>')
  ServerMessages.InvalidSessionTemplate.Strings = (
    '<html>'
    '<body bgcolor="#dfe8f6">'
    '<p style="text-align:center;color:#0000A0">[###message###]</p>'
    
      '<p style="text-align:center;color:#A05050"><a href="[###url###]"' +
      '>Reiniciar aplica'#231#227'o</a></p>'
    '</body>'
    '</html>')
  ServerMessages.TerminateTemplate.Strings = (
    '<html>'
    '<script>'
    'function redirect() {'
    '    location.href = "[###url###]";'
    '}'
    ' window.onpaint = redirect();'
    '</script>'
    '<body bgcolor="#dfe8f6">'
    '</body>'
    '</html>')
  ServerMessages.InvalidSessionMessage = 'Sess'#227'o expirada.'
  ServerMessages.TerminateMessage = 'Sess'#227'o da Web encerrada.'
  SSL.SSLOptions.RootCertFile = 'root.pem'
  SSL.SSLOptions.CertFile = 'cert.pem'
  SSL.SSLOptions.KeyFile = 'key.pem'
  SSL.SSLOptions.Method = sslvSSLv3
  SSL.SSLOptions.SSLVersions = [sslvSSLv3]
  SSL.SSLOptions.Mode = sslmUnassigned
  SSL.SSLOptions.VerifyMode = []
  SSL.SSLOptions.VerifyDepth = 0
  Options = [soShowLicenseInfo, soAutoPlatformSwitch, soRestartSessionOnTimeout, soWipeShadowSessions]
  ConnectionFailureRecovery.ErrorMessage = 'Erro de conex'#227'o'
  ConnectionFailureRecovery.RetryMessage = 'Tentando novamente...'
  ConnectionFailureRecovery.TextColor = clRed
  OnBeforeInit = UniGUIServerModuleBeforeInit
  Height = 210
  Width = 191
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    ScreenCursor = gcrNone
    Left = 80
    Top = 112
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 80
    Top = 40
  end
end
