object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 842
  ClientWidth = 1505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 97
    Width = 1505
    Height = 249
    Align = alTop
    Caption = 'Specimen'
    TabOrder = 0
    ExplicitTop = 0
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
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'animal_id'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'intake_date'
          Width = 228
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'specie'
          Width = 181
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'entered_by'
          Width = 181
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LUser'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LSpecie'
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
    Top = 0
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
      ExplicitHeight = 127
      object RadioGroup1: TRadioGroup
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
          'Mouse'
          'Ape')
        TabOrder = 0
        ExplicitLeft = 26
        ExplicitTop = 27
      end
    end
  end
end
