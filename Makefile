# REQUIREMENTS
#   latex   (use MacTeX, MikTeX, etc)
#   pandoc	(use brew to install on Mac, Windows download from
#   	https://github.com/jgm/pandoc/releases
#   	)

TARGET=$(shell basename "`pwd`")
TEMPLATE=default.latex

OPTIONS= -V geometry:margin=1in
# OPTIONS+= --template=$(TEMPLATE)
OPTIONS+= --latex-engine=xelatex



all: $(TARGET).pdf open cleantemps cleanlogs
verbose: pandoc $(TARGET).pdf open openlog cleantemps
clean: cleantemps cleanlogs cleanoutput
run: all


PLATFORM=$(shell ([[ -n "$(OSTYPE)" ]] && echo $(OSTYPE) || echo $(OS) ) | grep -o '[^0-9\-]\+')
ifeq ($(PLATFORM), Windows_NT)
	PLATFORM=cygwin
endif
ifeq ($(PLATFORM), cygwin)
	OPEN=cygstart
else
	OPEN=open
endif
	

# pandoc: $(TARGET).md
# 	pandoc \
# 		$(OPTIONS) \
# 		--from markdown \
# 		--to latex \
# 		$(TARGET).md \
# 		-o $(TARGET).tex


$(TARGET).pdf: $(TARGET).tex
	# pdflatex $(TARGET).tex
	xelatex \
		$(TARGET).tex \
		-o $(TARGET).pdf

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

	
