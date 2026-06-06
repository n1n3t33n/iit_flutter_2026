# Exercice 10 — Validation de saisie (10–20)

## 1. Analyse du problème

Le programme doit demander à l'utilisateur de saisir un nombre compris entre 10 et 20 (inclus). Tant que la saisie est invalide, on affiche un message d'indication et on redemande.

**Données d'entrée :**
- `n` : entier saisi par l'utilisateur (répété jusqu'à valeur valide)

**Données de sortie :**
- Messages "Plus petit !" ou "Plus grand !" si invalide
- "Valeur acceptée : n" si valide

**Condition d'arrêt :** `10 ≤ n ≤ 20`

---

## 2. Algorithme en pseudo-code

```
DÉBUT
  RÉPÉTER
    LIRE n
    SI n > 20 ALORS
      AFFICHER "Plus petit !"
    SINON SI n < 10 ALORS
      AFFICHER "Plus grand !"
    FIN SI
  TANT QUE n < 10 OU n > 20

  AFFICHER "Valeur acceptée : " + n
FIN
```
