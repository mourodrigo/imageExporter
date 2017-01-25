#!/bin/bash

# loop & print a folder recusively,
#xcode-select --install
#convert -background none -size 1024x1024 icone/fechou-icon-organization-black.svg icone/fechou-icon-organization-black-1024.png

writeContentsJson(){
	touch $1Contents.json
	echo "{\n  \"images\" : [\n    {\n      \"idiom\" : \"universal\",\n      \"filename\" : \"$2.png\",\n      \"scale\" : \"1x\"\n    },\n    {\n      \"idiom\" : \"universal\",\n      \"filename\" : \"$2@2x.png\",\n      \"scale\" : \"2x\"\n    },\n    {\n      \"idiom\" : \"universal\",\n      \"filename\" : \"$2@3x.png\",\n      \"scale\" : \"3x\"\n    }\n  ],\n  \"info\" : {\n    \"version\" : 1,\n    \"author\" : \"xcode\"\n  }\n}" > $1Contents.json
}


resize(){

	directory_name=$(dirname $1)
	base_name=$(basename $1)
	base_name_no_extension=$(echo $base_name | cut -f 1 -d '.')

	mkdir -p $directory_name/icon-thumb	
	convert -background none -size 300x300 $1 $directory_name/icon-thumb/$base_name_no_extension-thumb.png

	mkdir -p $directory_name/icon-android/mdpi/
	convert -background none -size 48x48 $1 $directory_name/icon-android/mdpi/$base_name_no_extension.png	

	mkdir -p $directory_name/icon-android/hdpi/
	convert -background none -size 72x72 $1 $directory_name/icon-android/hdpi/$base_name_no_extension.png

	mkdir -p $directory_name/icon-android/xhdpi/
	convert -background none -size 96x96 $1 $directory_name/icon-android/xhdpi/$base_name_no_extension.png

	mkdir -p $directory_name/icon-android/xxhdpi/
	convert -background none -size 144x144 $1 $directory_name/icon-android/xxhdpi/$base_name_no_extension.png

	mkdir -p $directory_name/icon-android/xxxhdpi/
	convert -background none -size 192x192 $1 $directory_name/icon-android/xxxhdpi/$base_name_no_extension.png

	mkdir -p $directory_name/icon-ios/$base_name_no_extension-nav-toolbar.imageset/	
	writeContentsJson "$directory_name/icon-ios/$base_name_no_extension-nav-toolbar.imageset/" "$base_name_no_extension"

	convert -background none -size 22x22 $1 $directory_name/icon-ios/$base_name_no_extension-nav-toolbar.imageset/$base_name_no_extension.png
	convert -background none -size 44x44 $1 $directory_name/icon-ios/$base_name_no_extension-nav-toolbar.imageset/$base_name_no_extension@2x.png
	convert -background none -size 66x66 $1 $directory_name/icon-ios/$base_name_no_extension-nav-toolbar.imageset/$base_name_no_extension@3x.png

	mkdir -p $directory_name/icon-ios/$base_name_no_extension-tabbar.imageset/	
	writeContentsJson "$directory_name/icon-ios/$base_name_no_extension-tabbar.imageset/" "$base_name_no_extension"
	convert -background none -size 25x25 $1 $directory_name/icon-ios/$base_name_no_extension-tabbar.imageset/$base_name_no_extension.png
	convert -background none -size 50x50 $1 $directory_name/icon-ios/$base_name_no_extension-tabbar.imageset/$base_name_no_extension@2x.png
	convert -background none -size 75x75 $1 $directory_name/icon-ios/$base_name_no_extension-tabbar.imageset/$base_name_no_extension@3x.png

	mkdir -p $directory_name/icon-ios/$base_name_no_extension-thumb.imageset/	
	writeContentsJson "$directory_name/icon-ios/$base_name_no_extension-thumb.imageset/" "$base_name_no_extension"
	convert -background none -size 200x200 $1 $directory_name/icon-ios/$base_name_no_extension-thumb.imageset/$base_name_no_extension.png
	convert -background none -size 400x400 $1 $directory_name/icon-ios/$base_name_no_extension-thumb.imageset/$base_name_no_extension@2x.png
	convert -background none -size 600x600 $1 $directory_name/icon-ios/$base_name_no_extension-thumb.imageset/$base_name_no_extension@3x.png

}

print_folder_recurse() {
    for i in "$1"/*;do
        if [ -d "$i" ];then
            # echo "dir: $i"
            print_folder_recurse "$i"
        elif [ -f "$i" ]; then
            # echo "file: $i"
            if [[ $i == *.svg ]];then
				echo "SVG encontrado: $i \nExportando...\n"
				# echo $PWD/$i
				resize $i
            fi
        fi
    done
}


# try get path from param
path=""
if [ -d "$1" ]; then
    path=$1;
else
    path="/tmp"
fi

echo "\n====================\nIniciando a magia...\n\n"
print_folder_recurse $path
echo "\n\nFechou! ;) \n====================\n"
