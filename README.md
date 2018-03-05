# Qt_app_build_scripts
Build Scripts for Qt apps for android platforms.

Before you run/use the script<br />
    - Sdk tools should be < 25 (you can download the older versions of sdk tools here: http://pnsurez.blogspot.in/2015/08/android-sdk-download-older-versions.html) <br />
    - download sdk and update sdkmanager with latest API plaforms<br />
    - download latest ndk<br />
    - download latest Qt tools<br />
    - Install ant on your system.<br />
<br />

Run 'source envsetup.sh' to set<br />
    - android source directory<br />
    - android sdk<br />
    - android ndk<br />
    - qt android dir<br />
    - out directory<br />

e.g.<br />
(Note: one can also run the script directory, script will ask for inputs)<br />

source envsetup.sh --sdk "sdk path" --ndk "ndk path" --qt "qt android dir" --and "android source" \
                    --approot "where applications are clonned" --out "out directory for final apks"
