import 'package:flutter/material.dart';
import 'package:flutter_tamak/components/button.dart';
import 'package:flutter_tamak/models/shop.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/food_tile.dart';
import 'food_details_pages.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //navigate to food items details page
  void navigateToFoodItemsDetails(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: const Text(
          'Bishkek',
          style: TextStyle(color: Colors.green),
        ),
        actions: [
          //card button
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Promo banners
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Promo massage
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get 32% promo',
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //redeem button
                    MyBotton(
                      text: "Redeem",
                      onTap: () {},
                    ),
                  ],
                ),
                //Image
                Image.asset(
                  "assets/images/kozu.png",
                  height: 80,
                ),
              ],
            ),
            //Image
          ),
          //Sear bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(150),
                ),
                hintText: "Search here.. ",
              ),
            ),
          ),

          //menu list
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Tamaktardyn aty",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                  onTap: () => navigateToFoodItemsDetails(index),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          //popular food
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                //image
                Image.asset(
                  "assets/images/shishkebek.png",
                  height: 60,
                ),
                const SizedBox(width: 20),
                //named and price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shishkebek",
                      style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    //price
                    Text(
                      '300c',
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ],
                ),
                //heart
                const Icon(Icons.favorite_outline, color: Colors.grey),
              ],
            ),
          )
        ],
      ),
    );
  }
}
