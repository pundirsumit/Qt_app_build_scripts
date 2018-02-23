#!/bin/sh
MYDIR="$(dirname $(realpath $0))"

#Should be same as the name of the .pro file in the Qt project folder.
MODULE=qt2048

[ -z "$ANDROID_HOME" ] && . $(MYDIR)/envsetup.sh
[ -z "$APP_ROOT_PATH" ] && APP_ROOT_PATH=$(MYDIR)

[ -d $MODULE ] ||  git clone git@github.com:sogilis/qt2048.git $MODULE
[ -d secret-keys ] || git clone git@github.com:OpenMandrivaAssociation/secret-keys
if [ -d secret-keys ]; then
        CERTS="$(pwd)"/secret-keys
fi

cd $MODULE

[ -z "$Loc" ] && Loc="$(pwd)" 

mkdir -p $MODULE.Android
cd $MODULE.Android 

$QT_DIR_PATH/qmake -r -spec android-g++ $Loc/$MODULE.pro
make
make install INSTALL_ROOT=android

if [ -n "$CERTS" ]; then
        P="$(cat $CERTS/aosp/password)"

        $QT_DIR_PATH/androiddeployqt --output android --verbose --input *.json --sign $CERTS/aosp/fmo.jks apps --storepass $P
	cp -f android/bin/QtApp-debug.apk $PRODUCT_OUT_PATH/2048-release.apk
 
else
        echo "INFO: Building in Debug Mode"

	$QT_DIR_PATH/androiddeployqt --output android --verbose --input *.json
	cp -f android/bin/QtApp-debug.apk $PRODUCT_OUT_PATH/2048-debug.apk
fi

