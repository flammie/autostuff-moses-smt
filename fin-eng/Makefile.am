## Process this file with automake to create Makefile.in

## This is Makefile for abumatran SMT morphs compounds stuff
## run make to reproduce.

L1=en
L2=fi
L1_LONG=eng
L2_LONG=fin
METEOR_L1_FLAGS=-l en
METEOR_L2_FLAGS=

if WANT_SECONDARY
# all secondary
.SECONDARY:
endif
.PHONY: naacl-2015-pretests naacl-2015-models naacl-2015-evals

# {{{ SETTINGS
# common prefixes
BASELINE_CORPUS=europarl-v8.$(L2)-$(L1)
BASELINE_TEST_PREFIX=newstest2015.$(L1)$(L2)
MTMATRIX_TEST_PREFIX=realtest2000
UNDHR_TEST_PREFIX=undhr
APERTIUM_TEST_PREFIX=story
WMT_TEST_PREFIX=newsdev2015-$(L1)$(L2)


# Moses baseline as with the wiki page but without europarl
MOSES_BASELINE_TRAIN=$(BASELINE_CORPUS)
MOSES_BASELINE_TUNE=newsdev2015
MOSES_BASELINE_L2=europarl-v8.news.2014.commoncrawl.blm.$(L2)
MOSES_BASELINE_L1_L2=europarl-v8.fi-en.tuned-binarised.tm.en-fi
MOSES_BASELINE_L1_L2_DIR=europarl-v8.fi-en

#MOSES_BASELINE_

# XXX: there's a dep between baseline evals and morfessor...
include $(top_srcdir)/am-shared/settings-baseline-evals.am

# Morfessor baseline from full europarl 
MORFESSOR_BASELINE_TRAIN=$(BASELINE_CORPUS)
MORFESSOR_TUNE=$(MOSES_BASELINE_TUNE).morfessor.1best
MORFESSOR_LM_L2=$(MORFESSOR_BASELINE_TRAIN).morfessor.1best.blm.$(L2)

FLATCAT_FLAGS_L2=--perplexity-threshold 200
FLATCAT_BASELINE_TRAIN=$(BASELINE_CORPUS)
FLATCAT_TUNE=$(MOSES_BASELINE_TUNE).flatcat.1best
FLATCAT_LM_L2=$(FLATCAT_BASELINE_TRAIN).flatcat.1best.blm.$(L2)

FACTOR_0_LM_L2=$(BASELINE_CORPUS).blm.$(L2)
FACTOR_1_LM_L2=$(BASELINE_CORPUS).norm.tok.clean.chipmunk.factor-1.blm.$(L2)

LABELSEGS_FACTOR_0_LM_L2=$(BASELINE_CORPUS).norm.tok.clean.omorfi-segments-labels.factor-0.blm.$(L2)
LABELSEGS_FACTOR_1_LM_L2=$(BASELINE_CORPUS).norm.tok.clean.omorfi-segments-labels.factor-1.blm.$(L2)

MOSES_LABELSEGS_TUNE=$(MOSES_BASELINE_TUNE).omorfi-labels-segments
MOSES_CHIPMUNK_TUNE=$(MOSES_BASELINE_TUNE).norm.tok.clean.chipmunk.factor-0

#include $(top_srcdir)/am-shared/settings-morfessor-baseline.am

#include $(top_srcdir)/am-shared/settings-hfst-baseline.am
#include $(top_srcdir)/am-shared/settings-apertium-baseline.am

include $(top_srcdir)/am-shared/check-oovs.am

# truecaser
TRUECASER_L1=$(BASELINE_CORPUS).truecaser.$(L1)
TRUECASER_L2=$(BASELINE_CORPUS).truecaser.$(L2)


HFST_L2_MORPHS_UNWEIGHTED=omorfi-morphs.hfst
HFST_L2_COMPOUNDS_UNWEIGHTED=omorfi-compounds.hfst
# just unweight now
HFST_L2_MORPHS=$(HFST_L2_MORPHS_UNWEIGHTED)
HFST_L2_COMPOUNDS=$(HFST_L2_COMPOUNDS_UNWEIGHTED)
HFST_L2_MARKS=omorfi.segment.hfst

CHIPMUNK_L2=fin.chipmunk.srl

APERTIUM_L1_L2=eng-fin
APERTIUM_L2_L1=fin-eng

# add none baseline tests
TRANSLATIONS_L1_L2+=undhr.baseline-moses.$(TRANSLATION_L1_L2) \
			 story.baseline-moses.$(TRANSLATION_L1_L2)
TRANSLATIONS_L2_L1+=undhr.baseline-moses.$(TRANSLATION_L2_L1) \
			 story.baseline-moses.$(TRANSLATION_L2_L1)
if CAN_MORFESS
TRANSLATIONS_L1_L2+=undhr.morfessor.$(TRANSLATION_L1_L2) \
			 story.morfessor.$(TRANSLATION_L1_L2)
TRANSLATIONS_L2_L1+=undhr.morfessor.$(TRANSLATION_L2_L1) \
			 story.morfessor.$(TRANSLATION_L2_L1)
endif
if CAN_HFST
TRANSLATIONS_L1_L2+=undhr.$(HFST_COMPOUNDS_INFIX).$(TRANSLATION_L1_L2) \
			  undhr.$(HFST_MORPHS_INFIX).$(TRANSLATION_L1_L2) \
			  story.$(HFST_COMPOUNDS_INFIX).$(TRANSLATION_L1_L2) \
			  story.$(HFST_MORPHS_INFIX).$(TRANSLATION_L1_L2)
TRANSLATIONS_L2_L1+=undhr.$(HFST_COMPOUNDS_INFIX).$(TRANSLATION_L2_L1) \
			  undhr.$(HFST_MORPHS_INFIX).$(TRANSLATION_L2_L1) \
			  story.$(HFST_COMPOUNDS_INFIX).$(TRANSLATION_L2_L1) \
			  story.$(HFST_MORPHS_INFIX).$(TRANSLATION_L2_L1)
endif
if CAN_APERTIUM
TRANSLATIONS_L1_L2+=undhr.baseline-apertium.$(TRANSLATION_L1_L2) \
			  story.baseline-apertium.$(TRANSLATION_L1_L2)
TRANSLATIONS_L1_L2+=undhr.baseline-apertium.$(TRANSLATION_L2_L1) \
			  story.baseline-apertium.$(TRANSLATION_L2_L1)
endif

TRANSLATIONS+=$(TRANSLATIONS_L1_L2) $(TRANSLATIONS_L2_L1)

# evaluations
if CAN_NISTBLEU
EVALUATIONS_L1_L2+=undhr.baseline-moses.$(NISTBLEU_L1_L2) \
			 story.baseline-moses.$(NISTBLEU_L1_L2)
EVALUATIONS_L2_L1+=undhr.baseline-moses.$(NISTBLEU_L2_L1) \
			 story.baseline-moses.$(NISTBLEU_L2_L1)
if CAN_MORFESS
EVALUATIONS_L1_L2+=undhr.morfessor.$(NISTBLEU_L1_L2) \
			 story.morfessor.$(NISTBLEU_L1_L2)
EVALUATIONS_L2_L1+=undhr.morfessor.$(NISTBLEU_L2_L1) \
			 story.morfessor.$(NISTBLEU_L2_L1)
endif
if CAN_HFST
EVALUATIONS_L1_L2+=undhr.$(HFST_COMPOUNDS_INFIX).$(NISTBLEU_L1_L2) \
			 undhr.$(HFST_MORPHS_INFIX).$(NISTBLEU_L1_L2) \
			 story.$(HFST_COMPOUNDS_INFIX).$(NISTBLEU_L1_L2) \
			 story.$(HFST_MORPHS_INFIX).$(NISTBLEU_L1_L2)
endif
EVALUATIONS_L2_L1+=undhr.$(HFST_COMPOUNDS_INFIX).$(NISTBLEU_L2_L1) \
			 undhr.$(HFST_MORPHS_INFIX).$(NISTBLEU_L2_L1) \
			 story.$(HFST_COMPOUNDS_INFIX).$(NISTBLEU_L2_L1) \
			 story.$(HFST_MORPHS_INFIX).$(NISTBLEU_L2_L1)
if CAN_APERTIUM
EVALUATIONS_L2_L1+=undhr.baseline-apertium.$(NISTBLEU_L1_L2) \
			 story.baseline-apertium.$(NISTBLEU_L1_L2)
EVALUATIONS_L2_L1+=undhr.baseline-apertium.$(NISTBLEU_L2_L1) \
			 story.baseline-apertium.$(NISTBLEU_L2_L1)
endif
endif # NIST bleu

if CAN_TER
EVALUATIONS_L1_L2+=undhr.baseline-moses.$(TER_L1_L2) \
			 story.baseline-moses.$(TER_L1_L2)
