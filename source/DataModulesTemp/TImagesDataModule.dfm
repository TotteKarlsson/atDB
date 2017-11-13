object imageDM: TimageDM
  OldCreateOrder = False
  Height = 462
  Width = 580
  object imagesDSource: TDataSource
    DataSet = imagesCDS
    Left = 424
    Top = 56
  end
  object imagesCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'imagesP'
    Left = 304
    Top = 64
    object imagesCDSid: TStringField
      FieldName = 'id'
      Required = True
      Size = 36
    end
    object imagesCDScreated: TSQLTimeStampField
      FieldName = 'created'
    end
    object imagesCDSfilename: TStringField
      FieldName = 'filename'
      Required = True
      Size = 255
    end
    object imagesCDSfileextension: TStringField
      FieldName = 'fileextension'
      Size = 16
    end
  end
  object imagesP: TDataSetProvider
    DataSet = imagesDS
    Left = 176
    Top = 56
  end
  object imagesDS: TSQLDataSet
    CommandText = 'SELECT * FROM `images`'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = pgDM.SQLConnection1
    Left = 64
    Top = 56
    object imagesDSid: TStringField
      FieldName = 'id'
      Required = True
      Size = 36
    end
    object imagesDScreated: TSQLTimeStampField
      FieldName = 'created'
    end
    object imagesDSfilename: TStringField
      FieldName = 'filename'
      Required = True
      Size = 255
    end
    object imagesDSfileextension: TStringField
      FieldName = 'fileextension'
      Size = 16
    end
  end
end
