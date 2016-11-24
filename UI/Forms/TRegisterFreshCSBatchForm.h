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
//---------------------------------------------------------------------------
class TRegisterFreshCSBatchForm : public TForm
{
__published:	// IDE-managed Components
	TDateTimePicker *DateTimePicker1;
	TIntegerLabeledEdit *mCSCount;
	TDBLookupComboBox *DBLookupComboBox1;
	TLabel *Label1;
	TButton *Button1;
	TLabel *Label2;
	TBarcode2D_DataMatrixEcc200 *Barcode2D_DataMatrixEcc2001;
	TImage *Image1;
	TDBBarcode2D *DBBarcode2D1;
	TDBGrid *DBGrid1;
	TLabel *Label3;
	TDataSource *DataSource1;
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
private:	// User declarations
public:		// User declarations
	__fastcall TRegisterFreshCSBatchForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRegisterFreshCSBatchForm *RegisterFreshCSBatchForm;
//---------------------------------------------------------------------------
#endif
