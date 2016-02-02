$1 == "<s>" {for (i=2; i <=NF; i++) $i = ""; /* ignore * /}
$1 == "</s>" {printf("\n"); for (i=2; i <= NF; i++) $i= ""; }
$1 == "<EMPTYLINE/>" { $2 = "____:SPECIAL|EMPTYTOKEN"; for (i=3; i<=NF; i++) $i="" }
{for (i = 2; i <= NF; i++) { 
        printf("%s", gensub(/:/, "|", "g", gensub(/\|/, ".", "g", $i)));
        if (i < NF ) {
            printf("→ ←");
        }
    }
    printf(" ");
}
