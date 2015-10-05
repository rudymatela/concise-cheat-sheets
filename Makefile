# Makefile


# Output quieting, choose one

# needs bash installed:
export QUIETPREFIX = tmp/
QUIET = ./bin/quiet

# needs moreutils installed:
#QUIET = chronic </dev/null

# verbose output (does not need anything):
#QUIET =


# Implicit Rules

PDFLATEX = $(QUIET) pdflatex -halt-on-error -file-line-error -output-directory tmp
FASTPDFLATEX = $(PDFLATEX) -draftmode

%.pdf: %.tex
	@mkdir -p tmp
	$(FASTPDFLATEX) $<
	$(PDFLATEX) $<
	@cp tmp/$@ $@


# Making Rules

all: template-refcard.pdf haskell-ucs.pdf haskell-tc-ucs.pdf ctf-ucs.pdf

template-refcard.pdf: template-refcard.tex refcard.cls threecols.sty

haskell-ucs.pdf: haskell-ucs.tex

haskell-tc-ucs.pdf: haskell-tc-ucs.tex

ctf-ucs.pdf: ctf-ucs.tex

# Cleanup rules

.PHONY: clean cleanauxs cleanfigs
clean: cleanauxs cleanfigs
	rm -f template-refcard.pdf haskell-ucs.pdf haskell-tc-ucs.pdf ctf-ucs.pdf

cleanauxs:
	rm -rf tmp

