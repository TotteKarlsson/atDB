#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
#include <Vcl.Styles.hpp>
#include <Vcl.Themes.hpp>
#include "TPGImagesAndMoviesDataModule.h"
#include "mtkUtils.h"
#include "mtkVCLUtils.h"
#include "mtkIniKey.h"
#include "mtkRestartApplicationUtils.h"
#include "mtkLogger.h"
#include "Core/atDBUtilities.h"
#include "mtkMoleculixException.h"
#include "database/mtkSQLite.h"

USEFORM("TMainForm.cpp", MainForm);
USEFORM("P:\libs\atapi\source\vcl\frames\TMoviesFrame.cpp", MoviesFrame); /* TFrame: File Type */
USEFORM("P:\libs\atapi\source\vcl\frames\TPGConnectionFrame.cpp", PGConnectionFrame); /* TFrame: File Type */
USEFORM("P:\libs\atapi\source\vcl\frames\TSyncMySQLToPostgresFrame.cpp", SyncMySQLToPostgresFrame); /* TFrame: File Type */
USEFORM("P:\libs\atapi\source\vcl\frames\TImagesFrame.cpp", ImagesFrame); /* TFrame: File Type */
USEFORM("P:\libs\atapi\source\vcl\datamodules\TPGCoverSlipDataModule.cpp", csPGDM); /* TDataModule: File Type */
USEFORM("P:\libs\atapi\source\vcl\datamodules\TPGDataModule.cpp", pgDM); /* TDataModule: File Type */
USEFORM("Forms\TAboutATDBForm.cpp", AboutATDBForm);
USEFORM("Forms\TBlockForm.cpp", BlockForm);
USEFORM("Forms\TSpecimenForm.cpp", SpecimenForm);
USEFORM("Frames\TTableFrame.cpp", TableFrame); /* TFrame: File Type */
USEFORM("Forms\TSlicesForm.cpp", SlicesForm);
USEFORM("Forms\TCoverSlipForm.cpp", CoverSlipForm);
USEFORM("Forms\TPrintLabelForm.cpp", PrintLabelForm);
USEFORM("Forms\TRegisterFreshCSBatchForm.cpp", RegisterFreshCSBatchForm);
//---------------------------------------------------------------------------
#pragma package(smart_init)

using namespace mtk;
using std::string;

extern HWND         gOtherAppWindow             = NULL;
extern string       gApplicationRegistryRoot    = "\\Software\\Smith Lab\\atDB\\0.5.0";
extern string       gAppMutexName           	= "ATDBAppMutex";
extern bool 		gAppIsStartingUp 			= true;
extern string       gRestartMutexName           = "ATDBRestartMutex";
extern string       gFullDateTimeFormat         = "%Y-%m-%dT%H:%M:%S";
extern string       gDateFormat                 = "%Y-%m-%d";
extern string       gTimeFormat                 = "%H:%M:%S";
extern string       gCommonAppDataLocation      = ""; //Filled out later
extern string       gLogFileLocation            = "";
extern string       gLogFileName                = "atDB.log";
extern bool         gIsDevelopmentRelease       = false;


BOOL CALLBACK FindOtherWindow(HWND hwnd, LPARAM lParam) ;

//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
    //The app mutex is used to check for already running instances
    try
    {
		// Initialize restart code
		// Check if this instance is restarted and
		// wait while previos instance finish
		if (mtk::checkForCommandLineFlag("--Restart"))
		{
			mtk::WaitForPreviousProcessToFinish(gRestartMutexName);
		}
        else
        {
            //Look at this later... does not work yet
            HANDLE appMutex = ::CreateMutexA(NULL, FALSE, gAppMutexName.c_str());
            int err = GetLastError();
            if( ERROR_ALREADY_EXISTS == err)
            {
                // Program already running somewhere
                ::EnumWindows(FindOtherWindow, NULL);

                if(gOtherAppWindow != NULL)
                {
                	MessageDlg("ATDB is already running!", mtWarning, TMsgDlgButtons() << mbOK, 0);
                    //Send a custom message to restore window here..
                    ::SwitchToThisWindow(gOtherAppWindow, false);
                }

                return(0); // Exit program
            }
        }

        setupLogging();
        Log(lInfo) << "The Logfile was opened..";

        //Setup globals
        gCommonAppDataLocation = joinPath(getSpecialFolder(CSIDL_LOCAL_APPDATA), "atDB");
        if(!folderExists(gCommonAppDataLocation))
        {
            Log(lError) << "The local app data folder("<<gCommonAppDataLocation<<") don't exists! Catastrophe..";
        }

        Application->Initialize();
        Application->MainFormOnTaskBar = true;

		TStyleManager::TrySetStyle("Iceberg Classico");
		Application->Title = "atDB";
        Application->ProcessMessages();


		Application->CreateForm(__classid(TpgDM), &pgDM);
		Application->CreateForm(__classid(TcsPGDM), &csPGDM);
		Application->CreateForm(__classid(TPGConnectionFrame), &PGConnectionFrame);
		Application->CreateForm(__classid(TPGImagesAndMoviesDM), &PGImagesAndMoviesDM);
		Application->CreateForm(__classid(TMainForm), &MainForm);
		Application->CreateForm(__classid(TImagesFrame), &ImagesFrame);
		Application->CreateForm(__classid(TMoviesFrame), &MoviesFrame);
		Application->CreateForm(__classid(TSyncMySQLToPostgresFrame), &SyncMySQLToPostgresFrame);
		Application->ShowMainForm = true;
		Application->Run();

        // Finish restarting process if needed
        DoRestartProcessFinish();
	}
	catch (Exception &exception)
	{
		Application->ShowException(&exception);
	}
	catch(const MoleculixException &e)
	{
		throw Exception(e.what());
	}

	catch (...)
	{
		try
		{
			throw Exception("There was something bad happening! We have to close atDB.");
		}
		catch (Exception &exception)
		{
			Application->ShowException(&exception);
		}
	}
	return 0;
}
