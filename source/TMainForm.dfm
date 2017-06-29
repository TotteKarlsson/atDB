object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'atDB'
  ClientHeight = 772
  ClientWidth = 1145
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
    Width = 1145
    Height = 712
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 1143
      Height = 710
      ActivePage = TabSheet4
      Align = alClient
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object TabSheet4: TTabSheet
        Caption = 'Tissue to Block'
        object PageControl2: TPageControl
          Left = 0
          Top = 0
          Width = 1135
          Height = 682
          ActivePage = TabSheet8
          Align = alClient
          TabOrder = 0
          OnChange = PageControl2Change
          object TabSheet8: TTabSheet
            Caption = 'Cases && Specimens'
            object GroupBox4: TGroupBox
              Left = 0
              Top = 264
              Width = 1127
              Height = 390
              Align = alBottom
              Caption = 'Specimen'
              TabOrder = 0
              object mSpecimenGrid: TDBGrid
                Left = 2
                Top = 15
                Width = 1123
                Height = 348
                Align = alClient
                DataSource = atdbDM.specimenDataSource
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDrawDataCell = mSpecimenGridDrawDataCell
                OnDrawColumnCell = mSpecimenGridDrawColumnCell
                OnDblClick = mSpecimenGridDblClick
                OnMouseDown = mSpecimenGridMouseDown
                OnMouseMove = mSpecimenGridMouseMove
                OnMouseUp = mSpecimenGridMouseUp
                OnTitleClick = mSpecimenGridTitleClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'case_id'
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'specimen_id'
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'lims_number'
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'virus'
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'age'
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'death_date'
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'brain_region_dissection'
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'entered_by'
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'culture_time'
                    Width = 75
                    Visible = True
                  end>
              end
              object mSpecimenNavigator: TDBNavigator
                Left = 2
                Top = 363
                Width = 1123
                Height = 25
                DataSource = atdbDM.specimenDataSource
                VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
                Align = alBottom
                TabOrder = 1
                OnClick = mSpecimenNavigatorClick
                ExplicitTop = 627
              end
            end
            object GroupBox9: TGroupBox
              Left = 0
              Top = 0
              Width = 1127
              Height = 209
              Align = alTop
              Caption = 'Cases'
              TabOrder = 1
              object DBNavigator3: TDBNavigator
                Left = 2
                Top = 182
                Width = 1123
                Height = 25
                DataSource = CasesDS
                VisibleButtons = [nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
                Align = alBottom
                TabOrder = 0
                ExplicitLeft = 464
                ExplicitTop = -128
                ExplicitWidth = 240
              end
              object DBGrid3: TDBGrid
                Left = 2
                Top = 15
                Width = 1123
                Height = 167
                Align = alClient
                DataSource = CasesDS
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
                    FieldName = 'id'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'animal_id'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'intake_date'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'specie'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'entered_by'
                    Visible = True
                  end>
              end
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'Blocks'
            ImageIndex = 1
            object Splitter6: TSplitter
              Left = 233
              Top = 0
              Height = 654
              ExplicitLeft = 216
              ExplicitTop = -3
              ExplicitHeight = 677
            end
            object GroupBox5: TGroupBox
              Left = 0
              Top = 0
              Width = 233
              Height = 654
              Align = alLeft
              Caption = 'Process IDs'
              Padding.Left = 5
              Padding.Top = 2
              Padding.Right = 7
              Padding.Bottom = 2
              TabOrder = 0
              object mProcessForBlocksGrid: TDBGrid
                Left = 7
                Top = 17
                Width = 217
                Height = 633
                Align = alClient
                DataSource = atdbDM.specimenDataSource
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
                    FieldName = 'specimen_id'
                    Width = 100
                    Visible = True
                  end>
              end
            end
            object mBlocksGB: TGroupBox
              Left = 236
              Top = 0
              Width = 891
              Height = 654
              Align = alClient
              Caption = 'Blocks'
              TabOrder = 1
              object BlockNotesGB: TGroupBox
                Left = 2
                Top = 372
                Width = 887
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
                  Width = 674
                  Height = 253
                  Align = alClient
                  TabOrder = 0
                  object mBlockNoteMemo: TDBMemo
                    Left = 1
                    Top = 1
                    Width = 672
                    Height = 226
                    Align = alClient
                    DataField = 'note'
                    DataSource = atdbDM.blockNotesDSource
                    TabOrder = 0
                  end
                  object DBNavigator2: TDBNavigator
                    Left = 1
                    Top = 227
                    Width = 672
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
                Width = 887
                Height = 357
                Align = alClient
                BevelEdges = []
                BevelOuter = bvNone
                TabOrder = 1
                object Panel5: TPanel
                  Left = 0
                  Top = 0
                  Width = 540
                  Height = 357
                  Align = alLeft
                  TabOrder = 0
                  object mBlocksGrid: TDBGrid
                    Left = 1
                    Top = 1
                    Width = 538
                    Height = 330
                    Align = alClient
                    DataSource = atdbDM.blocksDataSource
                    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnCellClick = mBlocksGridCellClick
                    OnDblClick = mBlocksGridDblClick
                    OnKeyUp = mBlocksGridKeyUp
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
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'LBlockStatus'
                        Width = 43
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'date_embedded'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'specimen_id'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'created'
                        Width = 82
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'LUser'
                        Visible = True
                      end>
                  end
                  object mBlocksNavigator: TDBNavigator
                    Left = 1
                    Top = 331
                    Width = 538
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
                object Panel6: TPanel
                  Left = 540
                  Top = 0
                  Width = 347
                  Height = 357
                  Align = alClient
                  TabOrder = 1
                  object GroupBox10: TGroupBox
                    Left = 1
                    Top = 1
                    Width = 345
                    Height = 355
                    Align = alClient
                    Caption = 'Print block labels'
                    TabOrder = 0
                    object mLblMakerMemo: TMemo
                      Left = 2
                      Top = 15
                      Width = 144
                      Height = 338
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
              end
            end
          end
          object TabSheet7: TTabSheet
            Caption = 'Ribbons'
            ImageIndex = 6
            object Splitter5: TSplitter
              Left = 121
              Top = 0
              Height = 654
              ExplicitLeft = 144
              ExplicitTop = 256
              ExplicitHeight = 100
            end
            object GroupBox2: TGroupBox
              Left = 124
              Top = 0
              Width = 1003
              Height = 654
              Align = alClient
              Caption = 'Ribbon Data'
              TabOrder = 0
              object Splitter1: TSplitter
                Left = 2
                Top = 483
                Width = 999
                Height = 3
                Cursor = crVSplit
                Align = alBottom
                ExplicitLeft = 18
                ExplicitTop = 371
                ExplicitWidth = 597
              end
              object GroupBox1: TGroupBox
                Left = 2
                Top = 486
                Width = 999
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
                  Width = 810
                  Height = 149
                  Align = alClient
                  TabOrder = 1
                  object mRibbonNoteMemo: TDBMemo
                    Left = 1
                    Top = 1
                    Width = 808
                    Height = 122
                    Align = alClient
                    DataField = 'note'
                    DataSource = atdbDM.ribbonNotesDSource
                    TabOrder = 0
                  end
                  object mRibbonNoteNavigator: TDBNavigator
                    Left = 1
                    Top = 123
                    Width = 808
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
                Width = 999
                Height = 468
                Align = alClient
                TabOrder = 1
                object mRibbonsGrid: TDBGrid
                  Left = 1
                  Top = 1
                  Width = 997
                  Height = 400
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
                      Title.Caption = 'Cutting Order'
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
                  Top = 401
                  Width = 997
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
                  Top = 426
                  Width = 997
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
              Height = 654
              Align = alLeft
              Caption = 'Blocks'
              TabOrder = 1
              object mBlocksForRibbonsGrid: TDBGrid
                Left = 2
                Top = 15
                Width = 117
                Height = 637
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
      end
      object TabSheet9: TTabSheet
        Caption = 'Coverslips'
        ImageIndex = 5
        object Splitter4: TSplitter
          Left = 369
          Top = 0
          Height = 682
          ExplicitLeft = 8
          ExplicitTop = 24
          ExplicitHeight = 100
        end
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 369
          Height = 682
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
            Height = 444
            Align = alClient
            Caption = 'Cover Slips'
            TabOrder = 0
            object CSNavigator: TDBNavigator
              Left = 2
              Top = 343
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
              Height = 328
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
              Top = 368
              Width = 363
              Height = 74
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 2
              object mNrOfSelectedCS: TIntLabel
                Left = 103
                Top = 48
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
                Left = 15
                Top = 48
                Width = 82
                Height = 13
                Caption = 'Selection Count: '
              end
              object mRegisterCleanRoundBtn: TButton
                Left = 15
                Top = 13
                Width = 132
                Height = 25
                Caption = 'Register Clean Round'
                TabOrder = 0
                OnClick = mRegisterCleanRoundBtnClick
              end
              object mRegisterCarbonCoatBatchBtn: TButton
                Left = 199
                Top = 13
                Width = 152
                Height = 25
                Caption = 'Register Carbon Coat Batch'
                TabOrder = 1
                OnClick = mRegisterCarbonCoatBatchBtnClick
              end
            end
          end
          object Panel9: TPanel
            Left = 1
            Top = 649
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
                  Width = 73
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
                end
                item
                  Expanded = False
                  FieldName = 'box_number'
                  Width = 72
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
                Top = 7
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
          Width = 763
          Height = 682
          Align = alClient
          TabOrder = 1
          object PageControl3: TPageControl
            Left = 1
            Top = 1
            Width = 761
            Height = 680
            ActivePage = TabSheet11
            Align = alClient
            TabOrder = 0
            object TabSheet11: TTabSheet
              Caption = 'Coverslip Info'
              object GroupBox12: TGroupBox
                Left = 0
                Top = 115
                Width = 753
                Height = 537
                Align = alClient
                Caption = 'Coverslip notes'
                TabOrder = 0
                object DBMemo1: TDBMemo
                  Left = 2
                  Top = 15
                  Width = 749
                  Height = 520
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
                Width = 753
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
                  Width = 471
                  Height = 113
                  Align = alClient
                  Caption = 'Ribbon(s)'
                  TabOrder = 1
                  object DBGrid1: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 467
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
                Top = 425
                Width = 753
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
                Width = 753
                Height = 264
                Align = alTop
                Caption = 'CoverSlip Dust Assays'
                TabOrder = 0
                object cdDustAssayNavigator: TDBNavigator
                  Left = 2
                  Top = 237
                  Width = 749
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
                  Width = 494
                  Height = 222
                  Align = alClient
                  TabOrder = 2
                  DesignSize = (
                    494
                    222)
                  object Label4: TLabel
                    Left = 6
                    Top = 13
                    Width = 28
                    Height = 13
                    Caption = 'Notes'
                  end
                  object DBText1: TDBText
                    Left = 431
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
                    Width = 492
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
                Top = 428
                Width = 753
                Height = 224
                Align = alBottom
                TabOrder = 1
                object mResultImage: TImage
                  Left = 1
                  Top = 1
                  Width = 751
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
                  Width = 751
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
                Width = 753
                Height = 161
                Align = alClient
                TabOrder = 2
                object Splitter3: TSplitter
                  Left = 225
                  Top = 1
                  Height = 159
                  ExplicitLeft = 289
                  ExplicitTop = 6
                  ExplicitHeight = 218
                end
                object mBackgroundImagePanel: TPanel
                  Left = 1
                  Top = 1
                  Width = 224
                  Height = 159
                  Align = alLeft
                  TabOrder = 0
                  object mBackgroundImage: TImage
                    Left = 1
                    Top = 1
                    Width = 222
                    Height = 140
                    Align = alClient
                    IncrementalDisplay = True
                    Proportional = True
                    Stretch = True
                    ExplicitWidth = 221
                    ExplicitHeight = 199
                  end
                  object mIm1FName: TDBText
                    Left = 1
                    Top = 141
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
                  Width = 524
                  Height = 159
                  Align = alClient
                  TabOrder = 1
                  object mCoverslipImage: TImage
                    Left = 1
                    Top = 1
                    Width = 522
                    Height = 140
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
                    Top = 141
                    Width = 522
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
        Caption = 'Images'
        ImageIndex = 6
        object Image1: TImage
          Left = 480
          Top = 16
          Width = 441
          Height = 425
        end
        object DBGrid2: TDBGrid
          Left = 11
          Top = 16
          Width = 200
          Height = 313
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object DBNavigator1: TDBNavigator
          Left = 11
          Top = 360
          Width = 200
          Height = 25
          TabOrder = 1
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'All Tables'
        ImageIndex = 4
        inline TTableFrame1: TTableFrame
          Left = 153
          Top = 0
          Width = 982
          Height = 682
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 153
          ExplicitWidth = 982
          ExplicitHeight = 682
          inherited GroupBox1: TGroupBox
            Width = 982
            Height = 682
            Align = alClient
            ExplicitWidth = 982
            ExplicitHeight = 682
            inherited DBGrid1: TDBGrid
              Top = 15
              Width = 978
              Height = 623
              Align = alClient
            end
            inherited DBNavigator1: TDBNavigator
              Top = 638
              Width = 978
              Hints.Strings = ()
              ExplicitTop = 638
              ExplicitWidth = 978
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
        object mTablesLB: TListBox
          Left = 0
          Top = 0
          Width = 153
          Height = 682
          Align = alLeft
          ItemHeight = 13
          TabOrder = 1
          OnClick = mTablesLBClick
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
            Caption = '...'
            TabOrder = 1
            OnClick = mBrowseForDustAssayImageFolderClick
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
      end
      object TabSheet3: TTabSheet
        Caption = 'Logs'
        ImageIndex = 6
        object BottomPanel: TPanel
          Left = 0
          Top = 0
          Width = 1135
          Height = 682
          Align = alClient
          TabOrder = 0
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 1133
            Height = 680
            Align = alClient
            Caption = 'Panel1'
            TabOrder = 0
            object infoMemo: TMemo
              Left = 1
              Top = 22
              Width = 1131
              Height = 657
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
              Width = 1131
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
    Top = 753
    Width = 1145
    Height = 19
    Panels = <>
  end
  object MenuPanel: TPanel
    Left = 0
    Top = 0
    Width = 1145
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
    object mUsersCB: TDBLookupComboBox
      Left = 42
      Top = 9
      Width = 145
      Height = 21
      KeyField = 'id'
      ListField = 'user_name'
      ListSource = atdbDM.usersDataSource
      TabOrder = 0
      OnCloseUp = mUsersCBCloseUp
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
  end
  object LogMemoPopup: TPopupMenu
    Left = 152
    Top = 336
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
    Left = 56
    Top = 176
    object openDocument: TMenuItem
      Caption = 'Open Document'
    end
  end
  object CoverSlipPopup: TPopupMenu
    Left = 264
    Top = 424
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
    Left = 440
    Top = 280
  end
  object CasesDS: TDataSource
    DataSet = atdbDM.casesCDS
    Left = 296
    Top = 152
  end
end
