unit FormLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniFieldSet, dxGDIPlusClasses, uniImage, uniGUIBaseClasses,
  uniPanel, uniButton, uniEdit, uniLabel;

type
  TUniLoginForm1 = class(TUniLoginForm)
    UniFieldContainer1: TUniFieldContainer;
    imgLogo: TUniImage;
    UniFieldContainer2: TUniFieldContainer;
    UniFieldSet1: TUniFieldSet;
    btnConfirmar: TUniButton;
    edtSenha: TUniEdit;
    edtLogin: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure UniLoginFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniLoginForm1: TUniLoginForm1;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, ServerModule;

function UniLoginForm1: TUniLoginForm1;
begin
  Result := TUniLoginForm1(UniMainModule.GetFormInstance(TUniLoginForm1));
end;

procedure TUniLoginForm1.btnConfirmarClick(Sender: TObject);
var
  Mensagem: String;
begin
  if uniMainModule.Login(edtLogin.Text, edtSenha.Text, True, Mensagem) then
    ModalResult := mrOk
  else
    ShowMessage(Mensagem);
end;

procedure TUniLoginForm1.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    btnConfirmarClick(btnConfirmar);
  end;
end;

procedure TUniLoginForm1.UniLoginFormShow(Sender: TObject);
begin
  if FileExists(UniServerModule.PastaFiles + 'logo.png') then
    imgLogo.Picture.LoadFromFile(UniServerModule.PastaFiles + 'logo.png');
end;

initialization
  RegisterAppFormClass(TUniLoginForm1);

end.
