#ifndef TMainFormH
#define TMainFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "TATDBDataModule.h"
#include <Vcl.DBGrids.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.DBCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:	// IDE-managed Components
	TDBGrid *DBGrid1;
	TDBNavigator *SpecimenNavigator;
	TGroupBox *GroupBox1;
	TPanel *Panel1;
	TGroupBox *GroupBox2;
	TRadioGroup *SpecieRG;
	TGroupBox *GroupBox3;
	TDBLookupComboBox *UserCB;
	TGroupBox *GroupBox4;
	TDBGrid *DBGrid2;
	TDBNavigator *SlicesNavigator;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall SpecimenNavigatorClick(TObject *Sender, TNavigateBtn Button);
	void __fastcall DBGrid1DblClick(TObject *Sender);
	void __fastcall FormKeyDown(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall SpecieRGClick(TObject *Sender);

private:	// User declarations
	void __fastcall TMainForm::openSpecimenForm();


public:		// User declarations
	__fastcall TMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
