# REQUIREMENTS
#   latex   (use MacTeX, MikTeX, etc)
#	imagemagick (install using brew, etc.)

TARGET=$(shell basename "`pwd`")
TEMPLATE=default.latex

OPTIONS= -V geometry:margin=1in
# OPTIONS+= --template=$(TEMPLATE)
OPTIONS+= --latex-engine=xelatex



all: $(TARGET).pdf open cleantemps cleanlogs
verbose: $(TARGET).pdf open openlog cleantemps
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

png: $(TARGET).pdf
	convert -density 300 $(TARGET).pdf $(TARGET).png

open: $(TARGET).pdf
	$(OPEN) $(TARGET).pdf

openlog: $(TARGET).log
	$(OPEN) $(TARGET).log

cleantemps:
	rm -rf *.aux *.out *.synctex.gz

cleanlogs:
	rm -rf *.log

cleanoutput:
	rm -rf *.pdf *.png

	
