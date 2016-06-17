#ifndef TatDMH
#define TatDMH
#include <System.Classes.hpp>
#include "DbxDevartSQLite.hpp"
#include <Data.DB.hpp>
#include <Data.FMTBcd.hpp>
#include <Data.SqlExpr.hpp>
#include <Datasnap.DBClient.hpp>
#include <Datasnap.Provider.hpp>
#include <SimpleDS.hpp>
//---------------------------------------------------------------------------
class TatDM : public TDataModule
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
	TSQLQuery *blockNotesQ;
	TDataSource *blockNotesDSource;
	TDataSetProvider *blockNotesProvider;
	TClientDataSet *blockNotesDSet;
	TIntegerField *blockNotesDSetid;
	TWideMemoField *blockNotesDSetnote;
	TSQLTimeStampField *blockNotesDSetcreated_on;
	TWideStringField *blockNotesDSetcreated_by;
	TIntegerField *blockNotesDSetblock_id;
	TIntegerField *blockNotesDSetnote_id;
	TSQLQuery *updateNoteQ;
	TSQLDataSet *noteDS;
	TDataSetProvider *notesProvider;
	TClientDataSet *notesCDS;
	TIntegerField *notesCDSid;
	TWideMemoField *notesCDSnote;
	TSQLTimeStampField *notesCDScreated_on;
	TWideStringField *notesCDScreated_by;
	TDataSource *notesDSource;
	TIntegerField *usersDSid;
	TWideMemoField *usersDSuser_name;
	TSQLTimeStampField *usersDScreated;
	TIntegerField *usersClientDataSetid;
	TWideMemoField *usersClientDataSetuser_name;
	TSQLTimeStampField *usersClientDataSetcreated;
	TIntegerField *blocksCDSid;
	TSQLTimeStampField *blocksCDScreated;
	TIntegerField *blocksCDScreated_by;
	TSQLTimeStampField *blocksCDSmodified;
	TIntegerField *blocksCDSstatus;
	TWideStringField *blocksCDSlabel;
	TIntegerField *blocksDSid;
	TSQLTimeStampField *blocksDScreated;
	TIntegerField *blocksDScreated_by;
	TSQLTimeStampField *blocksDSmodified;
	TIntegerField *blocksDSstatus;
	TWideStringField *blocksDSlabel;
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
	void __fastcall blocksCDSAfterScroll(TDataSet *DataSet);
	void __fastcall blockNotesDSetAfterPost(TDataSet *DataSet);
	void __fastcall usersDSuser_nameValidate(TField *Sender);
	void __fastcall usersClientDataSetBeforePost(TDataSet *DataSet);
	void __fastcall blocksCDSBeforePost(TDataSet *DataSet);




private:	// User declarations
public:		// User declarations
	__fastcall TatDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TatDM *atDM;
//---------------------------------------------------------------------------
#endif
