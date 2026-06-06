import 'dart:io';

void main() {
  stdout.write("Entrez un entier positif : ");
  final int n = int.parse(stdin.readLineSync()!.trim());

  if (n < 0) {
    print("Erreur : la factorielle n'est pas définie pour les entiers négatifs.");
    return;
  }

  int factorielle = 1;
  for (int i = 1; i <= n; i++) {
    factorielle *= i;
  }

  print("$n! = $factorielle");
}
