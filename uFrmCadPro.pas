unit uFrmCadPro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Vcl.Buttons, Vcl.ExtCtrls, uDm, Vcl.ComCtrls;

type
  TfrmCadProd = class(TForm)
    dtsTelaCadPro: TDataSource;
    GroupBox1: TGroupBox;
    lbCod: TLabel;
    lbDesc: TLabel;
    lbDate: TLabel;
    lbFraVen: TLabel;
    lbUniComp: TLabel;
    lbUniVend: TLabel;
    lbCodGtin: TLabel;
    lbCodNcm: TLabel;
    lbCodTip: TLabel;
    lbCodCest: TLabel;
    lbPreco: TLabel;
    edtCod: TDBEdit;
    edtDesProd: TDBEdit;
    edtData: TDBEdit;
    edtFraVen: TDBEdit;
    edtFraCom: TDBEdit;
    edtQtdFraVen: TDBEdit;
    edtEan: TDBEdit;
    edtNcm: TDBEdit;
    edtCest: TDBEdit;
    edtPreco: TDBEdit;
    edtCodTip: TDBEdit;
    sbCadastrar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbAlterar: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbCancelar: TSpeedButton;
    procedure HabilitarDesabilitarBotoes;
    procedure sbCancelarClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbAlterarClick(Sender: TObject);
    procedure sbCadastrarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtPrecoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProd: TfrmCadProd;

implementation

{$R *.dfm}

procedure TfrmCadProd.edtPrecoChange(Sender: TObject);
begin
    try
      edtPreco.Text := FormatFloat('#,,,0.00',StrToFloat(edtPreco.Text));
      edtPreco.SelStart := Length(edtPreco.Text) - 3;
    except
    end;
end;

procedure TfrmCadProd.FormActivate(Sender: TObject);
begin
    edtData.Enabled      := False;
    edtDesProd.Enabled   := False;
    edtFraVen.Enabled    := False;
    edtFraCom.Enabled    := False;
    edtEan.Enabled       := False;
    edtNcm.Enabled       := False;
    edtQtdFraVen.Enabled := False;
    edtCodTip.Enabled    := False;
    edtCest.Enabled      := False;
    edtPreco.Enabled     := False;
    edtData.Clear;
    edtDesProd.clear;
    edtFraVen.Clear;
    edtCod.Clear;
    edtFraCom.Clear;
    edtEan.Clear;
    edtNcm.Clear;
    edtQtdFraVen.Clear;
    edtCodTip.Clear;
    edtCest.Clear;
    edtPreco.Clear;
end;

procedure TfrmCadProd.FormShow(Sender: TObject);
begin
    dm.cdsProd.Active := True;
end;

procedure TfrmCadProd.HabilitarDesabilitarBotoes;
begin
    sbCadastrar.Enabled := not sbCadastrar.Enabled;
    sbExcluir.Enabled   := not sbExcluir.Enabled;
    sbAlterar.Enabled   := not sbAlterar.Enabled;
    sbCancelar.Enabled  := not sbCancelar.Enabled;
    sbSalvar.Enabled    := not sbSalvar.Enabled;
end;

procedure TfrmCadProd.sbAlterarClick(Sender: TObject);
begin
    dm.cdsProd.Active := True;
    with dm.cdsProd do
    begin
      begin
          Edit;
          HabilitarDesabilitarBotoes;
          edtDesProd.Enabled   := True;
          edtFraVen.Enabled    := True;
          edtFraCom.Enabled    := True;
          edtEan.Enabled       := True;
          edtNcm.Enabled       := True;
          edtQtdFraVen.Enabled := True;
          edtCodTip.Enabled    := True;
          edtCest.Enabled      := True;
          edtPreco.Enabled     := True;
          edtDesProd.SetFocus;
      end;
    end;
end;

procedure TfrmCadProd.sbCadastrarClick(Sender: TObject);
begin
    with dm.cdsProd do
    begin
        Append;
        edtData.Text := DateToStr(Date());
        HabilitarDesabilitarBotoes;
        edtDesProd.Enabled   := True;
        edtFraVen.Enabled    := True;
        edtFraCom.Enabled    := True;
        edtEan.Enabled       := True;
        edtNcm.Enabled       := True;
        edtQtdFraVen.Enabled := True;
        edtCodTip.Enabled    := True;
        edtCest.Enabled      := True;
        edtPreco.Enabled     := True;
        edtDesProd.SetFocus;
    end;
end;

procedure TfrmCadProd.sbCancelarClick(Sender: TObject);
begin
    with dm.cdsProd do
    begin
        HabilitarDesabilitarBotoes;
        Cancel;
     end;
end;

procedure TfrmCadProd.sbExcluirClick(Sender: TObject);
begin
    with dm.cdsProd do
    begin
      if not FieldByName('Cod_Produt').IsNull then
      begin
          Delete;
          Application.MessageBox('Cadastro excluído com sucesso!','Atenção',MB_OK + MB_ICONWARNING);
      end else
          begin
          Application.MessageBox('Nenhum cadastro selecionado!','Atenção',MB_OK + MB_ICONWARNING);
          end;
    end;
end;

procedure TfrmCadProd.sbSalvarClick(Sender: TObject);
begin
    with dm.cdsProd do
      try
        Post;
        HabilitarDesabilitarBotoes;
        Application.MessageBox('Confirmado com Sucesso!','Atenção',MB_OK + MB_ICONWARNING);
      except
        Application.MessageBox('Erro ao tentar salvar cadastro!','Atenção',MB_OK + MB_ICONWARNING);
    end;
end;

end.
