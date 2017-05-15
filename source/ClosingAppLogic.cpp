#pragma hdrstop
#include "TMainForm.h"
#include "mtkLogger.h"
#include "TMemoLogger.h"
//#include "TSplashForm.h"
#include "TATDBDataModule.h"
#include "mtkVCLUtils.h"
using namespace mtk;
//extern TSplashForm*  gSplashForm;
extern string gCommonAppDataLocation;
//---------------------------------------------------------------------------
__fastcall TMainForm::~TMainForm()
{
	//Save grid column settings to files into AppData/Grids folder...
    if(!folderExists(joinPath(gCommonAppDataLocation, "Grids")))
    {
    	createFolder(joinPath(gCommonAppDataLocation, "Grids"));
    }


//	Log(lInfo) << "Saving column states";
//	for(int i = 0; i < mDBGrids.size(); i++)
//    {
//    	if(mDBGrids[i] != NULL)
//        {
//            string fName = joinPathU(gCommonAppDataLocation, "Grids", mDBGrids[i]->Name);
//		    mDBGrids[i]->Columns->SaveToFile(fName.c_str());
//        }
//    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::ShutDownTimerTimer(TObject *Sender)
{
	ShutDownTimer->Enabled = false;

	if(mLogFileReader.isRunning())
	{
		Log(lDebug) << "Shutting down log file reader";
		mLogFileReader.stop();
	}

    if(atdbDM->SQLConnection1->Connected)
    {
    	atdbDM->SQLConnection1->Connected = false;
    }

    Close();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::FormCloseQuery(TObject *Sender, bool &CanClose)
{
	Log(lInfo) << "Closing down....";

	//Check if we can close.. abort all threads..
	if(mLogFileReader.isRunning() || atdbDM->SQLConnection1->Connected)
    {
		CanClose = false;
    }
    else
    {
    	CanClose = true;
    }

	if(CanClose == false)
	{
		ShutDownTimer->Enabled = true;
	}
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::FormClose(TObject *Sender, TCloseAction &Action)
{
	Log(lInfo) << "In FormClose";
	mIniFileC->clear();

	//Save project history
	mBottomPanelHeight          	= BottomPanel->Height;
    BatchesGBHeight 				= BatchesGB->Height;

    mDustAssayResultImageHeight 	= mResultImagePanel->Height;
    mDustAssayBackGroundImageWidth 	= mBackgroundImagePanel->Width;


	mGeneralProperties.write();
    mCoverslipPrintingProperties.write();

	//Write to file
	mIniFileC->save();

	//Registry settings
	mSplashProperties.write();
}

