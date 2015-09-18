## Process this file with automake to create Makefile.in

## This is Makefile for abumatran SMT morphs compounds stuff
## run make to reproduce.

# let's follow that L1=less morphs L2=more morphs
L1=en
L2=hr
L1_LONG=eng
L2_LONG=hbs
APERTIUM_L1_L2=eng-hbs_HR
APERTIUM_L2_L1=hbs_eng
METEOR_L1_FLAGS=-l en
METEOR_L2_FLAGS=


# common prefixes
BASELINE_CORPUS=hrenwacm3.norm.tok.true.esc.clean
BASELINE_TEST_PREFIX=$(BASELINE_CORPUS)
BASELINE_TUNE_PREFIX=newstest2012_first1011

WMT2013_TEST_PREFIX=newstest2013.$(L1)-$(L2)



# Moses baseline as with the wiki page but without europarl
MOSES_BASELINE_TRAIN=$(BASELINE_CORPUS)
MOSES_BASELINE_TUNE=$(BASELINE_TUNE_PREFIX)
MORFESSOR_TUNE=newstest2012_first1011.morfessor.1best
FLATCAT_TUNE=newstest2012_first1011.flatcat.1best.damplog.ppt-100
FLATCAT_PPT50_TUNE=newstest2012_first1011.flatcat.1best.ppt-50
FLATCAT_PPT200_TUNE=newstest2012_first1011.flatcat.1best.ppt-200

MORFESSOR_BASELINE_TRAIN=hrenwacm3.norm.tok.true.esc.clean
FLATCAT_BASELINE_TRAIN=hrenwacm3.norm.tok.true.esc.clean

include $(top_srcdir)/am-shared/settings-moses-baseline.am
include $(top_srcdir)/am-shared/settings-baseline-evals.am
include $(top_srcdir)/am-shared/settings-morfessor-baseline.am
include $(top_srcdir)/am-shared/settings-apertium-baseline.am

#include $(top_srcdir)/am-shared/settings-truecase-baseline.am

TRUECASER_L1=setimes.en-hr.truecaser.en
TRUECASER_L2=setimes.en-hr.truecaser.hr

HUNPOS_L2=model.hunpos.mte5.defnpout
CRF_L2=train.conll.lexicon.model

BASELINE_LM_L1=hrenwacm3.norm.tok.true.esc.clean.blm.$(L1)
BASELINE_LM_L2=hrenwacm3.norm.tok.true.esc.clean.blm.$(L2)
MORFESSOR_LM_L2=hrenwacm3.norm.tok.true.esc.clean.morfessor.1best.blm.$(L2)
FLATCAT_LM_L2=hrenwacm3.norm.tok.true.esc.clean.flatcat.1best.damplog.ppt-100.blm.$(L2)
FLATCAT_PPT50_LM_L2=hrenwacm3.norm.tok.true.esc.clean.flatcat.1best.ppt-50.blm.$(L2)
FLATCAT_PPT200_LM_L2=hrenwacm3.norm.tok.true.esc.clean.flatcat.1best.ppt-200.blm.$(L2)

include $(top_srcdir)/am-shared/preprocess-hunpos-factorising.am

MOSES_FACTORED_L1_0_1_L2_DIR=hrenwac.norm.tok.true.esc.crf.en-hr
MOSES_FACTORED_L1_0_1_L2=hrenwacm3.norm.tok.true.esc.clean.crf.factors-0-0_1.tm.untuned.en-hr

# }}}


# {{{ Corpora fetching

# no automatic fetching

include $(top_srcdir)/am-shared/preprocess-basics.am

include $(top_srcdir)/am-shared/preprocess-morfessor-segmenting.am
include $(top_srcdir)/am-shared/preprocess-split.am

# }}}

include $(top_srcdir)/am-shared/train-kenlm.am
include $(top_srcdir)/am-shared/train-moses-lm.am
include $(top_srcdir)/am-shared/train-morfessor.am
include $(top_srcdir)/am-shared/train-truecaser.am
include $(top_srcdir)/am-shared/train-moses-baseline.am
include $(top_srcdir)/am-shared/train-moses-factors.am
include $(top_srcdir)/am-shared/train-moses-morfessor.am

include $(top_srcdir)/am-shared/translate-moses-baseline.am
include $(top_srcdir)/am-shared/translate-moses-factored.am
include $(top_srcdir)/am-shared/translate-apertium-baseline.am
include $(top_srcdir)/am-shared/translate-morfessor-baseline.am
include $(top_srcdir)/am-shared/translate-morfessor-uncommons.am
include $(top_srcdir)/am-shared/translate-morfessor-lattices.am


include $(top_srcdir)/am-shared/evaluate-oovs.am
include $(top_srcdir)/am-shared/postprocess-sgml.am
include $(top_srcdir)/am-shared/evaluate-nistbleu.am
include $(top_srcdir)/am-shared/evaluate-ter.am
include $(top_srcdir)/am-shared/evaluate-meteor.am






include $(top_srcdir)/am-shared/paper-evals.am

include $(top_srcdir)/am-shared/check-oovs.am

# vim: set foldmethod=marker:
