#include <vcl.h>
#pragma hdrstop
#include "TTableFrame.h"
#include "mtkVCLUtils.h"

using namespace mtk;


//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TTableFrame *TableFrame;
//---------------------------------------------------------------------------
__fastcall TTableFrame::TTableFrame(TComponent* Owner)
	: TFrame(Owner)
{
}

void TTableFrame::assignDBconnection(TSQLConnection* c)
{
	mDBConnection = c;
	SQLDataSet1->SQLConnection = mDBConnection;
}

//---------------------------------------------------------------------------
bool TTableFrame::loadTable(const string& t)
{
	if(!mDBConnection || mDBConnection->Connected == false)
    {
    	MessageDlg("You need to connect to remote ATDB database!", mtWarning, TMsgDlgButtons() << mbOK, 0);
        return false;
    }

	String tableName = vclstr(t);
	SQLDataSet1->Active = false;
    ClientDataSet1->Active = false;
    SQLDataSet1->CommandText = "SELECT * FROM " + tableName ;

	SQLDataSet1->Active = true;
    ClientDataSet1->Active = true;
    ClientDataSet1->Refresh();

    //Set all columnwidts
	int cols = DBGrid1->Columns->Count;
    for(int i = 0; i < cols; i++)
    {
		DBGrid1->Columns->Items[i]->Width = 200;
    }
	return true;
}

