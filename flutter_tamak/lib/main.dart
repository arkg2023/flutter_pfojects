import 'package:flutter/material.dart';
import 'package:flutter_tamak/models/shop.dart';
import 'package:flutter_tamak/pages/intro_page.dart';
import 'package:provider/provider.dart';
import 'pages/cart_page.dart';
import 'pages/menu_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/menupage': (context) => const MenuPage(),
        '/intropage': (context) => const IntroPage(),
        '/cartpage': (context) => const CartPage(),
      },
    );
  }
}
