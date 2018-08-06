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
  haskell-cs.pdf    \
  haskell-tc-cs.pdf \
  haskell-exts-cs.pdf \
  thaskell-cs.pdf   \
  python-cs.pdf     \
  lua-cs.pdf        \
  ctf-cs.pdf        \
  yesod-cs.pdf      \
  template-refcard.pdf

CSS2X = \
  haskell-cs-2x.pdf    \
  haskell-tc-cs-2x.pdf \
  haskell-exts-cs-2x.pdf \
  thaskell-cs-2x.pdf   \
  python-cs-2x.pdf     \
  lua-cs-2x.pdf        \
  ctf-cs-2x.pdf        \
  yesod-cs-2x.pdf      \
  template-refcard-2x.pdf

all: $(CSS)

2x: $(CSS2X)

template-refcard.pdf: template-refcard.tex refcard.cls threecols.sty

%-2x.pdf: %.pdf
	mkdir -p tmp/2x
	./bin/quiet pdf90 haskell-cs.pdf -o tmp/2x/90.pdf
	pdfseparate tmp/2x/90.pdf tmp/2x/%d.pdf
	pdfunite tmp/2x/1.pdf tmp/2x/1.pdf tmp/2x/2.pdf tmp/2x/2.pdf tmp/2x/united.pdf
	./bin/quiet pdfnup tmp/2x/united.pdf -o $@
	rm -r tmp/2x

# Cleanup rules

.PHONY: clean cleanauxs cleanfigs
clean: cleanauxs cleanfigs
	rm -f $(CSS) $(CSS2X)

clean-2x:
	rm -f $(CSS2X)

cleanauxs:
	rm -rf tmp

