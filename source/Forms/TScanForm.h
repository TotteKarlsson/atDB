#ifndef TScanFormH
#define TScanFormH
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "atBarCodeBuilder.h"
//---------------------------------------------------------------------------


class TCoverSlipScanFrame;
class TScanForm : public TForm
{
    __published:
        void __fastcall FormKeyDown(TObject *Sender, WORD &Key, TShiftState Shift);
		void __fastcall FormKeyPress(TObject *Sender, System::WideChar &Key);

    private:
    								//The barcode builder scans incoming chars in the FormKeyDown event
		BarCodeBuilder				mBCBuilder;
		TCoverSlipScanFrame* 		CSFrame;
		void                    	onCSBarcode(int csID);

    public:
        				__fastcall 	TScanForm(TComponent* Owner);
		void						populate(const string& barcode);
};

extern PACKAGE TScanForm *ScanForm;
#endif
