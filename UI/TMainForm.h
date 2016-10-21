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
#include "pBarcode1D.hpp"
#include "pUPC.hpp"
#include "pUPCA.hpp"
#include "pCode39.hpp"
#include "pDBBarcode1D.hpp"
#include "TArrayBotBtn.h"
#include "database/abATDBServerSession.h"
#include "RzDBEdit.hpp"
#include "RzEdit.hpp"
#include "RzDBSpin.hpp"
#include "RzSpnEdt.hpp"
#include <Datasnap.DBClient.hpp>
#include <Datasnap.Provider.hpp>
#include "TTableFrame.h"

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
    TPanel *BottomPanel;
        TMemo *infoMemo;
        TActionList *ActionList1;
        TPopupMenu *PopupMenu1;
        TAction *ClearMemoA;
        TMenuItem *ClearMemoA1;
    TSplitter *Splitter1;
    TPanel *TopPanel;
    mtkIniFileC *mIniFileC;
    TMainMenu *MainMenu1;
    TMenuItem *File1;
    TMenuItem *Help1;
    TFileExit *FileExit1;
    TMenuItem *Exit1;
    TToolBar *ToolBar2;
    TPanel *Panel4;
    TToolButton *ToolButton4;
    TComboBox *LogLevelCB;
    TAction *OpenAboutFormA;
    TMenuItem *About1;
    TToolButton *ToolButton1;
    TTimer *ShutDownTimer;
	TPageControl *PageControl1;
	TTabSheet *TabSheet2;
	TGroupBox *mBlocksGB;
	TActionList *ActionList2;
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
	TDBText *DBText1;
	TLabel *Label8;
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
	TImage *Image1;
	TDBBarcode1D *DBBarcode1D1;
	TBarcode1D_Code39 *Barcode1D_Code391;
	TDBGrid *mBlocksGrid;
	TButton *Button1;
	TComboBox *mUsersCB;
	TDBText *DBText2;
	TMemo *Memo1;
	TDBGrid *mProcessForBlocksGrid;
	TLabel *Label1;
	TDBGrid *mBlocksForRibbonsGrid;
	TLabel *Label5;
	TLabel *Label3;
	TLabel *Label4;
	TDBGrid *mUsersDBGrid;
	TDBNavigator *mUsersNavigator;
	TGroupBox *GroupBox3;
	TSTDStringLabeledEdit *mServerIPE;
	TSTDStringLabeledEdit *mDBUserE;
	TSTDStringLabeledEdit *mPasswordE;
	TArrayBotButton *mATDBServerBtnConnect;
	TSTDStringLabeledEdit *mDatabaseE;
	TTabSheet *TabSheet1;
	TDBNavigator *mDocsNavigator;
	TDBGrid *mDocumentsGrid;
	TButton *mAddDocBtn;
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
	void __fastcall mBlocksGridDblClick(TObject *Sender);
	void __fastcall mUpdateNoteBtnClick(TObject *Sender);
	void __fastcall mUsersCBCloseUp(TObject *Sender);
	void __fastcall mRibbonsNavigatorBeforeAction(TObject *Sender, TNavigateBtn Button);
	void __fastcall mBlockNoteNavigatorClick(TObject *Sender, TNavigateBtn Button);
	void __fastcall mRibbonNotesNavigatorClick(TObject *Sender, TNavigateBtn Button);
	void __fastcall mSpecimenGridDrawDataCell(TObject *Sender, const TRect &Rect, TField *Field,
          TGridDrawState State);
	void __fastcall mUsersDBGridDrawDataCell(TObject *Sender, const TRect &Rect, TField *Field,
          TGridDrawState State);
	void __fastcall mSpecimenGridDrawColumnCell(TObject *Sender, const TRect &Rect, int DataCol,
          TColumn *Column, TGridDrawState State);
	void __fastcall TTableFrame1DBNavigator1Click(TObject *Sender, TNavigateBtn Button);
	void __fastcall mTablesLBClick(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall mSpecimenNavigatorClick(TObject *Sender, TNavigateBtn Button);
	void __fastcall mProcessForBlocksGridKeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall mProcessForBlocksGridCellClick(TColumn *Column);
	void __fastcall OpenAboutFormAExecute(TObject *Sender);
	void __fastcall PageControl2Change(TObject *Sender);
	void __fastcall mDocumentsGridDblClick(TObject *Sender);
	void __fastcall mAddDocBtnClick(TObject *Sender);

    private:	// User declarations
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

														//Threads can drop messages into the
														//Message container. The main thread pops them
														//using the messageProcessor
		MessageContainer                                mMessages;

		void											populateUsersCB();
                                                        //Parameters...
        IniFileProperties	      	                    mGeneralProperties;
        mtk::Property<int>	                            mBottomPanelHeight;
		mtk::Property<int>	                            mMainTabIndex;


		mtk::Property<mtk::LogLevel>	                mLogLevel;
        mtk::Property<string>							mLocalDBFile;
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
    public:		// User declarations
                    __fastcall                          TMainForm(TComponent* Owner);
                    __fastcall                          ~TMainForm();

        BEGIN_MESSAGE_MAP
                  MESSAGE_HANDLER(UWM_MESSAGE,        mlxStructMessage,         AppInBox);
        END_MESSAGE_MAP(TForm)
};

//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
