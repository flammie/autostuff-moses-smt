BEGIN { 
  if(FACTORS == "") {
    print("FACTORS unset");
    exit(1);
  }
}
{ 
  for (i = 1; i <= NF; i++) {
    split($i, factors, /\|/);
    if (length(factors) < FACTORS) {
        printf("%s not enough factors on line %d:\n%s", $i, NR, $0);
        exit(1);
    }
    for (j = 1; j <= FACTORS; j++) {
        if (length(factors[j]) < 1) {
            printf("%s emtpy factor on line %d:\n%s", $i, NR, $0);
            exit(1);
        }
    }
  }
}
