unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Phys, FireDAC.Comp.Client,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite,
  FireDAC.ConsoleUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MSSQLDef, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL;

type
  TUniServerModule = class(TUniGUIServerModule)
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    procedure UniGUIServerModuleCreate(Sender: TObject);
    procedure UniGUIServerModuleBeforeInit(Sender: TObject);
  private
    FConnString : string;
    FArquivoIni: String;
    FDatabase: String;
    FUser_Name: String;
    FPassword: String;
    FDriverID: String;
    FServer: String;
    FArquivoIniEncontrado: Boolean;
    FPastaFiles: STring;
  protected
    procedure FirstInit; override;
  public
    property ConnString : string read FConnString;

    property ArquivoIni: String read FArquivoIni;
    property ArquivoIniEncontrado: Boolean read FArquivoIniEncontrado;
    property Database: String read FDatabase;
    property User_Name: String read FUser_Name;
    property Password: String read FPassword;
    property DriverID: String read FDriverID;
    property Server: String read FServer;

    property PastaFiles: String read FPastaFiles;
  end;

function UniServerModule: TUniServerModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, Inifiles;

function UniServerModule: TUniServerModule;
begin
  Result := TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

procedure TUniServerModule.UniGUIServerModuleBeforeInit(Sender: TObject);
begin
  MimeTable.AddMimeType('eot', 'application/font',  False);
  MimeTable.AddMimeType('svg', 'application/font',  False);
  MimeTable.AddMimeType('ttf', 'application/font',  False);
  MimeTable.AddMimeType('woff', 'application/font', False);
end;

procedure TUniServerModule.UniGUIServerModuleCreate(Sender: TObject);
var
  ini: TInifile;
begin
  FPastaFiles := FilesFolderPath;

  FArquivoIni := FilesFolderPath + 'BD.ini';
  FArquivoIniEncontrado := FileExists(ArquivoIni);

  ini := TInifile.Create(ArquivoIni);
  try
    FDatabase := ini.ReadString('Database', 'Database', '');
    FUser_Name := ini.ReadString('Database', 'User_Name', 'SA');
    FPassword := ini.ReadString('Database', 'Password', '');
    FDriverID := ini.ReadString('Database', 'DriverID', '');
    FServer := ini.ReadString('Database', 'Server', '');
  finally
    ini.Free;
  end;

  PFmtSettings.DateSeparator := '/';
  PFmtSettings.CurrencyFormat := 0;
  PFmtSettings.CurrencyString := 'R$';
  PFmtSettings.ShortDateFormat := 'dd/mm/yyyy';

  MimeTable.AddMimeType('ttf', 'application/font', False);
end;

initialization
  RegisterServerModuleClass(TUniServerModule);
end.
