#!/bin/bash

# installation
echo "Installing Jaxodraw"
tar -xzf jaxodraw-2.1-0-bin.tar.gz # unpacking the jaxodraw tarball
sudo rm -r /opt/jaxodraw-2.1-0 # removing the old jaxodraw
sudo mv jaxodraw-2.1-0 /opt/ # installing the new jaxodraw

# creation of a global executable
echo "Creating a global executable"
glob_exe=/usr/local/bin/jaxodraw # path to global executable
glob_exe_content="java -jar /opt/jaxodraw-2.1-0/jaxodraw-2.1-0.jar" # content of the global executable

sudo touch $glob_exe # creating the binary
sudo chmod +x $glob_exe # making it executable
echo $glob_exe_content | sudo tee $glob_exe # writing how to point to the global executable

# desktop icon
echo "Creating a desktop icon for the dash menu"
tar -xzf jaxodraw-2.1-0-src.tar.gz # source files taball
sudo cp jaxodraw-2.1-0/src/site/resources/images/favicon.ico /opt/jaxodraw-2.1-0/favicon.ico # copying the jaxodraw icon

desktop_icon=~/.local/share/applications/jaxodraw.desktop # file giving the desktop icon
touch $desktop_icon # crating the desktop icon file
echo "  [Desktop Entry]
      Type=Application
      Encoding=UTF-8
      Name=Jaxodraw
      Comment=Feynman diagrams drawing GUI
      Exec=jaxodraw
      Icon=/opt/jaxodraw-2.1-0/favicon.ico
      Terminal=false" > $desktop_icon # filling the desktop icon file

# LaTeX compatibility
echo "LaTeX compatibility"
tar -xzf axodraw4j_2008_11_19.tar.gz # axodraw tarball
mkdir -p ~/texmf/tex/latex/axodraw4j/ # creating the directory for axodraw
cp axodraw4j.sty ~/texmf/tex/latex/axodraw4j/ # copying the axodraw package in its destination

# cleaning up fromm unnecessary files
rm    axodraw4j.sty
rm    axodraw4j-summary.txt
rm -r jaxodraw-2.1-0/
rm    README.txt
rm    try-axo4j.tex
