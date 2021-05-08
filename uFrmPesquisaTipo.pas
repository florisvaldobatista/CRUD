unit uFrmPesquisaTipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDm, UFrmTipo, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TfrmPesquisaTipo = class(TForm)
    pgPesquisa: TPageControl;
    TabSheet1: TTabSheet;
    sbPesquisa: TSpeedButton;
    edtPesquisa: TEdit;
    DBGrid1: TDBGrid;
    cdsPesTipo: TFDQuery;
    dtsPesTipo: TDataSource;
    procedure sbPesquisaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaTipo: TfrmPesquisaTipo;

implementation

{$R *.dfm}

procedure TfrmPesquisaTipo.DBGrid1DblClick(Sender: TObject);
begin
    frmCadTipo.ShowModal;
    frmCadTipo.HabilitarDesabilitarBotoes;
end;

procedure TfrmPesquisaTipo.sbPesquisaClick(Sender: TObject);
begin
    with dm.cdsTipo do
    begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT * FROM TIPO WHERE DES_TIPO LIKE :pPesq');
        ParamByName('pPesq').AsString := '%' + edtPesquisa.Text + '%';
        Open;
    end;
end;

end.
