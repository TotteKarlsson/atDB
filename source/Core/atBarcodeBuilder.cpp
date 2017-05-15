#pragma hdrstop
#include "atBarcodeBuilder.h"
#include "mtkLogger.h"
//---------------------------------------------------------------------------

BarCodeBuilder::BarCodeBuilder(const char& rDel)
 :
mRightDelimiter(rDel),
mIsBuilding(false),
mMessage(""),
mHasBarCode(false)
{}

void BarCodeBuilder::reset()
{
    mIsBuilding = false;
    mHasBarCode = false;
    mMessage.clear();
}

bool BarCodeBuilder::build(const char& ch)
{
    //If we are looking for end of lines, we are "always" building
    if(mRightDelimiter == '\n')
    {
        if(ch == '\n')
        {
            mHasBarCode = true;
            mIsBuilding = false;
            return true;
        }

        mIsBuilding = true;
        mMessage += ch;
        return true;
    }

    //Initiate building
    if(!mIsBuilding)
    {
        reset();
        mIsBuilding = true;
    }

    //Insert the character, discard irrelevant ones
   	mMessage += ch;
    return true;
}


string BarCodeBuilder::getBarCode()
{
    return mMessage;
}


