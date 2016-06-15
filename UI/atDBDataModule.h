#ifndef atDBDataModuleH
#define atDBDataModuleH
#include <System.Classes.hpp>
#include "DbxDevartSQLite.hpp"
#include <Data.DB.hpp>
#include <Data.FMTBcd.hpp>
#include <Data.SqlExpr.hpp>
#include <Datasnap.DBClient.hpp>
#include <Datasnap.Provider.hpp>
#include <SimpleDS.hpp>
//---------------------------------------------------------------------------
class TDataModule1 : public TDataModule
{
__published:	// IDE-managed Components
	TSQLConnection *SQLConnection1;
	TDataSource *blocksDataSource;
	TClientDataSet *blocksCDS;
	TDataSetProvider *blocksProvider;
	TSQLDataSet *blocksDS;
	TSQLDataSet *usersDS;
	TDataSetProvider *usersProvider;
	TClientDataSet *usersClientDataSet;
	TDataSource *usersDataSource;
	TIntegerField *usersDSid;
	TWideMemoField *usersDSuser_name;
	TWideMemoField *usersDScreated;
	TIntegerField *usersClientDataSetid;
	TWideMemoField *usersClientDataSetuser_name;
	TWideMemoField *usersClientDataSetcreated;
	TIntegerField *blocksCDSid;
	TSQLTimeStampField *blocksCDScreated;
	TIntegerField *blocksCDScreated_by;
	TSQLTimeStampField *blocksCDSmodified;
	TIntegerField *blocksCDSstatus;
	TWideStringField *blocksCDSlabel;
	void __fastcall usersClientDataSetuser_nameGetText(TField *Sender, UnicodeString &Text,
          bool DisplayText);
	void __fastcall usersClientDataSetBeforeApplyUpdates(TObject *Sender, OleVariant &OwnerData);
	void __fastcall usersClientDataSetBeforeInsert(TDataSet *DataSet);
	void __fastcall usersClientDataSetAfterPost(TDataSet *DataSet);
	void __fastcall usersClientDataSetAfterDelete(TDataSet *DataSet);
	void __fastcall usersClientDataSetuser_nameValidate(TField *Sender);
	void __fastcall usersClientDataSetAfterScroll(TDataSet *DataSet);
	void __fastcall usersClientDataSetAfterCancel(TDataSet *DataSet);
	void __fastcall blocksCDSAfterPost(TDataSet *DataSet);
	void __fastcall blocksCDSAfterDelete(TDataSet *DataSet);

private:	// User declarations
public:		// User declarations
	__fastcall TDataModule1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDataModule1 *DataModule1;
//---------------------------------------------------------------------------
#endif
