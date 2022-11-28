object WebModule1: TWebModule1
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  Actions = <
    item
      Name = 'HomeAction'
      PathInfo = '/Home'
      Producer = Home
    end
    item
      Name = 'LoginAction'
      PathInfo = '/Login'
      Producer = Login
    end
    item
      Default = True
      Name = 'DefaultAction'
      PathInfo = '/'
      OnAction = WebModuleDefaultAction
    end
    item
      Name = 'UserPlayerAction'
      PathInfo = '/UserPlayer'
      Producer = UserPlayer
    end>
  BeforeDispatch = WebModuleBeforeDispatch
  Height = 407
  Width = 490
  object DSServer1: TDSServer
    Left = 48
    Top = 11
  end
  object DSHTTPWebDispatcher1: TDSHTTPWebDispatcher
    Server = DSServer1
    Filters = <>
    SessionTimeout = 0
    WebDispatch.PathInfo = 'datasnap*'
    Left = 56
    Top = 75
  end
  object DSAuthenticationManager1: TDSAuthenticationManager
    OnUserAuthenticate = DSAuthenticationManager1UserAuthenticate
    OnUserAuthorize = DSAuthenticationManager1UserAuthorize
    Roles = <>
    Left = 208
    Top = 123
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 200
    Top = 11
  end
  object Login: TPageProducer
    HTMLFile = 'templates/Login.html'
    OnHTMLTag = LoginHTMLTag
    Left = 48
    Top = 192
  end
  object Home: TPageProducer
    HTMLFile = 'templates/Home.html'
    OnHTMLTag = LoginHTMLTag
    Left = 200
    Top = 192
  end
  object WebFileDispatcher1: TWebFileDispatcher
    WebFileExtensions = <
      item
        MimeType = 'text/css'
        Extensions = 'css'
      end
      item
        MimeType = 'text/javascript'
        Extensions = 'js'
      end
      item
        MimeType = 'image/x-png'
        Extensions = 'png'
      end
      item
        MimeType = 'text/html'
        Extensions = 'htm;html'
      end
      item
        MimeType = 'image/jpeg'
        Extensions = 'jpg;jpeg;jpe'
      end
      item
        MimeType = 'image/gif'
        Extensions = 'gif'
      end>
    BeforeDispatch = WebFileDispatcher1BeforeDispatch
    WebDirectories = <
      item
        DirectoryAction = dirInclude
        DirectoryMask = '*'
      end
      item
        DirectoryAction = dirExclude
        DirectoryMask = '\templates\*'
      end>
    RootDirectory = '.'
    VirtualPath = '/'
    Left = 48
    Top = 136
  end
  object DSProxyGenerator1: TDSProxyGenerator
    ExcludeClasses = 'DSMetadata'
    MetaDataProvider = DSServerMetaDataProvider1
    Writer = 'Java Script REST'
    Left = 48
    Top = 248
  end
  object DSServerMetaDataProvider1: TDSServerMetaDataProvider
    Server = DSServer1
    Left = 200
    Top = 248
  end
  object UserPlayer: TPageProducer
    HTMLFile = 'templates/UserPlayer.html'
    OnHTMLTag = UserPlayerHTMLTag
    Left = 336
    Top = 192
  end
end
