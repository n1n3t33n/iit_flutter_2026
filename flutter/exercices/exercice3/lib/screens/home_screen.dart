import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/restaurant.dart';
import '../widgets/category_chip.dart';
import '../widgets/restaurant_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategory = 0;
  int _selectedNavIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  List<Restaurant> get _filteredRestaurants {
    final query = _searchQuery.toLowerCase();
    return sampleRestaurants.where((r) {
      final matchesCategory = _selectedCategory == 0 ||
          r.category == foodCategories[_selectedCategory].label;
      final matchesSearch =
          query.isEmpty || r.name.toLowerCase().contains(query);
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader()),
            SliverToBoxAdapter(child: _buildSearchBar()),
            SliverToBoxAdapter(child: _buildPromoBanner()),
            SliverToBoxAdapter(child: _buildCategorySection()),
            SliverToBoxAdapter(child: _buildPopularSection()),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => RestaurantCard(
                    restaurant: _filteredRestaurants[index],
                  ),
                  childCount: _filteredRestaurants.length,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on_rounded,
                      color: Color(0xFFFF6B35), size: 18),
                  const SizedBox(width: 4),
                  const Text(
                    'Algiers, Algeria',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFFF6B35),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down_rounded,
                      color: Color(0xFFFF6B35), size: 18),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'Good afternoon! 👋',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A2E),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.notifications_outlined,
                      color: Color(0xFF1A1A2E), size: 22),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF6B35),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
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
        child: TextField(
          controller: _searchController,
          onChanged: (v) => setState(() => _searchQuery = v),
          decoration: InputDecoration(
            hintText: 'Search restaurants or food…',
            hintStyle: const TextStyle(
                color: Color(0xFFBBBBBB), fontSize: 14),
            prefixIcon: const Icon(Icons.search_rounded,
                color: Color(0xFFFF6B35)),
            suffixIcon: _searchQuery.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.close_rounded,
                        color: Color(0xFF999999)),
                    onPressed: () {
                      _searchController.clear();
                      setState(() => _searchQuery = '');
                    },
                  )
                : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
                vertical: 16, horizontal: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFF6B35), Color(0xFFFF9F1C)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF6B35).withValues(alpha: 0.40),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              bottom: -20,
              child: Opacity(
                opacity: 0.15,
                child: Icon(Icons.local_fire_department_rounded,
                    size: 160, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Today\'s Special',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Free delivery\non your first order!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Order now →',
                      style: TextStyle(
                        color: Color(0xFFFF6B35),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 24, 20, 14),
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A2E),
            ),
          ),
        ),
        SizedBox(
          height: 46,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            itemCount: foodCategories.length,
            itemBuilder: (context, index) => CategoryChip(
              category: foodCategories[index],
              isSelected: _selectedCategory == index,
              onTap: () => setState(() => _selectedCategory = index),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPopularSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Popular Near You',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A2E),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'See all',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFFFF6B35),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    const items = [
      (Icons.home_rounded, Icons.home_outlined, 'Home'),
      (Icons.favorite_rounded, Icons.favorite_outline_rounded, 'Favorites'),
      (Icons.shopping_bag_rounded, Icons.shopping_bag_outlined, 'Orders'),
      (Icons.person_rounded, Icons.person_outline_rounded, 'Profile'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final isSelected = _selectedNavIndex == index;
              final item = items[index];
              return GestureDetector(
                onTap: () => setState(() => _selectedNavIndex = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFFF6B35).withValues(alpha: 0.12)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isSelected ? item.$1 : item.$2,
                        color: isSelected
                            ? const Color(0xFFFF6B35)
                            : const Color(0xFFBBBBBB),
                        size: 24,
                      ),
                      if (isSelected) ...[
                        const SizedBox(width: 6),
                        Text(
                          item.$3,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFF6B35),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
