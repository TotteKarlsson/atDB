//---------------------------------------------------------------------------

#ifndef TStartFormH
#define TStartFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "TPGConnectionFrame.h"
#include <Vcl.ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TStartForm : public TForm
{
__published:	// IDE-managed Components
	TPGConnectionFrame *TPGConnectionFrame1;
	TPanel *Panel1;
	TPanel *Panel2;
private:	// User declarations
public:		// User declarations
	__fastcall TStartForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TStartForm *StartForm;
//---------------------------------------------------------------------------
#endif
