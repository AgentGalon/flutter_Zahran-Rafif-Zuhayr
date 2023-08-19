import 'dart:io';

void main() {
  stdout.write("Program Mengecek Kata - Kalimat Palindrom atau Bukan\n");
  stdout.write("Input Kata : ");
  String kata = stdin.readLineSync()!;
  String tanpaSpasi = kata.replaceAll(' ', '').toLowerCase();
  String terbalik = '';

  for (int i = tanpaSpasi.length - 1; i >= 0; i--) {
    terbalik += tanpaSpasi[i];
  }

  String hasil = (tanpaSpasi == terbalik) ? "Palindrom" : "Bukan Palindrom";
  print("Result : $hasil");
}
