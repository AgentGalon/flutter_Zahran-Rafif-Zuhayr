int faktorial(int i) {
  if (i == 0 || i == 1) {
    return 1;
  } else {
    return i * faktorial(i - 1);
  }
}

void main() {
  List<int> nilai = [10, 40, 50];

  for (int n in nilai) {
    int hasilFaktorial = faktorial(n);
    print("Faktorial dari $n adalah $hasilFaktorial");
  }
}
