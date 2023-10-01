import 'package:flutter/material.dart';
import 'package:flutter_tamak/components/button.dart';
import 'package:flutter_tamak/models/shop.dart';
import 'package:flutter_tamak/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  //quantity
  int quantityCount = 0;
  //decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  //incarment quantity
  void incarmentQuantity() {
    setState(() {
      setState(() {
        quantityCount++;
      });
    });
  }

  // add to cart
  void addToCart() {
    // only add to card if there if the someting in the cart
    if (quantityCount > 0) {
      //get acces to shop
      final shop = context.read<Shop>();

      //add to card
      shop.addToCart(widget.food, quantityCount);

      //let the user know it was succesfull
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            "Successfull adeed to cart",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: [
            //okay button
            IconButton(
              onPressed: () {
                //pop once to remove dialog box
                Navigator.pop(context);
                //pop again to go previous screen
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          //ListView  of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: ListView(
                children: [
                  //image

                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),

                  const SizedBox(width: 3),

                  //rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(height: 10),
                      //rating number
                      Text(
                        widget.food.rating,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  //food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(height: 25),
                  //description
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Бешбармак — майда тууралган эттен жасалган кыргыздын эң сый тамагы. Бышкан эт тууралып, эттин сорпосуна бышырылган кесме жана майлуу чык (тууралган пияз, калемпир, майлуу сорпо) аралаштырылып бешбармак жасалат. Этти майда тууроо ― улууларды, карыяларды сыйлоо. Бешбармактын алдында устукан тартылат",
                    style: TextStyle(
                      color: Color.fromARGB(255, 26, 25, 25),
                      fontSize: 10.5,
                      height: 2.8,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //price + quantity + add to card button
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(children: [
              //price + quantity
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${widget.food.price}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  //quantity

                  Row(
                    children: [
                      //minus button
                      Container(
                        decoration: const BoxDecoration(
                          color: secondaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          onPressed: decrementQuantity,
                        ),
                      ),
                      //quantity
                      SizedBox(
                        width: 40,
                        child: Center(
                          child: Text(
                            quantityCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      // plus button
                      Container(
                        decoration: const BoxDecoration(
                          color: secondaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: incarmentQuantity,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //add to card button
              MyBotton(
                text: "Add To Cart",
                onTap: addToCart,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
