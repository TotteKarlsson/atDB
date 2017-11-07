object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'ATDB Master'
  ClientHeight = 624
  ClientWidth = 825
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 16
    Top = 200
    Width = 457
    Height = 209
    Caption = 'Users'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 3
      Top = 49
      Width = 390
      Height = 144
      DataSource = usersDSource
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'user_name'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'created'
          Visible = True
        end>
    end
    object AddUserBtn: TButton
      Left = 318
      Top = 18
      Width = 75
      Height = 25
      Caption = 'Add User'
      TabOrder = 1
      OnClick = AddUserBtnClick
    end
    object DBNavigator1: TDBNavigator
      Left = 16
      Top = 18
      Width = 240
      Height = 25
      DataSource = usersDSource
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
  object mySQLC: TSQLConnection
    ConnectionName = 'LocalPG'
    DriverName = 'DevartPostgreSQL'
    KeepConnection = False
    LoadParamsOnConnect = True
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DevartPostgreSQL'
      'DriverUnit=DbxDevartPostgreSQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver170.' +
        'bpl'
      
        'MetaDataPackageLoader=TDBXDevartPostgreSQLMetaDataCommandFactory' +
        ',DbxDevartPostgreSQLDriver170.bpl'
      'ProductName=DevartPostgreSQL'
      'LibraryName=dbexppgsql40.dll'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'MaxBlobSize=-1'
      'FetchAll=True'
      'UseQuoteChar=False'
      'UseUnicode=True'
      'IPVersion=IPv4'
      'VendorLib=dbexppgsql40.dll'
      'BlobSize=-1'
      'HostName=localhost'
      'SchemaName='
      'Database=shotgundb'
      'User_Name=admin'
      'Password=totte'
      'EnableBCD=True')
    Connected = True
    Left = 736
    Top = 40
  end
  object usersDSP: TDataSetProvider
    DataSet = usersDS
    Left = 736
    Top = 168
  end
  object usersCDS: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'usersDSP'
    Left = 736
    Top = 232
    object usersCDSid: TIntegerField
      FieldName = 'id'
    end
    object usersCDSuser_name: TWideStringField
      FieldName = 'user_name'
      Size = 255
    end
    object usersCDScreated: TSQLTimeStampField
      FieldName = 'created'
    end
  end
  object usersDS: TSQLDataSet
    Active = True
    CommandText = 'select * from users'
    DataSource = usersDSource
    MaxBlobSize = -1
    Params = <>
    SQLConnection = mySQLC
    Left = 736
    Top = 104
    object usersDSid: TIntegerField
      FieldName = 'id'
    end
    object usersDSuser_name: TWideStringField
      FieldName = 'user_name'
      Size = 255
    end
    object usersDScreated: TSQLTimeStampField
      FieldName = 'created'
    end
  end
  object usersDSource: TDataSource
    DataSet = usersCDS
    Left = 736
    Top = 296
  end
  object ActionList1: TActionList
    Left = 592
    Top = 40
    object ConnectToDBA: TAction
      Caption = 'ToggleDbConenctionA'
    end
  end
end
