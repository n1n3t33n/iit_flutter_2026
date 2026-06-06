# Exercice 01 — Simulateur de Robot

## 1. Analyse du problème

**Contexte :** Un robot se déplace sur une grille infinie. On lui donne une position initiale (x, y), une direction initiale (N, S, E, O) et une séquence d'instructions.

**Instructions possibles :**
- `G` — Tourner à gauche (90° antihoraire)
- `D` — Tourner à droite (90° horaire)
- `A` — Avancer d'une case dans la direction courante

**Système de coordonnées :** les valeurs croissent vers le Nord (y+) et vers l'Est (x+).

**Données d'entrée :**
- Position initiale : (x, y)
- Direction initiale : N | E | S | O
- Séquence d'instructions : chaîne de caractères (ex: "DAAGAG")

**Données de sortie :**
- Position finale (x, y) et direction finale

**Cas à gérer :**
- Chaîne d'instructions vide → le robot ne bouge pas
- Enchainement de rotations sans avance

---

## 2. Algorithme en pseudo-code

```
CLASSE Robot
  ATTRIBUTS : x, y, direction

  PROCÉDURE tournerDroite()
    SI direction == N ALORS direction ← E
    SINON SI direction == E ALORS direction ← S
    SINON SI direction == S ALORS direction ← O
    SINON SI direction == O ALORS direction ← N
  FIN

  PROCÉDURE tournerGauche()
    SI direction == N ALORS direction ← O
    SINON SI direction == O ALORS direction ← S
    SINON SI direction == S ALORS direction ← E
    SINON SI direction == E ALORS direction ← N
  FIN

  PROCÉDURE avancer()
    SI direction == N ALORS y ← y + 1
    SINON SI direction == S ALORS y ← y - 1
    SINON SI direction == E ALORS x ← x + 1
    SINON SI direction == O ALORS x ← x - 1
  FIN

  PROCÉDURE executer(instructions)
    POUR CHAQUE instruction DANS instructions FAIRE
      SI instruction == 'D' ALORS tournerDroite()
      SINON SI instruction == 'G' ALORS tournerGauche()
      SINON SI instruction == 'A' ALORS avancer()
    FIN POUR
  FIN
FIN CLASSE

DÉBUT
  Créer robot1 à (0,0) face au Nord
  Créer robot2 à (0,-1) face au Nord

  Réorienter robot1 et robot2 vers l'Est
  Réorienter robot1 et robot2 vers l'Ouest

  Tester : robot à (7,3) N → "DAAGAG"    → attendu (9,4) O
  Tester : robot à (2,-7) O → "DDAAAAAGA" → attendu (7,-6) N
  Tester : robot à (8,4) S → "GAAADDDAGGGG" → attendu (11,5) N
FIN
```
