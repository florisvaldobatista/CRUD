unit uFrmPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls, uDm, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uFrmCadPro;

type
  TfrmPesquisa = class(TForm)
    DBGrid1: TDBGrid;
    cdsProdPes: TFDQuery;
    dstProdPes: TDataSource;
    pgPesquisa: TPageControl;
    TabSheet1: TTabSheet;
    sbPesquisa: TSpeedButton;
    edtPesquisa: TEdit;
    procedure sbPesquisaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

procedure TfrmPesquisa.DBGrid1DblClick(Sender: TObject);
begin
    frmCadProd.ShowModal;
    frmCadProd.HabilitarDesabilitarBotoes;
end;

procedure TfrmPesquisa.sbPesquisaClick(Sender: TObject);
begin
    with dm.cdsProd do
    begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT * FROM PRODU WHERE DES_PRODUT LIKE :pPesq');
        ParamByName('pPesq').AsString := '%' + edtPesquisa.Text + '%';
        Open;
    end;
end;

end.
