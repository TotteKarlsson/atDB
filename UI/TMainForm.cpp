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
#include "TATDBDataModule.h"
#include "mtkUtils.h"
#include "abVCLUtils.h"
#include "database/abDBUtils.h"
#include "TTableUpdateForm.h"
#include "TNewSpecimenForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "mtkIniFileC"
#pragma link "TIntegerLabeledEdit"
#pragma link "pBarcode1D"
#pragma link "pUPC"
#pragma link "pUPCA"
#pragma link "pCode39"
#pragma link "pDBBarcode1D"
#pragma link "TArrayBotBtn"
#pragma link "TTableFrame"
#pragma resource "*.dfm"

TMainForm *MainForm;
using namespace mtk;
using namespace ab;

extern string gLogFileName;
extern string gApplicationRegistryRoot;
extern string gDefaultAppTheme;
extern string gFullDateTimeFormat;
extern bool gIsDevelopmentRelease;
//extern TSplashForm*  gSplashForm;

//---------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent* Owner)
    : TRegistryForm(gApplicationRegistryRoot, "MainForm", Owner),

    mBottomPanelHeight(205),
    mMainTabIndex(0),
    mSplashProperties(gApplicationRegistryRoot, "Splash"),
    mShowSplashOnStartup(true),
    mLogLevel(lAny),
    mIsStyleMenuPopulated(false),
    gCanClose(true),
    logMsgMethod(&logMsg),
    mLogFileReader(joinPath(getSpecialFolder(CSIDL_LOCAL_APPDATA), "atDB", gLogFileName), logMsgMethod),
    mLocalDBFile(""),
	mServerDBSession("atdb"),
    mDBUserID(0)
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
void __fastcall TMainForm::mUsersNavigatorClick(TObject *Sender, TNavigateBtn Button)
{
	switch(Button)
    {
    	case TNavigateBtn::nbInsert:
        	atdbDM->usersCDS->FieldValues["user_name"] = "New User";
        break;
        case TNavigateBtn::nbApplyUpdates:      									  break;
        case TNavigateBtn::nbRefresh:
        	populateUsersCB();
        break;
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mBlocksNavigatorBeforeAction(TObject *Sender, TNavigateBtn Button)
{
	switch(Button)
    {
    	case TNavigateBtn::nbDelete:
             if(MessageDlg("Deleting this block will delete all associated ribbons and notes!\nContinue?", mtWarning, TMsgDlgButtons() << mbOK<<mbCancel, 0) == mrCancel)
             {
				Abort();
             }

			int blockID = atdbDM->blocksCDS->FieldByName("id")->Value;
            mServerDBSession.deleteNotesForBlock(blockID);
            mServerDBSession.deleteRibbonsForBlock(blockID);
        break;
    }
}

void __fastcall TMainForm::mRibbonsNavigatorBeforeAction(TObject *Sender, TNavigateBtn Button)
{
//	switch(Button)
//    {
//    	case TNavigateBtn::nbDelete:
////             if(MessageDlg("Deleting this ribbon will delete all associated notes!\nContinue?", mtWarning, TMsgDlgButtons() << mbOK<<mbCancel, 0) == mrCancel)
////             {
////				Abort();
////             }
//
////			String ribbonID = atdbDM->mRibbonCDS->FieldByName("id")->Value;
////            mServerDBSession.deleteNotesForRibbon(stdstr(ribbonID));
////            atdbDM->ribbonNotesCDS->Refresh();
//        break;
//    }
}

void __fastcall TMainForm::mBlocksNavigatorClick(TObject *Sender, TNavigateBtn Button)
{
	switch(Button)
    {
    	case TNavigateBtn::nbDelete:        break;

    	case TNavigateBtn::nbInsert:
        	if(mUsersCB->ItemIndex != -1)
            {
	            int* userID = (int*) mUsersCB->Items->Objects[mUsersCB->ItemIndex];
	        	atdbDM->blocksCDS->FieldValues["created_by"] = *userID;
	        	atdbDM->blocksCDS->FieldValues["process_id"] = atdbDM->specimenCDS->FieldByName("process_id")->AsInteger;
	        	atdbDM->blocksCDS->FieldValues["serial"] 	 = atdbDM->blocksCDS->RecordCount + 1;

                // Create block label
                String str = createBlockLabel();

	        	atdbDM->blocksCDS->FieldValues["label"] = str;
	        	atdbDM->blocksCDS->FieldValues["status"] = 0;
                atdbDM->blocksCDS->Post();
			    atdbDM->blocksCDS->First();
            }
            else
            {
            	MessageDlg("Select a user before inserting blocks..", mtInformation, TMsgDlgButtons() << mbOK, 0);
            	Log(lError) << "Bad...";
            }
        break;
        case TNavigateBtn::nbPost:        		break;
        case TNavigateBtn::nbRefresh:        	Log(lInfo) << "Refreshed Blocks Dataset"; 		break;
    }
}

String __fastcall TMainForm::createBlockLabel()
{
    String lbl;
    String specie = atdbDM->specimenCDS->FieldByName("Lspecie")->AsString;
	if(specie == "Human")
    {
    	lbl = "H";
    }
    else if(specie == "Mouse")
    {
    	lbl = "M";
    }
    else if(specie == "Human Surgical")
    {
    	lbl = "HS";
    }

	lbl = lbl + atdbDM->specimenCDS->FieldByName("specimen_id")->AsString + "-" + (atdbDM->blocksCDS->RecordCount + 1);

	return lbl;
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::RibbonsNavigatorClick(TObject *Sender, TNavigateBtn Button)
{
	switch(Button)
    {
    	case TNavigateBtn::nbDelete:        break;

    	case TNavigateBtn::nbInsert:
        {
	        atdbDM->mRibbonCDS->FieldByName("id")->Value 		= getUUID().c_str();
	        atdbDM->mRibbonCDS->FieldByName("block_id")->Value 	= atdbDM->blocksCDS->FieldByName("id")->Value;
            atdbDM->mRibbonCDS->Post();
			atdbDM->mRibbonCDS->First();
        }
        break;
        case TNavigateBtn::nbPost:
        break;
        case TNavigateBtn::nbRefresh:
        	Log(lInfo) << "Refreshed Ribbons Dataset";
 		break;
    }
}
void __fastcall	TMainForm::afterServerConnect(System::TObject* Sender)
{
	atdbDM->afterConnect();

    mATDBServerBtnConnect->Caption = "Disconnect";
    TTableFrame1->assignDBconnection(atdbDM->SQLConnection1);

	populateUsersCB();
}

void __fastcall	TMainForm::afterServerDisconnect(System::TObject* Sender)
{
	mUsersCB->Enabled = false;
	atdbDM->afterDisConnect();
    mATDBServerBtnConnect->Caption = "Connect";
}

void TMainForm::populateUsersCB()
{
    //Populate users CB
    TSQLQuery* q = new TSQLQuery(NULL);
    q->SQLConnection = atdbDM->SQLConnection1;
    q->SQL->Add("SELECT id,user_name from user ORDER by user_name");
    q->Open();

	mUsersCB->Clear();
	while(!q->Eof)
    {
	    String s = (*q)["user_name"];
        int *id = new int((*q)["id"]);
	    mUsersCB->Items->AddObject(s, (TObject*) id);
	   	q->Next();
    }

    //select current user
    for(int i = 0; i < mUsersCB->Items->Count; i++)
    {
    	int uid = *(int*) mUsersCB->Items->Objects[i];
        if(uid == mDBUserID.getValue())
        {
			mUsersCB->ItemIndex = i;
            break;
        }
    }

	mUsersCB->Enabled = true;
}

void __fastcall TMainForm::mATDBServerBtnConnectClick(TObject *Sender)
{
	if(atdbDM->SQLConnection1->Connected)
    {
	    atdbDM->SQLConnection1->Connected = false;
	    atdbDM->SQLConnection1->Close();
    }
    else
    {
	    atdbDM->connect(mServerIPE->getValue(), mDBUserE->getValue(), mPasswordE->getValue(), mDatabaseE->getValue());
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mBlocksGridDblClick(TObject *Sender)
{
	//Edit Block Record
    MessageDlg("Edit Block Record", mtWarning, TMsgDlgButtons() << mbOK, 0);
//	int bID = mBlocksGrid->DataSource->DataSet->FieldByName("id")->AsInteger;
}

void __fastcall TMainForm::mUpdateNoteBtnClick(TObject *Sender)
{
	atdbDM->blockNotesCDS->Post();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mUsersCBCloseUp(TObject *Sender)
{
	if(mUsersCB->ItemIndex == -1)
    {
    	enableDisableGroupBox(mBlocksGB, false);
    }
    else
    {
    	enableDisableGroupBox(mBlocksGB, true);
		mDBUserID = *(int*) (mUsersCB->Items->Objects[mUsersCB->ItemIndex]);
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::DBNavigator5Click(TObject *Sender, TNavigateBtn Button)
{
	switch(Button)
    {
    	case TNavigateBtn::nbInsert:
			{
                int uID = atdbDM->usersCDS->FieldByName("id")->AsInteger;
                int blockID = atdbDM->blocksCDSid->Value;
                string note("Block Note..");

                try
                {
                    mServerDBSession.addNoteForBlock(blockID, uID, note);
                }
                catch(...)
                {
                    handleMySQLException();
                }

                atdbDM->blockNotesCDS->Refresh();
                atdbDM->blockNotesCDS->Last();
            }
        break;

    	case TNavigateBtn::nbDelete:        break;
    }
}

void __fastcall TMainForm::DBNavigator6Click(TObject *Sender, TNavigateBtn Button)
{
	switch(Button)
    {
    	case TNavigateBtn::nbInsert:
			{
            int uID = atdbDM->usersCDS->FieldByName("id")->AsInteger;
            String rID = atdbDM->mRibbonCDSid->Value;
            string note("Ribbon Note..");

            try
            {
                mServerDBSession.addNoteForRibbon(stdstr(rID), uID, note);
            }
            catch(...)
            {
                handleMySQLException();
            }

            atdbDM->ribbonNotesCDS->Refresh();
            atdbDM->ribbonNotesCDS->Last();
            }
        break;

    	case TNavigateBtn::nbDelete:        break;
    }
}

void __fastcall TMainForm::DBGrid2DrawDataCell(TObject *Sender, const TRect &Rect,
          TField *Field, TGridDrawState State)
{
  	if (Field->DataType == ftMemo)
  	{
     	String S = Field->AsString;
      	DBGrid2->Canvas->Pen->Color = clWindow;
      	DBGrid2->Canvas->Brush->Color = clWindow;
      	DBGrid2->Canvas->Rectangle(Rect);
      	DBGrid2->Canvas->TextOut(Rect.Left, Rect.Top, S);
	}
}
//---------------------------------------------------------------------------


void __fastcall TMainForm::mUsersDBGridDrawDataCell(TObject *Sender, const TRect &Rect,
          TField *Field, TGridDrawState State)
{
	Log(lInfo) << "Drawing...";
}
//---------------------------------------------------------------------------


void __fastcall TMainForm::DBGrid2DrawColumnCell(TObject *Sender, const TRect &Rect,
          int DataCol, TColumn *Column, TGridDrawState State)
{

    if (Column->Field->DataType == ftMemo)
    {
		DBGrid2->Canvas->FillRect (Rect);
		DBGrid2->Canvas->TextOut( Rect.Left + 3, Rect.Top + 3,
              Column->Field->AsString);
    }
    else
    {

    }
}

void __fastcall TMainForm::TTableFrame1DBNavigator1Click(TObject *Sender, TNavigateBtn Button)
{
	switch(Button)
    {
		case TNavigateBtn::nbPost:
        	atdbDM->specimenCDS->Refresh();
            DBGrid2->Enabled = false;
			DBGrid2->Enabled = true;
        break;

    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mTablesLBClick(TObject *Sender)
{
	if(mTablesLB->ItemIndex != -1)
    {
		String tbl = mTablesLB->Items->Strings[mTablesLB->ItemIndex];
		TTableFrame1->loadTable(stdstr(tbl));
    }
    else
    {}
}

void __fastcall TMainForm::Button1Click(TObject *Sender)
{
//	TPrinter *pr = Printer();
//	TFont *Font1 = new TFont();
//	Font1->Name = "Times New Roman";
//	Font1->Size = 4;
//    pr->BeginDoc();
//	TBarcodeTextDefine TextDefine;
//    TextDefine.DisplayText = dtBarcode;
//	TextDefine.TextPosition = tpBottomOut;
//	TextDefine.TextAlignment = taJustify;
//	TextDefine.TextFont = Font1;
//	TextDefine.ExtraFontSize = 9;
//
////    TextDefine->
//	Barcode1D_Code391->Print(10, 10, Barcode1D_Code391->Barcode, true, clBlack, clWhite, TextDefine, 2, 0.3, 20, 10.1, 0);
//    pr->EndDoc();


	TPrinter *Prntr = Printer();
	TRect r = Rect(200, 200, Prntr->PageWidth - 200, Prntr->PageHeight - 200);
	Prntr->BeginDoc();
	for (int i = 0; i < Memo1->Lines->Count; i++)
    {
		Prntr->Canvas->TextOut(200,
			200 + (i * Prntr->Canvas->TextHeight(Memo1->Lines->Strings[i])),
			Memo1->Lines->Strings[i]);
    }

	Prntr->Canvas->Brush->Color = clBlack;
	Prntr->Canvas->FrameRect(r);
	Prntr->EndDoc();



}

void __fastcall TMainForm::DBNavigator3Click(TObject *Sender, TNavigateBtn Button)
{
	switch(Button)
    {
    	case TNavigateBtn::nbInsert:
        	if(mUsersCB->ItemIndex != -1)
            {
                atdbDM->specimenCDS->FieldValues["specimen_id"] = "NEW SPECIMEN";
            	//Open New specimen dialog
				TNewSpecimenForm* nsf = new TNewSpecimenForm(this);
                int res = nsf->ShowModal();
                if(res == mrCancel)
                {
                	//revert
                    atdbDM->specimenCDS->Cancel();

                }
                else
                {
	//	            int* userID = (int*) mUsersCB->Items->Objects[mUsersCB->ItemIndex];

	                atdbDM->specimenCDS->Post();
			    	atdbDM->specimenCDS->First();
                }
            }
            else
            {
            	MessageDlg("Select a user before inserting new data ", mtInformation, TMsgDlgButtons() << mbOK, 0);
            }
        break;
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::DBGrid3KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)
{
	selectBlocks();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::DBGrid3CellClick(TColumn *Column)
{
	selectBlocks();
}

void __fastcall TMainForm::selectBlocks()
{
	//Retrieve selected id and apply filter on blocks table
    atdbDM->blocksCDS->Close();
  	if(DBGrid3->SelectedRows->Count > 0)
    {
    	vector<int> p_ids;
    	stringstream s;
      	for(int i = 0; i < DBGrid3->SelectedRows->Count; i++)
    	{
    		TBookmarkList* bookMarkList = DBGrid3->SelectedRows;

            if(bookMarkList->Count == DBGrid3->SelectedRows->Count)
            {
        		atdbDM->specimenCDS->GotoBookmark((*bookMarkList)[i]);
                int pID = atdbDM->specimenCDS->FieldByName("process_id")->AsInteger;
				p_ids.push_back(pID);
		        s << pID <<",";
            }
        }

        s.str("");
        s << "SELECT * FROM block WHERE process_id IN (";

        for(int i = 0; i < p_ids.size(); i++)
        {
			s << p_ids[i];
            if(i < p_ids.size() - 1)
            {
            	s << ", ";
            }
        }
        s << ")";
		atdbDM->blocksCDS->CommandText = s.str().c_str();
        Log(lDebug) << "Selected: "<<s.str();
    }
    else
    {
        atdbDM->blocksCDS->CommandText = "SELECT * FROM block WHERE process_id = :process_id ORDER BY id DESC";
    }
    atdbDM->blocksCDS->Open();
}


