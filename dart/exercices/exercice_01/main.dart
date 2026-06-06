import 'robot.dart';

void main() {
  print('=== Simulateur de Robot ===\n');

  // --- Instanciation ---
  final robot1 = Robot(0, 0, Direction.N);
  final robot2 = Robot(0, -1, Direction.N);

  print('Instanciation :');
  print('  robot1 → $robot1');
  print('  robot2 → $robot2');

  // --- Réorientation vers l'Est ---
  robot1.direction = Direction.E;
  robot2.direction = Direction.E;
  print('\nAprès réorientation vers l\'Est :');
  print('  robot1 → $robot1');
  print('  robot2 → $robot2');

  // --- Réorientation vers l'Ouest ---
  robot1.direction = Direction.O;
  robot2.direction = Direction.O;
  print('\nAprès réorientation vers l\'Ouest :');
  print('  robot1 → $robot1');
  print('  robot2 → $robot2');

  print('\n--- Tests de séquences d\'instructions ---\n');

  // Test 1 : (7,3) N → "DAAGAG" → attendu (9,4) O
  final r1 = Robot(7, 3, Direction.N);
  print('Test 1 : départ (7,3) N | instructions: "DAAGAG"');
  r1.executer('DAAGAG');
  print('  Résultat  : $r1');
  print('  Attendu   : Position: (9, 4) | Direction: O');
  print('  ${r1.x == 9 && r1.y == 4 && r1.direction == Direction.O ? "✓ CORRECT" : "✗ INCORRECT"}\n');

  // Test 2 : (2,-7) O → "DDAAAAAGA"
  final r2 = Robot(2, -7, Direction.O);
  print('Test 2 : départ (2,-7) O | instructions: "DDAAAAAGA"');
  r2.executer('DDAAAAAGA');
  print('  Résultat  : $r2');
  print('  Attendu   : Position: (7, -6) | Direction: N\n');

  // Test 3 : (8,4) S → "GAAADDDAGGGG"
  final r3 = Robot(8, 4, Direction.S);
  print('Test 3 : départ (8,4) S | instructions: "GAAADDDAGGGG"');
  r3.executer('GAAADDDAGGGG');
  print('  Résultat  : $r3');
  print('  Attendu   : Position: (11, 5) | Direction: N');
}
