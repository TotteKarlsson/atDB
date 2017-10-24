#include <vcl.h>
#pragma hdrstop
#include "Package/atdbVCLUtils.h"
#include "atVCLUtils.h"
#include "database/atDBUtils.h"
#include "mtkLogger.h"
#include "mtkMoleculixException.h"
#include "database/mtkSQLiteException.h"
#include "mtkStringUtils.h"
#include "mtkUtils.h"
#include "mtkVCLUtils.h"
#include "Poco/DateTime.h"
#include "Poco/DateTimeFormat.h"
#include "Poco/DateTimeFormatter.h"
#include "Poco/Glob.h"
#include "Poco/Timezone.h"
#include "TATDBDataModule.h"
#include "TCoverSlipDataModule.h"
#include "TImagesDataModule.h"
#include "TMainForm.h"
#include "TMemoLogger.h"
#include "TShowFileContentForm.h"
#include "TTableUpdateForm.h"
#include "TRegisterFreshCSBatchForm.h"
#include "TPrintLabelForm.h"
#include "atQueryBuilder.h"
#include "vcl/forms/TTextInputDialog.h"
#include "TATDBDataModule.h"
#include "TATDBImagesAndMoviesDataModule.h"
#include "TCoverSlipDataModule.h"
#include "forms/TStringInputDialog.h"
#include "TSpecimenForm.h"
#include "TSlicesForm.h"
#include "TBlockForm.h"
#include "Poco/Path.h"
#include "Poco/File.h"
#include "frames/TMovieItemFrame.h"
#include <JPEG.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "mtkIniFileC"
#pragma link "TIntegerLabeledEdit"
#pragma link "TArrayBotBtn"
#pragma link "TTableFrame"
#pragma link "TIntLabel"
#pragma link "TFloatLabeledEdit"
#pragma link "TSTDStringEdit"
#pragma link "TImagesFrame"
#pragma link "TMoviesFrame"
#pragma resource "*.dfm"

TMainForm *MainForm;
using namespace mtk;
using namespace at;

extern string gLogFileName;
extern string gApplicationRegistryRoot;
extern string gDefaultAppTheme;
extern string gFullDateTimeFormat;
extern bool gIsDevelopmentRelease;
//extern TSplashForm*  gSplashForm;

//using Poco::Path;
//---------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent* Owner)
    : TRegistryForm(gApplicationRegistryRoot, "MainForm", Owner),

    mBottomPanelHeight(205),
    mMainTabIndex(0),
	mDustAssayResultImageHeight(100),
    mDustAssayBackGroundImageWidth(100),
    mSplashProperties(gApplicationRegistryRoot, "Splash"),
    mShowSplashOnStartup(true),
    mLogLevel(lAny),
    mIsStyleMenuPopulated(false),
    gCanClose(true),
    logMsgMethod(&logMsg),
    mLogFileReader(joinPath(getSpecialFolder(CSIDL_LOCAL_APPDATA), "atDB", gLogFileName), logMsgMethod),
	mServerDBSession("", "", "" ,""),
    mDBUserID(0),
	BatchesGBHeight(250),
    mTableUnlockPassword("")
{
    //Close any dataconnection created by stupid TSQLConnection
    mTempFileFolder = joinPath(getSpecialFolder(CSIDL_LOCAL_APPDATA), "atDB");
    TMemoLogger::mMemoIsEnabled = false;
    setupIniFile();
    setupAndReadIniParameters();

    //Add grids to db grids container for reading/saving column states
    mDBGrids.push_back(mProcessForBlocksGrid);
    mDBGrids.push_back(BlocksGrid);
    mDBGrids.push_back(mBlockNotesGrid);
	mDBGrids.push_back(mBlocksForRibbonsGrid);
    mDBGrids.push_back(mRibbonsGrid);
    mDBGrids.push_back(mRibbonNotesGrid);
    mDBGrids.push_back(mUsersDBGrid);
	mDBGrids.push_back(SlicesGrid);
}

void __fastcall	TMainForm::afterServerConnect(System::TObject* Sender)
{
	//Enable datamodules
	atdbDM->afterConnect();
    csDM->afterConnect();
    ImagesAndMoviesDM->afterConnect();

    UsersCB->KeyValue = mDBUserID.getValue();
    UsersCB->Enabled = true;
    mATDBServerBtnConnect->Caption = "Disconnect";
    TTableFrame1->assignDBconnection(atdbDM->SQLConnection1);
}

//---------------------------------------------------------------------------
void __fastcall	TMainForm::afterServerDisconnect(System::TObject* Sender)
{
	atdbDM->afterDisConnect();
    mATDBServerBtnConnect->Caption = "Connect";
    UsersCB->Enabled = false;

}

