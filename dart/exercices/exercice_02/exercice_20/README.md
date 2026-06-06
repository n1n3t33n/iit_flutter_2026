# Exercice 20 — Tableau de notes

## 1. Analyse du problème

Le programme déclare un tableau de 9 notes et permet à l'utilisateur d'entrer une valeur pour chaque position. À la fin, le tableau est affiché.

**Données d'entrée :**
- 9 notes saisies par l'utilisateur (valeurs réelles entre 0 et 20)

**Données de sortie :**
- Le tableau des 9 notes affiché

**Contrainte :** une note doit être comprise entre 0 et 20.

---

## 2. Algorithme en pseudo-code

```
DÉBUT
  DÉCLARER notes[9] : tableau de réels

  POUR i DE 0 À 8 FAIRE
    AFFICHER "Note " + (i+1) + " : "
    LIRE notes[i]
  FIN POUR

  AFFICHER "=== Tableau des notes ==="
  POUR i DE 0 À 8 FAIRE
    AFFICHER "Note " + (i+1) + " : " + notes[i]
  FIN POUR
FIN
```
