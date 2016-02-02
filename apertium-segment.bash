#!/bin/bash

if test $# -lt 1 ; then
	echo Usage $0 FILE
	exit 1
fi

# ~ @ # $ % ^ &amp;amp; * ( ) + = &amp;lt; &amp;gt; { } &amp;#91; &amp;#93; &amp;#124; \ / : ; &amp;apos; , .
# sed -e 's/[]{}/$$\\^@[]/\\\0/g'
sed -e 's/[]{}/$$\\^@[]/\\\0/g' < $1 | lt-proc hbs.autoseg.bin | tr '^' '\t' | tr -d '$' | sed -e 's:/\*:/:g' | sed -e 's:\t[^/]*/:\t:g' -e 's:/[^\t]*\(\t\|$\): :g' | tr '\t' ' ' | sed -e 's/→ ←→ ←/→ ←/g' | sed -e 's/\& amp;q uot;/\&amp;quot;/g' -e 's/\&amp;q uot;/\&amp;quot;/g' -e 's/<guio>//g' -e 's/<sent>//g' -e 's/<lpar>//g' -e 's/<rpar>//g' -e 's/ → ←/ /'g -e 's/→ ← / /g'  
