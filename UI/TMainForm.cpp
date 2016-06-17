#include <vcl.h>
#pragma hdrstop
#include "mtkLogger.h"
#include "mtkMoleculixException.h"
#include "mtkSQLiteException.h"
#include "mtkSQLiteQuery.h"
#include "mtkSQLiteTable.h"
#include "mtkStringUtils.h"
#include "mtkVCLUtils.h"
#include "Poco/DateTime.h"
#include "Poco/DateTimeFormat.h"
#include "Poco/DateTimeFormatter.h"
#include "Poco/Glob.h"
#include "Poco/Timezone.h"
#include "TamFileEditor.h"
#include "TMainForm.h"
#include "TMemoLogger.h"
#include "TShowFileContentForm.h"
#include "TSplashForm.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "mtkIniFileC"
#pragma link "TIntegerLabeledEdit"
#pragma link "pBarcode1D"
#pragma link "pUPC"
#pragma link "pUPCA"
#pragma link "pCode39"
#pragma link "pDBBarcode1D"
#pragma resource "*.dfm"

TMainForm *MainForm;
using namespace mtk;
using namespace Poco;

extern string gLogFileName;
extern string gApplicationRegistryRoot;
extern string gDefaultAppTheme;
extern string gFullDateTimeFormat;
extern bool gIsDevelopmentRelease;
extern TSplashForm*  gSplashForm;

//---------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent* Owner)
    : TRegistryForm(gApplicationRegistryRoot, "MainForm", Owner),

    mDBConnectionName("atDBDebug"),
    mBottomPanelHeight(205),
    mMainTabIndex(0),
    mSplashProperties(gApplicationRegistryRoot, "Splash"),
    mShowSplashOnStartup(true),
    mLogLevel(lAny),
    mIsStyleMenuPopulated(false),
    gCanClose(true),
    logMsgMethod(&logMsg),
    mLogFileReader(joinPath(getSpecialFolder(CSIDL_LOCAL_APPDATA), "atDB", gLogFileName), logMsgMethod)
{
    //Close any dataconnection created by stupid TSQLConnection
    mTempFileFolder = joinPath(getSpecialFolder(CSIDL_LOCAL_APPDATA), "atDB");
    TMemoLogger::mMemoIsEnabled = false;
    setupIniFile();
    setupAndReadIniParameters();
}

