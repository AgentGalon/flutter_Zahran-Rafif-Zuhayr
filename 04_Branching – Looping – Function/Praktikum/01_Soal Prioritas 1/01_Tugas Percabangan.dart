import 'dart:io';

String cekNilai(int nilai) {
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40) {
    return "Nilai B";
  } else if (nilai > 0) {
    return "Nilai C";
  } else {
    return "";
  }
}

void main() {
  stdout.write("Masukkan nilai mahasiswa: ");
  int nilaiMahasiswa = int.parse(stdin.readLineSync()!);

  String hasil = cekNilai(nilaiMahasiswa);
  print("Hasil: $hasil");
}
