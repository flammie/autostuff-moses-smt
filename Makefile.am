## Process this file with automake to create Makefile.in

## This is Makefile for abumatran SMT morphs compounds stuff
## run make to reproduce.

SUBDIRS=fin-eng hbs-eng fin-lit lit-eng
.PHONY: paper

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
