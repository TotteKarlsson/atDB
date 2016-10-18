object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'atDB'
  ClientHeight = 793
  ClientWidth = 1142
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
    Top = 645
    Width = 1142
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 0
    ExplicitWidth = 505
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 648
    Width = 1142
    Height = 126
    Align = alBottom
    TabOrder = 0
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 1140
      Height = 124
      Align = alClient
      Caption = 'Panel4'
      TabOrder = 0
      object infoMemo: TMemo
        Left = 1
        Top = 22
        Width = 1138
        Height = 101
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
      object ToolBar2: TToolBar
        Left = 1
        Top = 1
        Width = 1138
        Height = 21
        AutoSize = True
        ButtonHeight = 21
        ButtonWidth = 32
        Caption = 'ToolBar2'
        ShowCaptions = True
        TabOrder = 1
        object ToolButton4: TToolButton
          Left = 0
          Top = 0
          Action = ClearMemoA
          Caption = 'Clear'
        end
        object ToolButton1: TToolButton
          Left = 32
          Top = 0
          Width = 41
          Caption = 'ToolButton1'
          ImageIndex = 0
          Style = tbsSeparator
        end
        object LogLevelCB: TComboBox
          Left = 73
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
  object TopPanel: TPanel
    Left = 0
    Top = 41
    Width = 1142
    Height = 604
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 1140
      Height = 602
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
          Width = 1132
          Height = 574
          ActivePage = TabSheet2
          Align = alClient
          TabOrder = 0
          object TabSheet8: TTabSheet
            Caption = 'Specimen'
            object GroupBox4: TGroupBox
              Left = 0
              Top = 0
              Width = 1124
              Height = 546
              Align = alClient
              Caption = 'Specimen'
              TabOrder = 0
              object DBGrid2: TDBGrid
                Left = 2
                Top = 15
                Width = 1120
                Height = 504
                Align = alClient
                DataSource = atdbDM.specimenDSrc
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDrawDataCell = DBGrid2DrawDataCell
                OnDrawColumnCell = DBGrid2DrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'process_id'
                    Title.Caption = 'Process ID'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'specimen_id'
                    Title.Caption = 'Specimen ID'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Lspecie'
                    Title.Caption = 'Specie'
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
                    Title.Caption = 'Additional Identifier'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'age'
                    Title.Caption = 'Age'
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
                    Title.Caption = 'Date Received'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'date_embedded'
                    Title.Caption = 'Date Embedded'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Lpreproctreat'
                    Title.Caption = 'Pre-Process Treatment'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LFixative'
                    Title.Caption = 'Fixative Protocol'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LfixationMethod'
                    Title.Caption = 'Fixation Protocol'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Lpostfix'
                    Title.Caption = 'Postfix Protocol'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Lcryoprotection'
                    Title.Caption = 'CryoProtection'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LfreezeProtocol'
                    Title.Caption = 'Freeze Protocol'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LsubstitutionProtocol'
                    Title.Caption = 'Substitution Protocol'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Lembedding'
                    Title.Caption = 'Embedding'
                    Width = 64
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
              object DBNavigator3: TDBNavigator
                Left = 2
                Top = 519
                Width = 1120
                Height = 25
                DataSource = atdbDM.specimenDSrc
                VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
                Align = alBottom
                TabOrder = 1
              end
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'Blocks'
            ImageIndex = 1
            object ScrollBox1: TScrollBox
              Left = 0
              Top = 0
              Width = 1124
              Height = 546
              Align = alClient
              TabOrder = 0
              object mBlocksGB: TGroupBox
                Left = 23
                Top = 3
                Width = 934
                Height = 510
                Caption = 'Blocks'
                TabOrder = 0
                object Label5: TLabel
                  Left = 539
                  Top = 408
                  Width = 57
                  Height = 13
                  Caption = 'Entered by:'
                end
                object Image1: TImage
                  Left = 533
                  Top = 448
                  Width = 180
                  Height = 33
                  Proportional = True
                  Stretch = True
                end
                object Panel3: TPanel
                  Left = 2
                  Top = 15
                  Width = 930
                  Height = 41
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label8: TLabel
                    Left = 363
                    Top = 18
                    Width = 42
                    Height = 13
                    Caption = 'Block ID:'
                  end
                  object DBText1: TDBText
                    Left = 422
                    Top = 16
                    Width = 65
                    Height = 17
                    DataField = 'id'
                    DataSource = atdbDM.blocksDataSource
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object mBlocksNavigator: TDBNavigator
                    Left = 13
                    Top = 8
                    Width = 198
                    Height = 25
                    DataSource = atdbDM.blocksDataSource
                    VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh, nbApplyUpdates]
                    ConfirmDelete = False
                    TabOrder = 0
                    BeforeAction = mBlocksNavigatorBeforeAction
                    OnClick = mBlocksNavigatorClick
                  end
                  object DBLookupComboBox1: TDBLookupComboBox
                    Left = 219
                    Top = 12
                    Width = 135
                    Height = 21
                    DataField = 'created_by'
                    DataSource = atdbDM.blocksDataSource
                    KeyField = 'id'
                    ListField = 'user_name'
                    ListSource = atdbDM.usersDataSource
                    TabOrder = 1
                  end
                end
                object BlockNotesGB: TGroupBox
                  Left = 15
                  Top = 209
                  Width = 498
                  Height = 282
                  Caption = 'Notes'
                  TabOrder = 1
                  object DBLookupComboBox2: TDBLookupComboBox
                    Left = 223
                    Top = 23
                    Width = 258
                    Height = 21
                    DataField = 'created_by'
                    DataSource = atdbDM.blockNotesDSource
                    Enabled = False
                    KeyField = 'id'
                    ListField = 'user_name'
                    ListSource = atdbDM.usersDataSource
                    TabOrder = 0
                  end
                  object DBMemo1: TDBMemo
                    Left = 223
                    Top = 50
                    Width = 263
                    Height = 177
                    DataField = 'note'
                    DataSource = atdbDM.blockNotesDSource
                    TabOrder = 1
                  end
                  object DBNavigator2: TDBNavigator
                    Left = 223
                    Top = 233
                    Width = 262
                    Height = 25
                    DataSource = atdbDM.blockNotesDSource
                    VisibleButtons = [nbPost, nbCancel]
                    TabOrder = 2
                  end
                  object mBlockNotesGrid: TDBGrid
                    Left = 8
                    Top = 50
                    Width = 161
                    Height = 177
                    DataSource = atdbDM.blockNotesDSource
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                    TabOrder = 3
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
                  object DBNavigator5: TDBNavigator
                    Left = 9
                    Top = 19
                    Width = 160
                    Height = 25
                    DataSource = atdbDM.blockNotesDSource
                    VisibleButtons = [nbInsert, nbDelete, nbRefresh, nbApplyUpdates]
                    ConfirmDelete = False
                    TabOrder = 4
                    OnClick = DBNavigator5Click
                  end
                end
                object DBGrid4: TDBGrid
                  Left = 15
                  Top = 54
                  Width = 794
                  Height = 149
                  DataSource = atdbDM.blocksDataSource
                  TabOrder = 2
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'label'
                      Title.Caption = 'Label'
                      Width = 100
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Lprocess_id'
                      Title.Caption = 'Block Process ID'
                      Width = 90
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'lBlockStatus'
                      Title.Caption = 'Status'
                      Width = 100
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'LFreezeType'
                      Title.Caption = 'FreezeType'
                      Width = 438
                      Visible = True
                    end>
                end
                object Button1: TButton
                  Left = 719
                  Top = 448
                  Width = 75
                  Height = 25
                  Caption = 'Print'
                  TabOrder = 3
                  OnClick = Button1Click
                end
              end
            end
          end
          object TabSheet7: TTabSheet
            Caption = 'Ribbons'
            ImageIndex = 6
            object GroupBox2: TGroupBox
              Left = 13
              Top = 16
              Width = 935
              Height = 326
              Caption = 'Ribbons'
              TabOrder = 0
              object Label3: TLabel
                Left = 14
                Top = 252
                Width = 67
                Height = 13
                Caption = 'Nr of Sections'
              end
              object Label4: TLabel
                Left = 158
                Top = 250
                Width = 66
                Height = 13
                Caption = 'Cutting Order'
              end
              object mRibbonsGrid: TDBGrid
                Left = 14
                Top = 54
                Width = 396
                Height = 187
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
                  end>
              end
              object mRibbonsNavigator: TDBNavigator
                Left = 14
                Top = 23
                Width = 200
                Height = 25
                DataSource = atdbDM.mRibbonDSource
                VisibleButtons = [nbInsert, nbDelete, nbRefresh, nbApplyUpdates]
                ConfirmDelete = False
                TabOrder = 1
                BeforeAction = mRibbonsNavigatorBeforeAction
                OnClick = RibbonsNavigatorClick
              end
              object PrintBarCodeBtn: TButton
                Left = 782
                Top = 231
                Width = 113
                Height = 25
                Caption = 'PrintBarCodeBtn'
                TabOrder = 2
              end
              object DBEdit2: TDBEdit
                Left = 14
                Top = 271
                Width = 121
                Height = 21
                DataField = 'nr_of_sections'
                DataSource = atdbDM.mRibbonDSource
                TabOrder = 3
              end
              object DBEdit3: TDBEdit
                Left = 158
                Top = 269
                Width = 121
                Height = 21
                DataField = 'cutting_order'
                DataSource = atdbDM.mRibbonDSource
                TabOrder = 4
              end
              object GroupBox1: TGroupBox
                Left = 416
                Top = 23
                Width = 497
                Height = 289
                Caption = 'Notes'
                TabOrder = 5
                object DBGrid1: TDBGrid
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
                object DBLookupComboBox4: TDBLookupComboBox
                  Left = 220
                  Top = 29
                  Width = 253
                  Height = 21
                  DataField = 'created_by'
                  DataSource = atdbDM.ribbonNotesDSource
                  Enabled = False
                  KeyField = 'id'
                  ListField = 'user_name'
                  ListSource = atdbDM.usersDataSource
                  TabOrder = 1
                end
                object DBMemo3: TDBMemo
                  Left = 218
                  Top = 56
                  Width = 255
                  Height = 160
                  DataField = 'note'
                  DataSource = atdbDM.ribbonNotesDSource
                  TabOrder = 2
                end
                object DBNavigator4: TDBNavigator
                  Left = 219
                  Top = 222
                  Width = 254
                  Height = 25
                  DataSource = atdbDM.ribbonNotesDSource
                  VisibleButtons = [nbPost, nbCancel]
                  TabOrder = 3
                end
                object DBNavigator6: TDBNavigator
                  Left = 10
                  Top = 27
                  Width = 156
                  Height = 25
                  DataSource = atdbDM.ribbonNotesDSource
                  VisibleButtons = [nbInsert, nbDelete, nbRefresh, nbApplyUpdates]
                  ConfirmDelete = False
                  TabOrder = 4
                  OnClick = DBNavigator6Click
                end
              end
            end
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Users'
        ImageIndex = 2
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
        object DBNavigator1: TDBNavigator
          Left = 13
          Top = 20
          Width = 225
          Height = 25
          DataSource = atdbDM.usersDataSource
          VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
          TabOrder = 1
          OnClick = mUsersNavigatorClick
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'All Tables'
        ImageIndex = 4
        inline TTableFrame1: TTableFrame
          Left = 153
          Top = 0
          Width = 979
          Height = 574
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 153
          ExplicitWidth = 979
          ExplicitHeight = 574
          inherited GroupBox1: TGroupBox
            Width = 979
            Height = 574
            Align = alClient
            ExplicitWidth = 979
            ExplicitHeight = 574
            inherited DBGrid1: TDBGrid
              Top = 15
              Width = 975
              Height = 515
              Align = alClient
            end
            inherited DBNavigator1: TDBNavigator
              Top = 530
              Width = 975
              Hints.Strings = ()
              OnClick = TTableFrame1DBNavigator1Click
              ExplicitTop = 530
              ExplicitWidth = 975
            end
          end
        end
        object mTablesLB: TListBox
          Left = 0
          Top = 0
          Width = 153
          Height = 574
          Align = alLeft
          ItemHeight = 13
          TabOrder = 1
          OnClick = mTablesLBClick
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'DB Server'
        ImageIndex = 3
        object GroupBox3: TGroupBox
          Left = 3
          Top = 16
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
      object TabSheet6: TTabSheet
        Caption = 'Misc'
        ImageIndex = 5
      end
    end
  end
  object SB: TStatusBar
    Left = 0
    Top = 774
    Width = 1142
    Height = 19
    Panels = <>
  end
  object MenuPanel: TPanel
    Left = 0
    Top = 0
    Width = 1142
    Height = 41
    Align = alTop
    TabOrder = 3
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
    Left = 896
    Top = 160
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
    Left = 810
    Top = 384
  end
  object MainMenu1: TMainMenu
    Left = 613
    Top = 16
    object File1: TMenuItem
      Caption = 'File'
      object Exit1: TMenuItem
        Action = FileExit1
      end
    end
    object ools1: TMenuItem
      Caption = 'Options'
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
    Top = 224
  end
  object ActionList2: TActionList
    Left = 896
    Top = 48
  end
  object DBBarcode1D1: TDBBarcode1D
    DataField = 'label'
    DataSource = atdbDM.blocksDataSource
    Barcode1D = Barcode1D_Code391
    Left = 472
    Top = 424
  end
  object Barcode1D_Code391: TBarcode1D_Code39
    Image = Image1
    Stretch = True
    DisplayText = dtFullEncoded
    TextAlignment = taCenter
    TextFont.Charset = DEFAULT_CHARSET
    TextFont.Color = clBlack
    TextFont.Height = -11
    TextFont.Name = 'Tahoma'
    TextFont.Style = []
    Ratio = 2.000000000000000000
    AutoCheckDigit = False
    Left = 296
    Top = 416
  end
end
