SamechVov
=========

An exercise in Hebrew typesetting using LaTeX.

Dependencies
------------
### make
The Makefile has been tested on Mac OS X 10.9, and in Cygwin under Windows 7. It will probably work elsewhere, too.

### Fonts
Whether or not you use the Makefile, the following fonts are required:
* Miriam CLM
* Frank Ruehl CLM
* TeX Guire Pagella (a Palatino lookalike)

You can download them for free from:
* [Open Siddur Project](http://opensiddur.org/tools/fonts/)
* [TeX Guire Pagella](http://www.gust.org.pl/projects/e-foundry/tex-gyre/pagella)

### Programs
The following software is required:

xelatex
: Part of MacTeX, MikTeX, TeXLive, etc. If you install TeXLive, it is recommended to NOT use your package manager, but to perform a [manual install](https://www.tug.org/texlive/acquire-netinstall.html).

The following software is only needed for certain features:

imagemagick
: to run `make png`

Rendering to PDF
----------------
Just run `make`. It will try to open the PDF for you when it's done.

If you don't need to open it, or there is something wrong with `make`, just run `make pdf`.

Rendering to PNG
----------------
If you want to create PNG graphics for each page, run `make png`. This requires ImageMagick to be installed. Use your package manager to install it, or go to their [website](http://www.imagemagick.org/).

TODO
----
Of course this project is far from complete. See the Github [issue tracker](https://github.com/chaimleib/SamechVov/issues) for this project.
