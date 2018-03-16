#ifndef TCoverSlipScanFrameH
#define TCoverSlipScanFrameH
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "TSTDStringLabeledEdit.h"
#include <Data.DB.hpp>
#include <Data.FMTBcd.hpp>
#include <Data.SqlExpr.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.Grids.hpp>
#include <Datasnap.DBClient.hpp>
#include <Datasnap.Provider.hpp>
#include "TIntegerLabeledEdit.h"

//---------------------------------------------------------------------------
class TCoverSlipScanFrame : public TFrame
{
    __published:
        TGroupBox *GroupBox1;
	TDataSource *DataSource1;
	TDBGrid *DBGrid1;
	TDataSetProvider *DataSetProvider1;
	TClientDataSet *ClientDataSet1;
	TSQLQuery *SQLQuery1;
	TGroupBox *GroupBox2;
	TIntegerLabeledEdit *CSIDE;
	TLabeledEdit *SliceIDE;
	TGroupBox *GroupBox3;
	TLabeledEdit *AnimalIDE;
	TPanel *Panel1;
    private:
    	int					mCSID;

    public:
    			__fastcall 	TCoverSlipScanFrame(TComponent* Owner);
		void				populate(int csID);

};

extern PACKAGE TCoverSlipScanFrame *CoverSlipScanFrame;
#endif
