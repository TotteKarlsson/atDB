#! /bin/bash
echo "Hello Bash"

echo "Arg1: "$1
echo "Arg2: "$2
echo "Arg3: "$3
echo "Arg4: "$4

OUTPUTDIR=`cygpath $1`
APP_RELEASES=`cygpath $2`
OUTPUTFILENAME=$3
BDSCOMMONDIR=$4

echo "OUTPUTDIR: "$OUTPUTDIR
echo "AppReleases: "$APP_RELEASES
echo "Outputfilename: "$OUTPUTFILENAME
echo "BDSCOMMONDIR: "$BDSCOMMONDIR

#Extract version
VERSION=`cat ../VERSION.txt | tr -d '\r'`
APPNAME=atDB
echo "Copy stuff"
mkdir $APP_RELEASES/$APPNAME/$VERSION
dest=$APP_RELEASES/$APPNAME/$VERSION
cp ./../*.txt $dest
cp $OUTPUTDIR/*.ini $dest
cp $OUTPUTDIR/$OUTPUTFILENAME $dest

#DS Binaries
 cp $OUTPUTDIR/mtkCommon.dll                         $dest
 cp $OUTPUTDIR/mtkMath.dll                         $dest
 cp $OUTPUTDIR/mtkIPC.dll                         $dest
 cp $OUTPUTDIR/atCore.dll                         $dest
 cp $OUTPUTDIR/atDatabase.dll                         $dest
 cp $OUTPUTDIR/atResources.dll                         $dest
 cp $OUTPUTDIR/atBarcodeReader.dll                      $dest
 cp $OUTPUTDIR/atSSI.dll                      $dest

 cp $BDSCOMMONDIR/BPL/atVCLCore.bpl                 $dest    
 cp $BDSCOMMONDIR/BPL/DuneComponentsDD.bpl       $dest
 cp $BDSCOMMONDIR/BPL/DuneFormsDD.bpl            $dest
 cp $BDSCOMMONDIR/BPL/VCLCommonDD.bpl            $dest

#Borland Packages and dll's
REDIST="/cygdrive/c/CodeGear/Tokyo/bin"

cp $REDIST/borlndmm.dll             $dest
cp $REDIST/cc32250mt.dll            $dest
cp $REDIST/midas.dll                $dest

suffix="250.bpl"
cp $REDIST/bindcomp$suffix                  $dest
cp $REDIST/bindcompvcl$suffix               $dest
cp $REDIST/bindengine$suffix                $dest
cp $REDIST/dbexpress$suffix                 $dest
cp $REDIST/dbrtl$suffix                     $dest
cp $REDIST/dbxcds$suffix                    $dest
cp $REDIST/DbxCommonDriver$suffix		    $dest
cp $REDIST/DbxDevartPostgreSQLDriver$suffix	$dest
cp $REDIST/DBXMySQLDriver$suffix		    $dest
cp $REDIST/dsnap$suffix                     $dest
cp $REDIST/rtl$suffix                       $dest
cp $REDIST/vcl$suffix                       $dest
cp $REDIST/vclactnband$suffix               $dest
cp $REDIST/vcldb$suffix                     $dest
cp $REDIST/vclimg$suffix                    $dest
cp $REDIST/vclx$suffix                      $dest

#cp $REDIST/vclx$suffix		        $dest
miscRedist="/cygdrive/p/redist/atdb"
cp $miscRedist/dbexppgsql40.dll    $dest
