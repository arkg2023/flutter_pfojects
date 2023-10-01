import 'package:flutter/material.dart';
import 'package:flutter_tamak/themes/colors.dart';

class MyBotton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyBotton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //text
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
              //text
              const SizedBox(width: 10),
              //icon
              const Icon(Icons.arrow_forward, color: Colors.white),
            ],
          )),
    );
  }
}
