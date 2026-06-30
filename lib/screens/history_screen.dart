import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/shop_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shopProvider = Provider.of<ShopProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Histori Pemesanan')),
      body: shopProvider.orders.isEmpty
          ? const Center(child: Text('Belum ada histori pemesanan'))
          : ListView.builder(
              itemCount: shopProvider.orders.length,
              itemBuilder: (ctx, i) {
                final order = shopProvider.orders[i];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ExpansionTile(
                    title: Text(
                      'Total: Rp ${order.totalAmount.toStringAsFixed(0)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Tanggal: ${order.dateTime.day}/${order.dateTime.month}/${order.dateTime.year} ${order.dateTime.hour}:${order.dateTime.minute}',
                    ),
                    children: order.items.map((item) {
                      return ListTile(
                        title: Text(item.fruit.name),
                        trailing: Text(
                          '${item.quantity}x Rp ${item.fruit.price.toStringAsFixed(0)}',
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
    );
  }
}
