object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'atDB'
  ClientHeight = 660
  ClientWidth = 975
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 638
    Width = 975
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 0
    ExplicitWidth = 505
  end
  object TopPanel: TPanel
    Left = 0
    Top = 41
    Width = 975
    Height = 597
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 973
      Height = 595
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
          Width = 965
          Height = 567
          ActivePage = TabSheet8
          Align = alClient
          TabOrder = 0
          OnChange = PageControl2Change
          object TabSheet8: TTabSheet
            Caption = 'Specimen'
            object GroupBox4: TGroupBox
              Left = 0
              Top = 0
              Width = 957
              Height = 539
              Align = alClient
              Caption = 'Specimen'
              TabOrder = 0
              object mSpecimenGrid: TDBGrid
                Left = 2
                Top = 15
                Width = 953
                Height = 497
                Align = alClient
                DataSource = atdbDM.specimenDSrc
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
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
                    Width = 100
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
                    FieldName = 'date_embedded'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Lpreproctreat'
                    Title.Caption = 'Pre-Process Treatment'
                    Width = 124
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LFixative'
                    Title.Caption = 'Fixative Protocol'
                    Width = 124
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LfixationMethod'
                    Title.Caption = 'Fixation Protocol'
                    Width = 150
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Lpostfix'
                    Title.Caption = 'Postfix Protocol'
                    Width = 124
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Lcryoprotection'
                    Title.Caption = 'CryoProtection'
                    Width = 124
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LfreezeProtocol'
                    Width = 150
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LsubstitutionProtocol'
                    Width = 124
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Linfiltration'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Lembedding'
                    Width = 124
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
                Top = 512
                Width = 953
                Height = 25
                DataSource = atdbDM.specimenDSrc
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
              Width = 957
              Height = 539
              Align = alClient
              TabOrder = 0
              object mBlocksGB: TGroupBox
                Left = 185
                Top = 0
                Width = 768
                Height = 535
                Align = alClient
                Caption = 'Blocks'
                TabOrder = 0
                object BlockNotesGB: TGroupBox
                  Left = 2
                  Top = 253
                  Width = 764
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
                    Width = 551
                    Height = 253
                    Align = alClient
                    TabOrder = 0
                    object mBlockNoteMemo: TDBMemo
                      Left = 1
                      Top = 1
                      Width = 549
                      Height = 226
                      Align = alClient
                      DataField = 'note'
                      DataSource = atdbDM.blockNotesDSource
                      TabOrder = 0
                    end
                    object DBNavigator2: TDBNavigator
                      Left = 1
                      Top = 227
                      Width = 549
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
                  Width = 764
                  Height = 238
                  Align = alClient
                  BevelEdges = []
                  BevelOuter = bvNone
                  TabOrder = 1
                  object Panel5: TPanel
                    Left = 0
                    Top = 0
                    Width = 480
                    Height = 238
                    Align = alLeft
                    TabOrder = 0
                    object mBlocksGrid: TDBGrid
                      Left = 1
                      Top = 1
                      Width = 478
                      Height = 211
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
                      OnKeyUp = mBlocksGridKeyUp
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'Lprocess_id'
                          ReadOnly = True
                          Width = 59
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'created'
                          Title.Caption = 'Embedded On'
                          Width = 100
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'label'
                          Width = 69
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'LBlockStatus'
                          Width = 100
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'serial'
                          Width = 77
                          Visible = True
                        end>
                    end
                    object mBlocksNavigator: TDBNavigator
                      Left = 1
                      Top = 212
                      Width = 478
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
                    Left = 480
                    Top = 0
                    Width = 284
                    Height = 238
                    Align = alClient
                    TabOrder = 1
                    object Button1: TButton
                      Left = 165
                      Top = 180
                      Width = 107
                      Height = 37
                      Caption = 'Print Block Info'
                      TabOrder = 0
                      OnClick = Button1Click
                    end
                    object mLblMakerMemo: TMemo
                      Left = 1
                      Top = 1
                      Width = 144
                      Height = 236
                      Align = alLeft
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Times New Roman'
                      Font.Style = []
                      Lines.Strings = (
                        'Memo1'
                        'Test'
                        'M2333543'
                        'adfadf ad')
                      ParentFont = False
                      TabOrder = 1
                    end
                  end
                end
              end
              object GroupBox5: TGroupBox
                Left = 0
                Top = 0
                Width = 185
                Height = 535
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
                  Height = 514
                  Align = alClient
                  DataSource = atdbDM.specimenDSrc
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
                Width = 29
                Height = 13
                Caption = 'Blocks'
              end
              object Label3: TLabel
                Left = 380
                Top = 27
                Width = 38
                Height = 13
                Caption = 'Ribbons'
              end
              object Image2: TImage
                Left = 792
                Top = 46
                Width = 105
                Height = 105
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
                BeforeAction = mRibbonsNavigatorBeforeAction
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
      object TabSheet5: TTabSheet
        Caption = 'All Tables'
        ImageIndex = 4
        inline TTableFrame1: TTableFrame
          Left = 153
          Top = 0
          Width = 812
          Height = 567
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 153
          ExplicitWidth = 812
          ExplicitHeight = 567
          inherited GroupBox1: TGroupBox
            Width = 812
            Height = 567
            Align = alClient
            ExplicitWidth = 812
            ExplicitHeight = 567
            inherited DBGrid1: TDBGrid
              Top = 15
              Width = 808
              Height = 508
              Align = alClient
            end
            inherited DBNavigator1: TDBNavigator
              Top = 523
              Width = 808
              Hints.Strings = ()
              OnClick = TTableFrame1DBNavigator1Click
              ExplicitTop = 523
              ExplicitWidth = 808
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
          Height = 567
          Align = alLeft
          ItemHeight = 13
          TabOrder = 1
          OnClick = mTablesLBClick
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Misc'
        ImageIndex = 5
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object mUsersDBGrid: TDBGrid
          Left = 13
          Top = 63
          Width = 240
          Height = 154
          DataSource = atdbDM.usersDataSource
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawDataCell = mUsersDBGridDrawDataCell
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
          Left = 13
          Top = 20
          Width = 225
          Height = 25
          DataSource = atdbDM.usersDataSource
          VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
          TabOrder = 1
          OnClick = mUsersNavigatorClick
        end
        object GroupBox3: TGroupBox
          Left = 283
          Top = 20
          Width = 286
          Height = 233
          Caption = 'ATDB Connection'
          TabOrder = 2
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
            Left = 159
            Top = 164
            Width = 105
            Height = 48
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
      end
      object TabSheet1: TTabSheet
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
        ImageIndex = 4
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object BottomPanel: TPanel
          Left = 0
          Top = 0
          Width = 965
          Height = 567
          Align = alClient
          TabOrder = 0
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 963
            Height = 565
            Align = alClient
            Caption = 'Panel1'
            TabOrder = 0
            object infoMemo: TMemo
              Left = 1
              Top = 22
              Width = 961
              Height = 542
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
              Width = 961
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
    Top = 641
    Width = 975
    Height = 19
    Panels = <>
  end
  object MenuPanel: TPanel
    Left = 0
    Top = 0
    Width = 975
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
    Left = 824
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
    Left = 664
    Top = 712
    object ClearMemoA1: TMenuItem
      Action = ClearMemoA
    end
  end
  object mIniFileC: mtkIniFileC
    IniFileName = 'atDB.ini'
    RootFolder = '.'
    Left = 578
    Top = 392
  end
  object MainMenu1: TMainMenu
    Left = 765
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
    Left = 898
    Top = 408
  end
  object SpecimenPopup: TPopupMenu
    OnPopup = SpecimenPopupPopup
    Left = 72
    Top = 192
    object openDocument: TMenuItem
      Caption = 'Open Document'
    end
  end
  object DBBarcode2D1: TDBBarcode2D
    DataField = 'id'
    DataSource = atdbDM.mRibbonDSource
    Barcode2D = Barcode2D_QRCode1
    Left = 872
    Top = 528
  end
  object Barcode2D_QRCode1: TBarcode2D_QRCode
    Image = Image2
    Stretch = True
    Left = 760
    Top = 520
  end
end
