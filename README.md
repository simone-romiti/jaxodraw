# How to install Jaxodraw-2.1-0 on Ubuntu (18.04)

Jaxodraw is a GUI program for drawing Feynman diagrams. Further informations can be found on its [website](http://jaxodraw.sourceforge.net/).
It is also able to support LaTeX for labels.
Here it is explained how to:

1. Download and install Jaxodraw
2. Enable the LaTeX compatibility
3. Completely uninstall Jaxodraw

## Super-fast installation and setup

In the following sections all the steps are explained, but for a fast installation and setup of jaxodraw simply run the following executable:

``` bash
chmod +x ./install.sh # is not already executable
./install.sh
``` 

## Download and install

Download the most recent version of the pre-compiled binary of Jaxodraw from the [website](http://jaxodraw.sourceforge.net/download/bin.html) or directly clicking on this [link](http://jaxodraw.sourceforge.net/download/pkgs/jaxodraw-2.1-0-bin.tar.gz)

Choose and installation directory. A choice could be **/opt/**

Extract the binary and move it the in the desired path.
For example:

``` bash
tar -xzf jaxodraw-2.1-0-bin.tar.gz
sudo mv jaxodraw-2.1-0 /opt/
```

That's it! You've installed Jaxodraw on your Linux machine.

## Global executable

Now we create a global executable called **jaxodraw**, so that the program can be launched from any path. See this [guide](https://help.ubuntu.com/community/HowToAddaLauncher) for more details.

``` bash
sudo touch /usr/local/bin/jaxodraw # creating the binary
sudo chmod +x /usr/local/bin/jaxodraw # making it executable
```

Open the above file ad write into it the following command:
``` bash
java -jar /opt/jaxodraw-2.1-0/jaxodraw-2.1-0.jar
```
_Note_: replace */opt/jaxodraw-2.1-0/* with the *path/to/jaxodraw/* you chose for the installation.


## Desktop icon

The icon of Jaxodraw is not included in the binary, so you have to retrieve it from the source.
First, download it from the [website](http://jaxodraw.sourceforge.net/download/src.html) or by clicking directly on this [link](https://sourceforge.net/projects/jaxodraw/files/jaxodraw/2.1-0/jaxodraw-2.1-0-src.tar.gz/download)
Extract it and look for the file **favicon.ico** and copy it into the installation directory:

``` bash
tar -xzf jaxodraw-2.1-0-src.tar.gz
sudo cp jaxodraw-2.1-0/src/site/resources/images/favicon.ico /opt/jaxodraw-2.1-0/favicon.ico
```
You won't need the downloaded source directory anymore, so you can remove it.

Now add a *.desktop* file, so that Jaxodraw appears in the Dash. Note that this is a local procedure.
In order to make the link global, follow this [guide](https://developer.gnome.org/integration-guide/stable/desktop-files.html.en)

Run the command:

``` bash
touch ~/.local/share/applications/jaxodraw.desktop
```

Then write into that file the following text

> 		[Desktop Entry]
>			Type=Application
>			Encoding=UTF-8
>			Name=Jaxodraw
>			Comment=Feynman diagrams drawing GUI
>			Exec=jaxodraw
>			Icon=/opt/jaxodraw-2.1-0/favicon.ico
>			Terminal=false

NOTE: The path must be the full path. For instance fot the path /home/user/ it cannot be used **~/** or **$HOME**.


## LaTeX

LaTeX compatibility is given through the **axodraw4j**, which isn't included by default and has to be installed manually.

Download the package [axodraw4j.sty](http://jaxodraw.sourceforge.net/download/axodraw4j.html). You can click on this [link](https://sourceforge.net/projects/jaxodraw/files/axodraw4j/axodraw4j_2008_11_19/) and run the following commands:

``` bash
tar -xzf axodraw4j_2008_11_19.tar.gz
mkdir -p ~/texmf/tex/latex/axodraw4j/
cp axodraw4j.sty ~/texmf/tex/latex/axodraw4j/
```

For the general instructions about the installation of an isolated LaTeX package see this [guide](https://tex.stackexchange.com/questions/1137/where-do-i-place-my-own-sty-or-cls-files-to-make-them-available-to-all-my-te).

## Conclusion

You've successfully installed and configured Jaxodraw.
Have fun drawing Feynman diagrams!

## Uninstall Jaxodraw

In order to uninstall Jaxodraw it's sufficient to execute the following commands:

``` bash
sudo rm -r /opt/jaxodraw-2.1-0 # Jaxodraw package
sudo rm ~/.local/share/applications/jaxodraw.desktop # Desktop icon
sudo rm  /usr/local/bin/jaxodraw # global executable
rm -r ~/texmf/tex/latex/axodraw4j/ # axodraw4j LaTeX package
```
