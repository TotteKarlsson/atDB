#include <vcl.h>
#pragma hdrstop
#include "TMainForm.h"
#include "mtkLogger.h"
#include "mtkVCLUtils.h"
#include "TSpecimenForm.h"

using namespace mtk;


//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TMainForm *MainForm;
//---------------------------------------------------------------------------
extern bool gAppIsStartingUp;
__fastcall TMainForm::TMainForm(TComponent* Owner)
	: TForm(Owner)
{

}
//---------------------------------------------------------------------------
void __fastcall TMainForm::FormShow(TObject *Sender)
{

    bool connected = false;
	gAppIsStartingUp = false;
    try
    {
	    connected = atdbDM->connect("127.0.0.1", "atdb_client", "atdb123", "atdb");
	    atdbDM->afterConnect();
    }
    catch (const TDBXError &e)
	{
    	Log(lInfo) << "There was a database connection issue: "<<stdstr(e.Message);
	}
	UserCB->KeyValue = 27;
}

TDateTime __fastcall NowUTC()
{
  SYSTEMTIME SystemTime;
  ::GetSystemTime(&SystemTime);
  return EncodeDate(SystemTime.wYear, SystemTime.wMonth, SystemTime.wDay) + EncodeTime(SystemTime.wHour, SystemTime.wMinute, SystemTime.wSecond, SystemTime.wMilliseconds);
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::DBNavigator1Click(TObject *Sender, TNavigateBtn Button)

{
	switch(Button)
    {
    	case nbInsert:
        {
                atdbDM->specimenCDS->FieldByName("animal_id")->Value = "XXXX-XX";
                atdbDM->specimenCDS->FieldByName("entered_by")->Value = UserCB->KeyValue;

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
        break;
    }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::DBGrid1DblClick(TObject *Sender)
{
    openSpecimenForm();
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
//---------------------------------------------------------------------------
void __fastcall TMainForm::FormKeyDown(TObject *Sender, WORD &Key, TShiftState Shift)
{
    if(Key == VK_ESCAPE)
    {
        Close();
    }
}


