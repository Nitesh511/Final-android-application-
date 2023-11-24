import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 134, 73),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/shopwisely.PNG',
              height: 200,
              scale: 0.9,
            ),
            const Text(
              'ShopWisely',
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Color(0xfff07b3f),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Flutter Developer',
              style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  letterSpacing: 2.5,
                  color: Color(0xfff07b3f),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                color: Color(0xfff07b3f),
              ),
            ),
            const Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Color(0xfff07b3f),
                ),
                title: Text(
                  '+923030508582',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Color(0xfff07b3f),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const Card(
              margin: EdgeInsets.symmetric(vertical: 2, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Color(0xfff07b3f),
                ),
                title: Text(
                  'ShopWisely@gmail.com',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Color(0xfff07b3f),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
