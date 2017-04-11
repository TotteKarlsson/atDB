#ifndef TMainFormH
#define TMainFormH
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
//---------------------------------------------------------------------------
#include "Core/atDBApplicationMessages.h"
#include "Core/atDBDataStructures.h"
#include "mtkIniFileC.h"
#include "mtkIniFileProperties.h"
#include "mtkLogFileReader.h"
#include "mtkLogLevel.h"
#include "mtkMessageContainer.h"
#include "mtkProperty.h"
#include "mtkSQLite.h"
#include "TApplicationProperties.h"
#include "TRegistryForm.h"
#include "TRegistryProperties.h"
#include "TSTDStringLabeledEdit.h"
#include <System.Actions.hpp>
#include <System.Bindings.Outputs.hpp>
#include <System.Rtti.hpp>
#include <Vcl.ActnList.hpp>
#include <Vcl.AppEvnts.hpp>
#include <Vcl.Bind.Editors.hpp>
#include <Vcl.Bind.Grid.hpp>
#include <Vcl.Buttons.hpp>
#include <Vcl.CheckLst.hpp>
#include <Vcl.DBCtrls.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.Menus.hpp>
#include <Vcl.StdActns.hpp>
#include <Vcl.ToolWin.hpp>
#include "TIntegerLabeledEdit.h"
#include <Data.Bind.Components.hpp>
#include <Data.Bind.DBScope.hpp>
#include <Data.Bind.EngExt.hpp>
#include <Data.Bind.Grid.hpp>
#include <Vcl.Bind.DBEngExt.hpp>
#include <Vcl.Bind.Navigator.hpp>
#include <Data.DB.hpp>
#include <Data.FMTBcd.hpp>
#include <Data.SqlExpr.hpp>
#include <Vcl.Mask.hpp>
#include "TArrayBotBtn.h"
#include "database/atATDBServerSession.h"
#include <Datasnap.DBClient.hpp>
#include <Datasnap.Provider.hpp>
#include "TTableFrame.h"
#include "TIntLabel.h"
#include "TFloatLabeledEdit.h"

using mtk::Property;
using mtk::SQLite;
using mtk::MessageContainer;
using mtk::IniFileProperties;
using mtk::TRegistryProperties;

extern string gApplicationRegistryRoot;

