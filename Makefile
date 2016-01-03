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
#
# This Makefile intentionally will not detect changes
# in either refcard.cls and threecols.sty:
#   those are seldom modified
# (with the exception of template-refcard.pdf)

CSS = \
  haskell-ucs.pdf    \
  haskell-tc-ucs.pdf \
  thaskell-ucs.pdf   \
  ctf-ucs.pdf        \
  template-refcard.pdf

all: $(CSS)

template-refcard.pdf: template-refcard.tex refcard.cls threecols.sty

# Cleanup rules

.PHONY: clean cleanauxs cleanfigs
clean: cleanauxs cleanfigs
	rm -f $(CSS)

cleanauxs:
	rm -rf tmp

