enum Direction { N, E, S, O }

class Robot {
  int x;
  int y;
  Direction direction;

  Robot(this.x, this.y, this.direction);

  void tournerDroite() {
    switch (direction) {
      case Direction.N:
        direction = Direction.E;
        break;
      case Direction.E:
        direction = Direction.S;
        break;
      case Direction.S:
        direction = Direction.O;
        break;
      case Direction.O:
        direction = Direction.N;
        break;
    }
  }

  void tournerGauche() {
    switch (direction) {
      case Direction.N:
        direction = Direction.O;
        break;
      case Direction.O:
        direction = Direction.S;
        break;
      case Direction.S:
        direction = Direction.E;
        break;
      case Direction.E:
        direction = Direction.N;
        break;
    }
  }

  void avancer() {
    switch (direction) {
      case Direction.N:
        y += 1;
        break;
      case Direction.S:
        y -= 1;
        break;
      case Direction.E:
        x += 1;
        break;
      case Direction.O:
        x -= 1;
        break;
    }
  }

  void executer(String instructions) {
    for (final cmd in instructions.toUpperCase().split('')) {
      if (cmd == 'D') {
        tournerDroite();
      } else if (cmd == 'G') {
        tournerGauche();
      } else if (cmd == 'A') {
        avancer();
      }
    }
  }

  @override
  String toString() => 'Position: ($x, $y) | Direction: ${direction.name}';
}