class TMainForm : public TRegistryForm
{
    __published:	// IDE-managed Components
    TStatusBar *SB;
        TActionList *ActionList1;
        TPopupMenu *PopupMenu1;
        TAction *ClearMemoA;
        TMenuItem *ClearMemoA1;
    TPanel *TopPanel;
    mtkIniFileC *mIniFileC;
    TMainMenu *MainMenu1;
    TMenuItem *File1;
    TMenuItem *Help1;
    TFileExit *FileExit1;
    TMenuItem *Exit1;
    TAction *OpenAboutFormA;
    TMenuItem *About1;
    TTimer *ShutDownTimer;
	TPageControl *PageControl1;
	TTabSheet *TabSheet2;
	TGroupBox *mBlocksGB;
	TDBNavigator *mBlocksNavigator;
	TDBGrid *mBlockNotesGrid;
	TDBMemo *mBlockNoteMemo;
	TDBNavigator *DBNavigator2;
	TScrollBox *ScrollBox1;
	TLabel *Label2;
	TGroupBox *BlockNotesGB;
	TTabSheet *TabSheet5;
	TPanel *MenuPanel;
	TDBNavigator *mBlockNoteNavigator;
	TTabSheet *TabSheet6;
	TTableFrame *TTableFrame1;
	TTabSheet *TabSheet7;
	TGroupBox *GroupBox2;
	TDBGrid *mRibbonsGrid;
	TDBNavigator *mRibbonsNavigator;
	TButton *PrintBarCodeBtn;
	TGroupBox *GroupBox1;
	TDBGrid *mRibbonNotesGrid;
	TDBMemo *mRibbonNoteMemo;
	TDBNavigator *mRibbonNoteNavigator;
	TDBNavigator *mRibbonNotesNavigator;
	TTabSheet *TabSheet4;
	TPageControl *PageControl2;
	TTabSheet *TabSheet8;
	TDBGrid *mSpecimenGrid;
	TDBNavigator *mSpecimenNavigator;
	TGroupBox *GroupBox4;
	TListBox *mTablesLB;
	TDBGrid *mBlocksGrid;
	TButton *Button1;
	TMemo *mLblMakerMemo;
	TDBGrid *mProcessForBlocksGrid;
	TDBGrid *mBlocksForRibbonsGrid;
	TDBGrid *mUsersDBGrid;
	TDBNavigator *mUsersNavigator;
	TGroupBox *GroupBox3;
	TSTDStringLabeledEdit *mServerIPE;
	TSTDStringLabeledEdit *mDBUserE;
	TSTDStringLabeledEdit *mPasswordE;
	TArrayBotButton *mATDBServerBtnConnect;
	TSTDStringLabeledEdit *mDatabaseE;
	TTabSheet *mDocsTabSheet;
	TDBNavigator *mDocsNavigator;
	TDBGrid *mDocumentsGrid;
	TButton *mAddDocBtn;
	TTabSheet *TabSheet3;
	TPanel *BottomPanel;
	TPanel *Panel1;
	TMemo *infoMemo;
	TToolBar *ToolBar1;
	TToolButton *ToolButton2;
	TToolButton *ToolButton1;
	TComboBox *LogLevelCB;
	TPopupMenu *SpecimenPopup;
	TMenuItem *openDocument;
	TDBText *DBText3;
	TGroupBox *GroupBox5;
	TPanel *Panel2;
	TPanel *Panel3;
	TPanel *Panel4;
	TPanel *Panel5;
	TPanel *Panel6;
	TTabSheet *TabSheet9;
	TDBGrid *mCoverSlipsGrid;
	TDBNavigator *CSNavigator;
	TPanel *Panel7;
	TDBGrid *mCSDustAssaysGrid;
	TDBNavigator *cdDustAssayNavigator;
	TGroupBox *GroupBox6;
	TPanel *Panel8;
	TGroupBox *GroupBox8;
	TPanel *Panel9;
	TPanel *Panel10;
	TDBMemo *DBMemo2;
	TLabel *Label4;
	TDBText *DBText1;
	TTabSheet *TabSheet10;
	TDBGrid *DBGrid2;
	TImage *Image1;
	TDBNavigator *DBNavigator1;
	TImage *mBackgroundImage;
	TImage *mCoverslipImage;
	TImage *mResultImage;
	TDBText *mIm1FName;
	TDBText *mIm2FName;
	TDBText *mIm3FName;
	TPanel *Panel11;
	TPanel *mResultImagePanel;
	TPanel *mBackgroundImagePanel;
	TPanel *Panel14;
	TSplitter *Splitter2;
	TSplitter *Splitter3;
	TGroupBox *GroupBox7;
	TSTDStringLabeledEdit *mDustAssayImageFolderE;
	TButton *mBrowseForDustAssayImageFolder;
	TPanel *Panel12;
	TButton *mRegisterFreshBatchBtn;
	TGroupBox *GroupBox9;
	TDBGrid *mFreshBatchesGrid;
	TDBNavigator *CSFreshBatchNavigator;
	TButton *mPrintBatchLblBtn;
	TPanel *CSgridPanel;
	TButton *mRegisterCleanRoundBtn;
	TButton *mRegisterCarbonCoatBatchBtn;
	TIntLabel *mNrOfSelectedCS;
	TLabel *Label6;
	TButton *mPrintCSLabelsBtn;
	TPageControl *PageControl3;
	TTabSheet *TabSheet11;
	TTabSheet *TabSheet12;
	TDBMemo *DBMemo1;
	TGroupBox *GroupBox10;
	TDataSource *CoverslipsDataSource;
	TGroupBox *GroupBox11;
	TLabel *Label10;
	TDBLookupComboBox *DBLookupComboBox1;
	TLabel *Label16;
	TDBEdit *DBEdit7;
	TButton *mAddCSNote;
	TGroupBox *GroupBox12;
	TGroupBox *GroupBox13;
	TGroupBox *GroupBox14;
	TIntegerLabeledEdit *mCSBCTextXPos;
	TIntegerLabeledEdit *mCSBCTextYPos;
	TIntegerLabeledEdit *mCSBCFont;
	TIntegerLabeledEdit *mBCTextAlignment;
	TFloatLabeledEdit *mCSBCWidth;
	TFloatLabeledEdit *mCSBCHeight;
	TIntegerLabeledEdit *mCodeStartX;
	TIntegerLabeledEdit *mCodeStartY;
	TIntegerLabeledEdit *mExpectedHeight;
	TIntegerLabeledEdit *mExpectedWidth;
	TGroupBox *GroupBox15;
	TIntegerLabeledEdit *mRowSymbolSize;
	TIntegerLabeledEdit *mColSymbolSize;
	TIntegerLabeledEdit *mModuleSize;
	TSTDStringLabeledEdit *mTestLabel;
	TButton *mPrintTestLabelBtn;
	TGroupBox *GroupBox16;
	TGroupBox *GroupBox17;
	TPanel *Panel13;
	TPanel *Panel15;
	TPanel *Panel16;
	TSplitter *Splitter1;
	TPanel *Panel17;
	TDBText *DBText2;
	TDBLookupComboBox *mUsersCB;
    void __fastcall FormKeyDown(TObject *Sender, WORD &Key, TShiftState Shift);
    void __fastcall FormCreate(TObject *Sender);

