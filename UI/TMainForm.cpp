#include <vcl.h>
#pragma hdrstop
#include "atdbVCLUtils.h"
#include "atVCLUtils.h"
#include "database/atDBUtils.h"
#include "mtkLogger.h"
#include "mtkMoleculixException.h"
#include "mtkSQLiteException.h"
#include "mtkSQLiteQuery.h"
#include "mtkSQLiteTable.h"
#include "mtkStringUtils.h"
#include "mtkUtils.h"
#include "mtkVCLUtils.h"
#include "Poco/DateTime.h"
#include "Poco/DateTimeFormat.h"
#include "Poco/DateTimeFormatter.h"
#include "Poco/Glob.h"
#include "Poco/Timezone.h"
#include "TamFileEditor.h"
#include "TATDBDataModule.h"
#include "TCoverSlipDataModule.h"
#include "TImagesDataModule.h"
#include "TMainForm.h"
#include "TMemoLogger.h"
#include "TNewSpecimenForm.h"
#include "TShowFileContentForm.h"
#include "TTableUpdateForm.h"
#include "TRegisterFreshCSBatchForm.h"
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
#pragma link "pBarcode2D"
#pragma link "pCore2D"
#pragma link "pDataMatrix"
#pragma link "pDBBarcode2D"
#pragma link "pQRCode"
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
	mDustAssayResultImageHeight(100),
    mDustAssayBackGroundImageWidth(100),
    mSplashProperties(gApplicationRegistryRoot, "Splash"),
    mShowSplashOnStartup(true),
    mLogLevel(lAny),
    mIsStyleMenuPopulated(false),
    gCanClose(true),
    logMsgMethod(&logMsg),
    mLogFileReader(joinPath(getSpecialFolder(CSIDL_LOCAL_APPDATA), "atDB", gLogFileName), logMsgMethod),
	mServerDBSession(""),
    mDBUserID(0)

{
    //Close any dataconnection created by stupid TSQLConnection
    mTempFileFolder = joinPath(getSpecialFolder(CSIDL_LOCAL_APPDATA), "atDB");
    TMemoLogger::mMemoIsEnabled = false;
    setupIniFile();
    setupAndReadIniParameters();

    //Add grids to db grids container for reading/saving column states
    mDBGrids.push_back(mProcessForBlocksGrid);
    mDBGrids.push_back(mBlocksGrid);
    mDBGrids.push_back(mBlockNotesGrid);
	mDBGrids.push_back(mBlocksForRibbonsGrid);
    mDBGrids.push_back(mRibbonsGrid);
    mDBGrids.push_back(mRibbonNotesGrid);
    mDBGrids.push_back(mUsersDBGrid);
	mDBGrids.push_back(mSpecimenGrid);
}

void __fastcall	TMainForm::afterServerConnect(System::TObject* Sender)
{
	atdbDM->afterConnect();
    csDM->afterConnect();
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
        case TNavigateBtn::nbApplyUpdates:      									  break;
        case TNavigateBtn::nbRefresh:
        	populateUsersCB();
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
}

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

void __fastcall TMainForm::mSpecimenNavigatorClick(TObject *Sender, TNavigateBtn Button)
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
                    atdbDM->specimenCDS->Cancel();
                }
                else
                {
	                atdbDM->specimenCDS->Post();
			    	atdbDM->specimenCDS->First();
                }
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

