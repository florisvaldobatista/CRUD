unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, dxGDIPlusClasses, uDm, uFrmCadPro, uFrmPesquisa,
  uFrmPesquisaTipo;

type
  TfrmPrincipal = class(TForm)
    pnl_Dashboard: TPanel;
    pbl_thumb_logo: TPanel;
    pnl_img_logo: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl_data: TLabel;
    Panel3: TPanel;
    Shape13: TShape;
    Label9: TLabel;
    Label10: TLabel;
    Panel4: TPanel;
    pnl2: TPanel;
    btnCadastro: TSpeedButton;
    btnTipo: TSpeedButton;
    btnSair: TSpeedButton;
    shp2: TShape;
    pnl6: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl7: TPanel;
    lbl3: TLabel;
    StatusBar1: TStatusBar;
    sbPesquisa: TSpeedButton;
    Top_Timer: TTimer;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Pesquisa1: TMenuItem;
    Sair1: TMenuItem;
    Produto1: TMenuItem;
    ipo1: TMenuItem;
    Produto2: TMenuItem;
    ipo2: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel7: TPanel;
    procedure btnSairClick(Sender: TObject);
    procedure btnCadastroClick(Sender: TObject);
    procedure btnTipoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure sbPesquisaClick(Sender: TObject);
    procedure este1Click(Sender: TObject);
    procedure Top_TimerTimer(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Produto2Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure ipo1Click(Sender: TObject);
    procedure ipo2Click(Sender: TObject);
  private
    { Private declarations }
      protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UFrmTipo;

procedure TfrmPrincipal.btnCadastroClick(Sender: TObject);
begin
    frmCadProd.ShowModal;
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  if MessageBox (Application.Handle, Pchar ('Deseja fechar a aplicação?'), 'Confirmação!', MB_YESNO+MB_DEFBUTTON2) = idYes then
  begin
      Application.Terminate;
  end;
end;

procedure TfrmPrincipal.btnTipoClick(Sender: TObject);
begin
    frmCadTipo.ShowModal;
end;

procedure TfrmPrincipal.CreateParams(var Params: TCreateParams);
begin
  inherited;
 Params.ExStyle := Params.ExStyle OR WS_EX_APPWINDOW;
end;

procedure TfrmPrincipal.este1Click(Sender: TObject);
begin
 showmessage('teste');
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action       := cafree;
    frmPrincipal := NIL;
    FATALEXIT(0)
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmPrincipal.ipo1Click(Sender: TObject);
begin
    frmCadTipo.ShowModal;
end;

procedure TfrmPrincipal.ipo2Click(Sender: TObject);
begin
    frmPesquisaTipo.ShowModal;
end;

procedure TfrmPrincipal.Produto1Click(Sender: TObject);
begin
    frmCadProd.ShowModal;
end;

procedure TfrmPrincipal.Produto2Click(Sender: TObject);
begin
    frmPesquisa.ShowModal;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmPrincipal.sbPesquisaClick(Sender: TObject);
begin
    frmPesquisa.ShowModal;
end;

procedure TfrmPrincipal.Top_TimerTimer(Sender: TObject);
begin
    lbl_data.Caption := DateToStr(date) + ' ' + TimeToStr(time);
end;

end.
