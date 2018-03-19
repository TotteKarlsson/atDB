//---------------------------------------------------------------------------

#ifndef TRibbonNotesFrameH
#define TRibbonNotesFrameH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.DBCtrls.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
//---------------------------------------------------------------------------
class TRibbonNotesFrame : public TFrame
{
__published:	// IDE-managed Components
	TGroupBox *GroupBox1;
	TPanel *Panel15;
	TDBGrid *mRibbonNotesGrid;
	TDBNavigator *RibbonNotesNavigator;
	TPanel *Panel16;
	TDBMemo *mRibbonNoteMemo;
	TDBNavigator *RibbonNoteNavigator;
private:	// User declarations
public:		// User declarations
	__fastcall TRibbonNotesFrame(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRibbonNotesFrame *RibbonNotesFrame;
//---------------------------------------------------------------------------
#endif
