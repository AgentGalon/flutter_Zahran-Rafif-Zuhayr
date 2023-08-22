import 'dart:math';

double luasLingkaran(double jariJari) {
  return pi * jariJari * jariJari;
}

void main() {
  double jariJariLingkaran = 9.0;
  double luas = luasLingkaran(jariJariLingkaran);
  print("Luas lingkaran dari jari-jari $jariJariLingkaran adalah $luas");
}
