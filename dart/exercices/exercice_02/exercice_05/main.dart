import 'dart:io';

void main() {
  stdout.write("Genre (H/F) : ");
  final String genre = stdin.readLineSync()!.trim().toUpperCase();

  stdout.write("Âge : ");
  final int age = int.parse(stdin.readLineSync()!.trim());

  if (genre == 'H' && age > 20) {
    print("Imposable");
  } else if (genre == 'F' && age >= 18 && age <= 35) {
    print("Imposable");
  } else {
    print("Non imposable");
  }
}
