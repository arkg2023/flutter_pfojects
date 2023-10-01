import 'package:flutter/material.dart';
import 'food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
      name: "beshbarmak",
      price: "20",
      imagePath: "assets/images/beshbarmak.png",
      rating: "4.9",
    ),

    //Kuurdak
    Food(
      name: "kuurdak",
      price: "25",
      imagePath: "assets/images/kuurdak.png",
      rating: "4.8",
    ),
    Food(
      name: "manty",
      price: "15",
      imagePath: "assets/images/manty.png",
      rating: "4.4",
    ),
    Food(
      name: "kurut",
      price: "28",
      imagePath: "assets/images/kurut.png",
      rating: "4.8",
    ),
    Food(
      name: "tash-kordo",
      price: "40",
      imagePath: "assets/images/tash-kordo.png",
      rating: "5.00",
    ),
  ];
  //customer  cart
  final List<Food> _cart = [];
  //getter medhods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}

class _cart {
  static void remove(Food food) {}
  static void add(Food foodItem) {}
}
