object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'atDB'
  ClientHeight = 753
  ClientWidth = 993
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 605
    Width = 993
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 0
    ExplicitWidth = 505
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 608
    Width = 993
    Height = 126
    Align = alBottom
    TabOrder = 0
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 991
      Height = 124
      Align = alClient
      Caption = 'Panel4'
      TabOrder = 0
      object infoMemo: TMemo
        Left = 1
        Top = 22
        Width = 989
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
        Width = 989
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
    Top = 0
    Width = 993
    Height = 605
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 991
      Height = 603
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = 'Overview'
        ImageIndex = 1
        object GroupBox1: TGroupBox
          Left = 19
          Top = 19
          Width = 278
          Height = 86
          Caption = 'Users'
          TabOrder = 0
          object DBText1: TDBText
            Left = 160
            Top = 48
            Width = 121
            Height = 17
            DataField = 'created'
            DataSource = atDM.usersDataSource
          end
          object mUserIDText: TDBText
            Left = 254
            Top = 23
            Width = 65
            Height = 17
            DataField = 'id'
            DataSource = atDM.usersDataSource
          end
          object mUsersNavigator: TDBNavigator
            Left = 17
            Top = 15
            Width = 231
            Height = 25
            DataSource = atDM.usersDataSource
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
            ParentShowHint = False
            ConfirmDelete = False
            ShowHint = True
            TabOrder = 0
            BeforeAction = mUsersNavigatorBeforeAction
            OnClick = mUsersNavigatorClick
          end
          object mUserNameE: TDBEdit
            Left = 17
            Top = 46
            Width = 121
            Height = 21
            DataField = 'user_name'
            DataSource = atDM.usersDataSource
            TabOrder = 1
          end
        end
        object GroupBox3: TGroupBox
          Left = 19
          Top = 111
          Width = 798
          Height = 434
          Caption = 'Blocks && Ribbons'
          TabOrder = 1
          object GroupBox2: TGroupBox
            Left = 17
            Top = 95
            Width = 121
            Height = 202
            Caption = 'Blocks'
            TabOrder = 0
            object mBlocksNavigator: TDBNavigator
              Left = 17
              Top = 16
              Width = 64
              Height = 25
              DataSource = atDM.blocksDataSource
              VisibleButtons = [nbInsert, nbDelete]
              ConfirmDelete = False
              TabOrder = 0
              BeforeAction = mBlocksNavigatorBeforeAction
              OnClick = mBlocksNavigatorClick
            end
            object DBLookupListBox1: TDBLookupListBox
              Left = 17
              Top = 56
              Width = 64
              Height = 134
              KeyField = 'id'
              ListField = 'id'
              ListSource = atDM.blocksDataSource
              TabOrder = 1
            end
          end
          object GroupBox5: TGroupBox
            Left = 17
            Top = 31
            Width = 121
            Height = 58
            Caption = 'User'
            TabOrder = 1
            object mUsersCB: TDBLookupComboBox
              Left = 17
              Top = 23
              Width = 87
              Height = 21
              KeyField = 'id'
              ListField = 'user_name'
              ListSource = atDM.usersDataSource
              TabOrder = 0
              OnClick = mUsersCBClick
            end
          end
          object GroupBox6: TGroupBox
            Left = 144
            Top = 37
            Width = 641
            Height = 260
            Caption = 'Ribbons'
            TabOrder = 2
            object mBarCodeImage: TImage
              Left = 535
              Top = 22
              Width = 98
              Height = 221
              ParentShowHint = False
              Proportional = True
              ShowHint = True
              Stretch = True
            end
            object DBText2: TDBText
              Left = 280
              Top = 224
              Width = 65
              Height = 17
              DataField = 'bar_code'
              DataSource = atDM.mRibbonDSource
            end
            object DBGrid1: TDBGrid
              Left = 15
              Top = 22
              Width = 514
              Height = 184
              DataSource = atDM.mRibbonDSource
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
            object mRibbonsNavigator: TDBNavigator
              Left = 15
              Top = 212
              Width = 210
              Height = 25
              DataSource = atDM.mRibbonDSource
              VisibleButtons = [nbInsert, nbDelete]
              ConfirmDelete = False
              TabOrder = 1
              OnClick = RibbonsNavigatorClick
            end
            object PrintBarCode: TButton
              Left = 448
              Top = 212
              Width = 81
              Height = 25
              Caption = 'PrintBarCode'
              TabOrder = 2
              OnClick = PrintBarCodeClick
            end
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        ImageIndex = 1
        object DBGrid2: TDBGrid
          Left = 16
          Top = 40
          Width = 497
          Height = 120
          DataSource = atDM.blocksDataSource
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object DBGrid3: TDBGrid
          Left = 16
          Top = 200
          Width = 497
          Height = 120
          DataSource = atDM.mRibbonDSource
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
    end
  end
  object SB: TStatusBar
    Left = 0
    Top = 734
    Width = 993
    Height = 19
    Panels = <>
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
    object AddUserA: TAction
      Caption = 'Add'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 912
    Top = 456
    object ClearMemoA1: TMenuItem
      Action = ClearMemoA
    end
  end
  object mIniFileC: mtkIniFileC
    IniFileName = 'atDB.ini'
    RootFolder = '.'
    Left = 906
    Top = 336
  end
  object MainMenu1: TMainMenu
    Left = 909
    Top = 400
    object File1: TMenuItem
      Caption = 'File'
      object Exit1: TMenuItem
        Action = FileExit1
      end
    end
    object ools1: TMenuItem
      Caption = 'Options'
      object ThemesMenu: TMenuItem
        Caption = 'Themes'
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
    Top = 224
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = atDM.blocksCDS
    ScopeMappings = <>
    Left = 920
    Top = 64
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    UseAppManager = True
    Left = 660
    Top = 109
  end
  object Barcode1D_Code391: TBarcode1D_Code39
    Image = mBarCodeImage
    Orientation = boBottomTop
    Stretch = True
    DisplayText = dtBarcode
    TextPosition = tpBottomOut
    TextAlignment = taCenter
    TextFont.Charset = DEFAULT_CHARSET
    TextFont.Color = clBlack
    TextFont.Height = -11
    TextFont.Name = 'Tahoma'
    TextFont.Style = []
    ShowGuards = True
    Barcode = '990000099'
    Ratio = 2.000000000000000000
    Left = 560
    Top = 304
  end
  object DBBarcode1D1: TDBBarcode1D
    DataField = 'bar_code'
    DataSource = atDM.mRibbonDSource
    ReadOnly = True
    Barcode1D = Barcode1D_Code391
    Left = 656
    Top = 312
  end
  object ActionList2: TActionList
    Left = 648
    Top = 48
  end
end
