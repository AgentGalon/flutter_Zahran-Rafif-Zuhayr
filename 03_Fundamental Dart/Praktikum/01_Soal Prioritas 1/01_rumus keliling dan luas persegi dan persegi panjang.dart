double sisi = 10;
double panjang = 20;
double lebar = 20;

/// Rumus untuk Persegi
double kelilingPersegi = 4 * sisi;
double luasPersegi = sisi * sisi;

/// Rumus untuk Persegi Panjang
double kelilingPersegiPanjang = 2 * (panjang + lebar);
double luasPersegiPanjang = panjang * lebar;

void main() {
  print("Keliling dari Persegi adalah: $kelilingPersegi");
  print("Luas dari Persegi adalah: $luasPersegi");
  print("Keliling dari Persegi Panjang adalah: $kelilingPersegiPanjang");
  print("Luas dari Persegi Panjang adalah: $luasPersegiPanjang");
}
