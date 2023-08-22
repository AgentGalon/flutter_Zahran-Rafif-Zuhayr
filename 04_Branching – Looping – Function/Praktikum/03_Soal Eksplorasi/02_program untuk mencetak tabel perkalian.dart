import 'dart:io';

void main() {
  stdout.write('Masukkan angka tabel perkaliannya: ');
  int number = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= number; i++) {
    for (int j = 1; j <= number; j++) {
      stdout.write((i * j).toString().padLeft(4));
    }
    stdout.write('\n');
  }
}
