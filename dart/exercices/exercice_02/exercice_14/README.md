# Exercice 14 — Factorielle

## 1. Analyse du problème

Le programme demande un entier positif n et calcule n! (factorielle de n).

**Définition :** n! = 1 × 2 × 3 × ... × n  (avec 0! = 1 par convention)

**Données d'entrée :**
- `n` : entier positif ou nul

**Données de sortie :**
- La valeur de `n!`

**Exemples :**
- 0! = 1
- 5! = 120
- 8! = 40320

---

## 2. Algorithme en pseudo-code

```
DÉBUT
  LIRE n

  factorielle ← 1

  POUR i DE 1 À n FAIRE
    factorielle ← factorielle × i
  FIN POUR

  AFFICHER n + "! = " + factorielle
FIN
```
