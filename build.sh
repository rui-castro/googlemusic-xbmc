#!/bin/bash

addon=`grep ".*id=" addon.xml | cut -f2 -d'"'`
dest=build/$addon
version=`grep "^\s\+version" addon.xml | cut -f2 -d'"'`

if [ -d $dest ]; then
    rm -r $dest
fi

mkdir -p $dest
cp addon.xml $dest/
cp LICENSE.txt $dest/
cp changelog.txt $dest/
cp icon.png $dest/
cp "icon and thumbnail licensing.txt" $dest/
cp *.py $dest/
cp -r resources $dest/

if [ -f $dest-$version.zip ]; then
    rm $dest-$version.zip
fi

cd build
zip -r $addon-$version.zip $addon
mv $addon-$version.zip $addon

rm $addon/LICENSE.txt
rm $addon/changelog.txt
rm $addon/"icon and thumbnail licensing.txt"
rm $addon/*.py
rm -r $addon/resources
