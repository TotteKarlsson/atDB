#include <System.hpp>
#pragma hdrstop
#pragma package(smart_init)

#pragma argsused
extern "C" int _libmain(unsigned long reason)
{
    return 1;
}

//---------------------------------------------------------------------------

#pragma comment(lib, "mtkCommon.lib")
#pragma comment(lib, "mtkDataBase.lib")
#pragma comment(lib, "poco_foundation-static.lib")
#pragma comment(lib, "atDBCore-static.lib")
#pragma comment(lib, "VCLCommon.bpi")
#pragma comment(lib, "DuneComponents.bpi")
#pragma comment(lib, "vcl.bpi")