void __fastcall TMainForm::mSpecimenGridDrawDataCell(TObject *Sender, const TRect &Rect,
          TField *Field, TGridDrawState State)
{
  	if (Field->DataType == ftMemo)
  	{
     	String S = Field->AsString;
      	mSpecimenGrid->Canvas->Pen->Color = clWindow;
      	mSpecimenGrid->Canvas->Brush->Color = clWindow;
      	mSpecimenGrid->Canvas->Rectangle(Rect);
      	mSpecimenGrid->Canvas->TextOut(Rect.Left, Rect.Top, S);
	}
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mSpecimenGridDrawColumnCell(TObject *Sender, const TRect &Rect,
          int DataCol, TColumn *Column, TGridDrawState State)
{
    if (Column->Field->DataType == ftMemo)
    {
		mSpecimenGrid->Canvas->FillRect (Rect);
		mSpecimenGrid->Canvas->TextOut( Rect.Left + 3, Rect.Top + 3,
              Column->Field->AsString);
    }
}

void __fastcall TMainForm::mTablesLBClick(TObject *Sender)
{
	if(mTablesLB->ItemIndex != -1)
    {
		String tbl = mTablesLB->Items->Strings[mTablesLB->ItemIndex];
		TTableFrame1->loadTable(stdstr(tbl));
    }
}

void __fastcall TMainForm::Button1Click(TObject *Sender)
{

	int mr = MessageDlg("This will print using the default printer on your system.", mtInformation, TMsgDlgButtons() << mbOK<<mbCancel, 0);
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

void __fastcall TMainForm::selectBlocks()
{
	//Retrieve selected id and apply filter on blocks table
    atdbDM->blocksCDS->Close();
  	if(mProcessForBlocksGrid->SelectedRows->Count > 0)
    {
    	vector<int> p_ids;
    	stringstream s;
      	for(int i = 0; i < mProcessForBlocksGrid->SelectedRows->Count; i++)
    	{
    		TBookmarkList* bookMarkList = mProcessForBlocksGrid->SelectedRows;

            if(bookMarkList->Count == mProcessForBlocksGrid->SelectedRows->Count)
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
    }                                                                               atdbDM->blocksCDS->Open();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::PageControl2Change(TObject *Sender)
{
	//If we are opening the Ribbons page, sett blocks query to select all blocks
   	if(PageControl2->TabIndex == 2)
    {
        atdbDM->blocksCDS->Close();
        atdbDM->blocksCDS->CommandText = "SELECT * FROM block ORDER BY id DESC";
        atdbDM->blocksCDS->Open();
    }
}

void __fastcall TMainForm::mDocumentsGridDblClick(TObject *Sender)
{
	//Extract the document and open with default viewer
	String id  		= mDocumentsGrid->DataSource->DataSet->FieldByName("id")->AsString;
	String docName  = mDocumentsGrid->DataSource->DataSet->FieldByName("document_name")->AsString;
	String type 	= mDocumentsGrid->DataSource->DataSet->FieldByName("type")->AsString;
    Log(lInfo) << "Opening a :"<<stdstr(type)<<" file";

    TByteDynArray bytes = mDocumentsGrid->DataSource->DataSet->FieldByName("document")->AsBytes;

    String fNames(docName + "." + type);
    string fName(joinPath(getSpecialFolder(CSIDL_LOCAL_APPDATA),"Temp", stdstr(fNames)));

	fstream out(fName.c_str(), ios::out|ios::binary);
    if(out)
    {
        for(int i = 0; i < bytes.Length; i++)
        {
            out << bytes[i];
        }
    }

    out.close();
    ShellExecuteA(NULL, NULL, fName.c_str(), 0, 0, SW_SHOWNORMAL);
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mAddDocBtnClick(TObject *Sender)
{
	//Browse for file
	string filename = browseForFile();

    if(filename.size())
    {
    	Log(lInfo) << "Adding document: "<<filename<<" to documents table";

        string fName(getFileNameNoPath(filename));
        string fExt(getFileExtension(filename));

        if(!fName.size())
        {
        	MessageDlg("Something is wrong with this documents filename and or extension!", mtWarning, TMsgDlgButtons() << mbOK, 0);
        	return;
        }

        ifstream ifs(filename.c_str(), ios::binary|ios::ate);
    	ifstream::pos_type pos = ifs.tellg();

	    std::vector<char> result(pos);
    	ifs.seekg(0, ios::beg);
	    ifs.read(&result[0], pos);

		TSQLQuery* q = new TSQLQuery(NULL);
        q->SQLConnection = atdbDM->SQLConnection1;
    	stringstream s;

        q->SQL->Add("INSERT INTO documents ");
        q->SQL->Add("(document_name, document, type) VALUES  ");
		q->SQL->Add("( :dname, :doc, :type )");
        q->ParamByName("dname")->Value = getFileNameNoExtension(fName).c_str();

        TByteDynArray bytes;
        bytes.Length = result.size();
        for(int i = 0; i < result.size(); i++)
        {
        	bytes[i] = result[i];
        }

        q->ParamByName("doc")->AsBlob = bytes;
		q->ParamByName("type")->Value = fExt.c_str();
        q->ExecSQL();
        delete q;
       	atdbDM->documentsCDS->ApplyUpdates(0);
    }
	atdbDM->documentsCDS->Refresh();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mSpecimenGridDblClick(TObject *Sender)
{
	//Show current record on a form
    TNewSpecimenForm* nsf = new TNewSpecimenForm(this);
    atdbDM->specimenCDS->Edit();
	atdbDM->substitutionProtocol->Edit();
    int res = nsf->ShowModal();
    if(res == mrCancel)
    {
        //revert
        atdbDM->specimenCDS->Cancel();
    }
    else
    {
        atdbDM->specimenCDS->Post();
        atdbDM->specimenCDS->First();
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mSpecimenGridMouseDown(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y)
{
	if(Button == TMouseButton::mbRight)
    {
    	TGridCoord c = mSpecimenGrid->MouseCoord(X,Y);
		TField* field =  mSpecimenGrid->Columns->operator [](c.X)->Field;

		SpecimenPopup->Popup(X,Y);
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mSpecimenGridMouseUp(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y)
{
	if(Button != TMouseButton::mbRight)
    {
    	return;
    }

    TGridCoord c = mSpecimenGrid->MouseCoord(X,Y);
    TField* field =  mSpecimenGrid->Columns->operator [](c.X - 1)->Field;

    if(field->FieldKind == fkLookup)
    {
        TPoint screen(mSpecimenGrid->ClientToScreen(Point(X,Y)));

        Log(lInfo) << "Field: " << stdstr(field->Value);
        Log(lInfo) << "Key Fields: " << stdstr(field->KeyFields);

        Log(lInfo) << "Field Lookup: " << stdstr(field->LookupKeyFields);
        String value = field->DataSet->FieldByName(field->KeyFields)->Value;

        //Query lookup data set for document_id
        TLocateOptions lo;
        bool found = field->LookupDataSet->Locate("id", value, lo);

        if(found)
        {
            int id = -1;
            if(!field->LookupDataSet->FieldByName("document_id")->Value.IsNull())
            {
                id = field->LookupDataSet->FieldByName("document_id")->Value;
            }

            Log(lInfo) << "Opening document with id: "<<id;

            TLocateOptions lo;
            bool found = atdbDM->documentsCDS->Locate("id", id, lo);
            if(found)
            {
            //	SpecimenPopup->Popup(screen.X, screen.Y);
                openCurrentDocumentFile();
            }
        }

        //Get document id
        Log(lInfo) << "Field Lookup Value" << stdstr(value);
    }
}

void TMainForm::openCurrentDocumentFile()
{
	TClientDataSet* cds = atdbDM->documentsCDS;

	String id  		= cds->FieldByName("id")->AsString;
	String docName  = cds->FieldByName("document_name")->AsString;
	String type 	= cds->FieldByName("type")->AsString;

    Log(lInfo) << "Opening a :"<<stdstr(type)<<" file";

    TByteDynArray bytes = cds->FieldByName("document")->AsBytes;

    String fNames(docName + "." + type);
    string fName(joinPath(getSpecialFolder(CSIDL_LOCAL_APPDATA),"Temp", stdstr(fNames)));

	fstream out(fName.c_str(), ios::out|ios::binary);
    if(out)
    {
        for(int i = 0; i < bytes.Length; i++)
        {
            out << bytes[i];
        }
    }

    out.close();
    ShellExecuteA(NULL, NULL, fName.c_str(), 0, 0, SW_SHOWNORMAL);
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mBlocksGridKeyUp(TObject *Sender, WORD &Key, TShiftState Shift)
{
	//When selecting multiple blocks, prepare Memo for block text output
	createBlockLabels();
}

void __fastcall TMainForm::createBlockLabels()
{
	mLblMakerMemo->Clear();
  	stringstream s;
  	if(mBlocksGrid->SelectedRows->Count > 0)
    {
      	for(int i = 0; i < mBlocksGrid->SelectedRows->Count; i++)
    	{
    		TBookmarkList* bookMarkList = mBlocksGrid->SelectedRows;
            if(bookMarkList->Count == mBlocksGrid->SelectedRows->Count)
            {
        		atdbDM->blocksCDS->GotoBookmark((*bookMarkList)[i]);
                String str = atdbDM->blocksCDS->FieldByName("Cblock_label")->AsString;
		        s << stdstr(str);
                if(i < mBlocksGrid->SelectedRows->Count -1)
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
void __fastcall TMainForm::mBlocksGridCellClick(TColumn *Column)
{
	createBlockLabels();
}

////---------------------------------------------------------------------------
//void __fastcall TMainForm::DataSource1DataChange(TObject *Sender, TField *Field)
//{
//	createBlockLabels();
//}

//---------------------------------------------------------------------------
void __fastcall TMainForm::mSpecimenGridMouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y)
{
	TGridCoord pt = mSpecimenGrid->MouseCoord(X,Y);
	mSpecimenGrid->Cursor = (pt.Y == 0) ? crHandPoint : crDefault;
}


//---------------------------------------------------------------------------
void __fastcall TMainForm::mSpecimenGridTitleClick(TColumn *Column)
{
	TField* field =  Column->Field;
	static int PreviousColumnIndex = -1;
	if(mSpecimenGrid->DataSource->DataSet == atdbDM->specimenCDS && PreviousColumnIndex != -1)
    {
    	TColumn* prevCol = mSpecimenGrid->Columns->Items[PreviousColumnIndex];
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
void __fastcall TMainForm::Button2Click(TObject *Sender)
{
	MessageDlg("Not yet implemented", mtInformation, TMsgDlgButtons() << mbOK, 0);
}

void __fastcall TMainForm::onDustAssayDataChanged(TObject *Sender)
{
	Log(lInfo) << "Loading new Dust Assay Dataset";
    loadImage(stdstr(mIm1FName->Caption), mBackgroundImage);
    loadImage(stdstr(mIm2FName->Caption), mCoverslipImage);
    loadImage(stdstr(mIm3FName->Caption), mResultImage);

}

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
}


