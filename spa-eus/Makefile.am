## Process this file with automake to create Makefile.in

## This is Makefile for abumatran SMT morphs compounds stuff
## run make to reproduce.

L1=es
L2=eu
L1_LONG=spa
L2_LONG=eus
METEOR_L1_FLAGS=-l es
METEOR_L2_FLAGS=

if WANT_SECONDARY
# all secondary
.SECONDARY:
endif
.PHONY:

# {{{ SETTINGS
# common prefixes
BASELINE_CORPUS=tweetmt-OpenSubtitles2013-corpus_from_tmx.$(L1)-$(L2)
BASELINE_TEST_PREFIX=tweetmt.$(L1)-$(L2).test

# Moses baseline as with the wiki page but without europarl
MOSES_BASELINE_TRAIN=$(BASELINE_CORPUS)
MOSES_BASELINE_TUNE=tweetmt.dev.$(L2)$(L1).norm.tok

MORFESSOR_BASELINE_TRAIN=tweets_eu.gz.norm.tok.split.eu.gz

include $(top_srcdir)/am-shared/settings-moses-baseline.am
include $(top_srcdir)/am-shared/settings-baseline-evals.am
include $(top_srcdir)/am-shared/settings-truecase-baseline.am
include $(top_srcdir)/am-shared/settings-morfessor-baseline.am
include $(top_srcdir)/am-shared/settings-hfst-baseline.am
include $(top_srcdir)/am-shared/settings-apertium-baseline.am

include $(top_srcdir)/am-shared/check-oovs.am


APERTIUM_L1_L2=es-eu
APERTIUM_L2_L1=eu-es

# add none baseline tests

PAPER=

# all is secondary, clean a lot
CLEANFILES=$(MODELS) $(SEGMENTS) $(TRANSLATIONS) $(EVALUATIONS) \
			$(PAPER)
# }}}

noinst_DATA=

# {{{ CORPORA
corpora:

include $(top_srcdir)/am-shared/preprocess-split.am

# no external data yet

# }}}
#
# {{{ MODELS

models: $(MODELS)
fi: $(LANGUAGE_MODELS_FI)
en: $(LANGUAGE_MODELS_EN)

include $(top_srcdir)/am-shared/train-language-models.am
include $(top_srcdir)/am-shared/train-moses-baseline.am





# }}}
# {{{SEGMENTing
segments: $(SEGMENTS)

include $(top_srcdir)/am-shared/preprocess-morfessor-segmenting.am

# }}}
# {{{TRANSLATEing
translations:  $(TRANSLATIONS)

include $(top_srcdir)/am-shared/translate-moses-baseline.am
include $(top_srcdir)/am-shared/translate-apertium-baseline.am
include $(top_srcdir)/am-shared/translate-morfessor-baseline.am

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


# vim: set foldmethod=marker:
