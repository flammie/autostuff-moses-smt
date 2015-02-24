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
BASELINE_CORPUS=europarl-v8.$(L1)-$(L2)
BASELINE_TEST_PREFIX=europarl-v7.$(L1)-$(L2).test
MTMATRIX_TEST_PREFIX=realtest2000
UNDHR_TEST_PREFIX=undhr
APERTIUM_TEST_PREFIX=story
WMT_TEST_PREFIX=newsdev2015-$(L1)$(L2)

# Moses baseline as with the wiki page but without europarl
MOSES_BASELINE_TRAIN=$(BASELINE_CORPUS).train
MOSES_BASELINE_TUNE=$(BASELINE_CORPUS).dev
include $(top_srcdir)/am-shared/settings-moses-baseline.am
include $(top_srcdir)/am-shared/settings-morfessor-baseline.am
include $(top_srcdir)/am-shared/settings-hfst-baseline.am
include $(top_srcdir)/am-shared/settings-apertium-baseline.am
#include $(top_srcdir)/am-shared/settings-moses-baseline-scaling.am
#include $(top_srcdir)/am-shared/settings-segment-markers.am

#include $(top_srcdir)/am-shared/settings-quick-sampling.am
include $(top_srcdir)/am-shared/check-oovs.am

HFST_L2_MORPHS_UNWEIGHTED=omorfi-morphs.hfst
HFST_L2_COMPOUNDS_UNWEIGHTED=omorfi-compounds.hfst
# just unweight now
HFST_L2_MORPHS=$(HFST_L2_MORPHS_UNWEIGHTED)
HFST_L2_COMPOUNDS=$(HFST_L2_COMPOUNDS_UNWEIGHTED)

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

include $(top_srcdir)/am-shared/preprocess-europarl.am
include $(top_srcdir)/am-shared/preprocess-split.am

europarl-v8.fi-en.tgz:
	$(WGET) http://statmt.org/wmt15/europarl-v8.fi-en.tgz

europarl-v8.fi-en.fi.text: europarl-v8.fi-en.tgz
	tar zxvf $< europarl-v8.fi-en.fi
	mv -v europarl-v8.fi-en.fi $@

europarl-v8.fi-en.en.text: europarl-v8.fi-en.tgz
	tar zxvf $< europarl-v8.fi-en.en
	mv -v europarl-v8.fi-en.en $@

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

include $(top_srcdir)/am-shared/train-language-models.am
include $(top_srcdir)/am-shared/train-moses-baseline.am
include $(top_srcdir)/am-shared/train-hfst.am


# from omorfi repo
morphology.segments.hfst: $(OMORFI_PREFIX)/share/hfst/fi/morphology.segments.hfst
	cp -v $< $@

# originals with segmentation added

$(HFST_L2_COMPOUNDS_UNWEIGHTED): morphology.segments.hfst omorfi-segments.relabel
	hfst-fst2fst -f openfst < $< | hfst-substitute -F omorfi-segments.relabel |\
		hfst-minimize |\
		hfst-fst2fst -f olw -o $@

$(HFST_L2_MORPHS_UNWEIGHTED): morphology.segments.hfst omorfi-morphs.relabel
	hfst-fst2fst -f openfst < $< | hfst-substitute -F omorfi-morphs.relabel |\
		hfst-minimize |\
		hfst-fst2fst -f olw -o $@



# }}}
# {{{SEGMENTing
segments: $(SEGMENTS)

include $(top_srcdir)/am-shared/preprocess-morfessor-segmenting.am
include $(top_srcdir)/am-shared/preprocess-hfst-segmenting.am

# }}}
# {{{TRANSLATEing
translations:  $(TRANSLATIONS)

include $(top_srcdir)/am-shared/translate-moses-baseline.am
include $(top_srcdir)/am-shared/translate-apertium-baseline.am
include $(top_srcdir)/am-shared/translate-morfessor-baseline.am
include $(top_srcdir)/am-shared/translate-hfst-baseline.am


evaluations: $(EVALUATIONS)
fi-en: $(EVALUATIONS_FI_EN)
en-fi: $(EVALUATIONS_EN_FI)

include $(top_srcdir)/am-shared/postprocess-sgml.am
include $(top_srcdir)/am-shared/evaluate-oovs.am
include $(top_srcdir)/am-shared/evaluate-nistbleu.am
include $(top_srcdir)/am-shared/evaluate-ter.am
include $(top_srcdir)/am-shared/evaluate-meteor.am

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
	$(WMT2015_TEST_PREFIX).hfst-compounds.$(L2)-$(L1).rows \


# vim: set foldmethod=marker:
