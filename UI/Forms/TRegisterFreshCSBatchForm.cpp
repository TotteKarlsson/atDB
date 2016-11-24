#include <vcl.h>
#pragma hdrstop
#include "TRegisterFreshCSBatchForm.h"
#include "TCoverSlipDataModule.h"
#include "TATDBDataModule.h"
#include "mtkLogger.h"
#include <sstream>
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

//---------------------------------------------------------------------------
void __fastcall TRegisterFreshCSBatchForm::Button1Click(TObject *Sender)
{
//	//Insert/create a new batch
//    TSQLQuery* q = new TSQLQuery(NULL);
//    q->SQLConnection = atdbDM->SQLConnection1;
//    q->SQL->Add("INSERT into freshCSbatch (count, batchcode) VALUES (100, '16F1223')");
//    q->ExecSQL();
//
//	csDM->csFreshbatchesCDS->ApplyUpdates(0);
//    csDM->csFreshbatchesCDS->Refresh();
//
//    TSQLQuery* tq = new TSQLQuery(NULL);
//    tq->SQLConnection = atdbDM->SQLConnection1;
//
//    tq->SQL->Add("SELECT LAST_INSERT_ID();");
//    tq->Open();
//    int id = tq->Fields->operator [](0)->AsInteger;
//    tq->Close();
//
//    //Associate count coverslips with this batch
//	stringstream qs;
//    qs <<"INSERT INTO coverslip (status, type, freshCSBatch) VALUES ";
//    int count = mCSCount->getValue();
//    for(int i = 0; i < 10; i++)
//    {
//	    qs<<"(1,1,"<<id<<")";
//        if(i < count-1)
//        {
//	    	qs<<",";
//        }
//    }
//    tq->SQL->Clear();
//    tq->SQL->Add(qs.str().c_str());
//	tq->ExecSQL();
//    delete tq;
//    delete q;
//
//    Log(lInfo) << "The id: "<<id;
}

//Restore the filter
void __fastcall TRegisterFreshCSBatchForm::FormClose(TObject *Sender, TCloseAction &Action)
{
//    csDM->csFreshbatchesCDS->Active = false;
//	csDM->csFreshbatchesCDS->CommandText = "SELECT * from freshcsbatch";
//    csDM->csFreshbatchesCDS->Execute();
//    csDM->csFreshbatchesCDS->Active = true;

}

