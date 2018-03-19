//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TRibbonNotesFrame.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TRibbonNotesFrame *RibbonNotesFrame;
//---------------------------------------------------------------------------
__fastcall TRibbonNotesFrame::TRibbonNotesFrame(TComponent* Owner)
	: TFrame(Owner)
{
}
//---------------------------------------------------------------------------
