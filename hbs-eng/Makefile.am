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

MORFESSOR_FLAGS_L2=
FLATCAT_FLAGS_L2=--perplexity-threshold 100 -d log

# common prefixes
BASELINE_CORPUS=out.forms.ml.1-0.en-hr.sorted.uniq.top1div4
BASELINE_TEST_PREFIX=$(BASELINE_CORPUS)
BASELINE_TUNE_PREFIX=newstest2012_first1011

WMT2013_TEST_PREFIX=newstest2013.$(L1)-$(L2)



# Moses baseline as with the wiki page but without europarl
MOSES_BASELINE_TRAIN=$(BASELINE_CORPUS)
MOSES_BASELINE_TUNE=$(BASELINE_TUNE_PREFIX)

MORFESSOR_TUNE=newstest2012_first1011.morfessor.1best
FLATCAT_TUNE=newstest2012_first1011.flatcat.1best
APERTIUM_TUNE=newstest2012_first1011.apertium.1best

FLATCAT_PPT50_TUNE=newstest2012_first1011.flatcat.1best.ppt-50
FLATCAT_PPT200_TUNE=newstest2012_first1011.flatcat.1best.ppt-200

MOSES_FACTORS_0_TO_0_1_TUNE=newstest2012_first1011.crf.factors.$(L2)

MORFESSOR_BASELINE_TRAIN=hrenwacm3.norm.tok.true.esc.clean
FLATCAT_BASELINE_TRAIN=hrenwacm3.norm.tok.true.esc.clean
APERTIUM_BASELINE_TRAIN=out.forms.ml.1-0.en-hr.sorted.uniq.top1div4

include $(top_srcdir)/am-shared/settings-moses-baseline.am
include $(top_srcdir)/am-shared/settings-baseline-evals.am
include $(top_srcdir)/am-shared/settings-morfessor-baseline.am
include $(top_srcdir)/am-shared/settings-apertium-baseline.am

#include $(top_srcdir)/am-shared/settings-truecase-baseline.am

TRUECASER_L1=setimes.en-hr.truecaser.en
TRUECASER_L2=setimes.en-hr.truecaser.hr

HUNPOS_L2=model.hunpos.mte5.defnpout
CRF_L2=train.conll.lexicon.model

BASELINE_LM_L1=binlm.5g.trie.allwmt15.norm.tok.true.esc.blm.$(L1)
BASELINE_LM_L2=hrwac2.0.deduped.devert.norm.tok.true.esc.blm.$(L2)
MORFESSOR_LM_L2=hrwac2.0.deduped.devert.norm.tok.true.esc.morfessor.1best.blm.$(L2)
FLATCAT_LM_L2=hrwac2.0.deduped.devert.norm.tok.true.esc.flatcat.1best.blm.$(L2)

FLATCAT_PPT50_LM_L2=hrenwacm3.norm.tok.true.esc.clean.flatcat.1best.ppt-50.blm.$(L2)
FLATCAT_PPT200_LM_L2=hrenwacm3.norm.tok.true.esc.clean.flatcat.1best.ppt-200.blm.$(L2)

APERTIUM_LM_L2=hrwac2.0.deduped.devert.norm.tok.true.esc.apertium.1best.blm.$(L2)
APERTIUM_SEGMENTER_L2=hbs.autoseg.bin

include $(top_srcdir)/am-shared/preprocess-hunpos-factorising.am
include $(top_srcdir)/am-shared/preprocess-morfessor-segmenting.am
include $(top_srcdir)/am-shared/preprocess-apertium-segmenting.am

MOSES_FACTORED_L1_0_1_L2_DIR=hrenwacm3.norm.tok.true.esc.clean.crf.en-hr-factors-0-0_1
MOSES_FACTORED_L1_0_1_L2=hrenwacm3.norm.tok.true.esc.clean.crf.factors-0-0_1.tuned-binarised.tm.en-hr

FACTOR_0_LM_L2=$(BASELINE_LM_L2)
FACTOR_1_LM_L2=hrwac2.0.setimes.ted.norm.tok.true.esc.mostly.crf.factor-1.blm.hr

# out.forms.ml.1-0.en-hr.sorted.uniq.top1div4.hunpos.en-hr-factors-0-0_1/

