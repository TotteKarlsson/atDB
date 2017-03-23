//---------------------------------------------------------------------------

#ifndef TRegisterFreshCSBatchFormH
#define TRegisterFreshCSBatchFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "pBarcode2D.hpp"
#include "pCore2D.hpp"
#include "pDataMatrixEcc200.hpp"
#include "pDBBarcode2D.hpp"
#include "TIntegerLabeledEdit.h"
#include <Vcl.ComCtrls.hpp>
#include <Vcl.DBCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Data.DB.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.Mask.hpp>
 //---------------------------------------------------------------------------
class TRegisterFreshCSBatchForm : public TForm
{
__published:	// IDE-managed Components
	TDateTimePicker *mDT;
	TIntegerLabeledEdit *mCSCount;
	TDBLookupComboBox *mCSTypeLookup;
	TLabel *Label1;
	TButton *mRegisterBtn;
	TLabel *Label2;
	void __fastcall mRegisterBtnClick(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall FormKeyDown(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall FormShow(TObject *Sender);

private:	// User declarations
public:		// User declarations
	__fastcall TRegisterFreshCSBatchForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRegisterFreshCSBatchForm *RegisterFreshCSBatchForm;
//---------------------------------------------------------------------------
#endif
