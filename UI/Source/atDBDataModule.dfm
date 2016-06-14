object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 405
  Width = 647
  object SQLConnection1: TSQLConnection
    ConnectionName = 'ATDBDebug'
    DriverName = 'DevartSQLite'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DevartSQLite'
      'DriverUnit=DbxDevartSQLite'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver170.' +
        'bpl'
      
        'MetaDataPackageLoader=TDBXDevartSQLiteMetaDataCommandFactory,Dbx' +
        'DevartSQLiteDriver170.bpl'
      'ProductName=DevartSQLite'
      'LibraryName=dbexpsqlite40.dll'
      'VendorLib=sqlite3.dll'
      'Database=p:\atDB\db\atDB.db'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'ASCIIDataBase=False'
      'BusyTimeout=0'
      'EnableSharedCache=False'
      'MaxBlobSize=-1'
      'FetchAll=True'
      'ForceCreateDatabase=False'
      'ForeignKeys=True'
      'UseUnicode=True'
      'EnableLoadExtension=False'
      'BlobSize=-1')
    Connected = True
    Left = 40
    Top = 24
  end
  object blocksDataSource: TDataSource
    DataSet = blocksCDS
    Left = 336
    Top = 152
  end
  object blocksCDS: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'blocksProvider'
    AfterPost = blocksCDSAfterPost
    AfterDelete = blocksCDSAfterDelete
    Left = 240
    Top = 152
    object blocksCDSid: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'id'
    end
    object blocksCDScreated: TSQLTimeStampField
      FieldName = 'created'
    end
    object blocksCDScreated_by: TIntegerField
      FieldName = 'created_by'
    end
    object blocksCDSmodified: TSQLTimeStampField
      FieldName = 'modified'
    end
    object blocksCDSstatus: TIntegerField
      FieldName = 'status'
    end
    object blocksCDSlabel: TWideStringField
      FieldName = 'label'
      Size = 400
    end
  end
  object blocksProvider: TDataSetProvider
    DataSet = blocksDS
    Options = [poFetchBlobsOnDemand, poUseQuoteChar]
    Left = 136
    Top = 152
  end
  object blocksDS: TSQLDataSet
    Active = True
    CommandText = 'select * from block'
    DataSource = blocksDataSource
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 40
    Top = 152
  end
  object usersDS: TSQLDataSet
    CommandText = 'select * from users'
    DataSource = usersDataSource
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 40
    Top = 88
    object usersDSid: TIntegerField
      FieldName = 'id'
    end
    object usersDSuser_name: TWideMemoField
      FieldName = 'user_name'
      BlobType = ftWideMemo
      Size = -1
    end
    object usersDScreated: TWideMemoField
      FieldName = 'created'
      BlobType = ftWideMemo
      Size = -1
    end
  end
  object usersProvider: TDataSetProvider
    DataSet = usersDS
    Options = [poFetchBlobsOnDemand, poUseQuoteChar]
    Left = 136
    Top = 88
  end
  object usersClientDataSet: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'usersProvider'
    BeforeInsert = usersClientDataSetBeforeInsert
    AfterPost = usersClientDataSetAfterPost
    AfterCancel = usersClientDataSetAfterCancel
    AfterDelete = usersClientDataSetAfterDelete
    AfterScroll = usersClientDataSetAfterScroll
    BeforeApplyUpdates = usersClientDataSetBeforeApplyUpdates
    Left = 240
    Top = 88
    object usersClientDataSetid: TIntegerField
      FieldName = 'id'
    end
    object usersClientDataSetuser_name: TWideMemoField
      FieldName = 'user_name'
      OnGetText = usersClientDataSetuser_nameGetText
      OnValidate = usersClientDataSetuser_nameValidate
      BlobType = ftWideMemo
    end
    object usersClientDataSetcreated: TWideMemoField
      FieldName = 'created'
      OnGetText = usersClientDataSetuser_nameGetText
      BlobType = ftWideMemo
    end
  end
  object usersDataSource: TDataSource
    DataSet = usersClientDataSet
    Left = 336
    Top = 88
  end
end
