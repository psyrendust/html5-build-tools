#!/bin/bash

# get the current working project directory
SOURCE="${BASH_SOURCE[0]}";
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
project="$( cd -P "$( dirname "$SOURCE" )" && pwd )";
dev="$project/dev";
publish="$project/publish";
html="$project/tools/htmlcompressor-1.5.2.jar";
yui="$project/tools/yuicompressor-2.4.7.jar";

# make a copy of dev
rm -rf "$publish";
cp -R "$dev" "$publish";

# run htmlcompressor
options1="--preserve-line-breaks --preserve-multi-spaces --compress-js --compress-css --preserve-php --preserve-ssi";
options2="--compress-js --compress-css --preserve-php --preserve-ssi";
java -jar "$html" $options1 -o "$publish/index.html" "$publish/index.html";

# run yuicompressor on css
css="$publish/css";
java -jar "$yui" "$css/screen.css" -o "$css/screen.css";

# run yuicompressor on js
js="$publish/js";
java -jar "$yui" "$js/global.js" -o "$js/global.js";

# remove any non essential files from the publish directory
# sudo rm -rf "$publish/replaceMe";

# remove any hidden files from the publish directory
sudo rm -rf `find "$publish/" -type f -name .DS_Store`;
sudo rm -rf `find "$publish/" -type d -name .git`;
sudo rm -rf `find "$publish/" -type f -name .gitignore`;
sudo rm -rf `find "$publish/" -type f -name .gitmodule`;