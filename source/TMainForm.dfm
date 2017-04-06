object MainForm: TMainForm
  Left = 0
  Top = 0
  ActiveControl = mATDBServerBtnConnect
  Caption = 'atDB'
  ClientHeight = 764
  ClientWidth = 922
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 41
    Width = 922
    Height = 704
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 920
      Height = 702
      ActivePage = TabSheet6
      Align = alClient
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object TabSheet4: TTabSheet
        Caption = 'Tissue to Block'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object PageControl2: TPageControl
          Left = 0
          Top = 0
          Width = 912
          Height = 674
          ActivePage = TabSheet8
          Align = alClient
          TabOrder = 0
          OnChange = PageControl2Change
          object TabSheet8: TTabSheet
            Caption = 'Specimen'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object GroupBox4: TGroupBox
              Left = 0
              Top = 0
              Width = 904
              Height = 646
              Align = alClient
              Caption = 'Specimen'
              TabOrder = 0
              object mSpecimenGrid: TDBGrid
                Left = 2
                Top = 15
                Width = 900
                Height = 604
                Align = alClient
                DataSource = atdbDM.specimenDataSource
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
                    FieldName = 'specimen_id'
                    Width = 88
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'process_id'
                    ReadOnly = True
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Lspecie'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'lims_number'
                    Title.Caption = 'Lims #'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'additional_identifier'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'age'
                    Width = 63
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'death_date'
                    Title.Caption = 'Date of Death'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'date_received'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'brain_region_dissection'
                    Title.Caption = 'From Brain region'
                    Width = 100
                    Visible = True
                  end>
              end
              object mSpecimenNavigator: TDBNavigator
                Left = 2
                Top = 619
                Width = 900
                Height = 25
                DataSource = atdbDM.specimenDataSource
                VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
                Align = alBottom
                TabOrder = 1
                OnClick = mSpecimenNavigatorClick
              end
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'Blocks'
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object ScrollBox1: TScrollBox
              Left = 0
              Top = 0
              Width = 904
              Height = 646
              Align = alClient
              TabOrder = 0
              object mBlocksGB: TGroupBox
                Left = 185
                Top = 0
                Width = 715
                Height = 642
                Align = alClient
                Caption = 'Blocks'
                TabOrder = 0
                object BlockNotesGB: TGroupBox
                  Left = 2
                  Top = 360
                  Width = 711
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
                    Width = 498
                    Height = 253
                    Align = alClient
                    TabOrder = 0
                    object mBlockNoteMemo: TDBMemo
                      Left = 1
                      Top = 1
                      Width = 496
                      Height = 226
                      Align = alClient
                      DataField = 'note'
                      DataSource = atdbDM.blockNotesDSource
                      TabOrder = 0
                    end
                    object DBNavigator2: TDBNavigator
                      Left = 1
                      Top = 227
                      Width = 496
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
                  Width = 711
                  Height = 345
                  Align = alClient
                  BevelEdges = []
                  BevelOuter = bvNone
                  TabOrder = 1
                  object Panel5: TPanel
                    Left = 0
                    Top = 0
                    Width = 393
                    Height = 345
                    Align = alLeft
                    TabOrder = 0
                    object mBlocksGrid: TDBGrid
                      Left = 1
                      Top = 1
                      Width = 391
                      Height = 318
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
                        end>
                    end
                    object mBlocksNavigator: TDBNavigator
                      Left = 1
                      Top = 319
                      Width = 391
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
                    Left = 393
                    Top = 0
                    Width = 318
                    Height = 345
                    Align = alClient
                    TabOrder = 1
                    object GroupBox10: TGroupBox
                      Left = 1
                      Top = 1
                      Width = 316
                      Height = 343
                      Align = alClient
                      Caption = 'Print block labels'
                      TabOrder = 0
                      object mLblMakerMemo: TMemo
                        Left = 2
                        Top = 15
                        Width = 144
                        Height = 326
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
              object GroupBox5: TGroupBox
                Left = 0
                Top = 0
                Width = 185
                Height = 642
                Align = alLeft
                Caption = 'Process IDs'
                Padding.Left = 5
                Padding.Top = 2
                Padding.Right = 7
                Padding.Bottom = 2
                TabOrder = 1
                object mProcessForBlocksGrid: TDBGrid
                  Left = 7
                  Top = 17
                  Width = 169
                  Height = 621
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
                      FieldName = 'process_id'
                      Width = 74
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'specimen_id'
                      Visible = True
                    end>
                end
              end
            end
          end
          object TabSheet7: TTabSheet
            Caption = 'Ribbons'
            ImageIndex = 6
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object GroupBox2: TGroupBox
              Left = 3
              Top = 3
              Width = 958
              Height = 565
              Caption = 'Ribbons'
              TabOrder = 0
              object Label5: TLabel
                Left = 14
                Top = 27
                Width = 65
                Height = 13
                Caption = 'Select a Block'
              end
              object Label3: TLabel
                Left = 380
                Top = 27
                Width = 38
                Height = 13
                Caption = 'Ribbons'
              end
              object DBText3: TDBText
                Left = 661
                Top = 23
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
              object mRibbonsGrid: TDBGrid
                Left = 380
                Top = 46
                Width = 396
                Height = 187
                DataSource = atdbDM.mRibbonDSource
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
                  end>
              end
              object mRibbonsNavigator: TDBNavigator
                Left = 380
                Top = 239
                Width = 270
                Height = 25
                DataSource = atdbDM.mRibbonDSource
                VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh, nbApplyUpdates]
                ConfirmDelete = False
                TabOrder = 1
                OnClick = RibbonsNavigatorClick
              end
              object PrintBarCodeBtn: TButton
                Left = 661
                Top = 239
                Width = 113
                Height = 25
                Caption = 'PrintBarCodeBtn'
                Enabled = False
                TabOrder = 2
              end
              object GroupBox1: TGroupBox
                Left = 380
                Top = 272
                Width = 467
                Height = 267
                Caption = 'Notes'
                TabOrder = 3
                object mRibbonNotesGrid: TDBGrid
                  Left = 10
                  Top = 58
                  Width = 156
                  Height = 187
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
                      Width = 142
                      Visible = True
                    end>
                end
                object mRibbonNoteMemo: TDBMemo
                  Left = 186
                  Top = 24
                  Width = 255
                  Height = 192
                  DataField = 'note'
                  DataSource = atdbDM.ribbonNotesDSource
                  TabOrder = 1
                end
                object mRibbonNoteNavigator: TDBNavigator
                  Left = 187
                  Top = 222
                  Width = 254
                  Height = 25
                  DataSource = atdbDM.ribbonNotesDSource
                  VisibleButtons = [nbPost, nbCancel]
                  TabOrder = 2
                end
                object mRibbonNotesNavigator: TDBNavigator
                  Left = 10
                  Top = 27
                  Width = 156
                  Height = 25
                  DataSource = atdbDM.ribbonNotesDSource
                  VisibleButtons = [nbInsert, nbDelete, nbRefresh, nbApplyUpdates]
                  ConfirmDelete = False
                  TabOrder = 3
                  OnClick = mRibbonNotesNavigatorClick
                end
              end
              object mBlocksForRibbonsGrid: TDBGrid
                Left = 14
                Top = 46
                Width = 291
                Height = 483
                DataSource = atdbDM.blocksDataSource
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 4
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'label'
                    Width = 69
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'process_id'
                    Width = 95
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'serial'
                    Width = 100
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
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 369
          Height = 674
          Align = alLeft
          TabOrder = 0
          object GroupBox8: TGroupBox
            Left = 1
            Top = 192
            Width = 367
            Height = 449
            Align = alClient
            Caption = 'Cover Slips'
            TabOrder = 0
            object CSNavigator: TDBNavigator
              Left = 2
              Top = 422
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
              Top = 89
              Width = 363
              Height = 333
              Align = alClient
              DataSource = csDM.csDSource
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
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
              Top = 15
              Width = 363
              Height = 74
              Align = alTop
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
                Caption = 'Register CarbonCoat Batch'
                TabOrder = 1
                OnClick = mRegisterCarbonCoatBatchBtnClick
              end
            end
          end
          object Panel9: TPanel
            Left = 1
            Top = 641
            Width = 367
            Height = 32
            Align = alBottom
            TabOrder = 1
            object mPrintCSLabelsBtn: TButton
              Left = 266
              Top = 4
              Width = 87
              Height = 25
              Caption = 'Print Labels'
              TabOrder = 0
              OnClick = mPrintCSLabelsBtnClick
            end
            object mAddCSNote: TButton
              Left = 4
              Top = 4
              Width = 87
              Height = 25
              Caption = 'Add Note'
              TabOrder = 1
              OnClick = mPrintCSLabelsBtnClick
            end
          end
          object GroupBox9: TGroupBox
            Left = 1
            Top = 1
            Width = 367
            Height = 191
            Align = alTop
            Caption = 'Fresh Batches'
            TabOrder = 2
            object mFreshBatchesGrid: TDBGrid
              Left = 2
              Top = 56
              Width = 363
              Height = 108
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
                  FieldName = 'batchcode'
                  Width = 73
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'type'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'lot_number'
                  Width = 50
                  Visible = True
                end>
            end
            object CSFreshBatchNavigator: TDBNavigator
              Left = 2
              Top = 164
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
                Caption = 'Register New Box'
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
          Left = 369
          Top = 0
          Width = 543
          Height = 674
          Align = alClient
          TabOrder = 1
          object PageControl3: TPageControl
            Left = 1
            Top = 1
            Width = 541
            Height = 672
            ActivePage = TabSheet11
            Align = alClient
            TabOrder = 0
            object TabSheet11: TTabSheet
              Caption = 'Coverslip Info'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object GroupBox11: TGroupBox
                Left = 0
                Top = 0
                Width = 533
                Height = 129
                Align = alTop
                Caption = 'Identification'
                TabOrder = 0
                object Label10: TLabel
                  Left = 16
                  Top = 32
                  Width = 31
                  Height = 13
                  Caption = 'Status'
                  FocusControl = DBLookupComboBox1
                end
                object Label16: TLabel
                  Left = 216
                  Top = 32
                  Width = 46
                  Height = 13
                  Caption = 'From LOT'
                  FocusControl = DBEdit7
                end
                object DBLookupComboBox1: TDBLookupComboBox
                  Left = 16
                  Top = 48
                  Width = 185
                  Height = 21
                  DataField = 'LStatus'
                  DataSource = CoverslipsDataSource
                  TabOrder = 0
                end
                object DBEdit7: TDBEdit
                  Left = 216
                  Top = 48
                  Width = 145
                  Height = 21
                  DataField = 'from_lot'
                  DataSource = CoverslipsDataSource
                  Enabled = False
                  ReadOnly = True
                  TabOrder = 1
                end
              end
              object GroupBox12: TGroupBox
                Left = 0
                Top = 129
                Width = 533
                Height = 515
                Align = alClient
                Caption = 'Coverslip notes'
                TabOrder = 1
                object DBMemo1: TDBMemo
                  Left = 2
                  Top = 15
                  Width = 529
                  Height = 498
                  Align = alClient
                  DataField = 'notes'
                  DataSource = csDM.csDSource
                  ScrollBars = ssBoth
                  TabOrder = 0
                end
              end
            end
            object TabSheet12: TTabSheet
              Caption = 'Dust Assays'
              ImageIndex = 1
              object Splitter2: TSplitter
                Left = 0
                Top = 417
                Width = 533
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
                Width = 533
                Height = 264
                Align = alTop
                Caption = 'CoverSlip Dust Assays'
                TabOrder = 0
                object cdDustAssayNavigator: TDBNavigator
                  Left = 2
                  Top = 237
                  Width = 529
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
                  Width = 274
                  Height = 222
                  Align = alClient
                  TabOrder = 2
                  DesignSize = (
                    274
                    222)
                  object Label4: TLabel
                    Left = 6
                    Top = 13
                    Width = 28
                    Height = 13
                    Caption = 'Notes'
                  end
                  object DBText1: TDBText
                    Left = 211
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
                    Width = 272
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
                Top = 420
                Width = 533
                Height = 224
                Align = alBottom
                TabOrder = 1
                object mResultImage: TImage
                  Left = 1
                  Top = 1
                  Width = 531
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
                  Width = 531
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
                Width = 533
                Height = 153
                Align = alClient
                TabOrder = 2
                object Splitter3: TSplitter
                  Left = 225
                  Top = 1
                  Height = 151
                  ExplicitLeft = 289
                  ExplicitTop = 6
                  ExplicitHeight = 218
                end
                object mBackgroundImagePanel: TPanel
                  Left = 1
                  Top = 1
                  Width = 224
                  Height = 151
                  Align = alLeft
                  TabOrder = 0
                  object mBackgroundImage: TImage
                    Left = 1
                    Top = 1
                    Width = 222
                    Height = 132
                    Align = alClient
                    IncrementalDisplay = True
                    Proportional = True
                    Stretch = True
                    ExplicitWidth = 221
                    ExplicitHeight = 199
                  end
                  object mIm1FName: TDBText
                    Left = 1
                    Top = 133
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
                  Width = 304
                  Height = 151
                  Align = alClient
                  TabOrder = 1
                  object mCoverslipImage: TImage
                    Left = 1
                    Top = 1
                    Width = 302
                    Height = 132
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
                    Top = 133
                    Width = 302
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
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
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
          Width = 759
          Height = 674
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 153
          ExplicitWidth = 759
          ExplicitHeight = 674
          inherited GroupBox1: TGroupBox
            Width = 759
            Height = 674
            Align = alClient
            ExplicitWidth = 759
            ExplicitHeight = 674
            inherited DBGrid1: TDBGrid
              Top = 15
              Width = 755
              Height = 615
              Align = alClient
            end
            inherited DBNavigator1: TDBNavigator
              Top = 630
              Width = 755
              Hints.Strings = ()
              ExplicitTop = 630
              ExplicitWidth = 755
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
          Height = 674
          Align = alLeft
          ItemHeight = 13
          TabOrder = 1
          OnClick = mTablesLBClick
        end
      end
      object mDocsTabSheet: TTabSheet
        Caption = 'Documents'
        ImageIndex = 3
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object mDocsNavigator: TDBNavigator
          Left = 16
          Top = 24
          Width = 210
          Height = 25
          DataSource = atdbDM.documentsDSource
          VisibleButtons = [nbPrior, nbNext, nbDelete, nbPost, nbCancel, nbRefresh, nbApplyUpdates]
          TabOrder = 0
        end
        object mDocumentsGrid: TDBGrid
          Left = 16
          Top = 64
          Width = 385
          Height = 193
          DataSource = atdbDM.documentsDSource
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = mDocumentsGridDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'document_name'
              Width = 263
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'type'
              Width = 89
              Visible = True
            end>
        end
        object mAddDocBtn: TButton
          Left = 16
          Top = 263
          Width = 121
          Height = 58
          Caption = 'Add Document'
          TabOrder = 2
          OnClick = mAddDocBtnClick
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Logs'
        ImageIndex = 6
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object BottomPanel: TPanel
          Left = 0
          Top = 0
          Width = 912
          Height = 674
          Align = alClient
          TabOrder = 0
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 910
            Height = 672
            Align = alClient
            Caption = 'Panel1'
            TabOrder = 0
            object infoMemo: TMemo
              Left = 1
              Top = 22
              Width = 908
              Height = 649
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Consolas'
              Font.Style = []
              ParentFont = False
              PopupMenu = PopupMenu1
              ScrollBars = ssBoth
              TabOrder = 0
            end
            object ToolBar1: TToolBar
              Left = 1
              Top = 1
              Width = 908
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
                Width = 206
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
          object GroupBox15: TGroupBox
            Left = 16
            Top = 181
            Width = 305
            Height = 222
            Caption = 'Barcode Settings'
            TabOrder = 0
            object mCodeStartX: TIntegerLabeledEdit
              Left = 17
              Top = 44
              Width = 73
              Height = 21
              EditLabel.Width = 51
              EditLabel.Height = 13
              EditLabel.Caption = 'Horiz Start'
              TabOrder = 0
              Text = '0'
            end
            object mCodeStartY: TIntegerLabeledEdit
              Left = 112
              Top = 44
              Width = 74
              Height = 21
              EditLabel.Width = 62
              EditLabel.Height = 13
              EditLabel.Caption = 'Vertical Start'
              TabOrder = 1
              Text = '0'
            end
            object mExpectedHeight: TIntegerLabeledEdit
              Left = 112
              Top = 95
              Width = 73
              Height = 21
              EditLabel.Width = 79
              EditLabel.Height = 13
              EditLabel.Caption = 'Expected Height'
              TabOrder = 2
              Text = '0'
            end
            object mExpectedWidth: TIntegerLabeledEdit
              Left = 17
              Top = 92
              Width = 74
              Height = 21
              EditLabel.Width = 76
              EditLabel.Height = 13
              EditLabel.Caption = 'Expected Width'
              TabOrder = 3
              Text = '0'
            end
            object mRowSymbolSize: TIntegerLabeledEdit
              Left = 17
              Top = 143
              Width = 74
              Height = 21
              EditLabel.Width = 80
              EditLabel.Height = 13
              EditLabel.Caption = 'Row Symbol Size'
              TabOrder = 4
              Text = '0'
            end
            object mColSymbolSize: TIntegerLabeledEdit
              Left = 112
              Top = 143
              Width = 73
              Height = 21
              EditLabel.Width = 94
              EditLabel.Height = 13
              EditLabel.Caption = 'Column Symbol Size'
              TabOrder = 5
              Text = '0'
            end
            object mModuleSize: TIntegerLabeledEdit
              Left = 17
              Top = 188
              Width = 74
              Height = 21
              EditLabel.Width = 56
              EditLabel.Height = 13
              EditLabel.Caption = 'Module Size'
              TabOrder = 6
              Text = '0'
            end
          end
          object mTestLabel: TSTDStringLabeledEdit
            Left = 352
            Top = 200
            Width = 121
            Height = 21
            EditLabel.Width = 75
            EditLabel.Height = 13
            EditLabel.Caption = 'Test Label Data'
            TabOrder = 1
            Text = '1234'
            Value = '1234'
          end
          object mPrintTestLabelBtn: TButton
            Left = 352
            Top = 244
            Width = 87
            Height = 25
            Caption = 'Print One'
            TabOrder = 2
            OnClick = mPrintTestLabelBtnClick
          end
          object GroupBox16: TGroupBox
            Left = 16
            Top = 32
            Width = 457
            Height = 143
            Caption = 'Text Settings'
            TabOrder = 3
            object mBCTextAlignment: TIntegerLabeledEdit
              Left = 125
              Top = 100
              Width = 74
              Height = 21
              EditLabel.Width = 72
              EditLabel.Height = 13
              EditLabel.Caption = 'Text Alignment'
              TabOrder = 0
              Text = '0'
            end
            object mCSBCFont: TIntegerLabeledEdit
              Left = 16
              Top = 100
              Width = 73
              Height = 21
              EditLabel.Width = 49
              EditLabel.Height = 13
              EditLabel.Caption = 'Font (0-8)'
              TabOrder = 1
              Text = '0'
            end
            object mCSBCHeight: TFloatLabeledEdit
              Left = 125
              Top = 40
              Width = 74
              Height = 21
              EditLabel.Width = 59
              EditLabel.Height = 13
              EditLabel.Caption = 'Label Height'
              TabOrder = 2
              Text = '-1.00'
              Value = -1.000000000000000000
            end
            object mCSBCTextXPos: TIntegerLabeledEdit
              Left = 216
              Top = 40
              Width = 73
              Height = 21
              EditLabel.Width = 51
              EditLabel.Height = 13
              EditLabel.Caption = 'Text X Pos'
              TabOrder = 3
              Text = '0'
            end
            object mCSBCTextYPos: TIntegerLabeledEdit
              Left = 325
              Top = 40
              Width = 74
              Height = 21
              EditLabel.Width = 51
              EditLabel.Height = 13
              EditLabel.Caption = 'Text Y Pos'
              TabOrder = 4
              Text = '0'
            end
            object mCSBCWidth: TFloatLabeledEdit
              Left = 16
              Top = 40
              Width = 73
              Height = 21
              EditLabel.Width = 56
              EditLabel.Height = 13
              EditLabel.Caption = 'Label Width'
              TabOrder = 5
              Text = '-1.00'
              Value = -1.000000000000000000
            end
          end
        end
      end
    end
  end
  object SB: TStatusBar
    Left = 0
    Top = 745
    Width = 922
    Height = 19
    Panels = <>
  end
  object MenuPanel: TPanel
    Left = 0
    Top = 0
    Width = 922
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
    object mUsersCB: TComboBox
      Left = 42
      Top = 9
      Width = 145
      Height = 21
      Style = csDropDownList
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
  object PopupMenu1: TPopupMenu
    Left = 672
    Top = 480
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
    Left = 338
  end
  object SpecimenPopup: TPopupMenu
    Left = 824
    Top = 208
    object openDocument: TMenuItem
      Caption = 'Open Document'
    end
  end
  object CoverslipsDataSource: TDataSource
    DataSet = csDM.csCDS
    Left = 840
    Top = 352
  end
end
