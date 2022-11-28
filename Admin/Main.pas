unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniLabel,
  uniButton, uniToolBar, uniBitBtn, Vcl.Menus, uniMainMenu, uniPanel, uniTreeView, uniTreeMenu, uniImage,
  uniScrollBox, unimTreeMenu, uniPageControl, uniSpeedButton, uniGUIFrame;

type
  TMainForm = class(TUniForm)
    UniPageControl1: TUniPageControl;
    UniPanel1: TUniPanel;
    imgMenu: TUniImage;
    imgUsuarioLogado: TUniImage;
    UniScrollBox1: TUniScrollBox;
    UnimTreeMenu1: TUnimTreeMenu;
    lblBotaoSair: TUniLabel;
    imgSair: TUniImage;
    imgLogo: TUniImage;
    procedure Exit1Click(Sender: TObject);
    procedure Logoff1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UnimTreeMenu1Click(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure lblBotaoSairClick(Sender: TObject);
    procedure imgMenuMouseEnter(Sender: TObject);
    procedure imgMenuMouseLeave(Sender: TObject);
    procedure imgSairMouseEnter(Sender: TObject);
  private
    FMenuExpandido: Boolean;

    procedure EstenderEncolherMenu;
    procedure EncolherMenu;
    procedure ExpandirMenu;
  public
    procedure OpenFrame(AClassName, ACaption: string; const MultiClasse: Boolean = False);
    procedure RemoveTabPagina(const CodigoTag: Integer);
    procedure CarregarImagemUsuarioLogado;
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, ServerModule, DEditarAlunosForm;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TMainForm.Logoff1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TMainForm.UniFormCreate(Sender: TObject);
begin
  //UnimTreeMenu1.Images := UniMainModule.UniNativeImageListMenu;

  UnimTreeMenu1.Width := 260;
  UniScrollBox1.Width := 260;

  FMenuExpandido := True;

  /// Carregar imagem do usuário logado
  CarregarImagemUsuarioLogado;;

  if FileExists(UniServerModule.PastaFiles + 'Menu.png') then
    imgMenu.Picture.LoadFromFile(UniServerModule.PastaFiles + 'Menu.png');

  if FileExists(UniServerModule.PastaFiles + 'Sair_Leave.png') then
    imgSair.Picture.LoadFromFile(UniServerModule.PastaFiles + 'Sair_Leave.png');

  if FileExists(UniServerModule.PastaFiles + 'logo.png') then
    imgLogo.Picture.LoadFromFile(UniServerModule.PastaFiles + 'logo.png');
end;

procedure TMainForm.CarregarImagemUsuarioLogado;
begin
  if FileExists(UniMainModule.ImagemUsuarioLogado) then
  begin
    imgUsuarioLogado.Picture.LoadFromFile(UniMainModule.ImagemUsuarioLogado);
    //imgUsuarioLogado.Stretch := True;
  end
  else
  if FileExists(UniServerModule.PastaFiles + 'User.png') then
    imgUsuarioLogado.Picture.LoadFromFile(UniServerModule.PastaFiles + 'User.png');
end;

procedure TMainForm.UniFormShow(Sender: TObject);
begin
  imgMenuClick(imgMenu);
end;

procedure TMainForm.imgMenuClick(Sender: TObject);
begin
  EstenderEncolherMenu;
end;

procedure TMainForm.imgMenuMouseEnter(Sender: TObject);
begin
//  if not FMenuExpandido then
//    ExpandirMenu;
end;

procedure TMainForm.imgMenuMouseLeave(Sender: TObject);
begin
//  if FMenuExpandido then
//    EncolherMenu;
end;

procedure TMainForm.imgSairMouseEnter(Sender: TObject);
begin
  if FileExists(UniServerModule.PastaFiles + 'Sair_Enter_Dourado.png') then
    imgSair.Picture.LoadFromFile(UniServerModule.PastaFiles + 'Sair_Enter_Dourado.png');
end;

procedure TMainForm.EstenderEncolherMenu;
begin
  if FMenuExpandido then
    EncolherMenu
  else
    ExpandirMenu;
end;

procedure TMainForm.EncolherMenu;
begin
  UnimTreeMenu1.Width := 39;
  UniScrollBox1.Width := 39;
  FMenuExpandido := False;
end;

procedure TMainForm.ExpandirMenu;
begin
  UnimTreeMenu1.Width := 260;
  UniScrollBox1.Width := 260;
  FMenuExpandido := True;
end;

procedure TMainForm.lblBotaoSairClick(Sender: TObject);
begin
  UniSession.Terminate();
end;

procedure TMainForm.OpenFrame(AClassName, ACaption: string; const MultiClasse: Boolean);
var
  Ts : TUniTabSheet;
  i, ActivePage_id :integer;
  FrC : TUniFrameClass;
  Fr : TUniFrame;
begin
  if AClassName <> '' then
   begin
     ActivePage_id := -1;
     if not MultiClasse then
     begin
        for i := 0 to UniPageControl1.PageCount -1 do
          begin
            if UniPageControl1.Pages[i].Caption = ACaption then
             begin
              UniPageControl1.ActivePageIndex := i;
              ActivePage_id := 0;
              Break;
             end;
          end;
     end;

    if ActivePage_id = -1 then
      begin
        Ts := TUniTabSheet.Create(Self);
        Ts.Closable := True;
        Ts.PageControl := UniPageControl1;
        Ts.Tag := UniPageControl1.PageCount;
        UniPageControl1.ActivePage := Ts;

        FrC := TUniFrameClass(FindClass(AClassName));
        Fr := FrC.Create(Ts);

        if AClassName = 'TDEditarAlunosForm' then
        begin
          if Pos('(ALTERAÇÃO)', ACaption) > 0 then
            TDEditarAlunosForm(Fr).SetEditar(UniMainModule.tblAlunosALU_ID.AsInteger)
          else
           TDEditarAlunosForm(Fr).SetInserir;
        end;

        if ACaption = 'CADASTRO NOVO ALUNO' then
          Ts.Caption := ACaption + ' (' + Ts.Tag.ToString + ') '
        else
        if Pos('(ALTERAÇÃO)', ACaption) > 0 then
          Ts.Caption := StringReplace(ACaption, '(ALTERAÇÃO)', '', [rfReplaceAll, rfIgnoreCase])
        else
          Ts.Caption := ACaption;
        Fr.Align := alClient;
        Fr.Parent := Ts;
      end;
   end;
end;

procedure TMainForm.RemoveTabPagina(const CodigoTag: Integer);
var
  i: Integer;
begin
  for i := 0 to UniPageControl1.PageCount -1 do
  begin
    if UniPageControl1.Pages[i].Tag = CodigoTag then
     begin
      UniPageControl1.Pages[i].Free;
      Break;
     end;
  end;
end;

procedure TMainForm.UnimTreeMenu1Click(Sender: TObject);
var
  AClassName: String;
  ACaption: String;
begin
  UnimTreeMenu1.Selected.Expand(not UnimTreeMenu1.Selected.Expanded);
  UnimTreeMenu1.Selected.Expanded := not UnimTreeMenu1.Selected.Expanded;

  AClassName := '';
  ACaption := '';

  /// Cadastro de Cursos
  if UnimTreeMenu1.Selected.Text = 'Cadastro' then
  begin
     AClassName := 'TDFormCadCursos';
     ACaption := 'Cadastro de Cursos';

     if FMenuExpandido then
       EstenderEncolherMenu;
  end;

  /// Cadastro de usuarios
  if UnimTreeMenu1.Selected.Text = 'Usuários' then
  begin
    if not UniMainModule.UsuarioAdministrador then
      ShowMessage('Sem permissão para acessar cadastro de usuários!')
    else
    begin
      AClassName := 'TDUsersForm';
      ACaption := 'Cadastro de Usuários';

      if FMenuExpandido then
         EstenderEncolherMenu;
    end;
  end;

  /// Cadastro de professores
  if UnimTreeMenu1.Selected.Text = 'Professores' then
  begin
    AClassName := 'TDProfessoresForm';
    ACaption := 'Cadastro de Professores';

    if FMenuExpandido then
      EstenderEncolherMenu;
  end;

  /// Cadastro de alunos
  if Pos('Alunos', UnimTreeMenu1.Selected.Text) > 0 then
  begin
    AClassName := 'TDAlunosForm';
    ACaption := 'Cadastro de Alunos';

    if FMenuExpandido then
      EstenderEncolherMenu;
  end;

  /// Cadastro de Trilhas
  if Pos('Trilhas<', UnimTreeMenu1.Selected.Text) > 0 then
  begin
     AClassName := 'TDFormCadTrilhas';
     ACaption := 'Cadastro de Trilhas';

     if FMenuExpandido then
       EstenderEncolherMenu;
  end;

  /// Cadastro de Trilhas
  if UnimTreeMenu1.Selected.Text = 'Trilhas Fixas' then
  begin
     AClassName := 'TDFormCadTrilhasFixas';
     ACaption := 'Cadastro de Trilhas Fixas';

     if FMenuExpandido then
       EstenderEncolherMenu;
  end;

  if AClassName <> '' then
    OpenFrame(AClassName, ACaption)
  else
  if not FMenuExpandido then
    EstenderEncolherMenu;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
