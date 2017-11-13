#pragma hdrstop
#include "TMainForm.h"
#include "mtkVCLUtils.h"
#include "mtkLogger.h"
#include "TAboutATDBForm.h"
#include "TPGDataModule.h"
#pragma package(smart_init)
#include "TCoverSlipForm.h"

using Poco::DateTimeFormatter;

using namespace mtk;

extern HWND gOtherAppWindow;
void __fastcall TMainForm::FormKeyDown(TObject *Sender, WORD &Key, TShiftState Shift)
{
    if(Key == VK_ESCAPE)
    {
        Close();
    }
    else if(Key == VK_RETURN)
    {
    	string bc(mBCBuilder.getBarCode());
    	//handle barcode
        bc = trimChars(bc,"\r \n");
        if(bc.size() == 8 && bc[0] == 'C')
        {
        	Log(lInfo) << "Current barcode is: " << bc;
			TCoverSlipForm *cs = new TCoverSlipForm(bc, this);
            cs->ShowModal();


        }

        mBCBuilder.reset();
    }

}

void __fastcall TMainForm::FormKeyPress(TObject *Sender, System::WideChar &Key)
{
    //Check barcode from reader
    mBCBuilder.build((char) Key);
}



void __fastcall TMainForm::OpenAboutFormAExecute(TObject *Sender)
{
	TAboutATDBForm* f = new TAboutATDBForm(this);
    f->ShowModal();
    delete f;
}

void __fastcall TMainForm::ClearMemoAExecute(TObject *Sender)
{
    infoMemo->Clear();
}

int TMainForm::getCurrentUserID()
{
	int i = UsersCB->KeyValue;
	return  i;
}

void TMainForm::setupWindowTitle()
{
	string title = createWindowTitle("ATDB", Application);
	this->Caption = vclstr(title);
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::LogLevelCBChange(TObject *Sender)
{
    if(LogLevelCB->ItemIndex == 0)
    {
        mLogLevel = lInfo;
    }
    else if(LogLevelCB->ItemIndex == 1)
    {
        mLogLevel = lAny;
    }

    gLogger.setLogLevel(mLogLevel);
}


BOOL CALLBACK FindOtherWindow(HWND hwnd, LPARAM lParam)
{
	static TCHAR buffer[50];
	GetWindowText(hwnd, buffer, 50);

	if(_tcsstr(buffer, "atDB"))
	{
		// do something with hwnd here
		gOtherAppWindow = hwnd;
		return FALSE;
	}

	return TRUE;
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::AppInBox(mlxStructMessage &msg)
{
    if(msg.lparam == NULL)
    {
        return;
    }

    try
    {
        ApplicationMessageEnum aMsg = msg.lparam->mMessageEnum;

        switch(aMsg)
        {
            case amSplashWasClosed:
                Log(lDebug2) << "Splash form sent message that it was closed";
//                gSplashForm = NULL;
            break;

            default:
            break ;
        }
	}
	catch(...)
	{
		Log(lError) << "Received an unhandled windows message!";
	}
}




