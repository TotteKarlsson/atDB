object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 842
  ClientWidth = 1505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 202
    Width = 1505
    Height = 249
    Align = alTop
    Caption = 'Specimen'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 1501
      Height = 207
      Align = alClient
      DataSource = atdbDM.specimenDataSource
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Width = 144
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'animal_id'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LSpecie'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'intake_date'
          Width = 210
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LUser'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'summary'
          Visible = True
        end>
    end
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 222
      Width = 1501
      Height = 25
      DataSource = atdbDM.specimenDataSource
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
      Align = alBottom
      TabOrder = 1
      OnClick = DBNavigator1Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 105
    Width = 1505
    Height = 97
    Align = alTop
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 256
      Height = 95
      Align = alLeft
      Caption = 'Filters'
      TabOrder = 0
      object SpecieRG: TRadioGroup
        Left = 2
        Top = 15
        Width = 185
        Height = 78
        Align = alLeft
        Caption = 'Species'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Human'
          'Mouse')
        TabOrder = 0
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 1505
    Height = 105
    Align = alTop
    Caption = 'Misc'
    TabOrder = 2
    object UserCB: TDBLookupComboBox
      Left = 24
      Top = 24
      Width = 145
      Height = 21
      KeyField = 'id'
      ListField = 'user_name'
      ListSource = atdbDM.usersDataSource
      TabOrder = 0
    end
  end
end
