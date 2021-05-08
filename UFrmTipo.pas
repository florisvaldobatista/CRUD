unit UFrmTipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Buttons, uDm, uFrmPesquisa, Data.DB;

type
  TfrmCadTipo = class(TForm)
    sbCadastrar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbAlterar: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbCancelar: TSpeedButton;
    GroupBox1: TGroupBox;
    lbDesc: TLabel;
    lbDate: TLabel;
    lbCodTip: TLabel;
    edtDesTipo: TDBEdit;
    edtData: TDBEdit;
    edtCodTip: TDBEdit;
    dtsTelaTipo: TDataSource;
    procedure sbCadastrarClick(Sender: TObject);
    procedure HabilitarDesabilitarBotoes;
    procedure sbCancelarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbAlterarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipo: TfrmCadTipo;

implementation

{$R *.dfm}

procedure TfrmCadTipo.FormActivate(Sender: TObject);
begin
    edtData.Enabled      := False;
    edtDesTipo.Enabled   := False;
    edtCodTip.Enabled    := False;
    edtData.Clear;
    edtDesTipo.clear;
    edtCodTip.Clear;
end;

procedure TfrmCadTipo.FormShow(Sender: TObject);
begin
    dm.cdsTipo.Active := True;
end;

procedure TfrmCadTipo.HabilitarDesabilitarBotoes;
begin
    sbCadastrar.Enabled := not sbCadastrar.Enabled;
    sbExcluir.Enabled   := not sbExcluir.Enabled;
    sbAlterar.Enabled   := not sbAlterar.Enabled;
    sbCancelar.Enabled  := not sbCancelar.Enabled;
    sbSalvar.Enabled    := not sbSalvar.Enabled;
end;

procedure TfrmCadTipo.sbAlterarClick(Sender: TObject);
begin
    dm.cdsTipo.Active := True;
    with dm.cdsTipo do
    begin
      begin
          Edit;
          HabilitarDesabilitarBotoes;
          edtDesTipo.Enabled   := True;
          edtCodTip.Enabled    := True;
          edtDesTipo.SetFocus;
      end;
    end;
end;

procedure TfrmCadTipo.sbCadastrarClick(Sender: TObject);
begin
    with dm.cdsTipo do
    begin
        Append;
        edtData.Text := DateToStr(Date());
        HabilitarDesabilitarBotoes;
        edtDesTipo.Enabled   := True;
        edtCodTip.Enabled    := True;
        edtDesTipo.SetFocus;
    end;
end;

procedure TfrmCadTipo.sbCancelarClick(Sender: TObject);
begin
    with dm.cdsTipo do
    begin
        HabilitarDesabilitarBotoes;
        Cancel;
     end;
end;
procedure TfrmCadTipo.sbExcluirClick(Sender: TObject);
begin
    with dm.cdsTipo do
    begin
      if not FieldByName('Cod_Tipo').IsNull then
      begin
          Delete;
          Application.MessageBox('Cadastro excluído com sucesso!','Atenção',MB_OK + MB_ICONWARNING);
      end else
          begin
          Application.MessageBox('Nenhum cadastro selecionado!','Atenção',MB_OK + MB_ICONWARNING);
          end;
    end;
end;

procedure TfrmCadTipo.sbSalvarClick(Sender: TObject);
begin
    with dm.cdsTipo do
      try
        Post;
        HabilitarDesabilitarBotoes;
        Application.MessageBox('Confirmado com Sucesso!','Atenção',MB_OK + MB_ICONWARNING);
      except
        Application.MessageBox('Erro ao tentar salvar cadastro!','Atenção',MB_OK + MB_ICONWARNING);
    end;
end;

end.
