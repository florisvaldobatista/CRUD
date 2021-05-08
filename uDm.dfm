object Dm: TDm
  OldCreateOrder = False
  Height = 273
  Width = 281
  object pCon: TFDConnection
    ConnectionName = 'root'
    Params.Strings = (
      'Database=FBN'
      'User_Name=root'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 121
    Top = 12
  end
  object cdsProd: TFDQuery
    Connection = pCon
    SQL.Strings = (
      'SELECT * FROM PRODU')
    Left = 36
    Top = 116
    object cdsProdCod_Produt: TFDAutoIncField
      Alignment = taLeftJustify
      FieldName = 'Cod_Produt'
      ReadOnly = True
      AutoIncrementSeed = 1
      AutoIncrementStep = 1
    end
    object cdsProdDat_Cadastro: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'Dat_Cadastro'
      Origin = 'Dat_Cadastro'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsProdDes_Produt: TStringField
      FieldName = 'Des_Produt'
      Size = 40
    end
    object cdsProdDes_UniVen: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Des_UniVen'
      Origin = 'Des_UniVen'
      Size = 3
    end
    object cdsProdDes_UniCom: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Des_UniCom'
      Origin = 'Des_UniCom'
      Size = 3
    end
    object cdsProdCod_Ean: TStringField
      FieldName = 'Cod_Ean'
      Origin = 'Cod_Ean'
      Required = True
      Size = 14
    end
    object cdsProdCod_Ncm: TStringField
      FieldName = 'Cod_Ncm'
      Origin = 'Cod_Ncm'
      Required = True
      Size = 12
    end
    object cdsProdQtd_FraVen: TIntegerField
      Alignment = taLeftJustify
      AutoGenerateValue = arDefault
      FieldName = 'Qtd_FraVen'
      Origin = 'Qtd_FraVen'
    end
    object cdsProdCod_Tipo: TStringField
      FieldName = 'Cod_Tipo'
      Origin = 'Cod_Tipo'
      Required = True
      Size = 7
    end
    object cdsProdCod_Cest: TStringField
      FieldName = 'Cod_Cest'
      Origin = 'Cod_Cest'
      Required = True
      Size = 7
    end
    object cdsProdPreco: TBCDField
      Alignment = taLeftJustify
      AutoGenerateValue = arDefault
      FieldName = 'Preco'
      Origin = 'Preco'
      EditFormat = 'R$ ##,##'
      Precision = 15
      Size = 2
    end
  end
  object dtsProd: TDataSource
    DataSet = cdsProd
    Left = 92
    Top = 116
  end
  object cdsCadProd: TFDQuery
    Connection = pCon
    Left = 36
    Top = 168
  end
  object dtsCadProd: TDataSource
    DataSet = cdsCadProd
    Left = 84
    Top = 168
  end
  object dtsUsuar: TDataSource
    DataSet = cdsUsuar
    Left = 148
    Top = 60
  end
  object cdsUsuar: TFDQuery
    Connection = pCon
    SQL.Strings = (
      'SELECT NOM_LOGIN, SNH_HASH FROM USUAR')
    Left = 92
    Top = 60
  end
  object cdsTipo: TFDQuery
    Connection = pCon
    SQL.Strings = (
      'SELECT Cod_Tipo, Des_Tipo, Dat_Cadastro  FROM TIPO')
    Left = 144
    Top = 117
    object cdsTipoCod_Tipo: TFDAutoIncField
      Alignment = taLeftJustify
      FieldName = 'Cod_Tipo'
      Origin = 'Cod_Tipo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      AutoIncrementSeed = 1
      AutoIncrementStep = 1
    end
    object cdsTipoDes_Tipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Des_Tipo'
      Origin = 'Des_Tipo'
      Size = 40
    end
    object cdsTipoDat_Cadastro: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'Dat_Cadastro'
      Origin = 'Dat_Cadastro'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
  end
  object dtsTipo: TDataSource
    DataSet = cdsTipo
    Left = 192
    Top = 117
  end
end
