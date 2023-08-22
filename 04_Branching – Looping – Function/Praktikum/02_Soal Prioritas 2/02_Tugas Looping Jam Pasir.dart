void main() {
  int tinggi = 11;
  int lebar = (tinggi / 2).floor() + 1;

  // Bagian atas jam pasir
  for (int i = 1; i <= lebar; i++) {
    String jarak = '  ' * (i - 1);
    String nol = '0 ' * (2 * (lebar - i) + 1);
    print(jarak + nol);
  }

  // Bagian bawah jam pasir
  for (int i = lebar - 1; i >= 1; i--) {
    String jarak = '  ' * (i - 1);
    String nol = '0 ' * (2 * (lebar - i) + 1);
    print(jarak + nol);
  }
}
