#pragma hdrstop
#include "TMainForm.h"
//#include "TSplashForm.h"
#include "TMemoLogger.h"
#include "mtkVCLUtils.h"
#include "Poco/DateTime.h"
#include "Poco/DateTimeFormatter.h"
#include "mtkLogger.h"
#include "mtkIniSection.h"
#include "Core/atDBUtilities.h"
#include "Poco/Timezone.h"
#include "TATDBDataModule.h"
#include "database/atDBUtils.h"
#include "TCoverSlipDataModule.h"

extern bool             gAppIsStartingUp;
extern bool             gIsDevelopmentRelease;
extern string           gCommonAppDataLocation;
extern string           gLogFileLocation;
extern string           gLogFileName;
extern string           gFullDateTimeFormat;
extern string           gDateFormat;
extern string           gTimeFormat;

//extern TSplashForm*     gSplashForm;
extern string           gTimeFormat;

using namespace mtk;
using namespace at;
using Poco::DateTime;
using Poco::DateTimeFormatter;

//---------------------------------------------------------------------------
void __fastcall TMainForm::FormCreate(TObject *Sender)
{
    TMemoLogger::mMemoIsEnabled = false;
	setupWindowTitle();
	if(mLogLevel == lInfo)
	{
		LogLevelCB->ItemIndex = 0;
		StringList logs = getLinesInFile(joinPath(gLogFileLocation, gLogFileName));

		StringList msgs;
		msgs.append("WARNING");
		msgs.append("ERROR");
		msgs.append("INFO");

		//Only add lines to logwindow with lInfo and "higher"
		for(uint i = 0; i < logs.size(); i++)
		{
			if(contains(msgs, logs[i]))
			{
				infoMemo->Lines->Add(vclstr(logs[i]));
			}
		}
	}
	else if(mLogLevel == lAny)
	{
		LogLevelCB->ItemIndex = 1;
		StringList logs = getLinesInFile(joinPath(gLogFileLocation, gLogFileName));

		//Only add lines to log window with lInfo and "igher"
		for(int i = 0; i < logs.size(); i++)
		{
			infoMemo->Lines->Add(vclstr(logs[i]));
		}
	}

	mLogFileReader.start(true);
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::FormShow(TObject *Sender)
{
   	Log(lInfo) << "In FormShow";
   	Log(lInfo) << "Form visibility: "<<mtk::toString(this->Visible);
	gAppIsStartingUp = false;

	//transfer INI values
	BottomPanel->Height     = mBottomPanelHeight + 1;
	SB->Top = MainForm->Top + MainForm->Height + 10;
	SB->SizeGrip = true;

   	atdbDM->SQLConnection1->AfterConnect 	= afterServerConnect;
   	atdbDM->SQLConnection1->AfterDisconnect = afterServerDisconnect;

    csDM->csDustAssayCDSOnDataChanged = onDustAssayDataChanged;

    bool connected = false;
    try
    {
	    connected = atdbDM->connect(mServerIPE->getValue(), mDBUserE->getValue(), mPasswordE->getValue(), mDatabaseE->getValue());
    }
    catch (const TDBXError &e)
	{
    	Log(lInfo) << "There was a database connection issue: "<<stdstr(e.Message);
	}

	//Low level connection
    try
    {
        if(!mServerDBSession.isConnected())
        {
            mServerDBSession.connect(mServerIPE->getValue(), mDBUserE->getValue(), mPasswordE->getValue(), mDatabaseE->getValue());
        }
    }
    catch(...)
    {
    	handleMySQLException();
    }

    if(mServerDBSession.isConnected())
    {
        Log(lInfo) << "Connected to remote database.";
		//Populate table dropdown
	    StringList tables = mServerDBSession.getTableNames();
	    populateListBox(tables, mTablesLB);
    }

//	//Read grid column settings from files in AppData/Grids folder
//	Log(lInfo) << "Reading column states";
//
//	for(int i = 0; i < mDBGrids.size(); i++)
//    {
//    	if(mDBGrids[i] != NULL)
//        {
//            string fName = joinPathU(gCommonAppDataLocation, "Grids", mDBGrids[i]->Name);
//            if(fileExists(fName.c_str()))
//            {
//		    	mDBGrids[i]->Columns->LoadFromFile(fName.c_str());
//            }
//        }
//    }
}

void TMainForm::setupIniFile()
{
	string fldr =  joinPath(getSpecialFolder(CSIDL_LOCAL_APPDATA), "atDB");

	if(!folderExists(fldr))
	{
		CreateDir(fldr.c_str());
	}

	mIniFileC->init(fldr);

	//For convenience and for option form, populate appProperties container
	mAppProperties.append(&mGeneralProperties);
   	mAppProperties.append(&mCoverslipPrintingProperties);
	mAppProperties.append(&mSplashProperties);
}

bool TMainForm::setupAndReadIniParameters()
{
	mIniFileC->load();
	mGeneralProperties.setIniFile(mIniFileC->getIniFile());

	//Setup parameters
	mGeneralProperties.setSection("GENERAL");
	mGeneralProperties.add((BaseProperty*)  &mBottomPanelHeight.setup( 	            "HEIGHT_OF_BOTTOM_PANEL",    	    205));
	mGeneralProperties.add((BaseProperty*)  &mMainTabIndex.setup( 	                "MAIN_TAB_INDEX",           	    0));
	mGeneralProperties.add((BaseProperty*)  &mLogLevel.setup( 	                    "LOG_LEVEL",    	                lAny));

	mGeneralProperties.add((BaseProperty*)  &mDBUserID.setup( 	                    "ATDB_USER_ID",                    	0));
	mGeneralProperties.add((BaseProperty*)  &mServerIPE->getProperty()->setup( 	    "MYSQL_SERVER_IP",              	"127.0.0.1"));
	mGeneralProperties.add((BaseProperty*)  &mDBUserE->getProperty()->setup( 	    "ATDB_USER_NAME",                   "none"));
	mGeneralProperties.add((BaseProperty*)  &mPasswordE->getProperty()->setup( 	    "ATDB_USER_PASSWORD",               "none"));
	mGeneralProperties.add((BaseProperty*)  &mDatabaseE->getProperty()->setup( 	    "ATDB_DB_NAME",    			        "none"));
	mGeneralProperties.add((BaseProperty*)  &mDustAssayImageFolderE->getProperty()->setup(
    																				"DUSTASSAY_IMAGER_FOLDER",    			        "c:\\"));
	mGeneralProperties.add((BaseProperty*)  &mDustAssayResultImageHeight.setup( 	"RESULT_IMAGE_HEIGHT",     	        100));
	mGeneralProperties.add((BaseProperty*)  &mDustAssayBackGroundImageWidth.setup( 	"BACKGROUND_IMAGE_WIDTH",  	        100));

	//Read from file. Create if file do not exist
	mGeneralProperties.read();

	//Update
    mResultImagePanel->Height 		= mDustAssayResultImageHeight.getValue();
    mBackgroundImagePanel->Width 	= mDustAssayBackGroundImageWidth.getValue();
    mDBUserE->update();
    mPasswordE->update();
    mDatabaseE->update();
	mServerIPE->update();
	mDustAssayImageFolderE->update();

    //Coverslip properties
   	mCoverslipPrintingProperties.setIniFile(mIniFileC->getIniFile());
	mCoverslipPrintingProperties.setSection("COVERSLIPLABEL_PRINTING");

	mCoverslipPrintingProperties.add((BaseProperty*)  &mCSBCWidth->getProperty()->setup( 	    "LABEL_WIDTH",              0.965));
	mCoverslipPrintingProperties.add((BaseProperty*)  &mCSBCHeight->getProperty()->setup( 	    "LABEL_HEIGHT",             0.2874));
	mCoverslipPrintingProperties.add((BaseProperty*)  &mCSBCTextXPos->getProperty()->setup( 	"TEXT_X",               	200));
	mCoverslipPrintingProperties.add((BaseProperty*)  &mCSBCTextYPos->getProperty()->setup( 	"TEXT_Y",               	55));
	mCoverslipPrintingProperties.add((BaseProperty*)  &mCSBCFont->getProperty()->setup( 	    "FONT_NUMBER",              3));
	mCoverslipPrintingProperties.add((BaseProperty*)  &mBCTextAlignment->getProperty()->setup( 	"TEXT_ALIGNMENT",           0));

	mCoverslipPrintingProperties.add((BaseProperty*)  &mCodeStartX->getProperty()->setup( 	    "BARCODE_X",               145));
	mCoverslipPrintingProperties.add((BaseProperty*)  &mCodeStartY->getProperty()->setup( 	    "BARCODE_Y",               35));
	mCoverslipPrintingProperties.add((BaseProperty*)  &mExpectedWidth->getProperty()->setup( 	"BC_EXPECTED_WIDTH",       15));
	mCoverslipPrintingProperties.add((BaseProperty*)  &mExpectedHeight->getProperty()->setup( 	"BC_EXPECTED_HEIGHT",      15));

	mCoverslipPrintingProperties.add((BaseProperty*)  &mRowSymbolSize->getProperty()->setup( 	"ROW_SYMBOL_SIZE",          43));
	mCoverslipPrintingProperties.add((BaseProperty*)  &mColSymbolSize->getProperty()->setup( 	"COl_SYMBOL_SIZE",          43));
	mCoverslipPrintingProperties.add((BaseProperty*)  &mModuleSize->getProperty()->setup( 		"MODULE_SIZE",     		    3));

    mCoverslipPrintingProperties.read();

	//Update
	mCSBCWidth->update();
    mCSBCHeight->update();
    mCSBCTextXPos->update();
    mCSBCTextYPos->update();
    mCSBCFont->update();
    mBCTextAlignment->update();

    mCodeStartX->update();
    mCodeStartY->update();
    mExpectedWidth->update();
    mExpectedHeight->update();

    mRowSymbolSize->update();
    mColSymbolSize->update();
    mModuleSize->update();

	//Setup UI elements
	mSplashProperties.add((BaseProperty*)  &mShowSplashOnStartup.setup(             "ShowOnStartup",                    true));

	if(mSplashProperties.doesSectionExist())
	{
		mSplashProperties.read();
	}

	return true;
}
