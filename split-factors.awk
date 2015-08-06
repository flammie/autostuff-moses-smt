BEGIN { 
  if(FACTOR == "") {
    print("FACTOR unset");
    exit(1);
  }
}
{ 
  for (i = 1; i <= NF; i++) {
    split($i, factors, /\|/);
    print(factors[FACTOR]);
  }
}
