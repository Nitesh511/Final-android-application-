import 'package:electronic_accessories_app/screens/bottomNavagationScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThankYouPage extends StatefulWidget {
  const ThankYouPage({Key? key}) : super(key: key);

  @override
  State<ThankYouPage> createState() => _ThankYouPageState();
}

Color themeColor = const Color(0xFF43D19E);

class _ThankYouPageState extends State<ThankYouPage> {
  double screenWidth = 600;
  double screenHeight = 400;
  Color textColor = const Color(0xFF32567A);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 170,
              padding: const EdgeInsets.all(35),
              decoration: BoxDecoration(
                color: themeColor,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "assets/card.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            Text(
              "Thank You!",
              style: TextStyle(
                  color: themeColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 50,
                  fontFamily: "Cursive"),
            ),
            SizedBox(height: screenHeight * 0.01),
            const Text(
              "Order Has Been Successfully Placed",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 19,
                fontFamily: "monospace",
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            const Text(
              "You will be redirected to the home page shortly\nor click here to return to home page",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            Flexible(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const MyApp());
                },
                child: const Text("Return To Home",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "monospace",
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 232, 238, 237))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
