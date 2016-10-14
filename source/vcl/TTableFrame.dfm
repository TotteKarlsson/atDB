object TableFrame: TTableFrame
  Left = 0
  Top = 0
  Width = 754
  Height = 301
  TabOrder = 0
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 704
    Height = 286
    Caption = 'Table Updater'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 67
      Width = 700
      Height = 217
      Align = alBottom
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 25
      Width = 700
      Height = 42
      DataSource = DataSource1
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
      Align = alBottom
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 632
    Top = 176
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 552
    Top = 176
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 632
    Top = 104
  end
  object SQLDataSet1: TSQLDataSet
    Params = <>
    Left = 568
    Top = 104
  end
end
