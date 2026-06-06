# Foodie — Application de livraison de repas

## Design de référence (Dribbble)

Ce projet reproduit un design de type **Food Delivery App UI** inspiré des maquettes populaires sur Dribbble, notamment le style "FoodBee" de Moin Uddin.

Lien de référence : https://dribbble.com/shots/14153908-FoodBee-Food-Delivery-App-UI-Design

---

## Description du projet

**Foodie** est une application mobile Flutter qui simule une plateforme de commande de repas en ligne. Elle propose une interface moderne et épurée avec une palette de couleurs orange/blanc, des cartes arrondies, et une navigation intuitive.

### Fonctionnalités implémentées

- **Écran d'accueil (Home Screen)**
  - En-tête avec localisation et notification
  - Barre de recherche avec filtrage en temps réel
  - Bannière promotionnelle avec dégradé animé
  - Filtres par catégorie (Tout, Burgers, Pizza, Sushi, Mexican, Ramen)
  - Liste des restaurants populaires avec cartes détaillées
  - Barre de navigation inférieure animée (Home, Favoris, Commandes, Profil)

- **Écran de détail (Detail Screen)**
  - Image héro en mode SliverAppBar (parallax)
  - Informations du restaurant (note, délai de livraison, frais)
  - Menu avec photos, descriptions et prix
  - Contrôle de quantité par article (ajouter / retirer)
  - Barre de commande dynamique (apparaît quand un article est ajouté)
  - Confirmation de commande via SnackBar

### Palette de couleurs

| Couleur | Valeur | Usage |
|---|---|---|
| Orange principal | `#FF6B35` | Boutons, icônes actives, accents |
| Orange secondaire | `#FF9F1C` | Dégradé bannière |
| Fond | `#F8F8F8` | Arrière-plan des écrans |
| Texte principal | `#1A1A2E` | Titres et labels |
| Texte secondaire | `#999999` | Descriptions, sous-titres |

### Structure du projet

```
lib/
├── main.dart                  # Point d'entrée, thème global
├── models/
│   ├── restaurant.dart        # Modèle Restaurant, MenuItem, données factices
│   └── category.dart          # Modèle FoodCategory, liste des catégories
├── screens/
│   ├── home_screen.dart       # Écran principal
│   └── detail_screen.dart     # Écran de détail restaurant + menu
└── widgets/
    ├── category_chip.dart     # Chip de filtre par catégorie
    └── restaurant_card.dart   # Carte restaurant cliquable
```

---

## Lancer le projet

### Prérequis

- Flutter SDK ≥ 3.x
- Dart ≥ 3.x
- Un émulateur Android / iOS ou Chrome

### Commandes

```bash
# Installer les dépendances
flutter pub get

# Lancer sur Chrome
flutter run -d chrome

# Lancer sur l'émulateur Android (Pixel 7)
flutter emulators --launch Pixel_7
flutter run -d emulator-5554
```

---

## Critères de l'exercice

| Critère | Points | Statut |
|---|---|---|
| Fidélité au design | /8 | Couleurs, espacements, typographie respectés |
| Qualité du code | /4 | Widgets séparés, modèles de données, pas de duplication |
| Structure du projet | /3 | Dossiers `models/`, `screens/`, `widgets/` |
| Design responsive | /3 | `SafeArea`, `CustomScrollView`, `Expanded` |
| Documentation | /2 | Ce README |

---

## Difficultés rencontrées

- Gestion du cache Gradle 8.12 (bug `MergeInstrumentationAnalysisTransform`) — résolu en downgrading vers Gradle 8.10.2.
- Remplacement des `withOpacity()` dépréciés par `withValues(alpha: ...)` pour Flutter 3.x.