    void __fastcall ClearMemoAExecute(TObject *Sender);
    void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
    void __fastcall FormShow(TObject *Sender);
    void __fastcall ThemesMenuClick(TObject *Sender);
    void __fastcall ShutDownTimerTimer(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall LogLevelCBChange(TObject *Sender);

	void __fastcall mUsersNavigatorClick(TObject *Sender, TNavigateBtn Button);
	void __fastcall mBlocksNavigatorClick(TObject *Sender, TNavigateBtn Button);
	void __fastcall RibbonsNavigatorClick(TObject *Sender, TNavigateBtn Button);
	void __fastcall mBlocksNavigatorBeforeAction(TObject *Sender, TNavigateBtn Button);
	void __fastcall mATDBServerBtnConnectClick(TObject *Sender);
	void __fastcall mUpdateNoteBtnClick(TObject *Sender);
	void __fastcall mUsersCBCloseUp(TObject *Sender);
	void __fastcall mBlockNoteNavigatorClick(TObject *Sender, TNavigateBtn Button);
	void __fastcall mRibbonNotesNavigatorClick(TObject *Sender, TNavigateBtn Button);
	void __fastcall mSpecimenGridDrawDataCell(TObject *Sender, const TRect &Rect, TField *Field,
          TGridDrawState State);
	void __fastcall mSpecimenGridDrawColumnCell(TObject *Sender, const TRect &Rect, int DataCol,
          TColumn *Column, TGridDrawState State);
	void __fastcall mTablesLBClick(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall mSpecimenNavigatorClick(TObject *Sender, TNavigateBtn Button);
	void __fastcall mProcessForBlocksGridKeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall mProcessForBlocksGridCellClick(TColumn *Column);
	void __fastcall OpenAboutFormAExecute(TObject *Sender);
	void __fastcall PageControl2Change(TObject *Sender);
	void __fastcall mDocumentsGridDblClick(TObject *Sender);
	void __fastcall mAddDocBtnClick(TObject *Sender);
	void __fastcall mSpecimenGridDblClick(TObject *Sender);
	void __fastcall mSpecimenGridMouseDown(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y);
	void __fastcall mSpecimenGridMouseUp(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y);
	void __fastcall mBlocksGridKeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall mBlocksGridCellClick(TColumn *Column);
//	void __fastcall DataSource1DataChange(TObject *Sender, TField *Field);
	void __fastcall mSpecimenGridMouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
	void __fastcall mSpecimenGridTitleClick(TColumn *Column);
	void __fastcall CoverSlipNavigatorsClick(TObject *Sender, TNavigateBtn Button);
	void __fastcall mPrintTestLabelBtnClick(TObject *Sender);
	void __fastcall mBrowseForDustAssayImageFolderClick(TObject *Sender);
	void __fastcall cdDustAssayNavigatorBeforeAction(TObject *Sender, TNavigateBtn Button);
	void __fastcall mRegisterFreshBatchBtnClick(TObject *Sender);
	void __fastcall mPrintBatchLblBtnClick(TObject *Sender);
	void __fastcall mFreshBatchesGridCellClick(TColumn *Column);
	void __fastcall mFreshBatchesGridKeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall mRegisterCleanRoundBtnClick(TObject *Sender);
	void __fastcall mRegisterCarbonCoatBatchBtnClick(TObject *Sender);
	void __fastcall mPrintCSLabelsBtnClick(TObject *Sender);
	void __fastcall mCoverSlipsGridKeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall mCoverSlipsGridCellClick(TColumn *Column);
	void __fastcall mBlocksGridDblClick(TObject *Sender);

    private:
        bool                                            gCanClose;
        TApplicationProperties                          mAppProperties;
		Poco::Mutex										mServerDBMutex;

		ATDBServerSession								mServerDBSession;
		String __fastcall								createBlockLabel();
        TThreadMethod                                   logMsgMethod;
        void __fastcall                                 logMsg();
		int 											getCurrentUserID();

		LogFileReader                                   mLogFileReader;
        vector<TDBGrid*>								mDBGrids;
		bool                                            mIsStyleMenuPopulated;
		void                                            setupWindowTitle();
		void                                            updateWindowTitle();
		string                                          mTempFileFolder;

                                                        //INI Parameters...
        IniFileProperties	      	                    mGeneralProperties;
        mtk::Property<int>	                            mBottomPanelHeight;
		mtk::Property<int>	                            mMainTabIndex;
		mtk::Property<int>	                            mDustAssayResultImageHeight;
		mtk::Property<int>	                            mDustAssayBackGroundImageWidth;
		mtk::Property<mtk::LogLevel>	                mLogLevel;

        IniFileProperties	      	                    mCoverslipPrintingProperties;
        TRegistryProperties   	  	                    mSplashProperties;
        mtk::Property<bool>                             mShowSplashOnStartup;

		mtk::Property<int>	                            mDBUserID;

        void        __fastcall                          PopulateStyleMenu();

        bool                                            setupAndReadIniParameters();
        void                                            setupIniFile();

		void __fastcall                                 AppInBox(mlxStructMessage &Msg);

		void    										populateUsers();
		void       __fastcall							afterServerConnect(System::TObject* Sender);
		void       __fastcall							afterServerDisconnect(System::TObject* Sender);
		void 		__fastcall 							selectBlocks();
		void 		__fastcall							selectCoverSlips(TDBGrid* masterGrid, TDBGrid* detailGrid);
		void 											openCurrentDocumentFile();
		void 		__fastcall 							createBlockLabels();
		bool 											loadImage(const string& fName, TImage* img);

        //Custom event
		void 		__fastcall 							onDustAssayDataChanged(TObject *Sender);
		bool											removeAssayFile(const string& f);

    public:		// User declarations
                    __fastcall                          TMainForm(TComponent* Owner);
                    __fastcall                          ~TMainForm();

        BEGIN_MESSAGE_MAP
                  MESSAGE_HANDLER(UWM_MESSAGE,        mlxStructMessage,         AppInBox);
        END_MESSAGE_MAP(TForm)
};

extern PACKAGE TMainForm *MainForm;
#endif