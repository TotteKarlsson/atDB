//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TStartForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TPGConnectionFrame"
#pragma resource "*.dfm"
TStartForm *StartForm;
//---------------------------------------------------------------------------
__fastcall TStartForm::TStartForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
