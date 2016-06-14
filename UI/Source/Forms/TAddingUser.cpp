#include <vcl.h>
#pragma hdrstop
#include "TAddingUser.h"
#include "atDBDataModule.h"
#include <sstream>
#include "mtkVCLUtils.h"
#include "mtkLogger.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TSTDStringLabeledEdit"
#pragma resource "*.dfm"
TAddUserForm *AddUserForm;
using namespace std;
using namespace mtk;
//---------------------------------------------------------------------------
__fastcall TAddUserForm::TAddUserForm(TComponent* Owner)
	: TForm(Owner)
{
}

//---------------------------------------------------------------------------
void __fastcall TAddUserForm::mUserNameEKeyDown(TObject *Sender, WORD &Key, TShiftState Shift)
{
    if(Key == vkReturn)
    {
//    	try
//        {
//            stringstream q;
//            q <<"INSERT INTO users (user_name) VALUES (\""<<stdstr(mUserNameE->Text)<<"\")";
//            SQLQuery1->Close();
//            SQLQuery1->SQL->Add(q.str().c_str());
//            int i = SQLQuery1->ExecSQL(true);
//			Log(lInfo) << "DataSet: "<<stdstr(SQLQuery1->DataSource->DataSet->Name)<<" was updated";
//        }
//        catch(Exception& E)
//        {
//			Log(lError) << "Exception raised with message" + stdstr(E.Message);
//        }
		Close();
    }
}



