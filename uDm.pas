unit uDm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDm = class(TDataModule)
    pCon: TFDConnection;
    cdsProd: TFDQuery;
    dtsProd: TDataSource;
    cdsProdCod_Produt: TFDAutoIncField;
    cdsProdDes_Produt: TStringField;
    cdsCadProd: TFDQuery;
    dtsCadProd: TDataSource;
    cdsProdDat_Cadastro: TDateTimeField;
    cdsProdDes_UniVen: TStringField;
    cdsProdDes_UniCom: TStringField;
    cdsProdQtd_FraVen: TIntegerField;
    cdsProdCod_Tipo: TStringField;
    cdsProdCod_Ean: TStringField;
    cdsProdCod_Ncm: TStringField;
    cdsProdCod_Cest: TStringField;
    cdsProdPreco: TBCDField;
    dtsUsuar: TDataSource;
    cdsUsuar: TFDQuery;
    cdsTipo: TFDQuery;
    dtsTipo: TDataSource;
    cdsTipoCod_Tipo: TFDAutoIncField;
    cdsTipoDes_Tipo: TStringField;
    cdsTipoDat_Cadastro: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm: TDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

end.
