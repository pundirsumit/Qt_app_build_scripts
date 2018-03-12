#!/bin/sh
# Script to setup the Sdk tools 

CUR_DIR="$(dirname $(realpath $0))"

if [ -d "$ANDROID_SDK_ROOT/tools/ant" ] ; then
	echo "Sdk tools version < 25 is downloaded and set up."
else
	wget http://dl-ssl.google.com/android/repository/tools_r24.3.3-linux.zip
	mv $ANDROID_SDK_ROOT/tools $ANDROID_SDK_ROOT/tools2
	unzip $CUR_DIR/tools_r24.3.3-linux.zip -d $ANDROID_SDK_ROOT/
fi

if [ -e "/usr/bin/ant" ]; then
	echo "ant is set up at /usr/bin/ant"
else
	sudo apt-get install ant
fi

		
