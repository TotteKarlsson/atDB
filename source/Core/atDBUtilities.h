#ifndef atDBUtilitiesH
#define atDBUtilitiesH
#include "atDBCoreExporter.h"
#include "atDBDataStructures.h"
//#include "database/dslSQLite.h"
//#include "dslStringList.h"

//using dsl::SQLite;
//using dsl::StringList;

//---------------------------------------------------------------------------
ATDB_CORE void loadStyles();
ATDB_CORE void setupApplicationTheme();
ATDB_CORE void setupLogging();
ATDB_CORE bool sendAppMessage(ApplicationMessageEnum msg, void* struc = NULL);

#endif
