import 'dart:io';

bool nilai(int number) {
  if (number <= 1) {
    return false;
  }
  for (int i = 2; i * i <= number; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  stdout.write("Masukkan sebuah bilangan: ");
  int input = int.parse(stdin.readLineSync()!);

  if (nilai(input)) {
    print("bilangan prima");
  } else {
    print("bukan bilangan prima");
  }
}
