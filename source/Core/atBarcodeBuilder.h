#ifndef atBarcodeBuilderH
#define atBarcodeBuilderH
#include <string>
//---------------------------------------------------------------------------
using std::string;

class BarCodeBuilder
{
    public:
                                            BarCodeBuilder(const char& rDel = '\r');
        bool                                isBuilding(){return mIsBuilding;}
        bool                                hasBarCode(){return mHasBarCode;}
        void                                reset();
        bool                                build(const char& ch);
        string                              getBarCode();
        int		                            getBarCodeValue();
        void								setBarCode(const string& bc);

    private:
        string                              mBarCode;
        char                                mRightDelimiter;
        bool                                mIsBuilding;
        bool                                mHasBarCode;
};

#endif