//This one is called from the reader thread
void __fastcall TMainForm::logMsg()
{
    infoMemo->Lines->Add(vclstr(mLogFileReader.getData()));
    mLogFileReader.purge();
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

//---------------------------------------------------------------------------
void __fastcall TMainForm::mUsersNavigatorClick(TObject *Sender, TNavigateBtn Button)
{
	switch(Button)
    {
    	case TNavigateBtn::nbInsert:
        	atdbDM->usersCDS->FieldValues["user_name"] = "New User";
        break;
        case TNavigateBtn::nbApplyUpdates:  break;
        case TNavigateBtn::nbRefresh:

        break;
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mBlockNoteNavigatorClick(TObject *Sender, TNavigateBtn Button)
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

//---------------------------------------------------------------------------
void __fastcall TMainForm::mRibbonNotesNavigatorClick(TObject *Sender, TNavigateBtn Button)
{
	switch(Button)
    {
    	case TNavigateBtn::nbInsert:
        {
            int uID = getCurrentUserID();
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

//---------------------------------------------------------------------------
void __fastcall TMainForm::cdDustAssayNavigatorBeforeAction(TObject *Sender,
          TNavigateBtn Button)
{
	TDBNavigator* nav = dynamic_cast<TDBNavigator*>(Sender);
    if(nav == CSNavigator)
    {
        switch(Button)
        {
        }
    }
    else if(nav == cdDustAssayNavigator)
    {
        switch(Button)
        {

            case TNavigateBtn::nbDelete:
            {
            	//Remove assay image files
                if(!csDM->csDustAssayCDS->FieldByName("background_image")->IsNull )
                {
                	string f = stdstr(csDM->csDustAssayCDS->FieldByName("background_image")->AsString);
                    if(removeAssayFile(f))
                    {
                    	Log(lInfo) << "Removed file: "<<f;
                    }
                }

                if(!csDM->csDustAssayCDS->FieldByName("coverslip_image")->IsNull)
                {
                	string f = stdstr(csDM->csDustAssayCDS->FieldByName("coverslip_image")->AsString);
                    if(removeAssayFile(f))
                    {
                    	Log(lInfo) << "Removed file: "<<f;
                    }
                }
                if(!csDM->csDustAssayCDS->FieldByName("result_image")->IsNull)
                {
                	string f = stdstr(csDM->csDustAssayCDS->FieldByName("result_image")->AsString);
                    if(removeAssayFile(f))
                    {
                    	Log(lInfo) << "Removed file: "<<f;
                    }
                }
            }
            break;
        }
    }
}


//---------------------------------------------------------------------------
void __fastcall TMainForm::CoverSlipNavigatorsClick(TObject *Sender, TNavigateBtn Button)
{
	TDBNavigator* nav = dynamic_cast<TDBNavigator*>(Sender);
    if(nav == CSNavigator)
    {
        switch(Button)
        {
            case TNavigateBtn::nbInsert:
                    csDM->csCDS->FieldValues["status"] 	= 1;
                    csDM->csCDS->FieldValues["type"] 	= 1;
                    csDM->csCDS->Post();
                    csDM->csCDS->First();
            break;
        }
    }
    else if(nav == cdDustAssayNavigator)
    {
        switch(Button)
        {
            case TNavigateBtn::nbInsert:
                csDM->csDustAssayCDS->FieldValues["coverslip_id"] 		= csDM->csCDS->FieldByName("id")->AsInteger;
                csDM->csDustAssayCDS->FieldValues["coverslip_status"] 	= csDM->csCDS->FieldByName("status")->AsInteger;
                csDM->csDustAssayCDS->Post();
                csDM->csDustAssayCDS->First();
            break;

            case TNavigateBtn::nbDelete:
            {

            }
            break;
        }
    }
    else if(nav == CSFreshBatchNavigator)
    {
		csDM->csCDS->Refresh();
    }
}

//---------------------------------------------------------------------------
bool TMainForm::removeAssayFile(const string& f)
{
	//Create full path and check if exists before removing
    StringList path(f, '-');
	string imagePath;
    if(path.count() > 1)
    {
    	imagePath = joinPath(mDustAssayImageFolderE->getValue(), path[0] + path[1]);
    }
    else
    {
    	Log(lError) << "The image path for image: "<<f<<" is not correct";
       	Log(lError) << "Can't delete image";
        return false;
    }

	if(!folderExists(imagePath))
    {
		Log(lError) << "The image path: "<<imagePath<<" does not exist";
        return false;
    }

    string imFName = joinPath(imagePath, f);

    if(fileExists(imFName))
    {
		return removeFile(imFName);
    }
    else
    {
		Log(lError) << "The image "<<imFName<<" does not exist!";
		return false;
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mBlocksNavigatorClick(TObject *Sender, TNavigateBtn Button)
{
	switch(Button)
    {
    	case TNavigateBtn::nbDelete:        break;

    	case TNavigateBtn::nbInsert:

           	if(UsersCB->KeyValue != -1)
            {
                    TDateTime dt;
                    dt = Now();

                    atdbDM->blocksCDS->FieldByName("entered_by")->Value             = UsersCB->KeyValue;
                    atdbDM->blocksCDS->FieldByName("entered_on")->Value             = dt.CurrentDate();
		        	atdbDM->blocksCDS->FieldValues["slice_id"] 			            = atdbDM->slicesCDS->FieldByName("id")->AsInteger;
		        	atdbDM->blocksCDS->FieldValues["serial"] 	 		            = atdbDM->blocksCDS->RecordCount + 1;
		        	atdbDM->blocksCDS->FieldByName("date_embedded")->Value 			= dt.CurrentDate();

                    if(atdbDM->blocksCDS->RecordCount < 1)
                    {
                        atdbDM->blocksCDS->FieldValues["status"] 	 					= 0;
                        atdbDM->blocksCDS->FieldValues["cryoprotection_protocol"]  		= 0;
                        atdbDM->blocksCDS->FieldValues["freezing_protocol"] 	 		= 0;
                        atdbDM->blocksCDS->FieldValues["substitution_protocol"]    		= 0;
                        atdbDM->blocksCDS->FieldValues["infiltration_protocol"]    		= 0;
                        atdbDM->blocksCDS->FieldValues["embedding_protocol"]    		= 0;
                    }
                    else
                    {
                    	//Clone the cursor
						TClientDataSet *clone = new TClientDataSet(NULL);
                        clone->CloneCursor(atdbDM->blocksCDS, false, false);
                        clone->Last();
                        atdbDM->blocksCDS->FieldValues["status"] 	 					= clone->FieldByName("status")->Value;
                        atdbDM->blocksCDS->FieldValues["cryoprotection_protocol"]  		= clone->FieldByName("cryoprotection_protocol")->Value;
                        atdbDM->blocksCDS->FieldValues["freezing_protocol"] 	 		= clone->FieldByName("freezing_protocol")->Value;
                        atdbDM->blocksCDS->FieldValues["substitution_protocol"]    		= clone->FieldByName("substitution_protocol")->Value;
                        atdbDM->blocksCDS->FieldValues["infiltration_protocol"]    		= clone->FieldByName("infiltration_protocol")->Value;
                        atdbDM->blocksCDS->FieldValues["embedding_protocol"]    		= clone->FieldByName("embedding_protocol")->Value;
                        clone->Close();
                        delete clone;
                    }

                    //Open form
                    openBlocksForm();
            }
            else
            {
            	MessageDlg("Select a user before inserting new data ", mtInformation, TMsgDlgButtons() << mbOK, 0);
            }

        break;
        case TNavigateBtn::nbPost:        		break;
        case TNavigateBtn::nbRefresh:        	Log(lInfo) << "Refreshed Blocks Dataset"; 		break;
    }
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

void __fastcall TMainForm::SlicesNavigatorClick(TObject *Sender, TNavigateBtn Button)
{
	switch(Button)
    {
    	case TNavigateBtn::nbInsert:
        	if(UsersCB->KeyValue != -1)
            {
                atdbDM->slicesCDS->FieldByName("specimen_id")->Value = atdbDM->specimenCDS->FieldByName("id")->Value;
                atdbDM->slicesCDS->FieldByName("entered_by")->Value = UsersCB->KeyValue;

                if(SpecieRG->ItemIndex != -1)
                {
                    string specie = stdstr(SpecieRG->Items->Strings[SpecieRG->ItemIndex]);
                    //atdbDM->slices->FieldByName("specie")->Value = atdbDM->getIDForSpecie(specie);
                }

                TDateTime dt;
                dt = Now();
                //atdbDM->slices->FieldByName("intake_date")->Value = dt.CurrentDate();

                //Open new specimen form
                openSlicesForm();
            }
            else
            {
            	MessageDlg("Select a user before inserting new data ", mtInformation, TMsgDlgButtons() << mbOK, 0);
            }
        break;

       	case TNavigateBtn::nbRefresh:
        break;
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::SpecimenNavigatorClick(TObject *Sender, TNavigateBtn Button)
{
	switch(Button)
    {
    	case TNavigateBtn::nbInsert:
        	if(UsersCB->KeyValue != -1)
            {

                atdbDM->specimenCDS->FieldByName("animal_id")->Value = "XXXX-XX";
                atdbDM->specimenCDS->FieldByName("entered_by")->Value = UsersCB->KeyValue;

                if(SpecieRG->ItemIndex != -1)
                {
                    string specie = stdstr(SpecieRG->Items->Strings[SpecieRG->ItemIndex]);
                    atdbDM->specimenCDS->FieldByName("specie")->Value = atdbDM->getIDForSpecie(specie);
                }

                TDateTime dt;
                dt = Now();
                atdbDM->specimenCDS->FieldByName("intake_date")->Value = dt.CurrentDate();

                //Open new specimen form
                openSpecimenForm();

            }
            else
            {
            	MessageDlg("Please select a user before inserting new data ", mtInformation, TMsgDlgButtons() << mbOK, 0);
            }
        break;


    	case TNavigateBtn::nbApplyUpdates:
        	try
            {
            	Log(lWarning) << "About to delete a row";
            }
            catch(...)
            {

            }
        break;
    }
}

void __fastcall TMainForm::SpecimenNavigatorBeforeAction(TObject *Sender, TNavigateBtn Button)

{
	try
    {
           	Log(lWarning) << "About to delete a specimen";
    }
    catch(...)
    {

    }
}

void __fastcall TMainForm::DBGridDblClick(TObject *Sender)
{
    TDBGrid* g = dynamic_cast<TDBGrid*>(Sender);
    if(g == SpecimenGrid)
    {
    	openSpecimenForm();
    }
    else if(g == SlicesGrid)
    {
    	openSlicesForm();
    }
}

void __fastcall TMainForm::openSpecimenForm()
{
	//Open the currently seleceted record in the form
    TSpecimenForm* f = new TSpecimenForm(this);
    int res = f->ShowModal();

    if(res != mrCancel)
    {
        atdbDM->specimenCDS->Post();
        atdbDM->specimenCDS->First();
    }
    else
    {
		atdbDM->specimenCDS->Cancel();
    }
}

void __fastcall TMainForm::openSlicesForm()
{
	//Open the currently seleceted record in the form
    TSlicesForm* f = new TSlicesForm(this);
    int res = f->ShowModal();

    if(res != mrCancel)
    {
        atdbDM->slicesCDS->Post();
        atdbDM->slicesCDS->First();
    }
    else
    {
		atdbDM->slicesCDS->Cancel();
    }
}

//---------------------------------------------------------------------------
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
void __fastcall TMainForm::mATDBServerBtnConnectClick(TObject *Sender)
{
	if(atdbDM->SQLConnection1->Connected)
    {
    	//Remove runtime indices
    	TClientDataSet* cds = atdbDM->specimenCDS;
	    cds->IndexDefs->Update();
        for(int i = 0; i <cds->IndexDefs->Count; i++)
        {
            String idxName = cds->IndexDefs->operator [](i)->Name;
            Log(lDebug) <<"Removing index: "<< stdstr(idxName);
            if(idxName != "DEFAULT_ORDER" && idxName != "CHANGEINDEX")
            {
                cds->DeleteIndex(idxName);
            }
        }

	    atdbDM->SQLConnection1->Connected = false;
	    atdbDM->SQLConnection1->Close();
    }
    else
    {
	    atdbDM->connect(mServerIPE->getValue(), mDBUserE->getValue(), mPasswordE->getValue(), mDatabaseE->getValue());
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mUpdateNoteBtnClick(TObject *Sender)
{
	atdbDM->blockNotesCDS->Post();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::UsersCBCloseUp(TObject *Sender)
{
	if(UsersCB->KeyValue == -1)
    {
    	enableDisableGroupBox(mBlocksGB, false);
    }
    else
    {
    	enableDisableGroupBox(mBlocksGB, true);
		mDBUserID = UsersCB->KeyValue;
    }
}

void __fastcall TMainForm::SlicesGridDrawDataCell(TObject *Sender, const TRect &Rect,
          TField *Field, TGridDrawState State)
{
  	if (Field->DataType == ftMemo)
  	{
     	String S = Field->AsString;
      	SlicesGrid->Canvas->Pen->Color = clWindow;
      	SlicesGrid->Canvas->Brush->Color = clWindow;
      	SlicesGrid->Canvas->Rectangle(Rect);
      	SlicesGrid->Canvas->TextOut(Rect.Left, Rect.Top, S);
	}
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::SlicesGridDrawColumnCell(TObject *Sender, const TRect &Rect,
          int DataCol, TColumn *Column, TGridDrawState State)
{
//    if (Column->Field->DataType == ftMemo)
//    {
//		SlicesDBGrid->Canvas->FillRect (Rect);
//		SlicesDBGrid->Canvas->TextOut( Rect.Left + 3, Rect.Top + 3,
//              Column->Field->AsString);
//    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mTablesLBClick(TObject *Sender)
{
	if(mTablesLB->ItemIndex != -1)
    {
		String tbl = mTablesLB->Items->Strings[mTablesLB->ItemIndex];
		TTableFrame1->loadTable(stdstr(tbl));
        TTableFrame1->lock();
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::Button1Click(TObject *Sender)
{

	int mr = MessageDlg("This will print using the default printer on your system (beta).", mtInformation, TMsgDlgButtons() << mbOK<<mbCancel, 0);
    if(mr == mrCancel)
    {
		return;
    }
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
//	TRect r = Rect(200, 200, Prntr->PageWidth - 200, Prntr->PageHeight - 200);
	Prntr->BeginDoc();
    Prntr->Canvas->Font->Name = "Times New Roman";
    Prntr->Canvas->Font->Size = 4;

	for(int i = 0; i < mLblMakerMemo->Lines->Count; i++)
    {
    	int lineHeight = (i * Prntr->Canvas->TextHeight(mLblMakerMemo->Lines->Strings[i]));
		Prntr->Canvas->TextOut(200, 200 + lineHeight, mLblMakerMemo->Lines->Strings[i]);
    }

//	Prntr->Canvas->Brush->Color = clBlack;
//	Prntr->Canvas->FrameRect(r);
	Prntr->EndDoc();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mProcessForBlocksGridKeyUp(TObject *Sender, WORD &Key, TShiftState Shift)
{
	selectBlocks();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mProcessForBlocksGridCellClick(TColumn *Column)
{
	selectBlocks();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::selectBlocks()
{
//	//Retrieve selected id and apply filter on blocks table
//    atdbDM->blocksCDS->Close();
//  	if(mProcessForBlocksGrid->SelectedRows->Count > 0)
//    {
//       	vector<int> p_ids = getSelectedIDS(mProcessForBlocksGrid, "specimen_id");
//    	stringstream s;
//        s << "SELECT * FROM blocks WHERE specimen_id IN (";
//
//        for(int i = 0; i < p_ids.size(); i++)
//        {
//			s << p_ids[i];
//            if(i < p_ids.size() - 1)
//            {
//            	s << ", ";
//            }
//        }
//        s << ")";
//		atdbDM->blocksCDS->CommandText = s.str().c_str();
//        Log(lDebug) << "Selected: "<<s.str();
//    }
//    else
//    {
//        atdbDM->blocksCDS->CommandText = "SELECT * FROM blocks WHERE specimen_id = :specimen_id ORDER BY id DESC";
//    }
//    atdbDM->blocksCDS->Open();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::PageControl2Change(TObject *Sender)
{
	//If we are opening the Ribbons page, sett blocks query to select all blocks
   	if(PageControl2->TabIndex == 2)
    {
//        atdbDM->blocksCDS->Close();
//        atdbDM->blocksCDS->CommandText = "SELECT * FROM blocks ORDER BY id DESC";
//        atdbDM->blocksCDS->Open();
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mAddDocBtnClick(TObject *Sender)
{
//	//Browse for file
//	string filename = browseForFile();
//
//    if(filename.size())
//    {
//    	Log(lInfo) << "Adding document: "<<filename<<" to documents table";
//
//        string fName(getFileNameNoPath(filename));
//        string fExt(getFileExtension(filename));
//
//        if(!fName.size())
//        {
//        	MessageDlg("Something is wrong with this documents filename and or extension!", mtWarning, TMsgDlgButtons() << mbOK, 0);
//        	return;
//        }
//
//        ifstream ifs(filename.c_str(), ios::binary|ios::ate);
//    	ifstream::pos_type pos = ifs.tellg();
//
//	    std::vector<char> result(pos);
//    	ifs.seekg(0, ios::beg);
//	    ifs.read(&result[0], pos);
//
//		TSQLQuery* q = new TSQLQuery(NULL);
//        q->SQLConnection = atdbDM->SQLConnection1;
//    	stringstream s;
//
//        q->SQL->Add("INSERT INTO documents ");
//        q->SQL->Add("(document_name, document, type) VALUES  ");
//		q->SQL->Add("( :dname, :doc, :type )");
//        q->ParamByName("dname")->Value = getFileNameNoExtension(fName).c_str();
//
//        TByteDynArray bytes;
//        bytes.Length = result.size();
//        for(int i = 0; i < result.size(); i++)
//        {
//        	bytes[i] = result[i];
//        }
//
//        q->ParamByName("doc")->AsBlob = bytes;
//		q->ParamByName("type")->Value = fExt.c_str();
//        q->ExecSQL();
//        delete q;
//       	atdbDM->documentsCDS->ApplyUpdates(0);
//    }
//	atdbDM->documentsCDS->Refresh();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::SlicesDBGridDblClick(TObject *Sender)
{
//	//Show current record on a form
//    TNewSpecimenForm* nsf = new TNewSpecimenForm(this);
//    atdbDM->specimenCDS->Open();
//    atdbDM->specimenCDS->Edit();
//    atdbDM->substitutionProtocol->Open();
//	atdbDM->substitutionProtocol->Edit();
//    int res = nsf->ShowModal();
//    if(res == mrCancel)
//    {
//        //revert
//        atdbDM->specimenCDS->Cancel();
//    }
//    else
//    {
//        atdbDM->specimenCDS->Post();
//        atdbDM->specimenCDS->First();
//    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::SlicesGridMouseDown(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y)
{
	if(Button == TMouseButton::mbRight)
    {
    	TGridCoord c = SlicesGrid->MouseCoord(X,Y);
        if(c.X > -1 && c.Y > -1)
        {
			TField* field =  SlicesGrid->Columns->operator [](c.X)->Field;
			SpecimenPopup->Popup(X,Y);
        }
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::BlocksGridKeyUp(TObject *Sender, WORD &Key, TShiftState Shift)
{
	//When selecting multiple blocks, prepare Memo for block text output
	createBlockLabels();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::createBlockLabels()
{
	mLblMakerMemo->Clear();
  	stringstream s;
  	if(BlocksGrid->SelectedRows->Count > 0)
    {
      	for(int i = 0; i < BlocksGrid->SelectedRows->Count; i++)
    	{
    		TBookmarkList* bookMarkList = BlocksGrid->SelectedRows;
            if(bookMarkList->Count == BlocksGrid->SelectedRows->Count)
            {
        		atdbDM->blocksCDS->GotoBookmark((*bookMarkList)[i]);
                String str = atdbDM->blocksCDS->FieldByName("Cblock_label")->AsString;
		        s << stdstr(str);
                if(i < BlocksGrid->SelectedRows->Count -1)
                {
					s<<"\n";
                }
            }
        }

        StringList l(s.str(), '\n');
		mLblMakerMemo->Clear();
        for(int i = 0; i < l.count(); i++)
        {
			mLblMakerMemo->Lines->Add(vclstr(l[i]));
        }
    }
    else
    {
        String str = atdbDM->blocksCDS->FieldByName("Cblock_label")->AsString;
		s << stdstr(str);

        StringList l(s.str(), '\n');
		mLblMakerMemo->Clear();
        for(int i = 0; i < l.count(); i++)
        {
			mLblMakerMemo->Lines->Add(vclstr(l[i]));
        }
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::BlocksGridCellClick(TColumn *Column)
{
	createBlockLabels();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::SlicesGridMouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y)
{
	TGridCoord pt = SlicesGrid->MouseCoord(X,Y);
	SlicesGrid->Cursor = (pt.Y == 0) ? crHandPoint : crDefault;
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::SlicesGridTitleClick(TColumn *Column)
{
	TField* field =  Column->Field;
	static int PreviousColumnIndex = -1;
	if(SlicesGrid->DataSource->DataSet == atdbDM->specimenCDS && PreviousColumnIndex != -1)
    {
    	TColumn* prevCol = SlicesGrid->Columns->Items[PreviousColumnIndex];
        if(prevCol)
        {
	 		prevCol->Title->Font->Style = TFontStyles();
        }
    }

	Column->Title->Font->Style =  TFontStyles() <<  fsBold;
	PreviousColumnIndex = Column->Index;

    String fieldName;
	TField* Field = atdbDM->specimenCDS->Fields->FindField(Column->FieldName);
    if(Field)
    {
    	if(Field->FieldKind == fkLookup)
        {
        	fieldName = Field->KeyFields;
        }
        else
        {
        	fieldName = Column->FieldName;
        }
    }
	SortClientDataSet(atdbDM->specimenCDS, fieldName);
}


//---------------------------------------------------------------------------
void __fastcall TMainForm::mPrintTestLabelBtnClick(TObject *Sender)
{
   	TSCLIB lblPrinter;

    if(!lblPrinter.load("TSCLIB.dll"))
    {
    	Log(lError) << "Failed to load mTSC library..";
        return;
    }

    stringstream lbl;
    lbl <<mTestLabel->getValue();
    Log(lInfo) << "Printing label: "<<lbl.str();


    BarcodePrintParameters p;
    p.command = stdlines(mBarCodeCommandMemo->Lines);
    lblPrinter.printCoverSlipLabel(p, lbl.str(), 1);
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::onDustAssayDataChanged(TObject *Sender)
{
	Log(lInfo) << "Loading new Dust Assay Dataset";
    loadImage(stdstr(mIm1FName->Caption), mBackgroundImage);
    loadImage(stdstr(mIm2FName->Caption), mCoverslipImage);
    loadImage(stdstr(mIm3FName->Caption), mResultImage);
}

//---------------------------------------------------------------------------
bool TMainForm::loadImage(const string& fName, TImage* img)
{
	//Extract image folder from DB fName
    //Folder is baseFolder + yearmonth
    StringList path(fName, '-');
	string imagePath;
    if(path.count() > 1)
    {
    	imagePath = joinPath(mDustAssayImageFolderE->getValue(), path[0] + path[1]);
    }
    else
    {
    	Log(lError) << "The image path for image: "<<fName<<" is not correct";
       	Log(lError) << "Can't open image";
        return false;
    }

	if(!folderExists(imagePath))
    {
		Log(lError) << "The image path: "<<imagePath<<" does not exist";
        return false;
    }

    string imFName = joinPath(imagePath, fName);

    if(fileExists(imFName))
    {
    	img->Picture->LoadFromFile(vclstr(imFName));
    }
    else
    {
		Log(lError) << "The image "<<imFName<<" does not exist!";
		img->Picture = NULL;
    }
    return img->Picture->Graphic;
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mBrowseForDustAssayImageFolderClick(TObject *Sender)
{
	string folder = browseForFolder();

    if(folder.size())
    {
    	mDustAssayImageFolderE->setValue(folder);
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mRegisterFreshBatchBtnClick(TObject *Sender)
{
	//Open Register batch form
    TRegisterFreshCSBatchForm* f = new TRegisterFreshCSBatchForm(this);
    f->ShowModal();
    delete f;

	selectCoverSlips(mFreshBatchesGrid, mCoverSlipsGrid);
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mPrintBatchLblBtnClick(TObject *Sender)
{
	//Open print label form
	TPrintLabelForm* f = new TPrintLabelForm(this);

    //Get current Batch Label
    String code_1 = csDM->csFreshBatchesCDS->FieldByName("lot_number")->AsString;
    String code_2 = csDM->csFreshBatchesCDS->FieldByName("box_number")->AsString;

    if(code_1.Length())
    {
    	f->setup(stdstr(code_1 + '_' + code_2));
	    f->ShowModal();
    	delete f;
    }
    else
    {
    	MessageDlg("No label to print was selected..", mtError, TMsgDlgButtons() << mbOK, 0);
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mFreshBatchesGridCellClick(TColumn *Column)
{
	selectCoverSlips(mFreshBatchesGrid, mCoverSlipsGrid);
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mFreshBatchesGridKeyUp(TObject *Sender, WORD &Key, TShiftState Shift)
{
    if(mFreshBatchesGrid->DataSource->DataSet->Eof != true)
    {
        selectCoverSlips(mFreshBatchesGrid, mCoverSlipsGrid);
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::selectCoverSlips(TDBGrid* masterGrid, TDBGrid* detailGrid)
{
	//Retrieve selected ids from masterGrid
    // and apply filter on details table
    TClientDataSet* detailDataSet = dynamic_cast<TClientDataSet*>(detailGrid->DataSource->DataSet);
    detailDataSet->Close();
	TDataSet* masterDataSet = masterGrid->DataSource->DataSet;

  	if(masterGrid->SelectedRows->Count > 0)
    {
    	vector<int> p_ids = getSelectedIDS(masterGrid, "id");

    	QueryBuilder qb;
        qb << "SELECT * FROM coverslips WHERE freshCSBatch IN (";

        for(int i = 0; i < p_ids.size(); i++)
        {
			qb << p_ids[i];
            if(i < p_ids.size() - 1)
            {
            	qb << ", ";
            }
        }
        qb << ")";
		detailDataSet->CommandText = qb.asCString();
        Log(lDebug) << "Selected: "<<qb.asString();
    }
    else
    {
    	//Get master ID
        int id = masterDataSet->FieldByName("id")->AsInteger;
        detailDataSet->CommandText =
        	"SELECT * FROM coverslips WHERE freshCSBatch = " + IntToStr(id) +" ORDER BY freshCSBatch DESC";
    }

    detailDataSet->Open();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mRegisterCleanRoundBtnClick(TObject *Sender)
{
	//Get selected cs records in the coverslip grid
    vector<int> coverslipIDS = getSelectedIDS(mCoverSlipsGrid, "id");

    if(coverslipIDS.size() == 0)
    {
	 	MessageDlg("Please select some coverslips!", mtInformation, TMsgDlgButtons() << mbOK, 0);
		return;
    }

    StringList fromInts(coverslipIDS);
	Log(lInfo) << "Selected ids: (" << fromInts.asString(',')<<")";
    int mr = MessageDlg("Create a cleanround batch for selected coverslips?", mtInformation, TMsgDlgButtons() << mbYes << mbCancel, 0);
    if(mr != mrYes)
    {
    	return;
    }

    //Create a new cleanround record, and associate slected coverslips with it
    TSQLQuery* q = new TSQLQuery(NULL);
    q->SQLConnection = atdbDM->SQLConnection1;
    QueryBuilder qb;

    int current_user = getCurrentUserID();
    qb <<"INSERT into cleancsbatches (user, count) VALUES ('"<<current_user<<"','"<<coverslipIDS.size()<<"')";

    Log(lDebug) << "Query: " << qb.asString();
    q->SQL->Add(qb.asCString());
    int res = q->ExecSQL();
    Log(lDebug) << "Query result: " << res;

    //Get last insert ID for cleanCS batch and update coverslips
    int cleanCSBatchID = getLastInsertID(atdbDM->SQLConnection1);

    for(int i = 0; i < coverslipIDS.size(); i++)
    {
        qb.clear();
        qb 	<< "UPDATE coverslips SET status='"<<cssPostSilanization<<"',cleanCSBatch='"<<cleanCSBatchID<<"' "
            << "WHERE id='"<<coverslipIDS[i]<<"'";

        Log(lDebug) << "Query: " << qb.asString();
        q->SQL->Text = qb.asCString();
        int res = q->ExecSQL();
        Log(lDebug) << "Query result: " << res;

        //Update status and associate each coverslip
        Log(lInfo) << "Updating record:" <<coverslipIDS[i];
    }

    delete q;
	csDM->csCDS->Refresh();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mRegisterCarbonCoatBatchBtnClick(TObject *Sender)
{
	//Get selected cs records in the coverslip grid
    vector<int> coverslipIDS = getSelectedIDS(mCoverSlipsGrid, "id");

    if(coverslipIDS.size() == 0)
    {
	 	MessageDlg("Please select some coverslips!", mtInformation, TMsgDlgButtons() << mbOK, 0);
		return;
    }

    StringList fromInts(coverslipIDS);
	Log(lInfo) << "Selected ids: (" << fromInts.asString(',')<<")";
    int mr = MessageDlg("Create a carboncoated batch for selected coverslips? This will also print coverslip labels.", mtInformation, TMsgDlgButtons() << mbYes << mbCancel, 0);
    if(mr != mrYes)
    {
    	return;
    }

    //Create a new cleanround record, and associate slected coverslips with it
    TSQLQuery* q = new TSQLQuery(NULL);
    q->SQLConnection = atdbDM->SQLConnection1;

    QueryBuilder qb;
    int current_user = getCurrentUserID();
    qb <<"INSERT into carboncoatedcsbatches (user, count) VALUES ('"<<current_user<<"','"<<coverslipIDS.size()<<"')";

    Log(lDebug) << "Query: " << qb.asString();
    q->SQL->Add(qb.asCString());
    int res = q->ExecSQL();
    Log(lDebug) << "Query result: " << res;

    //Get last insert ID for cleanCS batch and update coverslips
    int carboncoatbatchID = getLastInsertID(atdbDM->SQLConnection1);

    for(int i = 0; i < coverslipIDS.size(); i++)
    {
        qb.clear();
        qb 	<< "UPDATE coverslips SET status='"<<cssPostCarbonCoat<<"', carboncoatbatch='"<<carboncoatbatchID<<"' "
            << "WHERE id='"<<coverslipIDS[i]<<"'";

        Log(lDebug) << "Query: " << qb.asString();
        q->SQL->Text = qb.asCString();
        int res = q->ExecSQL();
        Log(lDebug) << "Query result: " << res;

        //Update status and associate each coverslip
        Log(lInfo) << "Updating record:" <<coverslipIDS[i];
    }

    BarcodePrintParameters p;
    p.command = stdlines(mBarCodeCommandMemo->Lines);

    //Create and print labels
    if(!createAndPrintCoverSlipLabels(p, coverslipIDS, atdbDM->SQLConnection1))
    {
		Log(lError) << "There was a problem creating and/or printing coverslip labels";
    }

    delete q;
	csDM->csCDS->Refresh();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mPrintCSLabelsBtnClick(TObject *Sender)
{
    //Get selected cs records in the coverslip grid
    vector<int> coverslipIDS = getSelectedIDS(mCoverSlipsGrid, "id");

    if(coverslipIDS.size() == 0)
    {
        MessageDlg("Please select some coverslips!", mtInformation, TMsgDlgButtons() << mbOK, 0);
        return;
    }

	TButton* b = dynamic_cast<TButton*>(Sender);
	if(b == mPrintCSLabelsBtn)
    {
        BarcodePrintParameters p;
        p.command 			= stdlines(mBarCodeCommandMemo->Lines);

        //Create and print labels
        if(!createAndPrintCoverSlipLabels(p, coverslipIDS, atdbDM->SQLConnection1))
        {
            Log(lError) << "There was a problem creating and/or printing coverslip labels";
        }
    }
    else if(b == mAddCSNote)
    {
    	TTextInputDialog* f = new TTextInputDialog(this);
        f->Caption = "Add note to multiple coverslips";

		stringstream msg;
        msg <<"---------------------------------------------------------------------";
        msg <<"\nNew note added on "<<getDateTimeString() << " by " <<stdstr(UsersCB->Text)<<endl;
        msg <<"---------------------------------------------------------------------";
        f->setText(msg.str().c_str());

       	f->mInfoMemo->SelStart =f->mInfoMemo->GetTextLen();
	    f->mInfoMemo->Perform(EM_SCROLLCARET, 0, 0);
        int mr = f->ShowModal();

        if(mr == mrOk)
        {
        	string note = f->getText();
        	Log(lError) << "Adding note to multiple coverslips";
            addNoteToMultipleCoverSlips(coverslipIDS, atdbDM->SQLConnection1, note);
            CSNavigator->BtnClick(::Data::Bind::Controls::nbRefresh);
        }
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mCoverSlipsGridKeyUp(TObject *Sender, WORD &Key, TShiftState Shift)
{
	mCoverSlipsGrid->SelectedRows->Count;
	mNrOfSelectedCS->setValue(mCoverSlipsGrid->SelectedRows->Count);
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mCoverSlipsGridCellClick(TColumn *Column)
{
	mCoverSlipsGrid->SelectedRows->Count;
	mNrOfSelectedCS->setValue(mCoverSlipsGrid->SelectedRows->Count);
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::DBGrid_DBLClick(TObject *Sender)
{
    TDBGrid* g = dynamic_cast<TDBGrid*>(Sender);
    if(g == SpecimenGrid)
    {
    	openSpecimenForm();
    }
    else if(g == SlicesGrid)
    {
    	openSlicesForm();
    }
    else if(g == BlocksGrid)
    {
    	openBlocksForm();
    }
//
//	//Show current record on a form
//    TNewBlockForm* nsf = new TNewBlockForm(this);
//    atdbDM->blocksCDS->Edit();
//
//    int res = nsf->ShowModal();
//    if(res == mrCancel)
//    {
//        //revert
//        atdbDM->blocksCDS->Cancel();
//    }
//    else
//    {
//        atdbDM->blocksCDS->Post();
//        atdbDM->blocksCDS->First();
//    }
//
//    delete nsf;
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::DiscardedMenuItemClick(TObject *Sender)
{

	//Get selected cs records in the coverslip grid
    vector<int> coverslipIDS = getSelectedIDS(mCoverSlipsGrid, "id");
    if(coverslipIDS.size() == 0)
    {
	 	MessageDlg("Please select some coverslips!", mtInformation, TMsgDlgButtons() << mbOK, 0);
		return;
    }

    StringList fromInts(coverslipIDS);
	Log(lInfo) << "Selected ids: (" << fromInts.asString(',')<<")";


	TMenuItem* mi = dynamic_cast<TMenuItem*>(Sender);
    CoversSlipStatusE status;
    int mr;
    if(mi == DiscardedMenuItem)
    {
	    mr = MessageDlg("Change status to 'Discarded' for selected coverslips?", mtInformation, TMsgDlgButtons() << mbYes << mbCancel, 0);
		status = cssDiscarded;
    }
    else if(mi == FreshoutoftheBoxMenuItem)
    {
	    mr = MessageDlg("Change status to 'Fresh Out of the Box for selected Coverslips?", mtInformation, TMsgDlgButtons() << mbYes << mbCancel, 0);
    	status = cssFreshOutOfTheBox;
    }
    else
    {
	    MessageDlg("Invalid selection......!", mtInformation, TMsgDlgButtons() << mbOK, 0);
    }

    if(mr != mrYes)
    {
    	return;
    }

    //Create a new cleanround record, and associate slected coverslips with it
    TSQLQuery* q = new TSQLQuery(NULL);
    q->SQLConnection = atdbDM->SQLConnection1;
    QueryBuilder qb;

    int current_user = getCurrentUserID();
    for(int i = 0; i < coverslipIDS.size(); i++)
    {
        qb.clear();
        qb 	<< "UPDATE coverslips SET status='"<<status<<"'"
            << "WHERE id='"<<coverslipIDS[i]<<"'";

        Log(lDebug) << "Query: " << qb.asString();
        q->SQL->Text = qb.asCString();
        int res = q->ExecSQL();
        Log(lDebug) << "Query result: " << res;

        //Update status and associate each coverslip
        Log(lInfo) << "Updating status for coverslip with ID:" <<coverslipIDS[i];
    }

    delete q;
	csDM->csCDS->Refresh();
}


void __fastcall TMainForm::settingsNavigatorClick(TObject *Sender, TNavigateBtn Button)
{
//	switch(Button)
//    {
//    	case TNavigateBtn::nbInsert:
//        	atdbDM->settingsCDS->FieldValues["id"] = "New User";
//        break;
//    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::UnlocktablesBtnClick(TObject *Sender)
{
	static int nrOfTrys = 1;
	//Enable editing of current table
	auto_ptr<TStringInputDialog> f(new TStringInputDialog(this));
    f->Caption = "Input password";
    f->STDStringLabeledEdit1->EditLabel->Visible = false;
    f->BottomPanel->Visible = false;
    f->Width = 473;
    f->Height = 110;
    f->STDStringLabeledEdit1->PasswordChar = '*';

    if(f->ShowModal() == mrCancel)
    {
    	return;
    }

    if(f->getText() == mTableUnlockPassword.getValue())
    {
    	TTableFrame1->unlock();
	    nrOfTrys = 0;
    }
    else
    {
    	switch(nrOfTrys)
        {
    		case 1:
            	MessageDlg("That password is not the right one!\n\nYou get one more try, but after that, all files on this computer will be erased!", mtWarning, TMsgDlgButtons() << mbOK, 0);
			    nrOfTrys++;
			break;
    		case 2:
            	MessageDlg("We are sorry. That password is not the right one!\n\nAll files on this computer will now be erased!", mtWarning, TMsgDlgButtons() << mbOK, 0);
            	MessageDlg("Ok, one more try!", mtWarning, TMsgDlgButtons() << mbOK, 0);
			    nrOfTrys++;
			break;
			default:
            	MessageDlg("Ok, one more try!", mtWarning, TMsgDlgButtons() << mbOK, 0);
			    nrOfTrys = 1;
            break;
        }
    }
}


//---------------------------------------------------------------------------
void __fastcall TMainForm::SpecieRGClick(TObject *Sender)
{
    //Apply filter to specimen table
   	string specie = stdstr(SpecieRG->Items->Strings[SpecieRG->ItemIndex]);
    int specieID = atdbDM->getIDForSpecie(specie);

	atdbDM->specimenCDS->Filter = "specie = '" + IntToStr(specieID) + "'";
    atdbDM->specimenCDS->Filtered = true;
}

void __fastcall TMainForm::openBlocksForm()
{
	//Open the currently seleceted record in the form
    TBlockForm* f = new TBlockForm(this);
    int res = f->ShowModal();

    if(res != mrCancel)
    {
    	// Create block label
        String str = atdbDM->createBlockLabel();
        atdbDM->blocksCDS->FieldValues["label"] = str;
//        atdbDM->blocksCDS->FieldValues["status"] = 0;


        atdbDM->blocksCDS->Post();
        atdbDM->blocksCDS->First();
    }
    else
    {
		atdbDM->blocksCDS->Cancel();
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::ApplicationEvents1Exception(TObject *Sender, Exception *E)
{
	Log(lError) << "There was an exception";
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::BlockIDSLLBKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift)
{
	if(Key == vkUp || Key == vkDown || Key == vkLeft|| Key == vkRight)
    {

    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::BlockIDSLLBMouseUp(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y)
{
	populateMedia();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::BlockIDSLLBKeyUp(TObject *Sender, WORD &Key,
          TShiftState Shift)
{
	if(Key == vkUp || Key == vkDown|| Key == vkLeft|| Key == vkRight)
    {
        populateMedia();
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::BrowseForFolder1Accept(TObject *Sender)
{
	MediaFolderE->setValue(stdstr(BrowseForFolder1->Folder));
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::MediaPageControlChange(TObject *Sender)
{
	populateMedia();
}

void TMainForm::populateMedia()
{
    if(BlockIDSLLB->KeyValue.IsNull())
    {
        return;
    }

    //Check what page is open, movies or images
    Poco::Path p(MediaFolderE->getValue());
    if(MediaPageControl->TabIndex == 0)
    {
		TMoviesFrame1->populate(BlockIDSLLB->KeyValue, p);
    }
    else //Populate Images
	{
		TImagesFrame1->populate(BlockIDSLLB->KeyValue, p);
    }
}