MOSES_HUNPOSED_L1_0_1_L2_DIR=out.forms.ml.1-0.en-hr.sorted.uniq.top1div4.hunpos.en-hr-factors-0-0_1
MOSES_HUNPOSED_L1_0_1_L2=out.forms.ml.1-0.en-hr.sorted.uniq.top1div4.hunpos.hunpos-factors-0-0_1.tuned-binarised.tm.en-hr
HUNPOS_FACTOR_0_LM_L2=$(BASELINE_LM_L2)
HUNPOS_FACTOR_1_LM_L2=hrwac2.0.deduped.devert.norm.tok.true.esc.hunpos.factor-1.blm.hr

MOSES_CRFED_L1_0_1_L2_DIR=out.forms.ml.1-0.en-hr.sorted.uniq.top1div4.crf.en-hr-factors-0-0_1
MOSES_CRFED_L1_0_1_L2=out.forms.ml.1-0.en-hr.sorted.uniq.top1div4.crf.crf-factors-0-0_1.tuned-binarised.tm.en-hr
CRF_FACTOR_0_LM_L2=$(BASELINE_LM_L2)
CRF_FACTOR_1_LM_L2=hrwac2.0.setimes.ted.norm.tok.true.esc.mostly.crf.factor-1.blm.hr

MOSES_APERTIUM1BEST_L1_L2_DIR=out.forms.ml.1-0.en-hr.sorted.uniq.top1div4.apertium.1best.$(L1)-$(L2)
MOSES_APERTIUM1BEST_L1_L2=out.forms.ml.1-0.en-hr.sorted.uniq.top1div4.apertium.1best.apertium-tuned-binarised.tm.$(L1)-$(L2)
MOSES_APERTIUM1BEST_L2_L1_DIR=out.forms.ml.1-0.en-hr.sorted.uniq.top1div4.apertium.1best.$(L2)-$(L1)
MOSES_APERTIUM1BEST_L2_L1=out.forms.ml.1-0.en-hr.sorted.uniq.top1div4.apertium.1best.apertium-tuned-binarised.tm.$(L2)-$(L1)
#
MOSES_HIERARCHICAL_L1_L2_DIR=out.forms.ml.1-0.en-hr.sorted.uniq.top1div4.en-hr-hierarchical
MOSES_HIERARCHICAL_L1_L2=out.forms.ml.1-0.en-hr.sorted.uniq.top1div4.hierarchical-tuned.tm.en-hr
MOSES_HIERARCHICAL_L2_L1_DIR=out.forms.ml.1-0.en-hr.sorted.uniq.top1div4.hr-en-hierarchical
MOSES_HIERARCHICAL_L2_L1=out.forms.ml.1-0.en-hr.sorted.uniq.top1div4.hierarchical-tuned.tm.hr-en
# }}}


# {{{ Corpora fetching

# no automatic fetching

include $(top_srcdir)/am-shared/preprocess-basics.am

include $(top_srcdir)/am-shared/preprocess-split.am

# }}}

include $(top_srcdir)/am-shared/train-kenlm.am
include $(top_srcdir)/am-shared/train-moses-lm.am
include $(top_srcdir)/am-shared/train-morfessor.am
include $(top_srcdir)/am-shared/train-truecaser.am
include $(top_srcdir)/am-shared/train-moses-baseline.am
include $(top_srcdir)/am-shared/train-moses-hierarchical.am
include $(top_srcdir)/am-shared/train-moses-factors.am
include $(top_srcdir)/am-shared/train-moses-target-syntax.am
include $(top_srcdir)/am-shared/train-moses-morfessor.am
include $(top_srcdir)/am-shared/train-moses-apesegs.am
include $(top_srcdir)/am-shared/train-moses-reordering.am

include $(top_srcdir)/am-shared/translate-moses-baseline.am
include $(top_srcdir)/am-shared/translate-moses-factored.am
include $(top_srcdir)/am-shared/translate-apertium-segmented.am
include $(top_srcdir)/am-shared/translate-morfessor-baseline.am
include $(top_srcdir)/am-shared/translate-morfessor-uncommons.am
include $(top_srcdir)/am-shared/translate-morfessor-lattices.am
include $(top_srcdir)/am-shared/translate-moses-hierarchical.am

include $(top_srcdir)/am-shared/evaluate-oovs.am
include $(top_srcdir)/am-shared/postprocess-sgml.am
include $(top_srcdir)/am-shared/evaluate-nistbleu.am
include $(top_srcdir)/am-shared/evaluate-ter.am
include $(top_srcdir)/am-shared/evaluate-meteor.am






include $(top_srcdir)/am-shared/paper-evals.am

include $(top_srcdir)/am-shared/check-oovs.am

# vim: set foldmethod=marker:
