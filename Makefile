# Makefile


# Implicit Rules

%.pdf: %.tex
	pdflatex -halt-on-error -draftmode $<
	pdflatex -halt-on-error $<


# Making Rules

all: template-refcard.pdf haskell-ucs.pdf

template-refcard.pdf: template-refcard.tex refcard.cls threecols.sty

# Refcard dependency is provisory, as of now we're changing refcard a lot.
haskell-ucs.pdf: haskell-ucs.tex refcard.cls

# Cleanup rules

.PHONY: clean cleanauxs cleanfigs
clean: cleanauxs cleanfigs
	rm -f template-refcard.pdf haskell-ucs.pdf

cleanauxs:
	rm -f *~ *.aux *.bbl *.blg *.log *.toc *.nav *.out *.snm

