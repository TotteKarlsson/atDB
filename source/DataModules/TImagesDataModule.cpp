#pragma hdrstop
#include "TImagesDataModule.h"
#include "TATDBDataModule.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "System.Classes.TPersistent"
#pragma resource "*.dfm"
TimageDM *imageDM;
//---------------------------------------------------------------------------
__fastcall TimageDM::TimageDM(TComponent* Owner)
	: TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
