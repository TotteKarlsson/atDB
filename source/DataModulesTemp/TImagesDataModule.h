#ifndef TImagesDataModuleH
#define TImagesDataModuleH
#include <System.Classes.hpp>
#include <Data.DB.hpp>
#include <Data.FMTBcd.hpp>
#include <Data.SqlExpr.hpp>
#include <Datasnap.DBClient.hpp>
#include <Datasnap.Provider.hpp>

//---------------------------------------------------------------------------
class TimageDM : public TDataModule
{
__published:	// IDE-managed Components
	TDataSource *imagesDSource;
	TClientDataSet *imagesCDS;
	TDataSetProvider *imagesP;
	TSQLDataSet *imagesDS;
	TStringField *imagesDSid;
	TSQLTimeStampField *imagesDScreated;
	TStringField *imagesDSfilename;
	TStringField *imagesDSfileextension;
	TStringField *imagesCDSid;
	TSQLTimeStampField *imagesCDScreated;
	TStringField *imagesCDSfilename;
	TStringField *imagesCDSfileextension;
private:	// User declarations
public:		// User declarations
	__fastcall TimageDM(TComponent* Owner);
};

extern PACKAGE TimageDM *imageDM;

#endif
