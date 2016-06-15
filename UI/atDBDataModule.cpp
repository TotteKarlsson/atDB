#pragma hdrstop
#include "atDBDataModule.h"
#include "mtkVCLUtils.h"

using namespace mtk;
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "System.Classes.TPersistent"
#pragma link "DbxDevartSQLite"
#pragma resource "*.dfm"
TDataModule1 *DataModule1;
//---------------------------------------------------------------------------
__fastcall TDataModule1::TDataModule1(TComponent* Owner)
	: TDataModule(Owner)
{
}

void __fastcall TDataModule1::usersClientDataSetuser_nameGetText(TField *Sender,
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

//---------------------------------------------------------------------------
void __fastcall TDataModule1::usersClientDataSetBeforeApplyUpdates(TObject *Sender,
          OleVariant &OwnerData)
{
//	if(Sender == usersDSuser_name)
//    {
//        if(usersDSuser_name->AsString == "user name")
//        {
//            throw Exception("Bad user Name");
//        }
//    }
//
//    if(usersDSuser_name->AsString.IsEmpty())
//    {
//        throw Exception("Name cannot be empty");
//    }
}

//---------------------------------------------------------------------------
void __fastcall TDataModule1::usersClientDataSetBeforeInsert(TDataSet *DataSet)
{
//    if(usersDSuser_name->AsString.IsEmpty())
//    {
//        throw Exception("Name cannot be empty");
//    }
}
//---------------------------------------------------------------------------

void __fastcall TDataModule1::usersClientDataSetAfterPost(TDataSet *DataSet)
{
	usersClientDataSet->ApplyUpdates(0);
}

//---------------------------------------------------------------------------
void __fastcall TDataModule1::usersClientDataSetAfterDelete(TDataSet *DataSet)
{
	usersClientDataSet->ApplyUpdates(0);
}

//---------------------------------------------------------------------------
void __fastcall TDataModule1::usersClientDataSetuser_nameValidate(TField *Sender)

{
	MessageDlg("Validating", mtWarning, TMsgDlgButtons() << mbOK, 0);
}


void __fastcall TDataModule1::usersClientDataSetAfterScroll(TDataSet *DataSet)

{
	;
}
//---------------------------------------------------------------------------

void __fastcall TDataModule1::usersClientDataSetAfterCancel(TDataSet *DataSet)

{
;
}

//---------------------------------------------------------------------------
void __fastcall TDataModule1::blocksCDSAfterPost(TDataSet *DataSet)
{
	blocksCDS->ApplyUpdates(0);
}


//---------------------------------------------------------------------------
void __fastcall TDataModule1::blocksCDSAfterDelete(TDataSet *DataSet)
{
	blocksCDS->ApplyUpdates(0);
}


