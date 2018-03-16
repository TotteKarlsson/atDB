//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#include "TScanForm.h"
#include "mtkLogger.h"
#include "TCoverSlipScanFrame.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TScanForm *ScanForm;

using namespace mtk;


//---------------------------------------------------------------------------
__fastcall TScanForm::TScanForm(TComponent* Owner)
	: TForm(Owner),
    CSFrame(NULL)
{
}
//---------------------------------------------------------------------------
void __fastcall TScanForm::FormKeyDown(TObject *Sender, WORD &Key, TShiftState Shift)
{
    if(Key == VK_ESCAPE)
    {
        Close();
    }
}

void TScanForm::populate(const string& barcode)
{
	mBCBuilder.setBarCode(barcode);
	onCSBarcode(mBCBuilder.getBarCodeValue());
	mBCBuilder.reset();
}

//---------------------------------------------------------------------------
void __fastcall TScanForm::FormKeyPress(TObject *Sender, System::WideChar &Key)
{
	//Intercept string sent from barcode reader
	Log(lInfo) << "Got key.." << (char) Key;
	mBCBuilder.build((char) Key);

    if(Key == '\r')
    {
    	Log(lInfo) << "Got new line.";
        //Check character buffer
        if(mBCBuilder.hasBarCode())
        {
            //Check what we scanned..
            onCSBarcode(mBCBuilder.getBarCodeValue());
        }
		mBCBuilder.reset();
    }
}

void TScanForm::onCSBarcode(int csID)
{
	if(!CSFrame)
    {
		CSFrame = new TCoverSlipScanFrame(this);
        CSFrame->Parent = this;
    }

    CSFrame->GroupBox1->Caption = "Information for coverslip with ID: " + IntToStr(csID);
    CSFrame->populate(csID);

}
