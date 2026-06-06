import 'dart:io';

void main() {
  stdout.write("Entrez un nombre : ");
  final int n = int.parse(stdin.readLineSync()!.trim());

  print("\nTable de multiplication de $n :");
  for (int i = 1; i <= 10; i++) {
    print("$n × $i = ${n * i}");
  }
}
