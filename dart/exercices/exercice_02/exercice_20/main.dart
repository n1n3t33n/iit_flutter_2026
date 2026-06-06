import 'dart:io';

void main() {
  final List<double> notes = List.filled(9, 0.0);

  print("Saisie de 9 notes (entre 0 et 20) :\n");

  for (int i = 0; i < 9; i++) {
    double note;
    do {
      stdout.write("Note ${i + 1} : ");
      note = double.parse(stdin.readLineSync()!.trim());
      if (note < 0 || note > 20) {
        print("  Note invalide. Entrez une valeur entre 0 et 20.");
      }
    } while (note < 0 || note > 20);

    notes[i] = note;
  }

  print("\n=== Tableau des notes ===");
  for (int i = 0; i < notes.length; i++) {
    print("Note ${i + 1} : ${notes[i]}");
  }
}