//This one is called from the reader thread
void __fastcall TMainForm::logMsg()
{
    infoMemo->Lines->Add(vclstr(mLogFileReader.getData()));
    mLogFileReader.purge();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mUsersCBClick(TObject *Sender)
{
	Log(lInfo) <<"Selected: " << stdstr(mUsersCB->ListSource->DataSet->FieldByName("user_name")->AsString);
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mUsersNavigatorBeforeAction(TObject *Sender, TNavigateBtn Button)
{
	switch(Button)
    {
    	case TNavigateBtn::nbInsert:
//	        mUserCreatedE->Text = getFormattedDateTimeString(gFullDateTimeFormat).c_str();
//            mUserNameE->Text = "New User";
        break;
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mUsersNavigatorClick(TObject *Sender, TNavigateBtn Button)
{
	switch(Button)
    {
    	case TNavigateBtn::nbInsert:
            mUserNameE->Text = "New User";
        break;

        case TNavigateBtn::nbApplyUpdates:
        break;
        case TNavigateBtn::nbRefresh:
 		break;
        default:
		    mUsersCB->KeyValue = atDM->usersClientDataSet->FieldByName("id")->AsInteger;
        break;
    }
}

void __fastcall TMainForm::mBlocksNavigatorClick(TObject *Sender, TNavigateBtn Button)
{
	switch(Button)
    {
    	case TNavigateBtn::nbInsert:
	        mBlockCreatorID->Text = mUserIDText->Field->AsString;
		mBlocksNavigator->BtnClick( Data::Bind::Controls::nbPost);
        break;
        case TNavigateBtn::nbPost:
	        mBlocksNavigator->BtnClick( Data::Bind::Controls::nbRefresh);
	        mBlocksNavigator->BtnClick( Data::Bind::Controls::nbRefresh);
	        mBlocksNavigator->BtnClick( Data::Bind::Controls::nbLast);
        break;
        case TNavigateBtn::nbRefresh:
        	Log(lInfo) << "Refreshed Blocks Dataset";
 		break;
        default:
		    mUsersCB->KeyValue = atDM->usersClientDataSet->FieldByName("id")->AsInteger;
        break;
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mUserNameEKeyDown(TObject *Sender, WORD &Key, TShiftState Shift)
{
//	if(Key == vkReturn)
//    {
//		atDM->usersClientDataSet->Post();
//    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::Button3Click(TObject *Sender)
{
//    stringstream q;
//    int nID = atDM->blockNotesDSet->FieldByName("id")->AsInteger;
//
//    stringstream memo;
//    for(int i = 0; i <  mBlockNoteMemo->Lines->Count; i++)
//    {
//        memo<<stdstr(mBlockNoteMemo->Lines->Strings[i]);
//        if(i < mBlockNoteMemo->Lines->Count -1 )
//        {
//            memo<<endl;
//        }
//    }
//    string s(memo.str());
//    q << "UPDATE note SET note=\""<< s <<"\" WHERE id=\""<<nID<<"\"";
//    Log(lInfo) << q.str();
//
//    atDM->updateNoteQ->SQL->Clear();
//    atDM->updateNoteQ->SQL->Add(q.str().c_str());
//    atDM->updateNoteQ->ExecSQL(true);
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mInsertNewNoteBtnClick(TObject *Sender)
{
//    int uID = atDM->usersClientDataSet->FieldByName("id")->AsInteger;
//    int blockID = atDM->blocksCDSid->Value;
//
//    stringstream q;
//    q <<"INSERT INTO note (created_by) VALUES ("<<uID<<")";
//    Log(lInfo) << q.str();
//
//    TSQLQuery* tq = new TSQLQuery(NULL);
//    tq->SQLConnection = atDM->SQLConnection1;
//
//    tq->SQL->Add(q.str().c_str());
//    tq->ExecSQL(true);
//    tq->SQL->Clear();
//
//    tq->SQL->Add("SELECT LAST_INSERT_ROWID() as lRID");
//    tq->Open();
//    int noteID = tq->FieldByName("lRID")->AsInteger;
//
//    //Associate
//    q.str("");
//    q << "INSERT INTO block_note (block_id, note_id) VALUES("<<blockID<<","<<noteID<<")";
//    Log(lInfo) << q.str();
//    tq->SQL->Clear();
//    tq->SQL->Add(q.str().c_str());
//    tq->ExecSQL(true);
//
//    delete tq;
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mDeleteNoteBtnClick(TObject *Sender)
{
//	//To delete a note, first delete data in the relational table,
//	//    and after that the note itself
//    int uID 	= atDM->usersClientDataSet->FieldByName("id")->AsInteger;
//    int blockID = atDM->blocksCDSid->Value;
//    int noteID  = mNotesLookupLB->KeyValue;
//
//    stringstream q;
//    TSQLQuery* tq = new TSQLQuery(NULL);
//    tq->SQLConnection = atDM->SQLConnection1;
//
//    //Associate
//    q.str("");
//    q << "DELETE FROM block_note WHERE note_id="<<noteID;
//    Log(lInfo) << q.str();
//
//    tq->SQL->Add(q.str().c_str());
//    tq->ExecSQL(true);
//    tq->SQL->Clear();
//    q.str("");
//
//    q <<"DELETE FROM note WHERE id = "<<noteID;
//    Log(lInfo) << q.str();
//
//
//    tq->SQL->Add(q.str().c_str());
//    tq->ExecSQL(true);
//
//    delete tq;
////    mNotesLookupLB->DataSource->DataSet->Prior();
}


void __fastcall TMainForm::Button1Click(TObject *Sender)
{
    atDM->usersDS->Refresh();
}
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------

