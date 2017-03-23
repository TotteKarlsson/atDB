//---------------------------------------------------------------------------

#ifndef TTableFrameH
#define TTableFrameH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.DB.hpp>
#include <Data.FMTBcd.hpp>
#include <Data.SqlExpr.hpp>
#include <Datasnap.DBClient.hpp>
#include <Datasnap.Provider.hpp>
#include <Vcl.DBCtrls.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
#include <string>
//---------------------------------------------------------------------------
using std::string;
class TTableFrame : public TFrame
{
__published:	// IDE-managed Components
	TGroupBox *GroupBox1;
	TDBGrid *DBGrid1;
	TDBNavigator *DBNavigator1;
	TDataSource *DataSource1;
	TClientDataSet *ClientDataSet1;
	TDataSetProvider *DataSetProvider1;
	TSQLDataSet *SQLDataSet1;


private:	// User declarations
	TSQLConnection* 		 mDBConnection;
public:		// User declarations
				__fastcall TTableFrame(TComponent* Owner);
    bool					loadTable(const string& t);
    void					assignDBconnection(TSQLConnection* c);

};
//---------------------------------------------------------------------------
extern PACKAGE TTableFrame *TableFrame;
//---------------------------------------------------------------------------
#endif
