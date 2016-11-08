#pragma hdrstop
#include "TCoverSlipDataModule.h"
#include "TATDBDataModule.h"
#include "mtkLogger.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "System.Classes.TPersistent"
#pragma resource "*.dfm"
TcsDM *csDM;
using namespace mtk;

//---------------------------------------------------------------------------
__fastcall TcsDM::TcsDM(TComponent* Owner)
	: TDataModule(Owner),
    csDustAssayCDSOnDataChanged(NULL)
{
}

void __fastcall TcsDM::afterConnect()
{
	Log(lInfo) << "Initializing coverslip datamodule";
    csCDS->Active = true;
    csStatusCDS->Active = true;
    csTypeCDS->Active = true;
    csDustAssayCDS->Active = true;
}

void __fastcall TcsDM::afterDisConnect()
{
}

//---------------------------------------------------------------------------
void __fastcall TcsDM::csDSBeforeOpen(TDataSet *DataSet)
{
//	Log(lInfo) <<"Opening coverslip dataset";
}

//---------------------------------------------------------------------------
void __fastcall TcsDM::CDSAfterPost(TDataSet *DataSet)
{
	TClientDataSet* cds = dynamic_cast<TClientDataSet*>(DataSet);

    if(!cds)
    {
    	return;
    }

	cds->ApplyUpdates(0);
    cds->Refresh();
}

void __fastcall TcsDM::CDSAfterDelete(TDataSet *DataSet)
{
	TClientDataSet* cds = dynamic_cast<TClientDataSet*>(DataSet);

    if(!cds)
    {
    	return;
    }

	cds->ApplyUpdates(0);
    cds->Refresh();
}

//---------------------------------------------------------------------------
void __fastcall TcsDM::CDSAfterScroll(TDataSet *DataSet)
{
 	if(DataSet == csCDS)
    {
    	if(csDustAssayCDS->Active)
        {
        	csDustAssayCDS->Refresh();
        }
    }
}

//---------------------------------------------------------------------------
void __fastcall TcsDM::csDustAsssayDSourceDataChange(TObject *Sender, TField *Field)
{
	if(csDustAssayCDSOnDataChanged)
    {
    	csDustAssayCDSOnDataChanged(Sender);
    }
}


