object CoverSlipScanFrame: TCoverSlipScanFrame
  Left = 0
  Top = 0
  Width = 724
  Height = 442
  Align = alClient
  AutoSize = True
  TabOrder = 0
  ExplicitWidth = 451
  ExplicitHeight = 304
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 724
    Height = 442
    Align = alClient
    Caption = 'GroupBox1'
    TabOrder = 0
    ExplicitWidth = 451
    ExplicitHeight = 304
    object GroupBox3: TGroupBox
      Left = 145
      Top = 15
      Width = 577
      Height = 425
      Align = alClient
      Caption = 'Ribbon Info'
      TabOrder = 0
      ExplicitLeft = 200
      ExplicitTop = 24
      ExplicitWidth = 497
      ExplicitHeight = 265
      object SliceIDE: TLabeledEdit
        Left = 168
        Top = 40
        Width = 121
        Height = 33
        EditLabel.Width = 72
        EditLabel.Height = 25
        EditLabel.Caption = 'Slice ID'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -21
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object AnimalIDE: TLabeledEdit
        Left = 24
        Top = 40
        Width = 121
        Height = 33
        EditLabel.Width = 93
        EditLabel.Height = 25
        EditLabel.Caption = 'Animal ID'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -21
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 143
      Height = 425
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object GroupBox2: TGroupBox
        Left = 7
        Top = 96
        Width = 172
        Height = 329
        Caption = 'Ribbons'
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 2
          Top = 15
          Width = 168
          Height = 312
          Align = alClient
          DataSource = DataSource1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
      object CSIDE: TIntegerLabeledEdit
        Left = 7
        Top = 40
        Width = 121
        Height = 33
        EditLabel.Width = 113
        EditLabel.Height = 25
        EditLabel.Caption = 'Coverslip ID'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -21
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '0'
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 656
    Top = 360
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLQuery1
    Left = 432
    Top = 360
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 544
    Top = 360
  end
  object SQLQuery1: TSQLQuery
    DataSource = DataSource1
    MaxBlobSize = -1
    Params = <>
    SQLConnection = pgDM.SQLConnection1
    Left = 336
    Top = 360
  end
end
