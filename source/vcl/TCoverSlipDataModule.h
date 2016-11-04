#ifndef TCoverSlipDataModuleH
#define TCoverSlipDataModuleH
#include <System.Classes.hpp>
#include <Data.DB.hpp>
#include <Data.FMTBcd.hpp>
#include <Data.SqlExpr.hpp>
#include <Datasnap.DBClient.hpp>
#include <Datasnap.Provider.hpp>

//---------------------------------------------------------------------------
class TcsDM : public TDataModule
{
    __published:	// IDE-managed Components
        TSQLDataSet *csDS;
        TDataSetProvider *csP;
        TClientDataSet *csCDS;
        TDataSource *csDSource;
        TSQLDataSet *csStatusDS;
        TDataSetProvider *csStatusP;
        TClientDataSet *csStatusCDS;
        TDataSource *csStatusDSource;
        TIntegerField *csStatusCDSid;
        TStringField *csStatusCDSstatus;
        TMemoField *csStatusCDSnote;
        TSQLDataSet *csTypeDS;
        TDataSetProvider *csTypeP;
        TClientDataSet *csTypeCDS;
        TDataSource *csTypeDSource;
        TIntegerField *csTypeCDSid;
        TStringField *csTypeCDStype;
        TMemoField *csTypeCDSnote;
        TIntegerField *csStatusDSid;
        TStringField *csStatusDSstatus;
        TMemoField *csStatusDSnote;
        TIntegerField *csTypeDSid;
        TStringField *csTypeDStype;
        TMemoField *csTypeDSnote;
        TIntegerField *csDSid;
        TIntegerField *csDSstatus;
        TIntegerField *csDStype;
        TIntegerField *csCDSid;
        TIntegerField *csCDSstatus;
        TIntegerField *csCDStype;
        TStringField *csCDSLStatus;
        TStringField *csCDSLType;
        TMemoField *csDSnotes;
        TMemoField *csCDSnotes;
        TSQLDataSet *csDustAssayDS;
        TDataSetProvider *csDustAssayP;
        TClientDataSet *csDustAssayCDS;
        TDataSource *csDustAsssayDSource;
        TIntegerField *csDustAssayCDSid;
        TSQLTimeStampField *csDustAssayCDSdate;
        TIntegerField *csDustAssayCDScoverslip_id;
        TStringField *csDustAssayCDSbackground_image;
        TIntegerField *csDustAssayDSid;
        TSQLTimeStampField *csDustAssayDSdate;
        TIntegerField *csDustAssayDScoverslip_id;
        TStringField *csDustAssayDSbackground_image;
        TIntegerField *csDustAssayDScoverslip_status;
        TIntegerField *csDustAssayCDScoverslip_status;
        TMemoField *csDustAssayDSnote;
        TMemoField *csDustAssayCDSnote;
        TStringField *csDustAssayDScoverslip_image;
        TStringField *csDustAssayCDScoverslip_image;
	TStringField *csDustAssayDSresult_image;
	TStringField *csDustAssayCDSresult_image;
        void __fastcall csDSBeforeOpen(TDataSet *DataSet);
        void __fastcall CDSAfterPost(TDataSet *DataSet);
        void __fastcall CDSAfterScroll(TDataSet *DataSet);
	void __fastcall csDustAsssayDSourceDataChange(TObject *Sender, TField *Field);
	void __fastcall CDSAfterDelete(TDataSet *DataSet);


        private:

        public:
			TNotifyEvent		  csDustAssayCDSOnDataChanged;
                    __fastcall TcsDM(TComponent* Owner);
        	void    __fastcall afterConnect();
            void    __fastcall afterDisConnect();


};

extern PACKAGE TcsDM *csDM;
#endif
