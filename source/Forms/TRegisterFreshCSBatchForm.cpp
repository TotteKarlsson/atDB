#include <vcl.h>
#pragma hdrstop
#include "TRegisterFreshCSBatchForm.h"
#include "TPGCoverSlipDataModule.h"
#include "TPGDataModule.h"
#include "mtkLogger.h"
#include <sstream>
#include <System.DateUtils.hpp>
using namespace mtk;
using namespace std;

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TIntegerLabeledEdit"
#pragma link "TSTDStringLabeledEdit"
#pragma resource "*.dfm"
TRegisterFreshCSBatchForm *RegisterFreshCSBatchForm;

//---------------------------------------------------------------------------
__fastcall TRegisterFreshCSBatchForm::TRegisterFreshCSBatchForm(TComponent* Owner)
	: TForm(Owner)
{
////    csPGDM->csFreshbatchesCDS->Active = false;
//	csPGDM->csFreshbatchesCDS->CommandText = "SELECT * from freshcsbatch where DATE(date_created) = CURDATE()";
//    csPGDM->csFreshbatchesCDS->Execute();
//    csPGDM->csFreshbatchesCDS->Active = true;

}

string Month(int month)
{
	switch(month)
    {
    	case 1:     return "JAN";
    	case 2:     return "FEB";
    	case 3:     return "MAR";
    	case 4:     return "APR";
    	case 5:     return "MAY";
    	case 6:     return "JUN";
    	case 7:     return "JUL";
    	case 8:     return "AUG";
    	case 9:     return "SEP";
    	case 10:    return "OCT";
    	case 11:    return "NOV";
    	case 12:    return "DEC";
		default: 	return "NAN";
    }
}

int nrOfFreshBatchesToday()
{
    TSQLQuery* q = new TSQLQuery(NULL);
    q->SQLConnection = pgDM->SQLConnection1;
    stringstream sq;
    sq << "SELECT COUNT(*) FROM freshCSbatches";
    q->SQL->Add(sq.str().c_str());
	q->Open();
    int rows = q->FieldByName("COUNT(*)")->AsInteger;
    delete q;
    return rows;
}
//---------------------------------------------------------------------------
void __fastcall TRegisterFreshCSBatchForm::mRegisterBtnClick(TObject *Sender)
{

    if(mCoverSlipLOTE->Text.Length() < 1 || mBoxof100NrEdit->Text.Length() < 1)
    {
    	MessageDlg("Both Lot number and Box (of 100) number must be filled out!", mtError, TMsgDlgButtons() << mbOK, 0);
    	return;
    }

	//Insert/create a new batch
    int count = mCSCount->getValue();
    TSQLQuery* q = new TSQLQuery(NULL);
    q->SQLConnection = pgDM->SQLConnection1;

    int csType = csPGDM->csTypeCDS->FieldByName("id")->AsInteger;

    //Parse date time
    TDateTime dt 	= mDT->DateTime;
    int 	year 	= YearOf(dt) - 2000;
    string 	month 	= Month(MonthOf(dt));
    int 	day   	= DayOf(dt);

    stringstream sq;
    sq << "INSERT into freshCSbatches (count, lot_number, box_number, type) VALUES ("
    		<<count<<", '" <<mCoverSlipLOTE->getValue()<<"', '"<<mBoxof100NrEdit->getValue()<<"', '"<<csType<<"') RETURNING id";

    q->SQL->Add(sq.str().c_str());
    q->Open();

    int insert_id = q->FieldByName("id")->AsInteger;

	csPGDM->csFreshBatchesCDS->ApplyUpdates(0);
    csPGDM->csFreshBatchesCDS->Refresh();

	//Get last insert id, create and associate 'count' coverslips
    TSQLQuery* tq = new TSQLQuery(NULL);
    tq->SQLConnection = pgDM->SQLConnection1;

    //Associate count coverslips with this batch
	stringstream qs;
    qs <<"INSERT INTO coverslips (status, type, freshCSBatch, from_lot) VALUES ";
    for(int i = 0; i < count; i++)
    {
	    qs<<"(1,"<<csType <<","<<insert_id<<", \'"<<mCoverSlipLOTE->getValue()<<"\')";
        if(i < count-1)
        {
	    	qs<<",";
        }
    }
    tq->SQL->Add(qs.str().c_str());
	tq->ExecSQL();
    delete tq;
    delete q;
    Log(lInfo) << "Batch ID: "<<insert_id;
    Sleep(1000);
    Close();
    csPGDM->csCDS->Refresh();
}

//Restore the filter
void __fastcall TRegisterFreshCSBatchForm::FormKeyDown(TObject *Sender, WORD &Key, TShiftState Shift)
{
    if(Key == VK_ESCAPE)
    {
        Close();
    }
}

//---------------------------------------------------------------------------
void __fastcall TRegisterFreshCSBatchForm::FormShow(TObject *Sender)
{
	//Select the first item in the coverslip type CB list
	SendMessage(mCSTypeLookup->Handle, WM_KEYDOWN, VK_DOWN, 0);
    mDT->Date = Date();
}


