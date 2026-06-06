# Exercice 05 — Imposition à Zorglub

## 1. Analyse du problème

**Règle fiscale de Zorglub :**
- Un homme de plus de 20 ans paye des impôts
- Une femme entre 18 et 35 ans paye des impôts
- Dans tous les autres cas, on ne paye pas d'impôts

**Données d'entrée :**
- `genre` : caractère ('H' ou 'F')
- `age` : entier positif

**Données de sortie :**
- "Imposable" ou "Non imposable"

---

## 2. Algorithme en pseudo-code

```
DÉBUT
  LIRE genre
  LIRE age

  SI genre == 'H' ET age > 20 ALORS
    AFFICHER "Imposable"
  SINON SI genre == 'F' ET age >= 18 ET age <= 35 ALORS
    AFFICHER "Imposable"
  SINON
    AFFICHER "Non imposable"
  FIN SI
FIN
```
