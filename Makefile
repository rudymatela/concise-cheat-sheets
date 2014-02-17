# Makefile


# Implicit Rules

%.pdf: %.tex
	pdflatex -halt-on-error -draftmode $<
	pdflatex -halt-on-error $<


# Making Rules

all: template-refcard.pdf

template-refcard.pdf: template-refcard.tex refcard.cls

# Cleanup rules

.PHONY: clean cleanauxs cleanfigs
clean: cleanauxs cleanfigs
	rm -f template-refcard.pdf

cleanauxs:
	rm -f *~ *.aux *.bbl *.blg *.log *.toc *.nav *.out *.snm

