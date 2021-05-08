program CadProdu;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDm in 'uDm.pas' {Dm: TDataModule},
  uFrmCadPro in 'uFrmCadPro.pas' {frmCadProd},
  uFrmLogin in 'uFrmLogin.pas' {frmLogin},
  UFrmTipo in 'UFrmTipo.pas' {frmCadTipo},
  uFrmPesquisa in 'uFrmPesquisa.pas' {frmPesquisa},
  uFrmPesquisaTipo in 'uFrmPesquisaTipo.pas' {frmPesquisaTipo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadProd, frmCadProd);
  Application.CreateForm(TfrmCadTipo, frmCadTipo);
  Application.CreateForm(TfrmPesquisa, frmPesquisa);
  Application.CreateForm(TfrmPesquisaTipo, frmPesquisaTipo);
  Application.ShowMainForm := false;
  Application.Run;

end.
