#include <vcl.h>
#pragma hdrstop
#include "TRegisterFreshCSBatchForm.h"
#include "TCoverSlipDataModule.h"
#include "TATDBDataModule.h"
#include "mtkLogger.h"
#include <sstream>
#include <System.DateUtils.hpp>
using namespace mtk;
using namespace std;

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "pBarcode2D"
#pragma link "pCore2D"
#pragma link "pDataMatrixEcc200"
#pragma link "pDBBarcode2D"
#pragma link "TIntegerLabeledEdit"
#pragma resource "*.dfm"
TRegisterFreshCSBatchForm *RegisterFreshCSBatchForm;

//---------------------------------------------------------------------------
__fastcall TRegisterFreshCSBatchForm::TRegisterFreshCSBatchForm(TComponent* Owner)
	: TForm(Owner)
{
////    csDM->csFreshbatchesCDS->Active = false;
//	csDM->csFreshbatchesCDS->CommandText = "SELECT * from freshcsbatch where DATE(date_created) = CURDATE()";
//    csDM->csFreshbatchesCDS->Execute();
//    csDM->csFreshbatchesCDS->Active = true;

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

    q->SQLConnection = atdbDM->SQLConnection1;
    stringstream sq;
    sq << "SELECT COUNT(*) FROM freshCSbatch";
    q->SQL->Add(sq.str().c_str());
	q->Open();
    int rows = q->FieldByName("COUNT(*)")->AsInteger;
    delete q;
    return rows;
}
//---------------------------------------------------------------------------
void __fastcall TRegisterFreshCSBatchForm::mRegisterBtnClick(TObject *Sender)
{
	//Insert/create a new batch
    int count = mCSCount->getValue();
    TSQLQuery* q = new TSQLQuery(NULL);
    int csType = csDM->csTypeCDS->FieldByName("id")->AsInteger;

    //Parse date time
    TDateTime dt 	= mDT->DateTime;
    int 	year 	= YearOf(dt) - 2000;
    string 	month 	= Month(MonthOf(dt));
    int 	day   	= DayOf(dt);

    //Get nr of batches created today
    int batchCnt = nrOfFreshBatchesToday();
    string 	dayBatchNr("0" + mtk::toString(batchCnt + 1));

    stringstream lbl;
    lbl << year << month << day<<dayBatchNr;

    q->SQLConnection = atdbDM->SQLConnection1;
    stringstream sq;
    sq << "INSERT into freshCSbatch (count, batchcode, type) VALUES ("<<count<<", '" <<lbl.str() <<"', '"<<csType<<"')";

    q->SQL->Add(sq.str().c_str());
    q->ExecSQL();
	csDM->csFreshBatchesCDS->ApplyUpdates(0);
    csDM->csFreshBatchesCDS->Refresh();

	//Get last insert id, create and associate 'count' coverslips
    TSQLQuery* tq = new TSQLQuery(NULL);
    tq->SQLConnection = atdbDM->SQLConnection1;

    tq->SQL->Add("SELECT LAST_INSERT_ID();");
    tq->Open();
    int id = tq->Fields->operator [](0)->AsInteger;
    tq->Close();

    //Associate count coverslips with this batch
	stringstream qs;
    qs <<"INSERT INTO coverslip (status, type, freshCSBatch) VALUES ";
    for(int i = 0; i < count; i++)
    {
	    qs<<"(1,"<<csType <<","<<id<<")";
        if(i < count-1)
        {
	    	qs<<",";
        }
    }
    tq->SQL->Clear();
    tq->SQL->Add(qs.str().c_str());
	tq->ExecSQL();
    delete tq;
    delete q;
    Log(lInfo) << "The id: "<<id;

    Sleep(1000);
    Close();
}

//Restore the filter
void __fastcall TRegisterFreshCSBatchForm::FormClose(TObject *Sender, TCloseAction &Action)
{
//    csDM->csFreshbatchesCDS->Active = false;
//	csDM->csFreshbatchesCDS->CommandText = "SELECT * from freshcsbatch";
//    csDM->csFreshbatchesCDS->Execute();
//    csDM->csFreshbatchesCDS->Active = true;

}

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


