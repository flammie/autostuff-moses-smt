## Process this file with automake to create Makefile.in

## This is Makefile for abumatran SMT morphs compounds stuff
## run make to reproduce.

L1=en
L2=lt
L1_LONG=eng
L2_LONG=lit
METEOR_L1_FLAGS=-l en
METEOR_L2_FLAGS=

# all secondary
if WANT_SECONDARY
.SECONDARY:

endif
# common prefixes
BASELINE_CORPUS=europarl-v7.$(L1)-$(L2)
UNDHR_TEST_PREFIX=undhr
APERTIUM_TEST_PREFIX=story

# Moses baseline as with the wiki page but without europarl
MOSES_BASELINE_PREFIX=$(BASELINE_CORPUS).train
include $(top_srcdir)/am-shared/settings-moses-baseline.am
include $(top_srcdir)/am-shared/settings-baseline-evals.am
include $(top_srcdir)/am-shared/settings-morfessor-baseline.am
#include $(top_srcdir)/am-shared/settings-apertium-baseline.am


#APERTIUM_L1_L2=eng-fin
#APERTIUM_L2_L1=fin-eng

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

include $(top_srcdir)/am-shared/preprocess-europarl.am
include $(top_srcdir)/am-shared/preprocess-split.am

include $(top_srcdir)/am-shared/train-language-models.am
include $(top_srcdir)/am-shared/train-moses-baseline.am


# }}}
# {{{SEGMENTing

include $(top_srcdir)/am-shared/preprocess-morfessor-segmenting.am

# }}}
# {{{TRANSLATEing

include $(top_srcdir)/am-shared/translate-moses-baseline.am
#include $(top_srcdir)/am-shared/translate-apertium-baseline.am
include $(top_srcdir)/am-shared/translate-morfessor-baseline.am

include $(top_srcdir)/am-shared/postprocess-sgml.am
include $(top_srcdir)/am-shared/evaluate-oovs.am
include $(top_srcdir)/am-shared/evaluate-nistbleu.am
include $(top_srcdir)/am-shared/evaluate-ter.am
include $(top_srcdir)/am-shared/evaluate-meteor.am

include $(top_srcdir)/am-shared/paper-evals.am

# vim: set foldmethod=marker:
