## Process this file with automake to create Makefile.in

## This is Makefile for abumatran SMT morphs compounds stuff
## run make to reproduce.

L1=en
L2=fi
L1_LONG=eng
L2_LONG=fin
METEOR_L1_FLAGS=-l en
METEOR_L2_FLAGS=

# all secondary
.SECONDARY:
.PHONY: corpora models segments translations evaluations fi en fi-en en-fi

# common prefixes
BASELINE_CORPUS=europarl-v7.$(L1)-$(L2)
BASELINE_TEST_PREFIX=realtest2000
UNDHR_TEST_PREFIX=undhr
APERTIUM_TEST_PREFIX=story

# Moses baseline as with the wiki page but without europarl
MOSES_BASELINE_PREFIX=$(BASELINE_CORPUS).train
include $(top_srcdir)/am-shared/settings-moses-baseline.am
include $(top_srcdir)/am-shared/settings-morfessor-baseline.am
include $(top_srcdir)/am-shared/settings-hfst-baseline.am
include $(top_srcdir)/am-shared/settings-apertium-baseline.am
#include $(top_srcdir)/am-shared/settings-moses-baseline-scaling.am
include $(top_srcdir)/am-shared/settings-segment-markers.am

include $(top_srcdir)/am-shared/settings-quick-sampling.am

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

realtest2000.fi.gz:
	$(WGET) http://www.statmt.org/wpt05/mt-shared-task/realtest2000.fi.gz

realtest2000.en.gz:
	$(WGET) http://www.statmt.org/wpt05/mt-shared-task/realtest2000.en.gz

# XXX: realtest is pre-tokenised but we don't want that because of apertium,
# removing test data from training set, etc. etc.
# but the measures may become incomparable.
realtest2000.fi.text: realtest2000.fi.gz
	zcat $< | $(ICONV) -f latin1 -t utf8 | $(MOSES_DETOKENIZER) > $@

realtest2000.en.text: realtest2000.en.gz
	zcat $< | $(ICONV) -f latin1 -t utf8 | $(MOSES_DETOKENIZER) > $@


models: $(MODELS)
fi: $(LANGUAGE_MODELS_FI)
en: $(LANGUAGE_MODELS_EN)

include $(top_srcdir)/am-shared/train-language-models.am
include $(top_srcdir)/am-shared/train-translation-models.am
include $(top_srcdir)/am-shared/train-hfst.am


# from omorfi repo
morphology.segments.hfst: $(OMORFI_PREFIX)/share/hfst/fi/morphology.segments.hfst
	cp -v $< $@

# originals with segmentation added

$(HFST_L2_COMPOUNDS_UNWEIGHTED): morphology.segments.hfst omorfi-segments.relabel
	hfst-fst2fst -f openfst < $< | hfst-substitute -F omorfi-segments.relabel |\
		hfst-minimize -o $@

$(HFST_L2_MORPHS_UNWEIGHTED): morphology.segments.hfst omorfi-morphs.relabel
	hfst-fst2fst -f openfst < $< | hfst-substitute -F omorfi-morphs.relabel |\
		hfst-minimize -o $@



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

# vim: set foldmethod=marker:
