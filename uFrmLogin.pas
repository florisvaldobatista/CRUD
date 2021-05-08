unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, uDm, uPrincipal, IdHashMessageDigest, idHash,
  dxGDIPlusClasses;

type
  TfrmLogin = class(TForm)
    edtSenha: TEdit;
    edtUsuario: TEdit;
    btnCancelar: TBitBtn;
    btnEntrar: TBitBtn;
    Image2: TImage;
    procedure btnEntrarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

Function MD5(const texto: string): string;
var
  IdMD5: TIdHashMessageDigest5;
begin
  IdMD5 := TIdHashMessageDigest5.Create;
  try
    result := IdMD5.HashStringAsHex(texto);
  finally
    IdMD5.Free;
  end;
end;

{$R *.dfm}

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
Begin
  with dm.cdsUsuar do
  begin
    Close;
    SQL.Clear;
    SQL.Text := ' SELECT Nom_Login, Snh_Hash FROM USUAR ' +
                ' WHERE UPPER(Nom_Login) =              ' + QuotedStr(AnsiUpperCase(Trim(edtUsuario.Text))) +
                ' AND Snh_Hash =                        ' + QuotedStr(MD5(Trim(edtSenha.Text)));
    Open;

    if RecordCount > 0 then
    begin

      try
        frmLogin.Hide;
        frmPrincipal.ShowModal;
      finally
        frmPrincipal.Release;
        frmPrincipal := Nil;
      end;
    end
    else
      Application.MessageBox('Não foi possível realizar o login.', 'Atenção', MB_OK + MB_ICONWARNING);
      edtUsuario.SetFocus;
      btnEntrar.Click;
  end;
end;

end.
