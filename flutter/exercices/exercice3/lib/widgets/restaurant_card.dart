import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import '../screens/detail_screen.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailScreen(restaurant: restaurant),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.07),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            _buildInfo(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Image.network(
            restaurant.imageUrl,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (_, child, progress) => progress == null
                ? child
                : Container(
                    height: 180,
                    color: const Color(0xFFF0F0F0),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFFF6B35),
                        strokeWidth: 2,
                      ),
                    ),
                  ),
            errorBuilder: (_, __, ___) => Container(
              height: 180,
              color: const Color(0xFFF0F0F0),
              child: const Icon(Icons.image_not_supported,
                  color: Colors.grey, size: 40),
            ),
          ),
        ),
        if (restaurant.isFavorite)
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const Icon(Icons.favorite,
                  color: Color(0xFFFF6B35), size: 18),
            ),
          ),
      ],
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                restaurant.name,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star_rounded,
                      color: Color(0xFFFFB703), size: 18),
                  const SizedBox(width: 3),
                  Text(
                    restaurant.rating.toString(),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  Text(
                    ' (${restaurant.reviewCount})',
                    style: const TextStyle(
                        fontSize: 12, color: Color(0xFF999999)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _infoChip(
                Icons.access_time_rounded,
                restaurant.deliveryTime,
                const Color(0xFF4CAF50),
              ),
              const SizedBox(width: 10),
              _infoChip(
                Icons.delivery_dining_rounded,
                restaurant.deliveryFee == 0
                    ? 'Free delivery'
                    : '\$${restaurant.deliveryFee.toStringAsFixed(2)} delivery',
                const Color(0xFF2196F3),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoChip(IconData icon, String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
