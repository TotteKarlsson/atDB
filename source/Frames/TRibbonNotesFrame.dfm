object RibbonNotesFrame: TRibbonNotesFrame
  Left = 0
  Top = 0
  Width = 560
  Height = 274
  TabOrder = 0
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 560
    Height = 274
    Align = alClient
    Caption = 'Ribbon Notes'
    TabOrder = 0
    ExplicitLeft = -102
    ExplicitTop = 75
    ExplicitWidth = 686
    ExplicitHeight = 326
    object Panel15: TPanel
      Left = 2
      Top = 15
      Width = 185
      Height = 257
      Align = alLeft
      TabOrder = 0
      ExplicitHeight = 309
      object mRibbonNotesGrid: TDBGrid
        Left = 1
        Top = 1
        Width = 183
        Height = 230
        Align = alClient
        DataSource = pgDM.ribbonNotesDSource
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
            FieldName = 'created_on'
            Title.Caption = 'Date'
            Width = 143
            Visible = True
          end>
      end
      object RibbonNotesNavigator: TDBNavigator
        Left = 1
        Top = 231
        Width = 183
        Height = 25
        DataSource = pgDM.ribbonNotesDSource
        VisibleButtons = [nbInsert, nbDelete, nbRefresh, nbApplyUpdates]
        Align = alBottom
        ConfirmDelete = False
        TabOrder = 1
        ExplicitTop = 283
      end
    end
    object Panel16: TPanel
      Left = 187
      Top = 15
      Width = 371
      Height = 257
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 497
      ExplicitHeight = 309
      object mRibbonNoteMemo: TDBMemo
        Left = 1
        Top = 1
        Width = 369
        Height = 230
        Align = alClient
        DataField = 'note'
        DataSource = pgDM.ribbonNotesDSource
        TabOrder = 0
        ExplicitWidth = 495
        ExplicitHeight = 282
      end
      object RibbonNoteNavigator: TDBNavigator
        Left = 1
        Top = 231
        Width = 369
        Height = 25
        DataSource = pgDM.ribbonNotesDSource
        VisibleButtons = [nbPost, nbCancel]
        Align = alBottom
        TabOrder = 1
        ExplicitTop = 283
        ExplicitWidth = 495
      end
    end
  end
end
