**Image Exporter**
----------
A bash script for MAC OS to export SVG files to PNG for Android/iOS projects.


----------
Dependencies:
----------
To install, paste and enter each line in your [terminal](http://www.macworld.co.uk/feature/mac-software/get-more-out-of-os-x-terminal-3608274/)

**Install [X-Code Command Line Tools](https://www.google.com.br/search?q=X-Code%20Command%20Line%20Tools)** 

    xcode-select --install

**Install [Homebrew](https://brew.sh/)** 

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

**Install [Image Magick](https://www.imagemagick.org/script/index.php)** 

    brew install imagemagick --use-rsvg


Usage:
----------
Open [terminal](http://www.macworld.co.uk/feature/mac-software/get-more-out-of-os-x-terminal-3608274/) and use the syntax below:

    sh /path_to_file/resize.sh  /path_to_svg_folder/

You can also type "sh" on terminal, drag the resize.sh file and later drag the svg folder.

![Image exporting example](https://im.ezgif.com/tmp/im_color_128_ezgif-1-2c0aae5a27.gif)

Exported formats:
----------
The script will search for all .svg files inside all folders (recursively) in the given path and **for each .svg will create:**

 - Android PNG files
	 - hdpi - 48x48
	 - mdpi - 72x72
	 - xhdpi - 96x96
	 - xxhdpi - 144x144
	 - xxxhdpi - 192x192
 - iOS PNG files with .imageset
	 - Navigation Bar and ToolBar icon sizes (22x22 + @2x @3x sizes)
	 - Tab Bar and standard icon sizes (25x25 + @2x @3x sizes)
 - PNG Thumb
	 - For general thumbs and uses inside the application (300x300)

Features:
----------
Search for SVG files recursively
Supports SVG -> PNG transparency
