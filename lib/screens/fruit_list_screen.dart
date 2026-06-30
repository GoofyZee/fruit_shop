import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/shop_provider.dart';
import 'fruit_detail_screen.dart';
import 'cart_screen.dart';
import 'history_screen.dart';

class FruitListScreen extends StatefulWidget {
  const FruitListScreen({super.key});

  @override
  State<FruitListScreen> createState() => _FruitListScreenState();
}

class _FruitListScreenState extends State<FruitListScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final shopProvider = Provider.of<ShopProvider>(context);
    final filteredFruits = shopProvider.fruits
        .where((fruit) =>
            fruit.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Buah'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CartScreen()),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HistoryScreen()),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Cari Buah...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFruits.length,
              itemBuilder: (ctx, i) {
                final fruit = filteredFruits[i];
                return ListTile(
                  leading: Image.network(
                    fruit.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                  ),
                  title: Text(fruit.name),
                  subtitle: Text('Rp ${fruit.price.toStringAsFixed(0)}'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FruitDetailScreen(fruit: fruit),
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      shopProvider.addToCart(fruit);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${fruit.name} ditambah ke keranjang'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
