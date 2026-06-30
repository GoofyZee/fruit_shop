import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/shop_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shopProvider = Provider.of<ShopProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang Belanja')),
      body: shopProvider.cart.isEmpty
          ? const Center(child: Text('Keranjang masih kosong'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: shopProvider.cart.length,
                    itemBuilder: (ctx, i) {
                      final item = shopProvider.cart[i];
                      return ListTile(
                        title: Text(item.fruit.name),
                        subtitle: Text(
                          '${item.quantity} x Rp ${item.fruit.price.toStringAsFixed(0)}',
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => shopProvider.removeFromCart(item.fruit.id),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Total Pembayaran:'),
                          Text(
                            'Rp ${shopProvider.cartTotal.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          shopProvider.placeOrder();
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Pesanan berhasil dibuat!')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
