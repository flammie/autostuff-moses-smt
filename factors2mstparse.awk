{ 
  for (i = 1; i <= NF; i++) {
      if (i > 1) { printf("\t"); }
    split($i, factors, /\|/);
    printf("%s ", factors[1]);
  }
  printf("\n");
  for (i = 1; i <= NF; i++) {
      if (i > 1) { printf("\t"); }
    split($i, factors, /\|/);
    printf("%s", factors[2]);
  }
  printf("\n");
  for (i = 1; i <= NF; i++) {
      if (i > 1) { printf("\t"); }
    split($i, factors, /\|/);
    printf("LAB");
  }
  printf("\n");
  for (i = 1; i <= NF; i++) {
      if (i > 1) { printf("\t"); }
    split($i, factors, /\|/);
    printf("0");
  }
  printf("\n\n");
}
