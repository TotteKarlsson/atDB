#ifndef atBarcodeBuilderH
#define atBarcodeBuilderH
#include <string>
//---------------------------------------------------------------------------
using std::string;

class BarCodeBuilder
{
    public:
                                            BarCodeBuilder(const char& rDel = '\n');
        bool                                isBuilding(){return mIsBuilding;}
        bool                                hasBarCode(){return mHasBarCode;}
        void                                reset();
        bool                                build(const char& ch);
        string                              getBarCode();

    private:
        string                              mMessage;
        char                                mRightDelimiter;
        bool                                mIsBuilding;
        bool                                mHasBarCode;
};

#endif
