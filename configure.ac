#/ Process this file with autoconf to produce configure scripts

## Copyright (c) 2014 Dublin City University / CNGL
## Authored by: Tommi A Pirinen <tommi.pirinen@computing.dcu.ie>

## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.

## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.


AC_INIT([abmt-morphs-segments], [20140728], [tommi.pirinen@computing.dcu.ie], [abmt-morphs-segments])
AM_INIT_AUTOMAKE([-Wall -Werror -Wno-portability foreign])

# arguments
AC_ARG_WITH([moses],
            [AS_HELP_STRING([--with-moses],
                            [custom path to moses srcdir @<:@default=PATH@:>@])],
            [with_moses=$withval])
AC_ARG_WITH([irstlm],
            [AS_HELP_STRING([--with-irstlm],
                            [custom path to irstlm install dir @<:@default=PATH@:>@])],
            [with_irstlm=$withval])
AC_ARG_WITH([giza],
            [AS_HELP_STRING([--with-giza],
                            [custom path to GIZA++ srcdir @<:@default=PATH@:>@])],
            [with_giza=$withval])
AC_ARG_WITH([mgizapp],
            [AS_HELP_STRING([--with-mgizapp],
                            [custom path to mgizapp srcdir @<:@default=PATH@:>@])],
            [with_mgizapp=$withval])
AC_ARG_WITH([giza-tools],
            [AS_HELP_STRING([--with-giza-tools],
                            [custom path to GIZA++, mkcls, sntcooc etc. @<:@default=PATH@:>@])],
            [with_giza_tools=$withval])
AC_ARG_WITH([apertium],
            [AS_HELP_STRING([--with-apertium],
                            [custom path to apertium @<:@default=PATH@:>@])],
            [with_apertium=$withval])

AC_ARG_ENABLE([parallel],
              [AS_HELP_STRING([--enable-parallel],
                              [use parallel processing @<:@default=no@:>@])],
              [enable_parallel=$enableval],
              [enable_parallel=no])
AC_ARG_WITH([cores],
	    [AS_HELP_STRING([--with-cores],
	    		    [number of cores with whatevers support --cores @<:@default=4@:>@])],
	    [with_cores=$withval],
	    [with_cores=4])
AC_ARG_WITH([threads],
	    [AS_HELP_STRING([--with-threads],
	    		    [number of threads for most threaded tools @<:@default=12@:>@])],
	    [with_threads=$withval],
	    [with_threads=12])
AS_IF([test x$enable_parallel != xno], 
      [AC_SUBST([PARALLEL_FLAGS], ["-parallel"])
       AC_SUBST([SORT_FLAGS], ["-sort-parallel $with_threads -sort-batch-size 253 -sort-compress gzip"])
       AC_SUBST([CORES_FLAGS], ["-cores $with_cores"])
       AC_SUBST([THREADS_FLAGS], ["-threads $with_threads"])])
AC_ARG_ENABLE([secondary],
              [AS_HELP_STRING([--enable-secondary],
                              [use SECONDARY directive in Makefile (retain intermediate results) @<:@default=no@:>@])],
              [enable_secondary=$enableval],
              [enable_secondary=no])
AM_CONDITIONAL([WANT_SECONDARY], [test x$enable_secondary != xno])

AC_ARG_WITH([pbs-mail],
            [AS_HELP_STRING([set email for pbs job @<:@default=disable pbs@:>@])],
            [with_pbs_mail=$withval],
            [with_pbs_mail=no])
AC_SUBST([PBS_EMAIL], [$with_pbs_mail])
AC_ARG_WITH([slurm-mail],
            [AS_HELP_STRING([set email for slurm job @<:@default=disable slurm@:>@])],
            [with_slurm_mail=$withval],
            [with_slurm_mail=no])
AC_SUBST([SLURM_EMAIL], [$with_slurm_mail])

AC_ARG_WITH([berkeley-path],
            [AS_HELP_STRING([--with-berkeley-path],
                            [path to BerkeleyParser-1.7.jar @<:@default=.@:>@])],
            [with_berkeley_path=$withval],
            [with_berkeley_path=.])
AC_ARG_WITH([tercom-path],
            [AS_HELP_STRING([--with-tercom-path],
                            [path to tercom.7.25.jar @<:@default=.@:>@])],
            [with_tercom_path=$withval],
            [with_tercom_path=.])
AC_ARG_WITH([meteor-path],
            [AS_HELP_STRING([--with-meteor-path],
                            [path to meteor.1.5.jar @<:@default=.@:>@])],
            [with_meteor_path=$withval],
            [with_meteor_path=.])
AC_ARG_WITH([marmot-path],
            [AS_HELP_STRING([--with-marmot-path],
                            [path to marmot.jar @<:@default=.@:>@])],
            [with_marmot_path=$withval],
            [with_marmot_path=.])
AC_ARG_WITH([omorfi-prefix],
            [AS_HELP_STRING([--with-omorfi-prefix],
                            [path to omorfi installation @<:@default=/usr/local@:>@])],
            [with_omorfi_path=$withval],
            [with_omorfi_path=.])

# Programs
AM_PATH_PYTHON([2.7])
AC_PATH_PROG([JAVA], [java], [false])
AC_PATH_PROG([WGET], [wget], [false])
AC_PATH_PROGS([TAR], [gnutar gtar tar], [false])
AC_PATH_PROG([ICONV], [iconv], [false])


#tex
AC_PATH_PROG([XELATEX], [xelatex], [false])
AC_PATH_PROG([BIBTEX], [bibtex], [false])
AM_CONDITIONAL([CAN_LATEX], [test x$XELATEX != xfalse])

# moses
AC_PATH_PROG([MOSES], [moses], [false], [$PATH$PATH_SEPARATOR$with_moses/bin])
AC_PATH_PROG([MOSES_CHART], [moses_chart], [false], [$PATH$PATH_SEPARATOR$with_moses/bin])
AC_PATH_PROG([MOSES_RELAX_PARSE], [relax-parse], [false], [$PATH$PATH_SEPARATOR$with_moses/bin])
AC_PATH_PROG([MOSES_TRAIN_MODEL], [train-model.perl], [false], [$PATH$PATH_SEPARATOR$with_moses/scripts/training/])
AC_PATH_PROG([MOSES_TOKENIZER], [tokenizer.perl], [false], [$PATH$PATH_SEPARATOR$with_moses/scripts/tokenizer/])
AC_PATH_PROG([MOSES_NORMALIZE_PUNCTUATION], [normalize-punctuation.perl], [false], [$PATH$PATH_SEPARATOR$with_moses/scripts/tokenizer/])
AC_PATH_PROG([MOSES_ESCAPE_SPECIAL_CHARS], [escape-special-chars.perl], [false], [$PATH$PATH_SEPARATOR$with_moses/scripts/tokenizer/])
AC_PATH_PROG([MOSES_DEESCAPE_SPECIAL_CHARS], [deescape-special-chars.perl], [false], [$PATH$PATH_SEPARATOR$with_moses/scripts/tokenizer/])
AC_PATH_PROG([MOSES_REMOVE_NON_PRINTING_CHAR], [remove-non-printing-char.perl], [false], [$PATH$PATH_SEPARATOR$with_moses/scripts/tokenizer/])
AC_PATH_PROG([MOSES_TRAIN_TRUECASER], [train-truecaser.perl], [false], [$PATH$PATH_SEPARATOR$with_moses/scripts/recaser/])
AC_PATH_PROG([MOSES_TRUECASE], [truecase.perl], [false], [$PATH$PATH_SEPARATOR$with_moses/scripts/recaser/])
AC_PATH_PROG([MOSES_DETOKENIZER], [detokenizer.perl], [false], [$PATH$PATH_SEPARATOR$with_moses/scripts/tokenizer/])
AC_PATH_PROG([MOSES_DETRUECASE], [detruecase.perl], [false], [$PATH$PATH_SEPARATOR$with_moses/scripts/recaser/])
AC_PATH_PROG([MOSES_CLEAN_CORPUS_N], [clean-corpus-n.perl], [false], [$PATH$PATH_SEPARATOR$with_moses/scripts/training/])
AC_PATH_PROG([MOSES_BUILD_BINARY], [build_binary], [false], [$PATH$PATH_SEPARATOR$with_moses/bin/])
AC_PATH_PROG([MOSES_MERT], [mert-moses.pl], [false], [$PATH$PATH_SEPARATOR$with_moses/scripts/training/])
AC_PATH_PROG([MOSES_PROCESS_PHRASE_TABLE_MIN], [processPhraseTableMin], [false], [$PATH$PATH_SEPARATOR$with_moses/bin/])
AC_PATH_PROG([MOSES_PROCESS_LEXICAL_TABLE_MIN], [processLexicalTableMin], [false], [$PATH$PATH_SEPARATOR$with_moses/bin/])
AC_PATH_PROG([MOSES_FILTER_MODEL_GIVEN_INPUT], [filter-model-given-input.pl], [false], [$PATH$PATH_SEPARATOR$with_moses/scripts/training/])
AC_PATH_PROG([MOSES_FILTER_MODEL_GIVEN_INPUT_HIER], [filter-model-given-input-hier.pl], [false], [$PATH$PATH_SEPARATOR$with_moses/scripts/training/])
AC_PATH_PROG([MOSES_OOV], [oov.pl], [false], [$PATH$PATH_SEPARATOR$with_moses/scripts/analysis/])
AC_PATH_PROG([MOSES_MULTI_BLEU], [multi-bleu.perl], [false], [$PATH$PATH_SEPARATOR$with_moses/scripts/generic/])
AC_PATH_PROG([MOSES_BERKELEY2XML_PTB], [berkeleyparsed2mosesxml_PTB.perl], [false], [$PATH$PATH_SEPARATOR$with_moses/scripts/training/wrappers/])

AS_IF([test x$MOSES = xfalse], [AC_MSG_ERROR([moses not found in $PATH$PATH_SEPARATOR:$with_moses, try --with-moses=PATH_TO_MOSES with downloaded mosesdecoder git src dir])])

# qsub
AC_PATH_PROG([QSUB], [qsub], [false])

# irstlm
AC_PATH_PROG([IRSTLM_ADD_START_END], [add-start-end.sh], [false], [$PATH$PATH_SEPARATOR$with_irstlm/bin/])
AC_PATH_PROG([IRSTLM_RM_START_END], [rm-start-end.sh], [false], [$PATH$PATH_SEPARATOR$with_irstlm/bin/])
AC_PATH_PROG([IRSTLM_BUILD_LM], [build-lm.sh], [false], [$PATH$PATH_SEPARATOR$with_irstlm/bin/])
AC_SUBST([IRSTLM_BUILD_LM_FIXED], [build-lm-makeable.sh])
AC_PATH_PROG([IRSTLM_COMPILE_LM], [compile-lm], [false], [$PATH$PATH_SEPARATOR$with_irstlm/bin/])

AS_IF([test x$IRSTLM_COMPILE_LM = xfalse], [AC_MSG_ERROR([irstlm not found im $PATH$PATH_SEPARATOR$with_irstlm, try --with-irstlm=IRSTLM_PATH with path irstlm tells it installs to at the end of configure])])
AC_SUBST([IRSTLM_DIR], [$with_irstlm])

# KenLM
AC_PATH_PROG([LMPLZ], [lmplz], [false])


# Argh giza tools
AC_PATH_PROG([MGIZA], [mgiza], [false], [$PATH$PATH_SEPARATOR$with_giza_tools/])
AC_PATH_PROG([GIZAPP], [GIZA++], [false], [$PATH$PATH_SEPARATOR$with_giza_tools/])
AC_PATH_PROG([GIZA_MKCLS], [mkcls], [false], [$PATH$PATH_SEPARATOR$with_giza_tools/])
AC_PATH_PROG([GIZA_SNT2COOC], [snt2cooc], [false], [$PATH$PATH_SEPARATOR$with_giza_tools/])
AC_PATH_PROG([MGIZA_SNT2COOC], [snt2cooc.pl], [false], [$PATH$PATH_SEPARATOR$with_giza_tools/])
AC_PATH_PROG([MGIZA_SNT2COOCRMP], [snt2coocrmp], [false], [$PATH$PATH_SEPARATOR$with_giza_tools/])
AS_IF([test -z $with_giza_tools], [AC_MSG_ERROR([giza tools must be copied to a directory and specified --with-giza-tools=DIR])])
AC_SUBST([GIZA_TOOLDIR], [$with_giza_tools])
AS_IF([test x$MGIZA != xfalse], [AC_SUBST([MGIZA_FLAGS], ["-mgiza -mgiza-cpus $with_threads"])])
AS_IF([test x$MGIZA_SNT2COOC != xfalse], [AC_SUBST([SNT2COOC_FLAG], ["-snt2cooc snt2cooc.pl"])])

# morfessor
AC_PATH_PROG([MORFESSOR], [morfessor], [false])
AC_PATH_PROG([MORFESSOR_TRAIN], [morfessor-train], [false])
AC_PATH_PROG([MORFESSOR_SEGMENT], [morfessor-segment], [false])
AC_PATH_PROG([MORFESSOR_FLATCAT], [flatcat], [false])
AC_PATH_PROG([MORFESSOR_FLATCAT_TRAIN], [flatcat-train], [false])
AC_PATH_PROG([MORFESSOR_FLATCAT_SEGMENT], [flatcat-segment], [false])
AM_CONDITIONAL([CAN_MORFESS], [test x$MORFESSOR != xfalse])
AM_CONDITIONAL([CAN_FLATCAT], [test x$MORFESSOR_FLATCAT != xfalse])

# omorfi
AC_PATH_PROG([OMORFI_SEGMENT], [omorfi-segment.py], [false])
AC_CHECK_FILE([$with_omorfi_prefix/share/omorfi/omorfi.segment.hfst], 
	      [AC_SUBST([OMORFIDIR], [$with_omorfi_prefix/share/omorfi/],
		        [AC_MSG_WARN([point --with-omorfi-prefix to installed automata for omorfi segmenting])])])
AM_CONDITIONAL([CAN_OMORFI], [test x$OMORFI_SEGMENT != xfalse])

# Berkeley
AC_CHECK_FILE([$with_berkeley_path/BerkeleyParser-1.7.jar],
              [AC_SUBST([BERKELEYPARSERJAR], [$with_berkeley_path/BerkeleyParser-1.7.jar],
                        [AC_MSG_WARN([point --with-berkeley-path to dir of berkeley parser for berkeley parsing])])])
AM_CONDITIONAL([CAN_BERKELEY], [test x$BERKELEYPARSERJAR != x])

# marmot
AC_CHECK_FILE([$with_marmot_path/marmot.jar],
              [AC_SUBST([MARMOTPATH], [$with_marmot_path],
                        [AC_MSG_WARN([point --with-marmot-path to dir of marmot parser and cp or ln the dated version to undated])])])
AM_CONDITIONAL([CAN_MARMOT], [test x$MARMOTPATH != x])

# java -cp /home/tpirinen/Koodit/cistern/marmot/marmot-2015-11-25.jar:/home/tpirinen/Koodit/cistern/marmot/lib/mallet.jar:/home/tpirinen/Koodit/cistern/marmot/lib/JSAP-2.1.jar chipmunk.segmenter.cmd.Segment --model-file fin.chipmunk.srl --input-file foo --output-file bar
# MST parser
AC_CHECK_FILE([$with_mstparser_path/lib/mstparser-0.5.1.jar],
              [AC_SUBST([MSTPARSERJAR], [$with_mstparser_path/mstparser.jar],
                        [AC_MSG_WARN([point --with-mstparser-path to dir of mstparser for mstparsing])])])
AM_CONDITIONAL([CAN_MSTPARSE], [test x$MSTPARSERJAR != x])

# NIST eval tools
AC_PATH_PROG([NIST_BLEU13A], [mteval-v13a.pl], [false])
AM_CONDITIONAL([CAN_NISTBLEU], [test x$NIST_BLEU13A != xfalse])

# TER eval tool
AC_CHECK_FILE([$with_tercom_path/tercom.7.25.jar],
              [AC_SUBST([TERJAR], [$with_tercom_path/tercom.7.25.jar])],
              [AC_MSG_WARN([point --with-tercom-path to dir of tercom.7.25.jar for TER tests])])
AM_CONDITIONAL([CAN_TER], [test x$TERJAR != x])

# METEOR eval tool
AC_CHECK_FILE([$with_meteor_path/meteor-1.5.jar],
              [AC_SUBST([METEORJAR], [$with_meteor_path/meteor-1.5.jar])],
              [AC_MSG_WARN([point --with-meteor-path to dir of meteor-1.5.jar for METEOR tests])])
AM_CONDITIONAL([CAN_METEOR], [test x$METEORJAR != x])

# WERPL and PERPL by ape
AC_PATH_PROG([WER], [WER.pl], [false])
AC_PATH_PROG([PER], [PER.pl], [false])


# XML wrapping for eval
AC_PATH_PROG([WRAP_XML], [wrap-xml.prompsit-version.sh], [false])
AM_CONDITIONAL([CAN_WRAPXML], [test x$WRAP_XML != xfalse])

# europarl 
AC_PATH_PROG([EUROPARL_ALIGN_SENTENCES], [sentence-align-corpus.perl], [false])
AM_CONDITIONAL([CAN_EUROPARL], [test x$EUROPARL_ALIGN_SENTENCES])

# external language models nicely
AC_PATH_PROGS([PKGCONFIG], [pkg-config pkgconf], 
             [AC_MSG_ERROR([pkg-config is crucial for even configure to work])])
PKG_CHECK_MODULES([APERTIUM], [apertium],,
                  [AC_MSG_WARN([apertium missing])])
AC_PATH_PROG([APERTIUM], [apertium], [false])
AC_PATH_PROG([APERTIUM_DESTXT], [apertium-destxt], [cat])
AC_PATH_PROG([APERTIUM_RETXT], [apertium-retxt], [cat])
AM_CONDITIONAL([CAN_APERTIUM], [test x$APERTIUM != xfalse -a x$with_apertium != xno])
PKG_CHECK_MODULES([APERTIUM_FIN_ENG], [apertium-fin-eng],, 
                  [AC_MSG_WARN([pkg-config did not find fin-eng make sure apertium command does])])
PKG_CHECK_MODULES([APERTIUM_HBS_ENG], [apertium-hbs-eng],, 
                  [AC_MSG_WARN([pkg-config did not find hbs-eng make sure apertium command does])])

# HFST
PKG_CHECK_MODULES([OMORFI], [omorfi], 
                  [AC_SUBST([OMORFI_PREFIX], [`pkg-config --variable prefix omorfi`])],
                  [AC_MSG_WARN([pkg-config did not find omorfi ensure that morphology.segments.hfst is in work dir])
                  AC_SUBST([OMORFI_PREFIX], [`pwd`])])
AC_PATH_PROG([HFST_LOOKUP], [hfst-lookup], [false])
AM_CONDITIONAL([CAN_HFST], [test x$HFST_LOOKUP != xfalse])

# HUNPOS
AC_PATH_PROG([HUNPOS_TAG], [hunpos-tag], [false])

# some oses are broken
AC_PATH_PROGS_FEATURE_CHECK([SED], [gnused gsed sed],
              [[m4out=`echo aaa | $ac_path_SED 's/a/\n/g' | wc -l`
                test "x$m4out" = x4\
                && ac_cv_path_SED=$ac_path_SED ac_path_SED_found=:]],
              [AC_MSG_ERROR([could not find sed that supports new line])])
AC_SUBST([SED], [$ac_cv_path_SED])
AC_PATH_PROG([COMM], [comm])

# 
AC_CONFIG_FILES([Makefile \
                 fin-eng/Makefile \
                 lit-eng/Makefile \
                 hbs-eng/Makefile \
                 spa-eus/Makefile])
                 #fin-lit/Makefile
AC_CONFIG_FILES([build-lm-makeable.sh],
                [chmod +x build-lm-makeable.sh])
AS_IF([test x$with_pbs_mail != xno],
      [AC_CONFIG_FILES([morph-segments-all.pbs
       fin-eng/morph-segments-all.pbs
       fin-eng/morph-segments-fin-eng.pbs
       fin-eng/morph-segments-eng-fin.pbs
       ])])
AS_IF([test x$with_slurm_mail != xno],
      [AC_CONFIG_FILES([morph-segments-all.slurm
       fin-eng/morph-segments-fin-eng.slurm
       ])])

AC_OUTPUT

cat <<EOF
-- Making article and experiments $PACKAGE_STRING
  Training:
  * moses: $with_moses_path
    * moses bin: $MOSES
    * train model: $MOSES_TRAIN_MODEL
    * parallel: $PARALLEL $PARALLEL_FLAGS $THREADS_FLAGS $CORES_FLAGS
  * irstlm: $IRSTLM_DIR
    * build lm: $IRSTLM_BUILD_LM
  * giza: $GIZA_TOOLDIR
    * GIZA++: $GIZAPP
    * mgiza: $MGIZA $MGIZA_FLAGS
    * mkcls: $GIZA_MKCLS
    * snt2cooc.pl (preferred): $MGIZA_SNT2COOC
    * snt2cooc: $GIZA_SNT2COOC
  * morfessor: $MORFESSOR
  * RB segments / hfst: $HFST_LOOKUP
    * fin / omorfi: $OMORFI_PREFIX
  * RBMT / apertium: $APERTIUM
    * fin-eng: $APERTIUM_FIN_ENG
    * hbs-eng: $APERTIUM_HBS_ENG
  Eval:
  * wrap-xml: $WRAP_XML
  * nist-bleu: $NIST_BLEU13A
  * ter: $TERJAR
  * meteor: $METEORJAR
  * wer: $WER
  * per: $PER
  Paper:
  * xelatex: $XELATEX
  * bibtex: $BIBTEX

to make experiments (or paper) say make.
(Some parts of this make process may download large files and take up to 50
 hours using 7 gigs of ram, on average laptop)
subdirs are per language pair. This dir is for paper AND all language pairs.
EOF
