#!/bin/bash
set -x

if test $# -lt 2 ; then
    echo Usage: $0 FILE1 FILEs...
    echo
    echo ensures that FILE1 and FILEs have same number of lines before heavy stuff
    exit 1
fi

mytmp=$(mktemp -dt abmtassmsalc.XXXXXXXXXX)
wc -l < $1 > $mytmp/wc-l.ref
shift
for f in $@ ; do
    wc -l < $f > $mytmp/wc-l.trg
    if ! diff $mytmp/wc-l.ref $mytmp/wc-l.trg ; then
        echo "not same number of lines in $1"
        exit 2
    fi
done
exit 0
