#include <vcl.h>
#pragma hdrstop
#include "TCoverSlipScanFrame.h"
#include "TPGCoverSlipDataModule.h"
#include "TPGDataModule.h"
#include "mtkVCLUtils.h"
#include "atQueryBuilder.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TSTDStringLabeledEdit"
#pragma link "TIntegerLabeledEdit"
#pragma resource "*.dfm"
TCoverSlipScanFrame *CoverSlipScanFrame;

using namespace mtk;

//---------------------------------------------------------------------------
__fastcall TCoverSlipScanFrame::TCoverSlipScanFrame(TComponent* Owner)
	: TFrame(Owner)
{
}

void TCoverSlipScanFrame::populate(int csID)
{
	mCSID = csID;
    CSIDE->setValue(mCSID);
    if(pgDM && pgDM->isConnected())
    {
        enableDisableGroupBox(GroupBox1, true);
    }
    else
    {
        enableDisableGroupBox(GroupBox1, false);
        return;
    }

	SQLQuery1->Active 			= false;
    ClientDataSet1->Active 		= false;

    //Setup Query
    QueryBuilder qb;

    qb	<<"SELECT specimen.animal_id, slices.id as slice_id, blocks.id as block_id, blocks.status as block_status, ribbons.id as ribbon_id, ribbons.knife_id "
      	<<"FROM specimen "
        <<"JOIN slices ON (specimen.id = slices.specimen_id)"
      	<<"JOIN blocks ON (slices.id = blocks.slice_id) "
    	<<"JOIN ribbons ON (blocks.id = ribbons.block_id) "
    	<<"WHERE "
    	<<"    ribbons.coverslip_id = " << csID
    	<<";";

	SQLQuery1->SQL->Text = qb.asCString();

    //Execute Query
    SQLQuery1->Open();

    if(SQLQuery1->Fields->Count)
    {
        SQLQuery1->Active = true;
        ClientDataSet1->Active = true;
        ClientDataSet1->Refresh();

        if(ClientDataSet1->FieldByName("slice_id"))
        {
        	SliceIDE->Text = ClientDataSet1->FieldByName("slice_id")->AsString;
        }

        if(ClientDataSet1->FieldByName("animal_id"))
        {
        	AnimalIDE->Text = ClientDataSet1->FieldByName("animal_id")->AsString;
        }

        //Set all columnwidts
        int cols = DBGrid1->Columns->Count;
        for(int i = 0; i < cols; i++)
        {
            DBGrid1->Columns->Items[i]->Width = 200;
        }


    }



}

