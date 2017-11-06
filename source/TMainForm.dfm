object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'atDB'
  ClientHeight = 934
  ClientWidth = 1333
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
    Top = 41
    Width = 1333
    Height = 874
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 1331
      Height = 872
      ActivePage = TabSheet13
      Align = alClient
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object TabSheet4: TTabSheet
        Caption = 'Tissue to Block'
        object PageControl2: TPageControl
          Left = 0
          Top = 41
          Width = 1323
          Height = 803
          ActivePage = TabSheet8
          Align = alClient
          TabOrder = 0
          OnChange = PageControl2Change
          object TabSheet8: TTabSheet
            Caption = 'Specimen && Slices'
            object GroupBox4: TGroupBox
              Left = 0
              Top = 297
              Width = 1315
              Height = 478
              Align = alClient
              Caption = 'Slices'
              TabOrder = 0
              object SlicesGrid: TDBGrid
                Left = 2
                Top = 15
                Width = 1311
                Height = 436
                Align = alClient
                DataSource = atdbDM.slicesDataSource
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
                Top = 451
                Width = 1311
                Height = 25
                DataSource = atdbDM.slicesDataSource
                VisibleButtons = [nbInsert, nbDelete, nbRefresh, nbApplyUpdates, nbCancelUpdates]
                Align = alBottom
                TabOrder = 1
                OnClick = SlicesNavigatorClick
              end
            end
            object GroupBox9: TGroupBox
              Left = 0
              Top = 0
              Width = 1315
              Height = 297
              Align = alTop
              Caption = 'Specimen'
              TabOrder = 1
              object SpecimenNavigator: TDBNavigator
                Left = 2
                Top = 270
                Width = 1311
                Height = 25
                DataSource = SpecimenDS
                VisibleButtons = [nbInsert, nbDelete, nbRefresh, nbApplyUpdates, nbCancelUpdates]
                Align = alBottom
                TabOrder = 0
                BeforeAction = SpecimenNavigatorBeforeAction
                OnClick = SpecimenNavigatorClick
              end
              object SpecimenGrid: TDBGrid
                Left = 2
                Top = 73
                Width = 1311
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
                Width = 1311
                Height = 58
                Align = alTop
                TabOrder = 2
                object SpecieRG: TRadioGroup
                  Left = 1156
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
            object Splitter6: TSplitter
              Left = 185
              Top = 0
              Height = 775
              ExplicitLeft = 216
              ExplicitTop = -3
              ExplicitHeight = 677
            end
            object mBlocksGB: TGroupBox
              Left = 188
              Top = 0
              Width = 1127
              Height = 775
              Align = alClient
              Caption = 'Blocks'
              TabOrder = 0
              object BlockNotesGB: TGroupBox
                Left = 2
                Top = 493
                Width = 1123
                Height = 280
                Align = alBottom
                Caption = 'Notes'
                Padding.Left = 5
                Padding.Top = 5
                Padding.Right = 5
                Padding.Bottom = 5
                TabOrder = 0
                object Panel3: TPanel
                  Left = 206
                  Top = 20
                  Width = 910
                  Height = 253
                  Align = alClient
                  TabOrder = 0
                  object mBlockNoteMemo: TDBMemo
                    Left = 1
                    Top = 1
                    Width = 908
                    Height = 226
                    Align = alClient
                    DataField = 'note'
                    DataSource = atdbDM.blockNotesDSource
                    TabOrder = 0
                  end
                  object DBNavigator2: TDBNavigator
                    Left = 1
                    Top = 227
                    Width = 908
                    Height = 25
                    DataSource = atdbDM.blockNotesDSource
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
                    DataSource = atdbDM.blockNotesDSource
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
                    DataSource = atdbDM.blockNotesDSource
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
                Width = 833
                Height = 478
                Align = alClient
                BevelEdges = []
                BevelOuter = bvNone
                TabOrder = 1
                object Panel5: TPanel
                  Left = 0
                  Top = 0
                  Width = 833
                  Height = 478
                  Align = alClient
                  TabOrder = 0
                  object BlocksGrid: TDBGrid
                    Left = 1
                    Top = 1
                    Width = 831
                    Height = 451
                    Align = alClient
                    DataSource = atdbDM.blocksDataSource
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
                    Top = 452
                    Width = 831
                    Height = 25
                    DataSource = atdbDM.blocksDataSource
                    VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh, nbApplyUpdates]
                    Align = alBottom
                    ConfirmDelete = False
                    TabOrder = 1
                    BeforeAction = mBlocksNavigatorBeforeAction
                    OnClick = mBlocksNavigatorClick
                  end
                end
              end
              object GroupBox10: TGroupBox
                Left = 835
                Top = 15
                Width = 290
                Height = 478
                Align = alRight
                Caption = 'Print block labels'
                TabOrder = 2
                object mLblMakerMemo: TMemo
                  Left = 2
                  Top = 15
                  Width = 144
                  Height = 461
                  Align = alLeft
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Times New Roman'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
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
              Height = 775
              Align = alLeft
              Caption = 'LeftPanel'
              TabOrder = 1
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
                  DataSource = atdbDM.specimenDataSource
                end
                object AnimalIDLookupListBox: TDBLookupListBox
                  Left = 2
                  Top = 41
                  Width = 179
                  Height = 108
                  Align = alTop
                  KeyField = 'id'
                  ListField = 'animal_id'
                  ListSource = atdbDM.specimenDataSource
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
                Height = 581
                Align = alClient
                Caption = 'Slices'
                Padding.Left = 5
                Padding.Top = 2
                Padding.Right = 7
                Padding.Bottom = 2
                TabOrder = 1
                object mProcessForBlocksGrid: TDBGrid
                  Left = 7
                  Top = 17
                  Width = 167
                  Height = 560
                  Align = alClient
                  DataSource = atdbDM.slicesDataSource
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
            object Splitter5: TSplitter
              Left = 121
              Top = 0
              Height = 775
              ExplicitLeft = 144
              ExplicitTop = 256
              ExplicitHeight = 100
            end
            object GroupBox2: TGroupBox
              Left = 124
              Top = 0
              Width = 1191
              Height = 775
              Align = alClient
              Caption = 'Ribbon Data'
              TabOrder = 0
              object Splitter1: TSplitter
                Left = 2
                Top = 604
                Width = 1187
                Height = 3
                Cursor = crVSplit
                Align = alBottom
                ExplicitLeft = 18
                ExplicitTop = 371
                ExplicitWidth = 597
              end
              object GroupBox1: TGroupBox
                Left = 2
                Top = 607
                Width = 1187
                Height = 166
                Align = alBottom
                Caption = 'Ribbon Notes'
                TabOrder = 0
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
                    DataSource = atdbDM.ribbonNotesDSource
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
                    DataSource = atdbDM.ribbonNotesDSource
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
                  Width = 998
                  Height = 149
                  Align = alClient
                  TabOrder = 1
                  object mRibbonNoteMemo: TDBMemo
                    Left = 1
                    Top = 1
                    Width = 996
                    Height = 122
                    Align = alClient
                    DataField = 'note'
                    DataSource = atdbDM.ribbonNotesDSource
                    TabOrder = 0
                  end
                  object mRibbonNoteNavigator: TDBNavigator
                    Left = 1
                    Top = 123
                    Width = 996
                    Height = 25
                    DataSource = atdbDM.ribbonNotesDSource
                    VisibleButtons = [nbPost, nbCancel]
                    Align = alBottom
                    TabOrder = 1
                  end
                end
              end
              object Panel13: TPanel
                Left = 2
                Top = 15
                Width = 1187
                Height = 589
                Align = alClient
                TabOrder = 1
                object mRibbonsGrid: TDBGrid
                  Left = 1
                  Top = 1
                  Width = 1185
                  Height = 521
                  Align = alClient
                  DataSource = atdbDM.mRibbonDSource
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
                      Width = 80
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
                      FieldName = 'created_by'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'coverslip_id'
                      Width = 74
                      Visible = True
                    end>
                end
                object mRibbonsNavigator: TDBNavigator
                  Left = 1
                  Top = 522
                  Width = 1185
                  Height = 25
                  DataSource = atdbDM.mRibbonDSource
                  VisibleButtons = [nbDelete, nbPost, nbCancel, nbRefresh]
                  Align = alBottom
                  ConfirmDelete = False
                  TabOrder = 1
                  OnClick = RibbonsNavigatorClick
                end
                object Panel17: TPanel
                  Left = 1
                  Top = 547
                  Width = 1185
                  Height = 41
                  Align = alBottom
                  TabOrder = 2
                  object DBText3: TDBText
                    Left = 15
                    Top = 6
                    Width = 236
                    Height = 17
                    DataField = 'id'
                    DataSource = atdbDM.mRibbonDSource
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
              Height = 775
              Align = alLeft
              Caption = 'Blocks'
              TabOrder = 1
              object mBlocksForRibbonsGrid: TDBGrid
                Left = 2
                Top = 15
                Width = 117
                Height = 758
                Align = alClient
                DataSource = atdbDM.blocksDataSource
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
          Width = 1323
          Height = 41
          Align = alTop
          TabOrder = 1
        end
      end
      object TabSheet9: TTabSheet
        Caption = 'Coverslips'
        ImageIndex = 5
        object Splitter4: TSplitter
          Left = 369
          Top = 0
          Height = 844
          ExplicitLeft = 8
          ExplicitTop = 24
          ExplicitHeight = 100
        end
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 369
          Height = 844
          Align = alLeft
          TabOrder = 0
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
            Height = 606
            Align = alClient
            Caption = 'Cover Slips'
            TabOrder = 0
            object CSNavigator: TDBNavigator
              Left = 2
              Top = 463
              Width = 363
              Height = 25
              DataSource = csDM.csDSource
              VisibleButtons = [nbPrior, nbNext, nbDelete, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
              Align = alBottom
              TabOrder = 0
              OnClick = CoverSlipNavigatorsClick
            end
            object mCoverSlipsGrid: TDBGrid
              Left = 2
              Top = 15
              Width = 363
              Height = 448
              Align = alClient
              DataSource = csDM.csDSource
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
              Top = 488
              Width = 363
              Height = 116
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 2
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
            Top = 811
            Width = 367
            Height = 32
            Align = alBottom
            TabOrder = 1
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
              DataSource = csDM.csFreshBatchesDSource
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
              DataSource = csDM.csFreshBatchesDSource
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
          Width = 951
          Height = 844
          Align = alClient
          TabOrder = 1
          object PageControl3: TPageControl
            Left = 1
            Top = 1
            Width = 949
            Height = 842
            ActivePage = TabSheet11
            Align = alClient
            TabOrder = 0
            object TabSheet11: TTabSheet
              Caption = 'Coverslip Info'
              object GroupBox12: TGroupBox
                Left = 0
                Top = 115
                Width = 941
                Height = 699
                Align = alClient
                Caption = 'Coverslip notes'
                TabOrder = 0
                object DBMemo1: TDBMemo
                  Left = 2
                  Top = 15
                  Width = 937
                  Height = 682
                  Align = alClient
                  DataField = 'notes'
                  DataSource = csDM.csDSource
                  ScrollBars = ssBoth
                  TabOrder = 0
                end
              end
              object Panel18: TPanel
                Left = 0
                Top = 0
                Width = 941
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
                    DataSource = csDM.csDSource
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
                    DataSource = csDM.csDSource
                    TabOrder = 0
                  end
                  object DBEdit7: TDBEdit
                    Left = 191
                    Top = 80
                    Width = 74
                    Height = 21
                    DataField = 'from_lot'
                    DataSource = csDM.csDSource
                    Enabled = False
                    ReadOnly = True
                    TabOrder = 1
                  end
                end
                object GroupBox18: TGroupBox
                  Left = 281
                  Top = 1
                  Width = 659
                  Height = 113
                  Align = alClient
                  Caption = 'Ribbon(s)'
                  TabOrder = 1
                  object DBGrid1: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 655
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
            object TabSheet12: TTabSheet
              Caption = 'Dust Assays'
              ImageIndex = 1
              object Splitter2: TSplitter
                Left = 0
                Top = 587
                Width = 941
                Height = 3
                Cursor = crVSplit
                Align = alBottom
                ExplicitLeft = 1
                ExplicitTop = 265
                ExplicitWidth = 223
              end
              object GroupBox6: TGroupBox
                Left = 0
                Top = 0
                Width = 941
                Height = 264
                Align = alTop
                Caption = 'CoverSlip Dust Assays'
                TabOrder = 0
                object cdDustAssayNavigator: TDBNavigator
                  Left = 2
                  Top = 237
                  Width = 937
                  Height = 25
                  DataSource = csDM.csDustAsssayDSource
                  VisibleButtons = [nbDelete, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
                  Align = alBottom
                  TabOrder = 0
                  BeforeAction = cdDustAssayNavigatorBeforeAction
                  OnClick = CoverSlipNavigatorsClick
                end
                object mCSDustAssaysGrid: TDBGrid
                  Left = 2
                  Top = 15
                  Width = 255
                  Height = 222
                  Align = alLeft
                  DataSource = csDM.csDustAsssayDSource
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'date'
                      Width = 85
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'coverslip_id'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'coverslip_status'
                      Visible = True
                    end>
                end
                object Panel10: TPanel
                  Left = 257
                  Top = 15
                  Width = 682
                  Height = 222
                  Align = alClient
                  TabOrder = 2
                  DesignSize = (
                    682
                    222)
                  object Label4: TLabel
                    Left = 6
                    Top = 13
                    Width = 28
                    Height = 13
                    Caption = 'Notes'
                  end
                  object DBText1: TDBText
                    Left = 619
                    Top = 9
                    Width = 49
                    Height = 17
                    Alignment = taRightJustify
                    Anchors = [akTop, akRight]
                    DataField = 'id'
                    DataSource = csDM.csDustAsssayDSource
                    ExplicitLeft = 272
                  end
                  object DBMemo2: TDBMemo
                    Left = 1
                    Top = 32
                    Width = 680
                    Height = 189
                    Align = alBottom
                    DataField = 'note'
                    DataSource = csDM.csDustAsssayDSource
                    TabOrder = 0
                  end
                end
              end
              object mResultImagePanel: TPanel
                Left = 0
                Top = 590
                Width = 941
                Height = 224
                Align = alBottom
                TabOrder = 1
                object mResultImage: TImage
                  Left = 1
                  Top = 1
                  Width = 939
                  Height = 205
                  Align = alClient
                  IncrementalDisplay = True
                  Proportional = True
                  Stretch = True
                  ExplicitLeft = 208
                  ExplicitTop = 31
                  ExplicitWidth = 209
                  ExplicitHeight = 105
                end
                object mIm3FName: TDBText
                  Left = 1
                  Top = 206
                  Width = 939
                  Height = 17
                  Align = alBottom
                  DataField = 'result_image'
                  DataSource = csDM.csDustAsssayDSource
                  ExplicitLeft = 56
                  ExplicitTop = 95
                  ExplicitWidth = 121
                end
              end
              object Panel11: TPanel
                Left = 0
                Top = 264
                Width = 941
                Height = 323
                Align = alClient
                TabOrder = 2
                object Splitter3: TSplitter
                  Left = 225
                  Top = 1
                  Height = 321
                  ExplicitLeft = 289
                  ExplicitTop = 6
                  ExplicitHeight = 218
                end
                object mBackgroundImagePanel: TPanel
                  Left = 1
                  Top = 1
                  Width = 224
                  Height = 321
                  Align = alLeft
                  TabOrder = 0
                  object mBackgroundImage: TImage
                    Left = 1
                    Top = 1
                    Width = 222
                    Height = 302
                    Align = alClient
                    IncrementalDisplay = True
                    Proportional = True
                    Stretch = True
                    ExplicitWidth = 221
                    ExplicitHeight = 199
                  end
                  object mIm1FName: TDBText
                    Left = 1
                    Top = 303
                    Width = 222
                    Height = 17
                    Align = alBottom
                    DataField = 'background_image'
                    DataSource = csDM.csDustAsssayDSource
                    ExplicitLeft = 56
                    ExplicitTop = 199
                    ExplicitWidth = 121
                  end
                end
                object Panel14: TPanel
                  Left = 228
                  Top = 1
                  Width = 712
                  Height = 321
                  Align = alClient
                  TabOrder = 1
                  object mCoverslipImage: TImage
                    Left = 1
                    Top = 1
                    Width = 710
                    Height = 302
                    Align = alClient
                    IncrementalDisplay = True
                    Proportional = True
                    Stretch = True
                    ExplicitLeft = 120
                    ExplicitWidth = 242
                    ExplicitHeight = 199
                  end
                  object mIm2FName: TDBText
                    Left = 1
                    Top = 303
                    Width = 710
                    Height = 17
                    Align = alBottom
                    DataField = 'coverslip_image'
                    DataSource = csDM.csDustAsssayDSource
                    ExplicitLeft = 245
                    ExplicitTop = 201
                    ExplicitWidth = 121
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
        object MediaPageControl: TPageControl
          Left = 73
          Top = 0
          Width = 1250
          Height = 844
          ActivePage = TabSheet1
          Align = alClient
          TabOrder = 0
          OnChange = MediaPageControlChange
          object TabSheet1: TTabSheet
            Caption = 'Movies'
            ImageIndex = 1
            inline TMoviesFrame1: TMoviesFrame
              Left = 0
              Top = 0
              Width = 1242
              Height = 816
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 1242
              ExplicitHeight = 816
              inherited Panel22: TPanel
                Top = 761
                Width = 1242
                ExplicitTop = 761
                ExplicitWidth = 1242
              end
              inherited ScrollBox2: TScrollBox
                Width = 1242
                Height = 761
                ExplicitWidth = 1242
                ExplicitHeight = 761
                inherited FlowPanel1: TFlowPanel
                  Width = 1238
                  ExplicitWidth = 1238
                end
              end
            end
          end
          object TabSheet14: TTabSheet
            Caption = 'Images'
            ImageIndex = 2
            inline TImagesFrame1: TImagesFrame
              Left = 0
              Top = 0
              Width = 1242
              Height = 816
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 1242
              ExplicitHeight = 816
              inherited Panel22: TPanel
                Top = 761
                Width = 1242
                ExplicitTop = 761
                ExplicitWidth = 1242
              end
              inherited ScrollBox2: TScrollBox
                Width = 1242
                Height = 761
                ExplicitWidth = 1242
                ExplicitHeight = 761
                inherited FlowPanel1: TFlowPanel
                  Width = 1238
                  ExplicitWidth = 1238
                end
              end
            end
          end
        end
        object GroupBox16: TGroupBox
          Left = 0
          Top = 0
          Width = 73
          Height = 844
          Align = alLeft
          Caption = 'Block IDs'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 1
          object BlockIDSLLB: TDBLookupListBox
            Left = 2
            Top = 15
            Width = 69
            Height = 823
            Align = alClient
            KeyField = 'id'
            ListField = 'id'
            ListSource = atdbDM.blockIDsDataSource
            TabOrder = 0
            OnKeyDown = BlockIDSLLBKeyDown
            OnKeyUp = BlockIDSLLBKeyUp
            OnMouseUp = BlockIDSLLBMouseUp
          end
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'All Tables'
        ImageIndex = 4
        object mTablesLB: TListBox
          Left = 0
          Top = 0
          Width = 153
          Height = 844
          Align = alLeft
          ItemHeight = 13
          TabOrder = 0
          OnClick = mTablesLBClick
        end
        object Panel6: TPanel
          Left = 153
          Top = 0
          Width = 1170
          Height = 844
          Align = alClient
          Caption = 'Panel6'
          TabOrder = 1
          inline TTableFrame1: TTableFrame
            Left = 1
            Top = 65
            Width = 1168
            Height = 778
            Align = alClient
            TabOrder = 0
            ExplicitLeft = 1
            ExplicitTop = 65
            ExplicitWidth = 1168
            ExplicitHeight = 778
            inherited GroupBox1: TGroupBox
              Width = 1168
              Height = 778
              Align = alClient
              ExplicitWidth = 1168
              ExplicitHeight = 778
              inherited DBGrid1: TDBGrid
                Top = 15
                Width = 1164
                Height = 719
                Align = alClient
              end
              inherited DBNavigator1: TDBNavigator
                Top = 734
                Width = 1164
                Hints.Strings = ()
                ExplicitTop = 734
                ExplicitWidth = 1164
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
            Width = 1168
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
        object GroupBox3: TGroupBox
          Left = 13
          Top = 12
          Width = 286
          Height = 233
          Caption = 'ATDB Connection'
          TabOrder = 0
          object mServerIPE: TSTDStringLabeledEdit
            Left = 16
            Top = 40
            Width = 121
            Height = 21
            EditLabel.Width = 45
            EditLabel.Height = 13
            EditLabel.Caption = 'Server IP'
            TabOrder = 1
            Text = '127.0.0.1'
            Value = '127.0.0.1'
          end
          object mDBUserE: TSTDStringLabeledEdit
            Left = 16
            Top = 89
            Width = 121
            Height = 21
            EditLabel.Width = 22
            EditLabel.Height = 13
            EditLabel.Caption = 'User'
            TabOrder = 2
            Text = 'atdb-client'
            Value = 'atdb-client'
          end
          object mPasswordE: TSTDStringLabeledEdit
            Left = 16
            Top = 137
            Width = 121
            Height = 21
            EditLabel.Width = 46
            EditLabel.Height = 13
            EditLabel.Caption = 'Password'
            TabOrder = 3
            Text = 'atdb123'
            Value = 'atdb123'
          end
          object mATDBServerBtnConnect: TArrayBotButton
            Left = 143
            Top = 89
            Width = 124
            Height = 64
            Caption = 'Connect/Disconnect'
            TabOrder = 0
            OnClick = mATDBServerBtnConnectClick
            SoundID = 'BUTTON_CLICK_4'
          end
          object mDatabaseE: TSTDStringLabeledEdit
            Left = 16
            Top = 185
            Width = 121
            Height = 21
            EditLabel.Width = 46
            EditLabel.Height = 13
            EditLabel.Caption = 'Database'
            TabOrder = 4
            Text = 'atdb'
            Value = 'atdb'
          end
        end
        object GroupBox7: TGroupBox
          Left = 654
          Top = 20
          Width = 240
          Height = 225
          Caption = 'Misc'
          TabOrder = 1
          object mDustAssayImageFolderE: TSTDStringLabeledEdit
            Left = 16
            Top = 32
            Width = 177
            Height = 21
            EditLabel.Width = 120
            EditLabel.Height = 13
            EditLabel.Caption = 'Dust Assay Image Folder'
            TabOrder = 0
          end
          object mBrowseForDustAssayImageFolder: TButton
            Left = 208
            Top = 32
            Width = 27
            Height = 25
            Action = BrowseForFolder1
            TabOrder = 1
          end
        end
        object GroupBox13: TGroupBox
          Left = 305
          Top = 12
          Width = 345
          Height = 233
          Caption = 'ATDB Users'
          TabOrder = 2
          object mUsersDBGrid: TDBGrid
            Left = 2
            Top = 15
            Width = 341
            Height = 191
            Align = alClient
            DataSource = atdbDM.usersDataSource
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
            DataSource = atdbDM.usersDataSource
            VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
            Align = alBottom
            TabOrder = 1
            OnClick = mUsersNavigatorClick
          end
        end
        object GroupBox14: TGroupBox
          Left = 13
          Top = 251
          Width = 635
          Height = 406
          Caption = 'Coverslip Print Settings'
          TabOrder = 3
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
          Left = 654
          Top = 276
          Width = 395
          Height = 85
          BiDiMode = bdLeftToRight
          Caption = 'Media'
          ParentBiDiMode = False
          TabOrder = 4
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
        object BottomPanel: TPanel
          Left = 0
          Top = 0
          Width = 1323
          Height = 844
          Align = alClient
          TabOrder = 0
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 1321
            Height = 842
            Align = alClient
            Caption = 'Panel1'
            TabOrder = 0
            object infoMemo: TMemo
              Left = 1
              Top = 22
              Width = 1319
              Height = 819
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
            end
            object ToolBar1: TToolBar
              Left = 1
              Top = 1
              Width = 1319
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
      object TabSheet13: TTabSheet
        Caption = 'Synchronize'
        ImageIndex = 6
        inline TSyncMySQLToPostgresFrame1: TSyncMySQLToPostgresFrame
          Left = 0
          Top = 0
          Width = 1323
          Height = 844
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 144
          ExplicitTop = 128
          inherited Panel1: TPanel
            Width = 1323
            Height = 844
            inherited GroupBox2: TGroupBox
              Width = 1321
              Height = 674
              inherited SyncLogMemo: TMemo
                Width = 1317
                Height = 657
              end
            end
            inherited GroupBox1: TGroupBox
              Width = 1321
            end
          end
        end
      end
    end
  end
  object SB: TStatusBar
    Left = 0
    Top = 915
    Width = 1333
    Height = 19
    Panels = <>
  end
  object MenuPanel: TPanel
    Left = 0
    Top = 0
    Width = 1333
    Height = 41
    Align = alTop
    TabOrder = 2
    object Label2: TLabel
      Left = 10
      Top = 12
      Width = 26
      Height = 13
      Caption = 'User:'
    end
    object UsersCB: TDBLookupComboBox
      Left = 42
      Top = 9
      Width = 145
      Height = 21
      KeyField = 'id'
      ListField = 'user_name'
      ListSource = atdbDM.usersDataSource
      TabOrder = 0
      OnCloseUp = UsersCBCloseUp
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
    Left = 394
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
    Left = 314
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
    DataSet = atdbDM.settingsCDS
    Left = 728
    Top = 8
  end
  object SpecimenDS: TDataSource
    DataSet = atdbDM.specimenCDS
    Left = 784
    Top = 168
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 952
    Top = 16
  end
end
