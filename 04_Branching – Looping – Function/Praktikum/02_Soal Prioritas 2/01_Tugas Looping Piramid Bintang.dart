void main() {
  int tinggi = 8;
  int lebar = 15;

  for (int i = 1; i <= tinggi; i++) {
    // Membuat spasi pada setiap baris agar terbentuk piramida
    String jarak = '  ' * (lebar - i);

    // Membuat bintang pada setiap baris
    String bintang = '* ' * (2 * i - 1);

    print(jarak + bintang);
  }
}
