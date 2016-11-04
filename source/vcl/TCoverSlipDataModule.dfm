object csDM: TcsDM
  OldCreateOrder = False
  Height = 614
  Width = 879
  object csDS: TSQLDataSet
    BeforeOpen = csDSBeforeOpen
    CommandText = 'SELECT * FROM `coverslip`'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = atdbDM.SQLConnection1
    Left = 64
    Top = 56
    object csDSid: TIntegerField
      FieldName = 'id'
    end
    object csDSstatus: TIntegerField
      FieldName = 'status'
      Required = True
    end
    object csDStype: TIntegerField
      FieldName = 'type'
      Required = True
    end
    object csDSnotes: TMemoField
      FieldName = 'notes'
      BlobType = ftMemo
      Size = 1
    end
  end
  object csP: TDataSetProvider
    DataSet = csDS
    Left = 176
    Top = 56
  end
  object csCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'csP'
    AfterPost = CDSAfterPost
    AfterScroll = CDSAfterScroll
    Left = 304
    Top = 64
    object csCDSid: TIntegerField
      FieldName = 'id'
    end
    object csCDSstatus: TIntegerField
      FieldName = 'status'
      Required = True
    end
    object csCDStype: TIntegerField
      FieldName = 'type'
      Required = True
    end
    object csCDSLStatus: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'LStatus'
      LookupDataSet = csStatusCDS
      LookupKeyFields = 'id'
      LookupResultField = 'status'
      KeyFields = 'status'
      Lookup = True
    end
    object csCDSLType: TStringField
      DisplayLabel = 'Type'
      FieldKind = fkLookup
      FieldName = 'LType'
      LookupDataSet = csTypeCDS
      LookupKeyFields = 'id'
      LookupResultField = 'type'
      KeyFields = 'type'
      Lookup = True
    end
    object csCDSnotes: TMemoField
      FieldName = 'notes'
      BlobType = ftMemo
      Size = 1
    end
  end
  object csDSource: TDataSource
    DataSet = csCDS
    Left = 424
    Top = 56
  end
  object csStatusDS: TSQLDataSet
    BeforeOpen = csDSBeforeOpen
    CommandText = 'SELECT * FROM `coverslipstatus` ORDER by id'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = atdbDM.SQLConnection1
    Left = 64
    Top = 136
    object csStatusDSid: TIntegerField
      FieldName = 'id'
    end
    object csStatusDSstatus: TStringField
      FieldName = 'status'
      Required = True
      Size = 255
    end
    object csStatusDSnote: TMemoField
      FieldName = 'note'
      BlobType = ftMemo
      Size = 1
    end
  end
  object csStatusP: TDataSetProvider
    DataSet = csStatusDS
    Left = 192
    Top = 136
  end
  object csStatusCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'csStatusP'
    AfterPost = CDSAfterPost
    Left = 312
    Top = 136
    object csStatusCDSid: TIntegerField
      FieldName = 'id'
    end
    object csStatusCDSstatus: TStringField
      FieldName = 'status'
      Required = True
      Size = 255
    end
    object csStatusCDSnote: TMemoField
      FieldName = 'note'
      BlobType = ftMemo
      Size = 1
    end
  end
  object csStatusDSource: TDataSource
    DataSet = csStatusCDS
    Left = 432
    Top = 136
  end
  object csTypeDS: TSQLDataSet
    BeforeOpen = csDSBeforeOpen
    CommandText = 'SELECT * FROM `coversliptype` ORDER by id'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = atdbDM.SQLConnection1
    Left = 64
    Top = 208
    object csTypeDSid: TIntegerField
      FieldName = 'id'
    end
    object csTypeDStype: TStringField
      FieldName = 'type'
      Required = True
      Size = 255
    end
    object csTypeDSnote: TMemoField
      FieldName = 'note'
      BlobType = ftMemo
      Size = 1
    end
  end
  object csTypeP: TDataSetProvider
    DataSet = csTypeDS
    Left = 192
    Top = 208
  end
  object csTypeCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'csTypeP'
    AfterPost = CDSAfterPost
    Left = 312
    Top = 208
    object csTypeCDSid: TIntegerField
      FieldName = 'id'
    end
    object csTypeCDStype: TStringField
      FieldName = 'type'
      Required = True
      Size = 255
    end
    object csTypeCDSnote: TMemoField
      FieldName = 'note'
      BlobType = ftMemo
      Size = 1
    end
  end
  object csTypeDSource: TDataSource
    DataSet = csTypeCDS
    Left = 432
    Top = 208
  end
  object csDustAssayDS: TSQLDataSet
    BeforeOpen = csDSBeforeOpen
    CommandText = 'SELECT * FROM coverslipdustassays where coverslip_id = :id'
    DataSource = csDSource
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
    SQLConnection = atdbDM.SQLConnection1
    Left = 64
    Top = 312
    object csDustAssayDSid: TIntegerField
      FieldName = 'id'
    end
    object csDustAssayDSdate: TSQLTimeStampField
      FieldName = 'date'
    end
    object csDustAssayDScoverslip_id: TIntegerField
      FieldName = 'coverslip_id'
      Required = True
    end
    object csDustAssayDSbackground_image: TStringField
      FieldName = 'background_image'
      Size = 36
    end
    object csDustAssayDScoverslip_status: TIntegerField
      FieldName = 'coverslip_status'
      Required = True
    end
    object csDustAssayDSnote: TMemoField
      FieldName = 'note'
      BlobType = ftMemo
      Size = 1
    end
    object csDustAssayDScoverslip_image: TStringField
      FieldName = 'coverslip_image'
      Size = 36
    end
    object csDustAssayDSresult_image: TStringField
      FieldName = 'result_image'
      Size = 36
    end
  end
  object csDustAssayP: TDataSetProvider
    DataSet = csDustAssayDS
    Left = 192
    Top = 312
  end
  object csDustAssayCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'csDustAssayP'
    AfterPost = CDSAfterPost
    AfterDelete = CDSAfterDelete
    Left = 312
    Top = 312
    object csDustAssayCDSid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object csDustAssayCDSdate: TSQLTimeStampField
      FieldName = 'date'
    end
    object csDustAssayCDScoverslip_id: TIntegerField
      FieldName = 'coverslip_id'
    end
    object csDustAssayCDSbackground_image: TStringField
      FieldName = 'background_image'
      Size = 36
    end
    object csDustAssayCDScoverslip_status: TIntegerField
      FieldName = 'coverslip_status'
    end
    object csDustAssayCDSnote: TMemoField
      FieldName = 'note'
      BlobType = ftMemo
      Size = 1
    end
    object csDustAssayCDScoverslip_image: TStringField
      FieldName = 'coverslip_image'
      Size = 36
    end
    object csDustAssayCDSresult_image: TStringField
      FieldName = 'result_image'
      Size = 36
    end
  end
  object csDustAsssayDSource: TDataSource
    DataSet = csDustAssayCDS
    OnDataChange = csDustAsssayDSourceDataChange
    Left = 432
    Top = 312
  end
end
