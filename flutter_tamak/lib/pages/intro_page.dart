import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tamak/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(235, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //shop name
            const SizedBox(
              height: 28,
            ),
            Text(
              "Чайхана Ак-Булак",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),
            //icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset(
                "assets/images/logo.png",
                height: 300,
                width: 400,
              ),
            ),

            //title
            const SizedBox(height: 10),
            Text(
              'Бул Кыргыздын улуттук даамдары',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 10,
                color: const Color.fromARGB(255, 245, 232, 232),
              ),
            ),
            const SizedBox(height: 8),

            //subtitle
            Text(
              "Бул тамактар кыргыз элинин белгилуу тамактары",
              style: TextStyle(
                color: Colors.grey[300],
                height: 2,
              ),
            ),
            const SizedBox(height: 25),

            //get started button
            MyBotton(
              text: "Get:started",
              onTap: () {
                //go to menu page
                Navigator.pushNamed(context, '/menupage');
              },
            )
          ],
        ),
      ),
    );
  }
}
