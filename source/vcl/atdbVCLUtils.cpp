#pragma hdrstop
#include "atdbVCLUtils.h"
#include "mtkLogger.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
using namespace mtk;



bool SortClientDataSet(TClientDataSet* ClientDataSet,  const String& FieldName)
{
	//from http://edn.embarcadero.com/article/29056
	TField* Field = ClientDataSet->Fields->FindField(FieldName);
	//If invalid field name, exit.
	if(!Field)
    {
		return false;
    }

    if(	dynamic_cast<TObjectField*>(Field) 		||		dynamic_cast<TBlobField*>(Field) 	||
        dynamic_cast<TAggregateField*>(Field) 	||      dynamic_cast<TVariantField*>(Field)	||
        dynamic_cast<TBinaryField*>(Field) 	)
    {
    	Log(lWarning) << "Can't sort this type of field...";
    	return false;
    }

    //Ensure IndexDefs is up-to-date
    ClientDataSet->IndexDefs->Update();

    //If an ascending index is already in use,
    //switch to a descending index
	String  		NewIndexName;
	TIndexOptions   IndexOptions;
    if(ClientDataSet->IndexName == (FieldName + "__IdxA"))
    {
        NewIndexName = FieldName + "__IdxD";
        IndexOptions = TIndexOptions() << ixDescending;
    }
    else
    {
        NewIndexName = FieldName + "__IdxA";
        IndexOptions = TIndexOptions();
    }

    //Look for existing index
    bool Result(false);
    for(int i = 0; i <ClientDataSet->IndexDefs->Count; i++)
    {
    	if( ClientDataSet->IndexDefs->operator [](i)->Name == NewIndexName)
      	{
        	Result = true;
          	break;
      	}
    }
    //If existing index not found, create one
    if(!Result)
    {
        ClientDataSet->AddIndex(NewIndexName, FieldName, IndexOptions);
        Result = True;
    }

    //Set the index
    ClientDataSet->IndexName = NewIndexName;
    return Result;
}