EVALUATIONS_L2_L1+=undhr.baseline-moses.$(TER_L2_L1) \
			 story.baseline-moses.$(TER_L2_L1)
if CAN_MORFESS
EVALUATIONS_L1_L2+=undhr.morfessor.$(TER_L1_L2) \
			 story.morfessor.$(TER_L1_L2)
EVALUATIONS_L2_L1+=undhr.morfessor.$(TER_L2_L1) \
			 story.morfessor.$(TER_L2_L1)
endif
if CAN_HFST
EVALUATIONS_L1_L2+=\
			 undhr.$(HFST_COMPOUNDS_INFIX).$(TER_L1_L2) \
			 undhr.$(HFST_MORPHS_INFIX).$(TER_L1_L2) \
			 story.$(HFST_COMPOUNDS_INFIX).$(TER_L1_L2) \
			 story.$(HFST_MORPHS_INFIX).$(TER_L1_L2)
EVALUATIONS_L2_L1+=\
			 undhr.$(HFST_COMPOUNDS_INFIX).$(TER_L2_L1) \
			 undhr.$(HFST_MORPHS_INFIX).$(TER_L2_L1) \
			 story.$(HFST_COMPOUNDS_INFIX).$(TER_L2_L1) \
			 story.$(HFST_MORPHS_INFIX).$(TER_L2_L1)
endif
if CAN_APERTIUM
EVALUATIONS_L1_L2+=undhr.baseline-apertium.$(TER_L1_L2) \
			 story.baseline-apertium.$(TER_L1_L2)
EVALUATIONS_L2_L1+=undhr.baseline-apertium.$(TER_L2_L1) \
			 story.baseline-apertium.$(TER_L2_L1)
endif
endif # TER
EVALUATIONS+=$(EVALUATIONS_L2_L1) $(EVALUATIONS_L1_L2)

PAPER=

# all is secondary, clean a lot
CLEANFILES=$(MODELS) $(SEGMENTS) $(TRANSLATIONS) $(EVALUATIONS) \
			$(PAPER)
# }}}

noinst_DATA=

# {{{ CORPORA
corpora:

include $(top_srcdir)/am-shared/preprocess-basics.am


include $(top_srcdir)/am-shared/preprocess-europarl.am
include $(top_srcdir)/am-shared/preprocess-split.am

europarl-v8.fi-en.tgz:
	$(WGET) http://statmt.org/wmt15/europarl-v8.fi-en.tgz

europarl-v8.fi-en.fi.text: europarl-v8.fi-en.tgz
	tar zxvf $< europarl-v8.fi-en.fi
	mv -v europarl-v8.fi-en.fi $@
	touch $@

europarl-v8.fi-en.en.text: europarl-v8.fi-en.tgz
	tar zxvf $< europarl-v8.fi-en.en
	mv -v europarl-v8.fi-en.en $@
	touch $@

europarl-v8.fi-en.tune.fi.text: newsdev2015-$(L1)$(L2).$(L2).text
	ln -sf $< $@

europarl-v8.fi-en.tune.en.text: newsdev2015-$(L1)$(L2).$(L1).text
	ln -sf $< $@

# Shared task 2005
realtest2000.fi.gz:
	$(WGET) http://www.statmt.org/wpt05/mt-shared-task/realtest2000.fi.gz

realtest2000.en.gz:
	$(WGET) http://www.statmt.org/wpt05/mt-shared-task/realtest2000.en.gz

# shared task 2015
newsdev2015.tgz:
	$(WGET) http://statmt.org/wmt15/dev-v2.tgz -O $@

# XXX: realtest is pre-tokenised but we don't want that because of apertium,
# removing test data from training set, etc. etc.
# but the measures may become incomparable.
realtest2000.fi.text: realtest2000.fi.gz
	zcat $< | $(ICONV) -f latin1 -t utf8 | $(MOSES_DETOKENIZER) > $@

realtest2000.en.text: realtest2000.en.gz
	zcat $< | $(ICONV) -f latin1 -t utf8 | $(MOSES_DETOKENIZER) > $@

# newsdev2015 doesn't have much problems...
newsdev2015-$(L1)$(L2).$(L1).text: newsdev2015.tgz
	$(TAR) zxvf $<
	$(SED) -e 's/<[^>]*>//g' < dev/newsdev2015-enfi-src.en.sgm |\
		tr -s '\n' |\
		tail -n +2 > $@

