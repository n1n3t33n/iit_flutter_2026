import 'package:flutter/material.dart';

class FoodCategory {
  final String label;
  final IconData icon;
  final Color color;

  const FoodCategory({
    required this.label,
    required this.icon,
    required this.color,
  });
}

final List<FoodCategory> foodCategories = [
  const FoodCategory(
    label: 'All',
    icon: Icons.grid_view_rounded,
    color: Color(0xFFFF6B35),
  ),
  const FoodCategory(
    label: 'Burgers',
    icon: Icons.lunch_dining,
    color: Color(0xFFFF9F1C),
  ),
  const FoodCategory(
    label: 'Pizza',
    icon: Icons.local_pizza,
    color: Color(0xFFE63946),
  ),
  const FoodCategory(
    label: 'Sushi',
    icon: Icons.set_meal,
    color: Color(0xFF2A9D8F),
  ),
  const FoodCategory(
    label: 'Mexican',
    icon: Icons.kebab_dining,
    color: Color(0xFF457B9D),
  ),
  const FoodCategory(
    label: 'Ramen',
    icon: Icons.ramen_dining,
    color: Color(0xFF6D6875),
  ),
];
