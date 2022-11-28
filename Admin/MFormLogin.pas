unit MFormLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIRegClasses, uniGUIForm, uniGUImForm, uniGUImJSForm, uniButton,
  unimButton, uniEdit, unimEdit, uniGUIBaseClasses, unimFieldSet, uniPanel, uniFieldSet,
  uniImage, unimImage;

type
  TUnimLoginForm1 = class(TUnimLoginForm)
    UnimFieldSet1: TUnimFieldSet;
    UnimContainerPanel1: TUnimContainerPanel;
    btnOK: TUnimButton;
    btnCancel: TUnimButton;
    UnimContainerPanel2: TUnimContainerPanel;
    UnimContainerPanel3: TUnimContainerPanel;
    edtLogin: TUnimEdit;
    edtSenha: TUnimEdit;
    UnimImage1: TUnimImage;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UnimLoginForm1: TUnimLoginForm1;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function UnimLoginForm1: TUnimLoginForm1;
begin
  Result := TUnimLoginForm1(UniMainModule.GetFormInstance(TUnimLoginForm1));
end;

procedure TUnimLoginForm1.btnOKClick(Sender: TObject);
var
  Mensagem: String;
begin
  if uniMainModule.Login(edtLogin.Text, edtSenha.Text, False, Mensagem) then
    ModalResult := mrOk
  else
    ShowMessage(Mensagem);
end;

initialization
  RegisterAppFormClass(TUnimLoginForm1);

end.