newsdev2015-$(L1)$(L2).$(L2).text: newsdev2015.tgz
	$(TAR) zxvf $<
	$(SED) -e 's/<[^>]*>//g' < dev/newsdev2015-fien-src.fi.sgm |\
		tr -s '\n' |\
		tail -n +2 > $@
# }}}
#
# {{{ MODELS

models: $(MODELS)
fi: $(LANGUAGE_MODELS_FI)
en: $(LANGUAGE_MODELS_EN)

include $(top_srcdir)/am-shared/train-kenlm.am
include $(top_srcdir)/am-shared/train-moses-lm.am
include $(top_srcdir)/am-shared/train-morfessor.am
include $(top_srcdir)/am-shared/train-truecaser.am
include $(top_srcdir)/am-shared/train-moses-baseline.am
include $(top_srcdir)/am-shared/train-moses-morfessor.am
include $(top_srcdir)/am-shared/train-moses-factors.am
include $(top_srcdir)/am-shared/train-moses-labelsegs-factors.am
include $(top_srcdir)/am-shared/train-hfst.am

include $(top_srcdir)/am-shared/train-truecaser.am

# from omorfi repo
morphology.segments.hfst: $(OMORFI_PREFIX)/share/hfst/fi/morphology.segments.hfst
	cp -v $< $@

# originals with segmentation added

$(HFST_L2_COMPOUNDS_UNWEIGHTED): morphology.segments.hfst omorfi-segments.relabel
	hfst-fst2fst -f openfst < $< | hfst-substitute -F omorfi-segments.relabel |\
		hfst-minimize -E |\
		hfst-fst2fst -f olw -o $@

$(HFST_L2_MORPHS_UNWEIGHTED): morphology.segments.hfst omorfi-morphs.relabel
	hfst-fst2fst -f openfst < $< | hfst-substitute -F omorfi-morphs.relabel |\
		hfst-minimize -E |\
		hfst-fst2fst -f olw -o $@



# }}}
# {{{SEGMENTing
segments: $(SEGMENTS)

include $(top_srcdir)/am-shared/preprocess-morfessor-segmenting.am
include $(top_srcdir)/am-shared/preprocess-hfst-segmenting.am
include $(top_srcdir)/am-shared/preprocess-chipmunk-segmenting.am
include $(top_srcdir)/am-shared/preprocess-omorfi-segmenting.am

# }}}
# {{{TRANSLATEing
translations:  $(TRANSLATIONS)

include $(top_srcdir)/am-shared/translate-moses-baseline.am
include $(top_srcdir)/am-shared/translate-apertium-baseline.am
include $(top_srcdir)/am-shared/translate-morfessor-baseline.am
include $(top_srcdir)/am-shared/translate-hfst-baseline.am

# }}}
#
# {{{ EVALing
evaluations: $(EVALUATIONS)
fi-en: $(EVALUATIONS_FI_EN)
en-fi: $(EVALUATIONS_EN_FI)

include $(top_srcdir)/am-shared/postprocess-sgml.am
include $(top_srcdir)/am-shared/evaluate-oovs.am
include $(top_srcdir)/am-shared/evaluate-nistbleu.am
include $(top_srcdir)/am-shared/evaluate-ter.am
include $(top_srcdir)/am-shared/evaluate-meteor.am
include $(top_srcdir)/am-shared/evaluate-pwer.am

include $(top_srcdir)/am-shared/paper-evals.am
# }}}
#
eamt-2015-pretests:
eamt-2015-models:
eamt-2015-evals:

wmt-2015-evals: $(WMT2015_TEST_PREFIX).baseline-moses.$(L1)-$(L2).rows \
	$(WMT2015_TEST_PREFIX).baseline-moses.$(L2)-$(L1).rows \
	$(WMT2015_TEST_PREFIX).morfessor.$(L1)-$(L2).rows \
	$(WMT2015_TEST_PREFIX).morfessor.$(L2)-$(L1).rows \
	$(WMT2015_TEST_PREFIX).hfst-morphs.$(L1)-$(L2).rows \
	$(WMT2015_TEST_PREFIX).hfst-morphs.$(L2)-$(L1).rows \
	$(WMT2015_TEST_PREFIX).hfst-compounds.$(L1)-$(L2).rows \
	$(WMT2015_TEST_PREFIX).hfst-compounds.$(L2)-$(L1).rows


# vim: set foldmethod=marker:
