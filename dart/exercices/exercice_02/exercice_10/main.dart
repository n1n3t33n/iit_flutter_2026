import 'dart:io';

void main() {
  int n;

  do {
    stdout.write("Entrez un nombre entre 10 et 20 : ");
    n = int.parse(stdin.readLineSync()!.trim());

    if (n > 20) {
      print("Plus petit !");
    } else if (n < 10) {
      print("Plus grand !");
    }
  } while (n < 10 || n > 20);

  print("Valeur acceptée : $n");
}
