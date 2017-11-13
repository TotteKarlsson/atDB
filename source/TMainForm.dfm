object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'atDB'
  ClientHeight = 997
  ClientWidth = 1438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 73
    Width = 1438
    Height = 905
    Align = alClient
    TabOrder = 0
    ExplicitTop = 65
    ExplicitHeight = 913
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 1436
      Height = 903
      ActivePage = TabSheet5
      Align = alClient
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ExplicitHeight = 911
      object TabSheet4: TTabSheet
        Caption = 'Tissue to Block'
        ExplicitHeight = 883
        object PageControl2: TPageControl
          Left = 0
          Top = 41
          Width = 1428
          Height = 834
          ActivePage = TabSheet2
          Align = alClient
          TabOrder = 0
          OnChange = PageControl2Change
          ExplicitHeight = 842
          object TabSheet8: TTabSheet
            Caption = 'Specimen && Slices'
            ExplicitHeight = 814
            object GroupBox4: TGroupBox
              Left = 0
              Top = 297
              Width = 1420
              Height = 509
              Align = alClient
              Caption = 'Slices'
              TabOrder = 0
              ExplicitHeight = 517
              object SlicesGrid: TDBGrid
                Left = 2
                Top = 15
                Width = 1416
                Height = 467
                Align = alClient
                DataSource = pgDM.slicesDataSource
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDrawDataCell = SlicesGridDrawDataCell
                OnDrawColumnCell = SlicesGridDrawColumnCell
                OnDblClick = DBGridDblClick
                OnMouseDown = SlicesGridMouseDown
                OnMouseMove = SlicesGridMouseMove
                OnMouseUp = SlicesGridMouseUp
                OnTitleClick = SlicesGridTitleClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'id'
                    Title.Caption = 'Slice ID'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'specimen_id'
                    Width = 74
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'virus'
                    Title.Caption = 'Fluorescence (Virus/Genotype)'
                    Width = 161
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'virus_dilution'
                    Title.Caption = 'Dilution'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'brain_region_dissection'
                    Width = 120
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'culture_timeL'
                    Width = 120
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'preprocess_treatment_protocolL'
                    Width = 120
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'fixative_protocolL'
                    Width = 120
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'fixation_protocolL'
                    Width = 120
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'postfix_protocolL'
                    Width = 120
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'entered_byL'
                    Width = 120
                    Visible = True
                  end>
              end
              object SlicesNavigator: TDBNavigator
                Left = 2
                Top = 482
                Width = 1416
                Height = 25
                DataSource = pgDM.slicesDataSource
                VisibleButtons = [nbInsert, nbDelete, nbRefresh, nbApplyUpdates, nbCancelUpdates]
                Align = alBottom
                TabOrder = 1
                OnClick = SlicesNavigatorClick
                ExplicitTop = 490
              end
            end
            object GroupBox9: TGroupBox
              Left = 0
              Top = 0
              Width = 1420
              Height = 297
              Align = alTop
              Caption = 'Specimen'
              TabOrder = 1
              object SpecimenNavigator: TDBNavigator
                Left = 2
                Top = 270
                Width = 1416
                Height = 25
                DataSource = SpecimenDS
                VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
                Align = alBottom
                TabOrder = 0
                BeforeAction = SpecimenNavigatorBeforeAction
                OnClick = SpecimenNavigatorClick
              end
              object SpecimenGrid: TDBGrid
                Left = 2
                Top = 73
                Width = 1416
                Height = 197
                Align = alClient
                DataSource = SpecimenDS
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDblClick = DBGridDblClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'id'
                    Title.Caption = 'Specimen ID'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'animal_id'
                    Title.Caption = 'Animal ID'
                    Width = 117
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'intake_date'
                    Title.Caption = 'Intake Date'
                    Width = 148
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LSpecie'
                    Width = 171
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'summary'
                    Title.Caption = 'Summary'
                    Width = 185
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LUser'
                    Width = 280
                    Visible = True
                  end>
              end
              object Panel20: TPanel
                Left = 2
                Top = 15
                Width = 1416
                Height = 58
                Align = alTop
                TabOrder = 2
                object SpecieRG: TRadioGroup
                  Left = 1261
                  Top = 1
                  Width = 154
                  Height = 56
                  Align = alRight
                  Caption = 'Species'
                  Columns = 2
                  ItemIndex = 0
                  Items.Strings = (
                    'Human'
                    'Mouse')
                  TabOrder = 0
                  OnClick = SpecieRGClick
                end
              end
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'Blocks'
            ImageIndex = 1
            ExplicitHeight = 814
            object Splitter6: TSplitter
              Left = 185
              Top = 0
              Height = 806
              ExplicitLeft = 216
              ExplicitTop = -3
              ExplicitHeight = 677
            end
            object mBlocksGB: TGroupBox
              Left = 188
              Top = 0
              Width = 1232
              Height = 806
              Align = alClient
              Caption = 'Blocks'
              TabOrder = 0
              ExplicitHeight = 814
              object BlockNotesGB: TGroupBox
                Left = 2
                Top = 524
                Width = 1228
                Height = 280
                Align = alBottom
                Caption = 'Notes'
                Padding.Left = 5
                Padding.Top = 5
                Padding.Right = 5
                Padding.Bottom = 5
                TabOrder = 0
                ExplicitTop = 532
                object Panel3: TPanel
                  Left = 206
                  Top = 20
                  Width = 1015
                  Height = 253
                  Align = alClient
                  TabOrder = 0
                  object mBlockNoteMemo: TDBMemo
                    Left = 1
                    Top = 1
                    Width = 1013
                    Height = 226
                    Align = alClient
                    DataField = 'note'
                    DataSource = pgDM.blockNotesDSource
                    TabOrder = 0
                  end
                  object DBNavigator2: TDBNavigator
                    Left = 1
                    Top = 227
                    Width = 1013
                    Height = 25
                    DataSource = pgDM.blockNotesDSource
                    VisibleButtons = [nbPost, nbCancel]
                    Align = alBottom
                    TabOrder = 1
                  end
                end
                object Panel4: TPanel
                  Left = 7
                  Top = 20
                  Width = 199
                  Height = 253
                  Align = alLeft
                  BevelOuter = bvNone
                  TabOrder = 1
                  object mBlockNoteNavigator: TDBNavigator
                    Left = 0
                    Top = 228
                    Width = 199
                    Height = 25
                    DataSource = pgDM.blockNotesDSource
                    VisibleButtons = [nbInsert, nbDelete, nbRefresh, nbApplyUpdates]
                    Align = alBottom
                    ConfirmDelete = False
                    TabOrder = 0
                    OnClick = mBlockNoteNavigatorClick
                  end
                  object mBlockNotesGrid: TDBGrid
                    Left = 0
                    Top = 0
                    Width = 199
                    Height = 228
                    Align = alClient
                    DataSource = pgDM.blockNotesDSource
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                    TabOrder = 1
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
                        Width = 161
                        Visible = True
                      end>
                  end
                end
              end
              object Panel2: TPanel
                Left = 2
                Top = 15
                Width = 938
                Height = 509
                Align = alClient
                BevelEdges = []
                BevelOuter = bvNone
                TabOrder = 1
                ExplicitHeight = 517
                object Panel5: TPanel
                  Left = 0
                  Top = 0
                  Width = 938
                  Height = 509
                  Align = alClient
                  TabOrder = 0
                  ExplicitHeight = 517
                  object BlocksGrid: TDBGrid
                    Left = 1
                    Top = 1
                    Width = 936
                    Height = 482
                    Align = alClient
                    DataSource = pgDM.blocksDataSource
                    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnCellClick = BlocksGridCellClick
                    OnDblClick = DBGrid_DBLClick
                    OnKeyUp = BlocksGridKeyUp
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'id'
                        Width = 35
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'slice_id'
                        Width = 78
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'entered_on'
                        Width = 98
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'LBlockStatus'
                        Width = 86
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'serial'
                        Width = 65
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'date_embedded'
                        Width = 120
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'LCryoProtectionProtocol'
                        Width = 120
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'LFreezingProtocol'
                        Width = 120
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'LSubstitutionProtocol'
                        Width = 120
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'LInfiltrationProtocol'
                        Width = 120
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'LEmbeddingProtocol'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'Cblock_label'
                        Width = 120
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'entered_byL'
                        Width = 120
                        Visible = True
                      end>
                  end
                  object mBlocksNavigator: TDBNavigator
                    Left = 1
                    Top = 483
                    Width = 936
                    Height = 25
                    DataSource = pgDM.blocksDataSource
                    VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh, nbApplyUpdates]
                    Align = alBottom
                    ConfirmDelete = False
                    TabOrder = 1
                    BeforeAction = mBlocksNavigatorBeforeAction
                    OnClick = mBlocksNavigatorClick
                    ExplicitTop = 491
                  end
                end
              end
              object GroupBox10: TGroupBox
                Left = 940
                Top = 15
                Width = 290
                Height = 509
                Align = alRight
                Caption = 'Print block labels'
                TabOrder = 2
                ExplicitHeight = 517
                object mLblMakerMemo: TMemo
                  Left = 2
                  Top = 15
                  Width = 144
                  Height = 492
                  Align = alLeft
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Times New Roman'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  ExplicitHeight = 500
                end
                object Button1: TButton
                  Left = 168
                  Top = 23
                  Width = 107
                  Height = 37
                  Caption = 'Print Block Info'
                  TabOrder = 1
                  OnClick = Button1Click
                end
              end
            end
            object LeftPanel: TPanel
              Left = 0
              Top = 0
              Width = 185
              Height = 806
              Align = alLeft
              Caption = 'LeftPanel'
              TabOrder = 1
              ExplicitHeight = 814
              object GroupBox15: TGroupBox
                Left = 1
                Top = 1
                Width = 183
                Height = 192
                Align = alTop
                Caption = 'Specimen'
                TabOrder = 0
                object Label1: TLabel
                  Left = 16
                  Top = 161
                  Width = 63
                  Height = 13
                  Caption = 'Specimen ID:'
                end
                object DBText5: TDBText
                  Left = 100
                  Top = 160
                  Width = 65
                  Height = 17
                  DataField = 'id'
                  DataSource = pgDM.specimenDataSource
                end
                object AnimalIDLookupListBox: TDBLookupListBox
                  Left = 2
                  Top = 41
                  Width = 179
                  Height = 108
                  Align = alTop
                  KeyField = 'id'
                  ListField = 'animal_id'
                  ListSource = pgDM.specimenDataSource
                  TabOrder = 0
                end
                object Panel21: TPanel
                  Left = 2
                  Top = 15
                  Width = 179
                  Height = 26
                  Align = alTop
                  TabOrder = 1
                  object Label3: TLabel
                    Left = 2
                    Top = 7
                    Width = 45
                    Height = 13
                    Caption = 'Animal ID'
                  end
                end
              end
              object GroupBox5: TGroupBox
                Left = 1
                Top = 193
                Width = 183
                Height = 612
                Align = alClient
                Caption = 'Slices'
                Padding.Left = 5
                Padding.Top = 2
                Padding.Right = 7
                Padding.Bottom = 2
                TabOrder = 1
                ExplicitHeight = 620
                object mProcessForBlocksGrid: TDBGrid
                  Left = 7
                  Top = 17
                  Width = 167
                  Height = 591
                  Align = alClient
                  DataSource = pgDM.slicesDataSource
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnCellClick = mProcessForBlocksGridCellClick
                  OnKeyUp = mProcessForBlocksGridKeyUp
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'id'
                      Title.Caption = 'Slice ID'
                      Width = 39
                      Visible = True
                    end>
                end
              end
            end
          end
          object TabSheet7: TTabSheet
            Caption = 'Ribbons'
            ImageIndex = 6
            ExplicitHeight = 814
            object Splitter5: TSplitter
              Left = 121
              Top = 0
              Height = 806
              ExplicitLeft = 144
              ExplicitTop = 256
              ExplicitHeight = 100
            end
            object GroupBox2: TGroupBox
              Left = 124
              Top = 0
              Width = 1296
              Height = 806
              Align = alClient
              Caption = 'Ribbon Data'
              TabOrder = 0
              ExplicitHeight = 814
              object Splitter1: TSplitter
                Left = 2
                Top = 635
                Width = 1292
                Height = 3
                Cursor = crVSplit
                Align = alBottom
                ExplicitLeft = 18
                ExplicitTop = 371
                ExplicitWidth = 597
              end
              object GroupBox1: TGroupBox
                Left = 2
                Top = 638
                Width = 1292
                Height = 166
                Align = alBottom
                Caption = 'Ribbon Notes'
                TabOrder = 0
                ExplicitTop = 646
                object Panel15: TPanel
                  Left = 2
                  Top = 15
                  Width = 185
                  Height = 149
                  Align = alLeft
                  TabOrder = 0
                  object mRibbonNotesGrid: TDBGrid
                    Left = 1
                    Top = 1
                    Width = 183
                    Height = 122
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
                  object mRibbonNotesNavigator: TDBNavigator
                    Left = 1
                    Top = 123
                    Width = 183
                    Height = 25
                    DataSource = pgDM.ribbonNotesDSource
                    VisibleButtons = [nbInsert, nbDelete, nbRefresh, nbApplyUpdates]
                    Align = alBottom
                    ConfirmDelete = False
                    TabOrder = 1
                    OnClick = mRibbonNotesNavigatorClick
                  end
                end
                object Panel16: TPanel
                  Left = 187
                  Top = 15
                  Width = 1103
                  Height = 149
                  Align = alClient
                  TabOrder = 1
                  object mRibbonNoteMemo: TDBMemo
                    Left = 1
                    Top = 1
                    Width = 1101
                    Height = 122
                    Align = alClient
                    DataField = 'note'
                    DataSource = pgDM.ribbonNotesDSource
                    TabOrder = 0
                  end
                  object mRibbonNoteNavigator: TDBNavigator
                    Left = 1
                    Top = 123
                    Width = 1101
                    Height = 25
                    DataSource = pgDM.ribbonNotesDSource
                    VisibleButtons = [nbPost, nbCancel]
                    Align = alBottom
                    TabOrder = 1
                  end
                end
              end
              object Panel13: TPanel
                Left = 2
                Top = 15
                Width = 1292
                Height = 620
                Align = alClient
                TabOrder = 1
                ExplicitHeight = 628
                object mRibbonsGrid: TDBGrid
                  Left = 1
                  Top = 1
                  Width = 1290
                  Height = 552
                  Align = alClient
                  DataSource = pgDM.mRibbonDSource
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'created'
                      Title.Caption = 'Date'
                      Width = 135
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'status'
                      Title.Caption = 'Status'
                      Width = 80
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'cutting_order'
                      Width = 80
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'nr_of_sections'
                      Title.Caption = 'Sections'
                      Width = 80
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'coverslip_id'
                      Width = 74
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'statusL'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'created_byL'
                      Visible = True
                    end>
                end
                object mRibbonsNavigator: TDBNavigator
                  Left = 1
                  Top = 553
                  Width = 1290
                  Height = 25
                  DataSource = pgDM.mRibbonDSource
                  VisibleButtons = [nbDelete, nbPost, nbCancel, nbRefresh]
                  Align = alBottom
                  ConfirmDelete = False
                  TabOrder = 1
                  OnClick = RibbonsNavigatorClick
                  ExplicitTop = 561
                end
                object Panel17: TPanel
                  Left = 1
                  Top = 578
                  Width = 1290
                  Height = 41
                  Align = alBottom
                  TabOrder = 2
                  ExplicitTop = 586
                  object DBText3: TDBText
                    Left = 15
                    Top = 6
                    Width = 236
                    Height = 17
                    DataField = 'id'
                    DataSource = pgDM.mRibbonDSource
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                end
              end
            end
            object GroupBox17: TGroupBox
              Left = 0
              Top = 0
              Width = 121
              Height = 806
              Align = alLeft
              Caption = 'Blocks'
              TabOrder = 1
              ExplicitHeight = 814
              object mBlocksForRibbonsGrid: TDBGrid
                Left = 2
                Top = 15
                Width = 117
                Height = 789
                Align = alClient
                DataSource = pgDM.blocksDataSource
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
                    Width = 34
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'serial'
                    Width = 39
                    Visible = True
                  end>
              end
            end
          end
        end
        object Panel22: TPanel
          Left = 0
          Top = 0
          Width = 1428
          Height = 41
          Align = alTop
          TabOrder = 1
        end
      end
      object TabSheet9: TTabSheet
        Caption = 'Coverslips'
        ImageIndex = 5
        ExplicitHeight = 883
        object Splitter4: TSplitter
          Left = 369
          Top = 0
          Height = 875
          ExplicitLeft = 8
          ExplicitTop = 24
          ExplicitHeight = 100
        end
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 369
          Height = 875
          Align = alLeft
          TabOrder = 0
          ExplicitHeight = 883
          object Splitter7: TSplitter
            Left = 1
            Top = 201
            Width = 367
            Height = 4
            Cursor = crVSplit
            Align = alTop
            ExplicitTop = 192
          end
          object GroupBox8: TGroupBox
            Left = 1
            Top = 205
            Width = 367
            Height = 637
            Align = alClient
            Caption = 'Cover Slips'
            TabOrder = 0
            ExplicitHeight = 645
            object CSNavigator: TDBNavigator
              Left = 2
              Top = 494
              Width = 363
              Height = 25
              DataSource = csPGDM.csDSource
              VisibleButtons = [nbPrior, nbNext, nbDelete, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
              Align = alBottom
              TabOrder = 0
              OnClick = CoverSlipNavigatorsClick
              ExplicitTop = 502
            end
            object mCoverSlipsGrid: TDBGrid
              Left = 2
              Top = 15
              Width = 363
              Height = 479
              Align = alClient
              DataSource = csPGDM.csDSource
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
              PopupMenu = CoverSlipPopup
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = mCoverSlipsGridCellClick
              OnKeyUp = mCoverSlipsGridKeyUp
              Columns = <
                item
                  Expanded = False
                  FieldName = 'id'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LStatus'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LType'
                  Width = 64
                  Visible = True
                end>
            end
            object CSgridPanel: TPanel
              Left = 2
              Top = 519
              Width = 363
              Height = 116
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 2
              ExplicitTop = 527
              object mNrOfSelectedCS: TIntLabel
                Left = 319
                Top = 16
                Width = 10
                Height = 13
                Caption = '-1'
                Value = -1
                TheFont.Charset = DEFAULT_CHARSET
                TheFont.Color = clWindowText
                TheFont.Height = -11
                TheFont.Name = 'Tahoma'
                TheFont.Style = []
              end
              object Label6: TLabel
                Left = 231
                Top = 16
                Width = 82
                Height = 13
                Caption = 'Selection Count: '
              end
              object mRegisterCarbonCoatBatchBtn: TButton
                Left = 79
                Top = 75
                Width = 152
                Height = 25
                Caption = 'Register Carbon Coat Batch'
                TabOrder = 0
                OnClick = mRegisterCarbonCoatBatchBtnClick
              end
              object RegisterPostSilanizationBatch: TButton
                Left = 47
                Top = 44
                Width = 132
                Height = 25
                Caption = 'Register Silanized Batch'
                TabOrder = 1
                OnClick = mRegisterCleanRoundBtnClick
              end
              object mRegisterCleanRoundBtn: TButton
                Left = 15
                Top = 13
                Width = 132
                Height = 25
                Caption = 'Register Clean Batch'
                Enabled = False
                TabOrder = 2
                OnClick = mRegisterCleanRoundBtnClick
              end
            end
          end
          object Panel9: TPanel
            Left = 1
            Top = 842
            Width = 367
            Height = 32
            Align = alBottom
            TabOrder = 1
            ExplicitTop = 850
            object mPrintCSLabelsBtn: TButton
              Left = 201
              Top = 4
              Width = 152
              Height = 25
              Caption = 'Print Labels for Selected'
              TabOrder = 0
              OnClick = mPrintCSLabelsBtnClick
            end
            object mAddCSNote: TButton
              Left = 4
              Top = 4
              Width = 145
              Height = 25
              Caption = 'Add Note to Multiple'
              TabOrder = 1
              OnClick = mPrintCSLabelsBtnClick
            end
          end
          object BatchesGB: TGroupBox
            Left = 1
            Top = 1
            Width = 367
            Height = 200
            Align = alTop
            Caption = 'Batches'
            TabOrder = 2
            object mFreshBatchesGrid: TDBGrid
              Left = 2
              Top = 56
              Width = 363
              Height = 117
              Align = alClient
              DataSource = csPGDM.csFreshBatchesDSource
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = mFreshBatchesGridCellClick
              OnKeyUp = mFreshBatchesGridKeyUp
              Columns = <
                item
                  Expanded = False
                  FieldName = 'date_created'
                  Width = 139
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'count'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'lot_number'
                  Width = 68
                  Visible = True
                end>
            end
            object CSFreshBatchNavigator: TDBNavigator
              Left = 2
              Top = 173
              Width = 363
              Height = 25
              DataSource = csPGDM.csFreshBatchesDSource
              VisibleButtons = [nbPrior, nbNext, nbDelete, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
              Align = alBottom
              TabOrder = 1
              OnClick = CoverSlipNavigatorsClick
            end
            object Panel12: TPanel
              Left = 2
              Top = 15
              Width = 363
              Height = 41
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 2
              object mRegisterFreshBatchBtn: TButton
                Left = 15
                Top = 10
                Width = 132
                Height = 25
                Caption = 'Register Batch'
                TabOrder = 0
                OnClick = mRegisterFreshBatchBtnClick
              end
              object mPrintBatchLblBtn: TButton
                Left = 226
                Top = 7
                Width = 125
                Height = 25
                Caption = 'Print Box Label'
                TabOrder = 1
                OnClick = mPrintBatchLblBtnClick
              end
            end
          end
        end
        object Panel8: TPanel
          Left = 372
          Top = 0
          Width = 1056
          Height = 875
          Align = alClient
          TabOrder = 1
          ExplicitHeight = 883
          object PageControl3: TPageControl
            Left = 1
            Top = 1
            Width = 1054
            Height = 873
            ActivePage = TabSheet11
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 881
            object TabSheet11: TTabSheet
              Caption = 'Coverslip Info'
              ExplicitHeight = 853
              object GroupBox12: TGroupBox
                Left = 0
                Top = 115
                Width = 1046
                Height = 730
                Align = alClient
                Caption = 'Coverslip notes'
                TabOrder = 0
                ExplicitHeight = 738
                object DBMemo1: TDBMemo
                  Left = 2
                  Top = 15
                  Width = 1042
                  Height = 713
                  Align = alClient
                  DataField = 'notes'
                  DataSource = csPGDM.csDSource
                  ScrollBars = ssBoth
                  TabOrder = 0
                  ExplicitHeight = 721
                end
              end
              object Panel18: TPanel
                Left = 0
                Top = 0
                Width = 1046
                Height = 115
                Align = alTop
                TabOrder = 1
                object GroupBox11: TGroupBox
                  Left = 1
                  Top = 1
                  Width = 280
                  Height = 113
                  Align = alLeft
                  Caption = 'Identification'
                  TabOrder = 0
                  object Label10: TLabel
                    Left = 16
                    Top = 64
                    Width = 31
                    Height = 13
                    Caption = 'Status'
                    FocusControl = DBLookupComboBox1
                  end
                  object Label16: TLabel
                    Left = 191
                    Top = 64
                    Width = 46
                    Height = 13
                    Caption = 'From LOT'
                    FocusControl = DBEdit7
                  end
                  object DBText2: TDBText
                    Left = 16
                    Top = 32
                    Width = 65
                    Height = 17
                    DataField = 'id'
                    DataSource = csPGDM.csDSource
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object DBLookupComboBox1: TDBLookupComboBox
                    Left = 16
                    Top = 80
                    Width = 169
                    Height = 21
                    DataField = 'LStatus'
                    DataSource = csPGDM.csDSource
                    TabOrder = 0
                  end
                  object DBEdit7: TDBEdit
                    Left = 191
                    Top = 80
                    Width = 74
                    Height = 21
                    DataField = 'from_lot'
                    DataSource = csPGDM.csDSource
                    Enabled = False
                    ReadOnly = True
                    TabOrder = 1
                  end
                end
                object GroupBox18: TGroupBox
                  Left = 281
                  Top = 1
                  Width = 764
                  Height = 113
                  Align = alClient
                  Caption = 'Ribbon(s)'
                  TabOrder = 1
                  object DBGrid1: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 760
                    Height = 96
                    Align = alClient
                    DataSource = TTableFrame1.DataSource1
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
              end
            end
          end
        end
      end
      object TabSheet10: TTabSheet
        Caption = 'Media'
        ImageIndex = 6
        ExplicitHeight = 883
        object MediaPageControl: TPageControl
          Left = 73
          Top = 0
          Width = 1355
          Height = 875
          ActivePage = TabSheet1
          Align = alClient
          TabOrder = 0
          OnChange = MediaPageControlChange
          ExplicitHeight = 883
          object TabSheet1: TTabSheet
            Caption = 'Movies'
            ImageIndex = 1
            ExplicitHeight = 855
            inline TMoviesFrame1: TMoviesFrame
              Left = 0
              Top = 0
              Width = 1347
              Height = 847
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 1347
              ExplicitHeight = 855
              inherited Panel22: TPanel
                Top = 792
                Width = 1347
                ExplicitTop = 800
                ExplicitWidth = 1347
              end
              inherited ScrollBox2: TScrollBox
                Width = 1347
                Height = 792
                ExplicitWidth = 1347
                ExplicitHeight = 800
                inherited FlowPanel1: TFlowPanel
                  Width = 1343
                  ExplicitWidth = 1343
                end
              end
            end
          end
          object TabSheet14: TTabSheet
            Caption = 'Images'
            ImageIndex = 2
            ExplicitHeight = 855
            inline TImagesFrame1: TImagesFrame
              Left = 0
              Top = 0
              Width = 1347
              Height = 847
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 1347
              ExplicitHeight = 855
              inherited Panel22: TPanel
                Top = 792
                Width = 1347
                ExplicitTop = 800
                ExplicitWidth = 1347
              end
              inherited ScrollBox2: TScrollBox
                Width = 1347
                Height = 792
                ExplicitWidth = 1347
                ExplicitHeight = 800
                inherited FlowPanel1: TFlowPanel
                  Width = 1343
                  ExplicitWidth = 1343
                end
              end
            end
          end
        end
        object GroupBox16: TGroupBox
          Left = 0
          Top = 0
          Width = 73
          Height = 875
          Align = alLeft
          Caption = 'Block IDs'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 1
          ExplicitHeight = 883
          object BlockIDSLLB: TDBLookupListBox
            Left = 2
            Top = 15
            Width = 69
            Height = 849
            Align = alClient
            KeyField = 'id'
            ListField = 'id'
            ListSource = pgDM.blockIDsDataSource
            TabOrder = 0
            OnKeyDown = BlockIDSLLBKeyDown
            OnKeyUp = BlockIDSLLBKeyUp
            OnMouseUp = BlockIDSLLBMouseUp
            ExplicitHeight = 862
          end
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'All Tables'
        ImageIndex = 4
        ExplicitHeight = 883
        object mTablesLB: TListBox
          Left = 0
          Top = 0
          Width = 153
          Height = 875
          Align = alLeft
          ItemHeight = 13
          TabOrder = 0
          OnClick = mTablesLBClick
          ExplicitHeight = 883
        end
        object Panel6: TPanel
          Left = 153
          Top = 0
          Width = 1275
          Height = 875
          Align = alClient
          Caption = 'Panel6'
          TabOrder = 1
          ExplicitHeight = 883
          inline TTableFrame1: TTableFrame
            Left = 1
            Top = 65
            Width = 1273
            Height = 809
            Align = alClient
            TabOrder = 0
            ExplicitLeft = 1
            ExplicitTop = 65
            ExplicitWidth = 1273
            ExplicitHeight = 817
            inherited GroupBox1: TGroupBox
              Width = 1273
              Height = 809
              Align = alClient
              ExplicitWidth = 1273
              ExplicitHeight = 817
              inherited DBGrid1: TDBGrid
                Top = 15
                Width = 1269
                Height = 750
                Align = alClient
              end
              inherited DBNavigator1: TDBNavigator
                Top = 765
                Width = 1269
                Hints.Strings = ()
                ExplicitTop = 773
                ExplicitWidth = 1269
              end
            end
            inherited ClientDataSet1: TClientDataSet
              Left = 520
              Top = 184
            end
            inherited SQLDataSet1: TSQLDataSet
              Left = 520
              Top = 112
            end
          end
          object Panel19: TPanel
            Left = 1
            Top = 1
            Width = 1273
            Height = 64
            Align = alTop
            TabOrder = 1
            object UnlocktablesBtn: TBitBtn
              Left = 5
              Top = 11
              Width = 84
              Height = 38
              Caption = 'Unlock'
              Glyph.Data = {
                F6060000424DF606000000000000360000002800000018000000180000000100
                180000000000C0060000C30E0000C30E00000000000000000000C6D4DDABB5C3
                B3BBC7DDDDDEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF98D0EB308CDE2874D85688C3D9DADCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF85AEDB42A2E32F88D91D77DDA7BACDFEFEFEFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF64BDE9307CCB45A9E440AEE37699
                BB9EB6C8DCDDDEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEEDF44DAAE9
                2974C749B2E549AEE5399BEC79ABC8F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFDEECF452B3EE3082CA54B7E95BB4E3509ACE90B0C4DBDBDCFEFEFE
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1EFF461C7F13A8ACE6BC5EB6BBBE136
                A2EA6BA7C9DBDCDDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEDF468C6
                F24792CD69C4EA46A3DE3AA1EB72AAC9DBDBDCFEFEFEFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFE2EEF49BE5F44B95CD53BBEB4CA8DD3CA0E86DA8C8D7D8D9FEFE
                FEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6F1F58CDCF33D8ECE58C0ED4CA2D8
                379CE467A9C7BBC5C9C2C9CBEEEEEFD5D9DDC2C8CECBCFD3E5E5E6F9F9F9FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EEF46C
                D1F43C8DCB57BFEC52A6D5308BCB56C6F166CCEB4875B22765BC2B85DF359AE5
                489CD27E9FBAD8D9DAFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFE4F0F567CAF32880C64FBBEB61D1FA5BD4FF59D4FF55C3F545
                B2F361D1FC50C4FA41AFF6369AF34B8CCFC1C8CEFDFDFDFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEDF469CBF456C8F668DAFF61DC
                FF5ED9FF58D2FF51CAFF68D9FE59CEFB68CCF881CBF64E9EF0488ED7D3D7DAFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3EEF3
                79DCFA6BDEFF64E1FF61DDFF5BD6FF54CEFF65D6FD8EDBFD9BE2FDC3DDE7B5DB
                F73B92F0709CCAF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFF4F7F966B1EF71E2FE65E2FF62DDFF5CD7FF53CBFEB0E6FEA9E5FD
                BBD7DFFDFEFEE4F0F95DA2ED3E90E3D9DCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFD7E4F065B8F86BE0FF62DDFF5DD8FF57D1FEAB
                E5FEC4EFFDC4DBE1FDFDFDFFFFFFFDFEFE67A1E348A2F3B2C4D2FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCADEED75CAFD5FD7FF59D3
                FF57CDFEB2E9FEC2F3FDCBDEE1FEFEFEFFFFFFFFFFFFFFFFFF72A1E058AFF7A6
                C2D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4E4EF
                83D1FD50C5FC4BBFFBA7E2FDCBF8FDCADCDDFEFEFEFFFFFFFFFFFFFFFFFFFFFF
                FF6997D956B3F9B3CCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFEDF3F78AD4F953B5F74CB1F6B7F1FDC7DBDCFDFDFDFFFFFFFFFFFF
                FFFFFFFFFFFFEEF1F44E8CDE51B3F6D7E1E7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFE9FD8F384C6F73D9EEEB6D4D7FDFDFDFF
                FFFFFFFFFFFFFFFFFFFFFFFEFEFE86AAD851A3F26BB6EAFBFBFBFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEEF6B7E5FC6DAE
                EE6D93BCD3D4D5F5F5F5FCFCFCFCFBFCEEEFF18FB5D85EA8EF45A6F7C8DEEDFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFD6ECF6EBF7FD9EC5F35188D0648CBF7CA1C574A5CC6BAFE17EC3FA52AD
                F9A8D1EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFE5F2F8E0F3F9D4F4FDACDCF9A0D7F9ABE0FC
                91D7FE7BC5F7C3E0F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FCFDDFF0F8C7
                EAF7B9E6F6C2E7F7D3EAF6F6FBFDFFFFFFFFFFFFFFFFFFFFFFFF}
              TabOrder = 0
              OnClick = UnlocktablesBtnClick
            end
          end
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Settings'
        ImageIndex = 5
        ExplicitHeight = 883
        object GroupBox13: TGroupBox
          Left = 305
          Top = 12
          Width = 345
          Height = 233
          Caption = 'ATDB Users'
          TabOrder = 0
          object mUsersDBGrid: TDBGrid
            Left = 2
            Top = 15
            Width = 341
            Height = 191
            Align = alClient
            DataSource = pgDM.usersDataSource
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'user_name'
                Title.Caption = 'User'
                Width = 182
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'id'
                Visible = True
              end>
          end
          object mUsersNavigator: TDBNavigator
            Left = 2
            Top = 206
            Width = 341
            Height = 25
            DataSource = pgDM.usersDataSource
            VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
            Align = alBottom
            TabOrder = 1
            OnClick = mUsersNavigatorClick
          end
        end
        object GroupBox14: TGroupBox
          Left = 16
          Top = 379
          Width = 635
          Height = 406
          Caption = 'Coverslip Print Settings'
          TabOrder = 1
          object DBText4: TDBText
            Left = 16
            Top = 25
            Width = 65
            Height = 17
            DataField = 'id'
            DataSource = settingsDS
          end
          object mTestLabel: TSTDStringLabeledEdit
            Left = 352
            Top = 200
            Width = 121
            Height = 21
            EditLabel.Width = 75
            EditLabel.Height = 13
            EditLabel.Caption = 'Test Label Data'
            TabOrder = 0
            Text = 'C0001234'
            Value = 'C0001234'
          end
          object mPrintTestLabelBtn: TButton
            Left = 352
            Top = 244
            Width = 87
            Height = 25
            Caption = 'Print One'
            TabOrder = 1
            OnClick = mPrintTestLabelBtnClick
          end
          object mBarCodeCommandMemo: TDBMemo
            Left = 16
            Top = 48
            Width = 297
            Height = 169
            DataField = 'label_printer_command'
            DataSource = settingsDS
            TabOrder = 2
          end
          object settingsNavigator: TDBNavigator
            Left = 16
            Top = 240
            Width = 240
            Height = 25
            DataSource = settingsDS
            TabOrder = 3
            OnClick = settingsNavigatorClick
          end
        end
        object GroupBox20: TGroupBox
          Left = 686
          Top = 19
          Width = 395
          Height = 85
          BiDiMode = bdLeftToRight
          Caption = 'Media'
          ParentBiDiMode = False
          TabOrder = 2
          object BrowseForMediaFolderBtn: TButton
            Left = 339
            Top = 47
            Width = 27
            Height = 25
            Action = BrowseForFolder1
            TabOrder = 0
          end
          object MediaFolderE: TSTDStringLabeledEdit
            Left = 16
            Top = 49
            Width = 317
            Height = 21
            EditLabel.Width = 87
            EditLabel.Height = 13
            EditLabel.Caption = 'Media Root Folder'
            TabOrder = 1
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Logs'
        ImageIndex = 6
        ExplicitHeight = 883
        object BottomPanel: TPanel
          Left = 0
          Top = 0
          Width = 1428
          Height = 875
          Align = alClient
          TabOrder = 0
          ExplicitHeight = 883
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 1426
            Height = 873
            Align = alClient
            Caption = 'Panel1'
            TabOrder = 0
            ExplicitHeight = 881
            object infoMemo: TMemo
              Left = 1
              Top = 22
              Width = 1424
              Height = 850
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Consolas'
              Font.Style = []
              ParentFont = False
              PopupMenu = LogMemoPopup
              ScrollBars = ssBoth
              TabOrder = 0
              ExplicitHeight = 858
            end
            object ToolBar1: TToolBar
              Left = 1
              Top = 1
              Width = 1424
              Height = 21
              AutoSize = True
              ButtonHeight = 21
              ButtonWidth = 82
              Caption = 'ToolBar1'
              ShowCaptions = True
              TabOrder = 1
              object ToolButton2: TToolButton
                Left = 0
                Top = 0
                Action = ClearMemoA
              end
              object ToolButton1: TToolButton
                Left = 82
                Top = 0
                Width = 41
                Caption = 'ToolButton1'
                ImageIndex = 0
                Style = tbsSeparator
              end
              object LogLevelCB: TComboBox
                Left = 123
                Top = 0
                Width = 145
                Height = 21
                ItemIndex = 0
                TabOrder = 0
                Text = 'INFO'
                OnChange = LogLevelCBChange
                Items.Strings = (
                  'INFO'
                  'Everything')
              end
            end
          end
        end
      end
    end
  end
  object SB: TStatusBar
    Left = 0
    Top = 978
    Width = 1438
    Height = 19
    Panels = <>
  end
  object MenuPanel: TPanel
    Left = 0
    Top = 0
    Width = 1438
    Height = 73
    Align = alTop
    TabOrder = 2
    DesignSize = (
      1438
      73)
    object Label2: TLabel
      Left = 1281
      Top = 15
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'User:'
    end
    object UsersCB: TDBLookupComboBox
      Left = 1281
      Top = 34
      Width = 145
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'id'
      ListField = 'user_name'
      ListSource = pgDM.usersDataSource
      TabOrder = 0
      OnCloseUp = UsersCBCloseUp
    end
    inline TPGConnectionFrame1: TPGConnectionFrame
      Left = 1
      Top = 1
      Width = 917
      Height = 71
      Align = alLeft
      TabOrder = 1
      ExplicitLeft = 520
      ExplicitTop = 1
      ExplicitWidth = 917
      ExplicitHeight = 71
      inherited GBox1: TGroupBox
        Width = 917
        Height = 71
        Align = alClient
        ExplicitLeft = 104
        ExplicitWidth = 929
        ExplicitHeight = 71
        inherited mServerIPE: TSTDStringLabeledEdit
          Top = 36
          Width = 341
          EditLabel.ExplicitLeft = 16
          EditLabel.ExplicitTop = 20
          EditLabel.ExplicitWidth = 74
          ExplicitTop = 36
          ExplicitWidth = 341
        end
        inherited mDBUserE: TSTDStringLabeledEdit
          Left = 519
          Top = 36
          EditLabel.ExplicitLeft = 519
          EditLabel.ExplicitTop = 20
          EditLabel.ExplicitWidth = 22
          ExplicitLeft = 519
          ExplicitTop = 36
        end
        inherited mPasswordE: TSTDStringLabeledEdit
          Left = 657
          Top = 36
          EditLabel.ExplicitLeft = 657
          EditLabel.ExplicitTop = 20
          EditLabel.ExplicitWidth = 46
          ExplicitLeft = 657
          ExplicitTop = 36
        end
        inherited mDatabaseE: TSTDStringLabeledEdit
          Left = 371
          Top = 36
          EditLabel.ExplicitLeft = 371
          EditLabel.ExplicitTop = 20
          EditLabel.ExplicitWidth = 46
          ExplicitLeft = 371
          ExplicitTop = 36
        end
        inherited ArrayBotButton1: TArrayBotButton
          Left = 796
          Top = 18
          ExplicitLeft = 796
          ExplicitTop = 18
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 528
    object ClearMemoA: TAction
      Category = 'Memo'
      Caption = 'Clear Messages'
      OnExecute = ClearMemoAExecute
    end
    object FileExit1: TFileExit
      Caption = 'E&xit'
      Hint = 'Exit|Quits the application'
      ImageIndex = 43
    end
    object OpenAboutFormA: TAction
      Caption = 'About'
      OnExecute = OpenAboutFormAExecute
    end
    object BrowseForFolder1: TBrowseForFolder
      Category = 'File'
      Caption = '...'
      DialogCaption = '...'
      BrowseOptions = [bifEditBox, bifNewDialogStyle, bifStatusText]
      OnAccept = BrowseForFolder1Accept
    end
  end
  object LogMemoPopup: TPopupMenu
    Left = 912
    Top = 280
    object ClearMemoA1: TMenuItem
      Action = ClearMemoA
    end
  end
  object mIniFileC: mtkIniFileC
    IniFileName = 'atDB.ini'
    RootFolder = '.'
    Left = 346
  end
  object MainMenu1: TMainMenu
    Left = 469
    object File1: TMenuItem
      Caption = 'File'
      object Exit1: TMenuItem
        Action = FileExit1
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object About1: TMenuItem
        Action = OpenAboutFormA
      end
    end
  end
  object ShutDownTimer: TTimer
    Enabled = False
    Interval = 50
    OnTimer = ShutDownTimerTimer
    Left = 266
  end
  object SpecimenPopup: TPopupMenu
    Left = 1000
    Top = 272
    object openDocument: TMenuItem
      Caption = 'Open Document'
    end
  end
  object CoverSlipPopup: TPopupMenu
    Left = 1088
    Top = 272
    object SetStatus1: TMenuItem
      Caption = 'Set Status'
      object FreshoutoftheBoxMenuItem: TMenuItem
        Caption = 'Fresh out of the Box'
        OnClick = DiscardedMenuItemClick
      end
      object DiscardedMenuItem: TMenuItem
        Caption = 'Discarded'
        OnClick = DiscardedMenuItemClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
    end
  end
  object settingsDS: TDataSource
    DataSet = pgDM.settingsCDS
    Left = 632
    Top = 160
  end
  object SpecimenDS: TDataSource
    DataSet = pgDM.specimenCDS
    Left = 784
    Top = 272
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 680
    Top = 96
  end
end
