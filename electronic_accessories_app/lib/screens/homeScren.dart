// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/ecommerce.jpg"), fit: BoxFit.fitHeight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 75,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "ShopWisely",
                  style: GoogleFonts.montserrat(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal),
                ),
                Text("|",
                    style: GoogleFonts.montserrat(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w200)),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    "All electronic\n accessories\n in one hand",
                    style: GoogleFonts.montserrat(
                        fontSize: 16, color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 400,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 45,
                    width: 120,
                    child: RaisedButton(
                      key: const ValueKey("register"),
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      color: const Color(0xff061420),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: const Text(
                        "SIGN IN",
                        style: TextStyle(
                            fontFamily: "SFUIText",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    width: 120,
                    child: RaisedButton(
                      key: const ValueKey("login"),
                      onPressed: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontFamily: "SFUIText",
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            const Center(
              child: Text(
                "Shop Online and payment\nonline and get instant delivery",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "SFUIText",
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
