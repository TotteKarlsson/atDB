//---------------------------------------------------------------------------

#ifndef TMainFormH
#define TMainFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.DB.hpp>
#include <Data.DBXMySQL.hpp>
#include <Data.SqlExpr.hpp>
#include <Data.FMTBcd.hpp>
#include <Datasnap.DBClient.hpp>
#include <Datasnap.Provider.hpp>
#include <Vcl.DBCtrls.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
#include "TSTDStringLabeledEdit.h"
#include <Vcl.Mask.hpp>
#include <System.Actions.hpp>
#include <Vcl.ActnList.hpp>
#include "DbxDevartPostgreSQL.hpp"
//---------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:	// IDE-managed Components
	TSQLConnection *mySQLC;
	TDataSetProvider *usersDSP;
	TClientDataSet *usersCDS;
	TSQLDataSet *usersDS;
	TDataSource *usersDSource;
	TDBGrid *DBGrid1;
	TGroupBox *GroupBox1;
	TButton *AddUserBtn;
	TDBNavigator *DBNavigator1;
	TActionList *ActionList1;
	TAction *ConnectToDBA;
	TIntegerField *usersDSid;
	TWideStringField *usersDSuser_name;
	TSQLTimeStampField *usersDScreated;
	TIntegerField *usersCDSid;
	TWideStringField *usersCDSuser_name;
	TSQLTimeStampField *usersCDScreated;
	void __fastcall AddUserBtnClick(TObject *Sender);
	void __fastcall FormKeyDown(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall MaskEdit1Exit(TObject *Sender);

private:	// User declarations
public:		// User declarations
	__fastcall TMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
