## Process this file with automake to create Makefile.in

## This is Makefile for abumatran SMT morphs compounds stuff
## run make to reproduce.

SUBDIRS=hren fin-eng
.PHONY: paper

GRAPHICX=alignments.pdf
PAPER=
if CAN_LATEX
PAPER+=morph-segments.pdf
endif

# clean tex intermediates
CLEANFILES=$(PAPER) \
			morph-segments.aux morph-segments.log morph-segments.blg

noinst_DATA=$(PAPER) $(GRAPHICX)

# {{{ paper
paper: $(PAPER)

morph-segments.pdf: morph-segments.tex alignments.pdf

%.pdf: %.dia
	dia -t pdf $< 

%.pdf: %.tex
	$(XELATEX) $<
	$(BIBTEX) $*
	$(XELATEX) $<
	$(XELATEX) $<
	$(XELATEX) $<

# }}}
# vim: set foldmethod=marker:
