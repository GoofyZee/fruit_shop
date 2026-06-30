class Fruit {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Fruit({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class CartItem {
  final Fruit fruit;
  int quantity;

  CartItem({required this.fruit, this.quantity = 1});
}

class Order {
  final String id;
  final List<CartItem> items;
  final double totalAmount;
  final DateTime dateTime;

  Order({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.dateTime,
  });
}
