unit DCarregarImagemUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniGUIBaseClasses,
  uniPanel, uniImage, uniFileUpload, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDFormCarregarImagemUsuario = class(TUniForm)
    UniPanel1: TUniPanel;
    lblVoltar: TUniLabel;
    lblIncluir: TUniLabel;
    UniImage1: TUniImage;
    UniFileUploadImage: TUniFileUpload;
    lblApagar: TUniLabel;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFileUploadImageCompleted(Sender: TObject; AStream: TFileStream);
    procedure UniFormActivate(Sender: TObject);
  private
    procedure CarregarImagem(Sender: TObject);
    procedure FecharForm(Sender: TObject);
    procedure ApagarImagem(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
    tblEditar: TFDQuery;
  end;

function DFormCarregarImagemUsuario: TDFormCarregarImagemUsuario;

implementation

uses
  uniGUIApplication, MainModule;

{$R *.dfm}

function DFormCarregarImagemUsuario: TDFormCarregarImagemUsuario;
begin
  Result := TDFormCarregarImagemUsuario(UniMainModule.GetFormInstance(TDFormCarregarImagemUsuario));
end;

procedure TDFormCarregarImagemUsuario.UniFileUploadImageCompleted(Sender: TObject; AStream: TFileStream);
begin
  UniImage1.Picture.Assign(nil);

  if UniMainModule.UploadFotoAlunoUser = tpFotoUser then
  begin
    /// Usuario
    UniImage1.LoadFromStream(AStream);

    if not (uniMainModule.tblUsers.State in [dsEdit, dsInsert]) then
      uniMainModule.tblUsers.Edit;

    uniMainModule.tblUsersUSU_FOTO.AsString :=
      uniMainModule.SalvarImagemFotoUsuario(
        UniImage1,
        uniMainModule.tblUsersUSU_ID.AsInteger,
        UniFileUploadImage.FileName);
  end
  else
  begin
    /// Aluno
    UniImage1.LoadFromStream(AStream);

    if not (tblEditar.State in [dsEdit, dsInsert]) then
      tblEditar.Edit;

    tblEditar.FieldByName('ALU_FOTO').AsString :=
      uniMainModule.SalvarImagemFotoAluno(
        UniImage1,
        tblEditar.FieldByName('ALU_ID').AsInteger,
        UniFileUploadImage.FileName);

    if FileExists(tblEditar.FieldByName('ALU_FOTO').AsString) then
       UniImage1.Picture.LoadFromFile(tblEditar.FieldByName('ALU_FOTO').AsString);
  end;
end;

procedure TDFormCarregarImagemUsuario.UniFormActivate(Sender: TObject);
begin
  if UniMainModule.UploadFotoAlunoUser = tpFotoUser then
  begin
    if FileExists(uniMainModule.tblUsersUSU_FOTO.AsString) then
      UniImage1.Picture.LoadFromFile(uniMainModule.tblUsersUSU_FOTO.AsString);
  end
  else
  begin
    if not Assigned(tblEditar) then
      tblEditar := uniMainModule.tblAlunos;

//    if FileExists(uniMainModule.tblAlunos.FieldByName('ALU_FOTO').AsString) then
//      UniImage1.Picture.LoadFromFile(uniMainModule.tblAlunos.FieldByName('ALU_FOTO').AsString);

     if FileExists(tblEditar.FieldByName('ALU_FOTO').AsString) then
       UniImage1.Picture.LoadFromFile(tblEditar.FieldByName('ALU_FOTO').AsString);
  end;
end;

procedure TDFormCarregarImagemUsuario.UniFormCreate(Sender: TObject);
begin
  lblVoltar.Caption := ' <button class="btn btn-primary">« VOLTAR</button>';
  lblVoltar.OnClick := FecharForm;

  lblIncluir.Caption := ' <button class="btn btn-success">CARREGAR</button>';
  lblIncluir.OnClick := CarregarImagem;

  lblApagar.Caption := ' <button class="btn btn-success">APAGAR</button>';
  lblApagar.OnClick := ApagarImagem;

  
end;

procedure TDFormCarregarImagemUsuario.ApagarImagem(Sender: TObject);
begin
  if UniMainModule.UploadFotoAlunoUser = tpFotoUser then
  begin
    if FileExists(uniMainModule.tblUsersUSU_FOTO.AsString) then
    begin
       if not (uniMainModule.tblUsers.State in [dsEdit, dsInsert]) then
         uniMainModule.tblUsers.Edit;

       DeleteFile(uniMainModule.tblUsersUSU_FOTO.AsString);
       uniMainModule.tblUsersUSU_FOTO.AsString := '';
       UniImage1.Picture.Assign(nil);
       uniMainModule.tblUsers.Post;
    end;
  end
  else
  begin
    if FileExists(tblEditar.FieldByName('ALU_FOTO').AsString) then
    begin
       if not (tblEditar.State in [dsEdit, dsInsert]) then
         tblEditar.Edit;

       DeleteFile(tblEditar.FieldByName('ALU_FOTO').AsString);
       tblEditar.FieldByName('ALU_FOTO').AsString := '';
       UniImage1.Picture.Assign(nil);
       tblEditar.Post;
    end;
  end;
end;

procedure TDFormCarregarImagemUsuario.CarregarImagem(Sender: TObject);
begin
  UniFileUploadImage.Execute;
end;

procedure TDFormCarregarImagemUsuario.FecharForm(Sender: TObject);
begin
  Close;
end;

end.
