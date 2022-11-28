unit udmDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MSSQLDef, FireDAC.Comp.UI,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Forms;

type
  TdmDados = class(TDataModule)
    ConexaoDados: TFDConnection;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    QryTmp: TFDQuery;
    QryTrilhasHome: TFDQuery;
    QryCursosAlunoPlayer: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure ConexaoDadosBeforeConnect(Sender: TObject);
  private
    { Private declarations }
    FUsuarioLogado: Boolean;
    FStatuAluno: String;
    FIdAluno: Integer;
  public
    { Public declarations }

    property UsuarioLogado: Boolean read FUsuarioLogado write FUsuarioLogado;
    property StatuAluno: String read FStatuAluno write FStatuAluno;
    property IdAluno: Integer read FIdAluno write FIdAluno;
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TdmDados.ConexaoDadosBeforeConnect(Sender: TObject);
var
  ArquivoConf: String;
begin
  ArquivoConf := System.SysUtils.GetCurrentDir + '\BD.ini';
  if not FileExists(ArquivoConf) then
    raise Exception.Create('Arquivo de configuração de banco de dados não encontrado "BD.ini".');

  ConexaoDados.Params.LoadFromFile(ArquivoConf);
end;

procedure TdmDados.DataModuleCreate(Sender: TObject);
var
  FileSql: String;
begin
  ConexaoDados.Close;
  FileSql := ExtractFilePath(Application.ExeName) + 'SQL_TRILHAS_HOME.sql' ;
  if FileExists(FileSql) then
  begin
    QryTrilhasHome.SQL.Clear;
    QryTrilhasHome.SQL.LoadFromFile(FileSql);
  end;
end;

end.
