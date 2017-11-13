object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'ATDB Master'
  ClientHeight = 868
  ClientWidth = 1236
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
  object PageControl1: TPageControl
    Left = 0
    Top = 169
    Width = 1236
    Height = 699
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Specimen'
      ExplicitWidth = 841
      ExplicitHeight = 565
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 1228
        Height = 671
        Align = alClient
        Caption = 'Specimen'
        TabOrder = 0
        ExplicitLeft = 22
        ExplicitTop = 40
        ExplicitWidth = 769
        ExplicitHeight = 345
        object DBGrid1: TDBGrid
          Left = 2
          Top = 73
          Width = 1224
          Height = 596
          Align = alClient
          DataSource = pgDM.specimenDataSource
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
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'animal_id'
              Width = 127
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'intake_date'
              Width = 119
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LSpecie'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'summary'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LUser'
              Width = 80
              Visible = True
            end>
        end
        object DBNavigator1: TDBNavigator
          Left = 2
          Top = 15
          Width = 1224
          Height = 58
          DataSource = pgDM.specimenDataSource
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
          Align = alTop
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Slices'
      ImageIndex = 2
      ExplicitWidth = 841
      ExplicitHeight = 565
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 1228
        Height = 671
        Align = alClient
        Caption = 'Slices'
        TabOrder = 0
        ExplicitLeft = 13
        ExplicitTop = 46
        ExplicitWidth = 769
        ExplicitHeight = 361
        object DBGrid2: TDBGrid
          Left = 2
          Top = 81
          Width = 1224
          Height = 588
          Align = alClient
          DataSource = pgDM.slicesDataSource
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
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'specimen_id'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'virus'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'virus_dilution'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'brain_region_dissection'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'culture_timeL'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'preprocess_treatment_protocolL'
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fixative_protocolL'
              Width = 152
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fixation_protocolL'
              Width = 170
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'postfix_protocolL'
              Width = 174
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'entered_byL'
              Visible = True
            end>
        end
        object DBNavigator2: TDBNavigator
          Left = 2
          Top = 15
          Width = 1224
          Height = 66
          DataSource = pgDM.slicesDataSource
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
          Align = alTop
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Notes'
      ImageIndex = 1
      ExplicitLeft = 228
      ExplicitTop = 48
      ExplicitWidth = 841
      ExplicitHeight = 565
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 377
        Height = 671
        Align = alLeft
        DataSource = pgDM.notesDSource
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
            FieldName = 'note'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'created_on'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'created_by'
            Visible = True
          end>
      end
      object DBMemo1: TDBMemo
        Left = 408
        Top = 16
        Width = 529
        Height = 281
        DataField = 'note'
        DataSource = pgDM.notesDSource
        TabOrder = 1
      end
      object DBNavigator3: TDBNavigator
        Left = 408
        Top = 322
        Width = 528
        Height = 25
        DataSource = pgDM.notesDSource
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
        TabOrder = 2
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Blocks'
      ImageIndex = 3
      object DBGrid4: TDBGrid
        Left = 0
        Top = 0
        Width = 89
        Height = 671
        Align = alLeft
        DataSource = pgDM.blockIDsDataSource
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'id'
            Visible = True
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1236
    Height = 169
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    inline TPGConnectionFrame1: TPGConnectionFrame
      Left = 1
      Top = 1
      Width = 286
      Height = 167
      Align = alLeft
      AutoSize = True
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitHeight = 167
      inherited GBox1: TGroupBox
        inherited mDBUserE: TSTDStringLabeledEdit
          Text = 'admin'
          Value = 'admin'
        end
        inherited mPasswordE: TSTDStringLabeledEdit
          Text = 'totte'
          Value = 'totte'
        end
        inherited mDatabaseE: TSTDStringLabeledEdit
          Text = 'shotgundb'
          Value = 'shotgundb'
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 696
    Top = 56
    object ConnectToDBA: TAction
      Caption = 'ToggleDbConenctionA'
    end
  end
  object AllBlocksDSrc: TDataSource
    DataSet = pgDM.blocksDS
    Left = 480
    Top = 432
  end
end
