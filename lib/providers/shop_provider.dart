import 'package:flutter/material.dart';
import '../models/fruit.dart';

class ShopProvider with ChangeNotifier {
  final List<Fruit> _fruits = [
    Fruit(
      id: '2',
      name: 'Pisang',
      description: 'Pisang raja berkualitas premium yang dipetik pada tingkat kematangan sempurna. Memiliki tekstur lembut dengan rasa manis yang khas. Merupakan sumber energi instan yang baik dan kaya akan kalium untuk kesehatan jantung.',
      price: 10000,
      imageUrl: 'https://images.unsplash.com/photo-1481349518771-20055b2a7b24?q=80&w=500',
    ),
    Fruit(
      id: '3',
      name: 'Jeruk',
      description: 'Jeruk Sunkist segar dengan kandungan air yang melimpah. Memiliki aroma yang sangat harum dan rasa manis-asam yang menyegarkan. Sangat direkomendasikan untuk memenuhi kebutuhan Vitamin C harian dan menjaga daya tahan tubuh.',
      price: 20000,
      imageUrl: 'https://images.unsplash.com/photo-1582979512210-99b6a53386f9?q=80&w=500',
    ),
    Fruit(
      id: '4',
      name: 'Mangga',
      description: 'Mangga Harum Manis asli yang terkenal dengan daging buahnya yang tebal, lembut, dan tanpa serat. Memiliki rasa manis legit yang sangat kuat dan aroma yang menggoda selera. Pilihan terbaik untuk pencuci mulut mewah.',
      price: 25000,
      imageUrl: 'https://images.unsplash.com/photo-1553279768-865429fa0078?q=80&w=500',
    ),
    Fruit(
      id: '5',
      name: 'Stroberi',
      description: 'Stroberi segar pilihan dengan warna merah merona. Memiliki perpaduan rasa asam dan manis yang seimbang. Kaya akan antioksidan dan sangat cocok untuk dijadikan topping juice, smoothie bowl, atau dimakan langsung.',
      price: 35000,
      imageUrl: 'https://images.unsplash.com/photo-1518635017498-87f514b751ba?q=80&w=500',
    ),
    Fruit(
      id: '6',
      name: 'Anggur',
      description: 'Anggur ungu tanpa biji (seedless) kualitas impor. Setiap butirnya memiliki tekstur yang garing (crunchy) dan rasa manis yang meledak di mulut. Sangat praktis dikonsumsi dan menjadi favorit anak-anak maupun dewasa.',
      price: 45000,
      imageUrl: 'https://images.unsplash.com/photo-1423483641154-5411ec9c0ddf?q=80&w=500',
    ),
    Fruit(
      id: '7',
      name: 'Semangka',
      description: 'Semangka merah tanpa biji yang sangat berair dan manis. Dipanen langsung dari kebun terbaik untuk menjamin kesegarannya. Sangat ampuh untuk menghilangkan dahaga di siang hari yang terik karena kandungan airnya yang tinggi.',
      price: 30000,
      imageUrl: 'https://images.unsplash.com/photo-1587049352846-4a222e784d38?q=80&w=500',
    ),
    Fruit(
      id: '8',
      name: 'Alpukat',
      description: 'Alpukat mentega pilihan dengan daging buah yang tebal, berwarna kuning mentega, dan tekstur yang sangat creamy. Kaya akan lemak sehat dan nutrisi. Sangat pas untuk menu diet sehat, jus alpukat, atau olesan roti.',
      price: 28000,
      imageUrl: 'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?q=80&w=500',
    ),
    Fruit(
      id: '9',
      name: 'Nanas',
      description: 'Nanas madu pilihan dengan rasa yang sangat manis dan kadar asam rendah, sehingga tidak menimbulkan rasa gatal di lidah. Memiliki warna kuning cerah dan aroma yang sangat segar. Mengandung enzim bromelain yang baik untuk pencernaan.',
      price: 18000,
      imageUrl: 'https://images.unsplash.com/photo-1550258987-190a2d41a8ba?q=80&w=500',
    ),
  ];

  final List<CartItem> _cart = [];
  final List<Order> _orders = [];

  List<Fruit> get fruits => [..._fruits];
  List<CartItem> get cart => [..._cart];
  List<Order> get orders => [..._orders];

  double get cartTotal {
    return _cart.fold(0, (sum, item) => sum + (item.fruit.price * item.quantity));
  }

  void addToCart(Fruit fruit) {
    final index = _cart.indexWhere((item) => item.fruit.id == fruit.id);
    if (index >= 0) {
      _cart[index].quantity++;
    } else {
      _cart.add(CartItem(fruit: fruit));
    }
    notifyListeners();
  }

  void removeFromCart(String fruitId) {
    _cart.removeWhere((item) => item.fruit.id == fruitId);
    notifyListeners();
  }

  void placeOrder() {
    if (_cart.isEmpty) return;
    _orders.insert(
      0,
      Order(
        id: DateTime.now().toString(),
        items: [..._cart],
        totalAmount: cartTotal,
        dateTime: DateTime.now(),
      ),
    );
    _cart.clear();
    notifyListeners();
  }
}
