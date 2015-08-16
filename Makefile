# Makefile


# Implicit Rules

%.pdf: %.tex
	pdflatex -halt-on-error -draftmode $<
	pdflatex -halt-on-error $<


# Making Rules

all: template-refcard.pdf haskell-ucs.pdf haskell-tc-ucs.pdf ctf-ucs.pdf

template-refcard.pdf: template-refcard.tex refcard.cls threecols.sty

haskell-ucs.pdf: haskell-ucs.tex

haskell-tc-ucs.pdf: haskell-tc-ucs.tex

ctf-ucs.pdf: ctf-ucs.tex

# Cleanup rules

.PHONY: clean cleanauxs cleanfigs
clean: cleanauxs cleanfigs
	rm -f template-refcard.pdf haskell-ucs.pdf ctf-ucs.pdf

cleanauxs:
	rm -f *~ *.aux *.bbl *.blg *.log *.toc *.nav *.out *.snm

