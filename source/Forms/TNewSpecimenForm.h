#ifndef TNewSpecimenFormH
#define TNewSpecimenFormH
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.DB.hpp>
#include <Vcl.DBCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Mask.hpp>
#include "TATDBDataModule.h"
//---------------------------------------------------------------------------
class TNewSpecimenForm : public TForm
{
__published:	// IDE-managed Components
	TDataSource *DataSource1;
	TScrollBox *ScrollBox1;
	TPanel *Panel1;
	TButton *Button1;
	TButton *Button2;
	TDBEdit *DBEdit1;
	TLabel *Label1;
	TDBLookupComboBox *DBLookupComboBox1;
	TLabel *Label2;
	TLabel *Label3;
	TDBEdit *DBEdit2;
	TLabel *Label4;
	TDBEdit *DBEdit3;
	TLabel *Label5;
	TDBEdit *DBEdit4;
	TLabel *Label6;
	TDBEdit *DBEdit5;
	TLabel *Label7;
	TDBEdit *DBEdit6;
	TLabel *Label9;
	TDBEdit *DBEdit8;
	TLabel *Label8;
	TLabel *Label10;
	void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TNewSpecimenForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TNewSpecimenForm *NewSpecimenForm;
//---------------------------------------------------------------------------
#endif
