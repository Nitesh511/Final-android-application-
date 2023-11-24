import 'package:electronic_accessories_app/controller/Add_to_cart.dart';
import 'package:electronic_accessories_app/screens/Thanku_page.dart';
import 'package:electronic_accessories_app/screens/bottomNavagationScreen.dart';
import 'package:electronic_accessories_app/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  AddtocartCounterController addtocartCounterController =
      Get.put(AddtocartCounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 84, 70, 70),
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            Container(),
            Positioned.fill(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: addtocartCounterController.cartList.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) => Card(
                  elevation: 0,
                  child: Container(
                    height: 110,
                    padding: const EdgeInsets.all(8.0),
                    width: 100,
                    margin: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                              addtocartCounterController
                                  .cartList[index].images![0].url!
                                  .replaceAll('localhost', '10.0.2.2'),
                            )),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  addtocartCounterController
                                      .cartList[index].name
                                      .toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Expanded(
                                  child: Text(
                                    addtocartCounterController
                                        .cartList[index].price
                                        .toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  "\Rs:${addtocartCounterController.cartList[index].price}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              color: Colors.grey[200],
                              child: const Icon(Icons.remove),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                            ),
                            Container(
                              color: Colors.grey[200],
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            _buildBottom(),
          ],
        ));
  }

  Positioned _buildBottom() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16,
          bottom: 8.0,
          top: 4.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: "sans-serif",
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Rs:${addtocartCounterController.subtotal}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23.0,
                        fontFamily: "monospace",
                      ),
                    ),
                    const Text(
                      "Subtotal does not include shipping",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16.0,
                      ),
                      primary: const Color.fromARGB(255, 30, 170, 82),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => const ThankYouPage());
                    },
                    child: const Text("Check out",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "monospace",
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255))),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16.0,
                ),
                primary: const Color.fromARGB(255, 159, 19, 252),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(
                    color: Colors.black38,
                  ),
                ),
              ),
              onPressed: () {
                Get.to(() => const MyApp());
              },
              child: const Text("Continue Shopping",
                  style: TextStyle(
                      fontSize: 19,
                      fontFamily: "monospace",
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255))),
            ),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 90, 91, 107),
      elevation: 0,
      centerTitle: true,
      title: const Text("Cart",
          style: TextStyle(
              fontSize: 30,
              fontFamily: "monospace",
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 18, 150, 115))),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined)),
      ],
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }
}
