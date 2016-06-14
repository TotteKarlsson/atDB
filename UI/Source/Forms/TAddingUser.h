//---------------------------------------------------------------------------

#ifndef TAddingUserH
#define TAddingUserH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.DB.hpp>
#include <Data.FMTBcd.hpp>
#include <Data.SqlExpr.hpp>
#include <Vcl.DBCtrls.hpp>
#include <Vcl.Mask.hpp>
#include "TSTDStringLabeledEdit.h"
#include <Vcl.ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TAddUserForm : public TForm
{
__published:	// IDE-managed Components
	TDBEdit *DBEdit1;
	void __fastcall mUserNameEKeyDown(TObject *Sender, WORD &Key, TShiftState Shift);

private:	// User declarations
public:		// User declarations
	__fastcall TAddUserForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAddUserForm *AddUserForm;
//---------------------------------------------------------------------------
#endif
