unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    Panel2: TPanel;
    MainMenu1: TMainMenu;
    Cad_Prod: TMenuItem;
    Prod: TMenuItem;
    Exit: TMenuItem;
    N1: TMenuItem;
    Tipo: TMenuItem;
    procedure ExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ExitClick(Sender: TObject);
begin
  Close;
end;

end.
