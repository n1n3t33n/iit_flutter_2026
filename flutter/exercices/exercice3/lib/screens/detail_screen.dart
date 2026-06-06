import 'package:flutter/material.dart';
import '../models/restaurant.dart';

class DetailScreen extends StatefulWidget {
  final Restaurant restaurant;

  const DetailScreen({super.key, required this.restaurant});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final Map<String, int> _cart = {};

  int get _totalItems =>
      _cart.values.fold(0, (sum, qty) => sum + qty);

  double get _totalPrice => _cart.entries.fold(0.0, (sum, entry) {
        final item = widget.restaurant.menu
            .firstWhere((m) => m.name == entry.key);
        return sum + item.price * entry.value;
      });

  @override
  Widget build(BuildContext context) {
    final restaurant = widget.restaurant;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context, restaurant),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRestaurantHeader(restaurant),
                  const SizedBox(height: 28),
                  const Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...restaurant.menu.map((item) => _buildMenuItem(item)),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _totalItems > 0
          ? _buildCartBar(context)
          : null,
    );
  }

  Widget _buildAppBar(BuildContext context, Restaurant restaurant) {
    return SliverAppBar(
      expandedHeight: 280,
      pinned: true,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: const EdgeInsets.all(8),
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
          child: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Color(0xFF1A1A2E), size: 18),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          restaurant.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: const Color(0xFFF0F0F0),
            child: const Icon(Icons.image_not_supported,
                color: Colors.grey, size: 60),
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantHeader(Restaurant restaurant) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          restaurant.name,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1A1A2E),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          restaurant.category,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFFFF6B35),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _statBadge(
              Icons.star_rounded,
              '${restaurant.rating} (${restaurant.reviewCount})',
              const Color(0xFFFFB703),
            ),
            const SizedBox(width: 12),
            _statBadge(
              Icons.access_time_rounded,
              restaurant.deliveryTime,
              const Color(0xFF4CAF50),
            ),
            const SizedBox(width: 12),
            _statBadge(
              Icons.delivery_dining_rounded,
              restaurant.deliveryFee == 0
                  ? 'Free'
                  : '\$${restaurant.deliveryFee.toStringAsFixed(2)}',
              const Color(0xFF2196F3),
            ),
          ],
        ),
      ],
    );
  }

  Widget _statBadge(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(MenuItem item) {
    final qty = _cart[item.name] ?? 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              item.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 80,
                height: 80,
                color: const Color(0xFFF0F0F0),
                child: const Icon(Icons.fastfood,
                    color: Colors.grey, size: 30),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 12, color: Color(0xFF999999)),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${item.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFFF6B35),
                  ),
                ),
              ],
            ),
          ),
          _buildQuantityControl(item, qty),
        ],
      ),
    );
  }

  Widget _buildQuantityControl(MenuItem item, int qty) {
    return Column(
      children: [
        if (qty > 0) ...[
          _circleButton(
            Icons.add,
            () => setState(() => _cart[item.name] = qty + 1),
            const Color(0xFFFF6B35),
          ),
          const SizedBox(height: 6),
          Text(
            '$qty',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 6),
          _circleButton(
            Icons.remove,
            () => setState(() {
              if (qty == 1) {
                _cart.remove(item.name);
              } else {
                _cart[item.name] = qty - 1;
              }
            }),
            const Color(0xFFFF6B35),
          ),
        ] else
          _circleButton(
            Icons.add,
            () => setState(() => _cart[item.name] = 1),
            const Color(0xFFFF6B35),
          ),
      ],
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap, Color color) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 18, color: color),
      ),
    );
  }

  Widget _buildCartBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 28),
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Order placed! Total: \$${_totalPrice.toStringAsFixed(2)}'),
              backgroundColor: const Color(0xFFFF6B35),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF6B35),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '$_totalItems',
                style: const TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'View Order',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Text(
              '\$${_totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
