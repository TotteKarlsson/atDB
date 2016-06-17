#pragma hdrstop
#include "TatDM.h"
#include "mtkVCLUtils.h"
#include <sstream>
#include "mtkLogger.h"

using namespace mtk;
using namespace std;
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "System.Classes.TPersistent"
#pragma link "DbxDevartSQLite"
#pragma resource "*.dfm"
TatDM *atDM;
//---------------------------------------------------------------------------
__fastcall TatDM::TatDM(TComponent* Owner)
	: TDataModule(Owner)
{}

void __fastcall TatDM::usersClientDataSetuser_nameGetText(TField *Sender,
          UnicodeString &Text, bool DisplayText)
{
	TWideMemoField* f = dynamic_cast<TWideMemoField*>(Sender);
    if(f == usersClientDataSetuser_name)
    {
		Text = f->AsString;
    }
    else if(f == usersClientDataSetcreated)
    {
        Text = f->AsString;
    }
}

void __fastcall TatDM::usersClientDataSetBeforePost(TDataSet *DataSet)
{
	if(usersClientDataSetuser_name->AsString.IsEmpty())
    {
		throw("Bad");
	}
}

//---------------------------------------------------------------------------
void __fastcall TatDM::usersClientDataSetBeforeApplyUpdates(TObject *Sender,
          OleVariant &OwnerData)
{
//	if()
    {
//        if(usersDSuser_name->AsString == "user name")
//        {
//            throw Exception("Bad user Name");
//        }
    }
//
//    if(usersDSuser_name->AsString.IsEmpty())
//    {
//        throw Exception("Name cannot be empty");
//    }
}

//---------------------------------------------------------------------------
void __fastcall TatDM::usersClientDataSetBeforeInsert(TDataSet *DataSet)
{
//    if(usersDSuser_name->AsString.IsEmpty())
//    {
//        throw Exception("Name cannot be empty");
//    }
}

//---------------------------------------------------------------------------
void __fastcall TatDM::usersClientDataSetAfterPost(TDataSet *DataSet)
{
	usersDS->FieldByName("user_name")->OnValidate(usersDS->FieldByName("user_name"));
	usersClientDataSet->ApplyUpdates(0);

}

//---------------------------------------------------------------------------
void __fastcall TatDM::usersClientDataSetAfterDelete(TDataSet *DataSet)
{
	usersClientDataSet->ApplyUpdates(0);
}

//---------------------------------------------------------------------------
void __fastcall TatDM::usersClientDataSetuser_nameValidate(TField *Sender)
{
	MessageDlg("Validating", mtWarning, TMsgDlgButtons() << mbOK, 0);
}

void __fastcall TatDM::usersClientDataSetAfterScroll(TDataSet *DataSet)
{
	;
}
//---------------------------------------------------------------------------

void __fastcall TatDM::usersClientDataSetAfterCancel(TDataSet *DataSet)

{
;
}

//---------------------------------------------------------------------------
void __fastcall TatDM::blocksCDSAfterPost(TDataSet *DataSet)
{
	blocksCDS->ApplyUpdates(0);
}


//---------------------------------------------------------------------------
void __fastcall TatDM::blocksCDSAfterDelete(TDataSet *DataSet)
{
	blocksCDS->ApplyUpdates(0);
}


//---------------------------------------------------------------------------
void __fastcall TatDM::blocksCDSAfterScroll(TDataSet *DataSet)
{
//	int bID = blocksCDS->FieldByName("id")->AsInteger;
//	blockNotesQ->Params->ParamByName("blockID")->AsInteger = bID;
//    blockNotesQ->Open();
//
//    //Get notes
//	string note = stdstr(blockNotesQ->FieldByName("note")->AsString);
//	Log(lInfo) << "Note is: "<<note;
//	blockNotesQ->Close();
}

//---------------------------------------------------------------------------
void __fastcall TatDM::blockNotesDSetAfterPost(TDataSet *DataSet)
{
//	blockNotesDSet->ApplyUpdates(0);

}


void __fastcall TatDM::usersDSuser_nameValidate(TField *Sender)
{
//	if(Sender == )
//    {
//
//    }
}

//---------------------------------------------------------------------------
void __fastcall TatDM::blocksCDSBeforePost(TDataSet *DataSet)
{
	Log(lInfo) << "Before Posting Block Data";
}
