import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/shop_provider.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShopProvider()),
      ],
      child: const FruitShopApp(),
    ),
  );
}

class FruitShopApp extends StatelessWidget {
  const FruitShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
