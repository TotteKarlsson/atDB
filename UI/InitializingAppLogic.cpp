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
using Poco::DateTime;
using Poco::DateTimeFormatter;

//---------------------------------------------------------------------------
void __fastcall TMainForm::FormCreate(TObject *Sender)
{
    TMemoLogger::mMemoIsEnabled = false;
//    if(gSplashForm)
//    {
//		gSplashForm->mMainAppIsRunning = true;
//
//		this->Visible = true;
//		while(gSplashForm->isOnShowTime() == true)
//		{
//			//In order to show whats going on on the splash screen
//			Application->ProcessMessages();
//			if(gSplashForm->Visible == false)
//			{
//				break;
//			}
//		}
//
//		gSplashForm->Close();
//    }	gLogger.setLogLevel(mLogLevel);

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
	gAppIsStartingUp = false;
    if(mIsStyleMenuPopulated == false)
    {
        PopulateStyleMenu();
        mIsStyleMenuPopulated = true;
	}

	//Update DB controls

	//transfer INI values
	BottomPanel->Height     = mBottomPanelHeight + 1;
	SB->Top = MainForm->Top + MainForm->Height + 10;
	SB->SizeGrip = true;

   	atdbDM->SQLConnection1->AfterConnect 	= afterServerConnect;
   	atdbDM->SQLConnection1->AfterDisconnect = afterServerDisconnect;

    bool connected = atdbDM->connect(mServerIPE->getValue(), mDBUserE->getValue(), mPasswordE->getValue(), mDatabaseE->getValue());
	if (connected)
    {
    	Log(lInfo) << "Connected to database: "<<"atdb";
    }
    else
    {
    	Log(lInfo) << "Failed to connect to database: "<<"atdb";
    }

    if(!mServerDBSession.isConnected())
    {
        mServerDBSession.connect(mServerIPE->getValue(), mDBUserE->getValue(), mPasswordE->getValue(), mDatabaseE->getValue());
    }

    if(mServerDBSession.isConnected())
    {
        Log(lInfo) << "Connected to remote database.";
		//Populate table dropdown
	    StringList tables = mServerDBSession.getTableNames();

	    populateListBox(tables, mTablesLB);
    }
    else
    {
        Log(lError) << "Failed to connect to remote database server using low level app connection...";
    }

	//Save grid column settings to files into AppData/Grids folder...
	Log(lInfo) << "Saving column states";

	for(int i = 0; i < mDBGrids.size(); i++)
    {
    	if(mDBGrids[i] != NULL)
        {
            string fName = joinPathU(gCommonAppDataLocation, "Grids", mDBGrids[i]->Name);
            if(fileExists(fName.c_str()))
            {
		    	mDBGrids[i]->Columns->LoadFromFile(fName.c_str());
            }
        }
    }
}

void TMainForm::setupIniFile()
{
	string fldr = getSpecialFolder(CSIDL_LOCAL_APPDATA);
	fldr =  joinPath(fldr, "atDB");

	if(!folderExists(fldr))
	{
		CreateDir(fldr.c_str());
	}

	mIniFileC->init(fldr);

	//For convenience and for option form, populate appProperties container
	mAppProperties.append(&mGeneralProperties);
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

	//Read from file. Create if file do not exist
	mGeneralProperties.read();

	mSplashProperties.add((BaseProperty*)  &mShowSplashOnStartup.setup(             "ShowOnStartup",                    true));

    mDBUserE->update();
    mPasswordE->update();
    mDatabaseE->update();
	mServerIPE->update();
	if(mSplashProperties.doesSectionExist())
	{
		mSplashProperties.read();
	}

	return true;
}

//---------------------------------------------------------------------------

