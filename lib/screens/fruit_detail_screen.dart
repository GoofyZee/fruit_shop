import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/fruit.dart';
import '../providers/shop_provider.dart';

class FruitDetailScreen extends StatelessWidget {
  final Fruit fruit;

  const FruitDetailScreen({super.key, required this.fruit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(fruit.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              fruit.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 300,
                color: Colors.grey[300],
                child: const Icon(Icons.broken_image, size: 100),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fruit.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Rp ${fruit.price.toStringAsFixed(0)}',
                    style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    fruit.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        Provider.of<ShopProvider>(context, listen: false).addToCart(fruit);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${fruit.name} ditambah ke keranjang'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      label: const Text('Tambah ke Keranjang'),
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
}
