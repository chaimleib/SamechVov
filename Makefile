# REQUIREMENTS
#   latex   (use MacTeX, MikTeX, etc)
#	imagemagick (install using brew, etc.)

TARGET=$(shell basename "`pwd`")


all: pdf open cleanlogs
verbose: pdf open openlog
clean: cleantemps cleanlogs cleanoutput
run: all


PLATFORM=$(shell ([[ -n "$(OSTYPE)" ]] && echo $(OSTYPE) || echo $(OS) ) | grep -o '[^0-9\-]\+')
ifeq ($(PLATFORM), Windows_NT)
	PLATFORM=cygwin
endif
ifeq ($(PLATFORM), cygwin)
	OPEN=$(shell cygstart && echo cygstart || echo start)
else
	OPEN=open
endif
	

$(TARGET).pdf: $(TARGET).tex
	xelatex $(TARGET).tex

pdf: $(TARGET).pdf cleantemps

png: pdf
	convert -density 300 $(TARGET).pdf $(TARGET).png

open: pdf
	$(OPEN) $(TARGET).pdf

openlog: $(TARGET).log
	$(OPEN) $(TARGET).log

cleantemps:
	rm -rf *.aux *.out *.synctex.gz

cleanlogs:
	rm -rf *.log

cleanoutput:
	rm -rf *.pdf *.png

	
