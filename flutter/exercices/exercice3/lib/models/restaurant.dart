class Restaurant {
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final String deliveryTime;
  final double deliveryFee;
  final bool isFavorite;
  final List<MenuItem> menu;

  const Restaurant({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.deliveryTime,
    required this.deliveryFee,
    this.isFavorite = false,
    this.menu = const [],
  });
}

class MenuItem {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  const MenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

final List<Restaurant> sampleRestaurants = [
  const Restaurant(
    id: '1',
    name: 'Burger Palace',
    category: 'Burgers',
    imageUrl:
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=600',
    rating: 4.8,
    reviewCount: 320,
    deliveryTime: '20–30 min',
    deliveryFee: 1.99,
    isFavorite: true,
    menu: [
      MenuItem(
        name: 'Classic Smash Burger',
        description: 'Double patty, cheddar, pickles, special sauce',
        price: 12.99,
        imageUrl:
            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=300',
      ),
      MenuItem(
        name: 'BBQ Bacon Burger',
        description: 'Crispy bacon, BBQ sauce, onion rings',
        price: 14.49,
        imageUrl:
            'https://images.unsplash.com/photo-1553979459-d2229ba7433b?w=300',
      ),
      MenuItem(
        name: 'Veggie Burger',
        description: 'Plant-based patty, avocado, tomato',
        price: 11.99,
        imageUrl:
            'https://images.unsplash.com/photo-1520072959219-c595dc870360?w=300',
      ),
    ],
  ),
  const Restaurant(
    id: '2',
    name: 'Pizza Nova',
    category: 'Pizza',
    imageUrl:
        'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=600',
    rating: 4.6,
    reviewCount: 215,
    deliveryTime: '25–40 min',
    deliveryFee: 2.49,
    menu: [
      MenuItem(
        name: 'Margherita',
        description: 'San Marzano tomato, fresh mozzarella, basil',
        price: 13.99,
        imageUrl:
            'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=300',
      ),
      MenuItem(
        name: 'Pepperoni Feast',
        description: 'Double pepperoni, mozzarella, oregano',
        price: 15.99,
        imageUrl:
            'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=300',
      ),
    ],
  ),
  const Restaurant(
    id: '3',
    name: 'Sushi Zen',
    category: 'Sushi',
    imageUrl:
        'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=600',
    rating: 4.9,
    reviewCount: 480,
    deliveryTime: '30–45 min',
    deliveryFee: 3.99,
    isFavorite: true,
    menu: [
      MenuItem(
        name: 'Salmon Roll (8 pcs)',
        description: 'Fresh salmon, cucumber, avocado, sesame',
        price: 16.99,
        imageUrl:
            'https://images.unsplash.com/photo-1617196034183-421b4040ed20?w=300',
      ),
      MenuItem(
        name: 'Dragon Roll (8 pcs)',
        description: 'Shrimp tempura, avocado, eel sauce',
        price: 18.99,
        imageUrl:
            'https://images.unsplash.com/photo-1617196034236-4e4f4e6e3e28?w=300',
      ),
    ],
  ),
  const Restaurant(
    id: '4',
    name: 'Taco Fiesta',
    category: 'Mexican',
    imageUrl:
        'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=600',
    rating: 4.5,
    reviewCount: 178,
    deliveryTime: '15–25 min',
    deliveryFee: 1.49,
    menu: [
      MenuItem(
        name: 'Street Tacos (3 pcs)',
        description: 'Carnitas, onion, cilantro, lime',
        price: 10.99,
        imageUrl:
            'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=300',
      ),
    ],
  ),
  const Restaurant(
    id: '5',
    name: 'The Ramen House',
    category: 'Ramen',
    imageUrl:
        'https://images.unsplash.com/photo-1569050467447-ce54b3bbc37d?w=600',
    rating: 4.7,
    reviewCount: 263,
    deliveryTime: '30–40 min',
    deliveryFee: 2.99,
    menu: [
      MenuItem(
        name: 'Tonkotsu Ramen',
        description: 'Rich pork broth, chashu, soft-boiled egg, nori',
        price: 17.99,
        imageUrl:
            'https://images.unsplash.com/photo-1569050467447-ce54b3bbc37d?w=300',
      ),
    ],
  ),
];
