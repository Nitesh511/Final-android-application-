import 'dart:async';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:electronic_accessories_app/controller/Favourite_controller.dart';
import 'package:electronic_accessories_app/response/product_response.dart';
import 'package:electronic_accessories_app/screens/bottomNavagationScreen.dart';
import 'package:electronic_accessories_app/screens/profile_screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavCounterController favCounterController = Get.put(FavCounterController());
  List<double> _gyroscopeValues = <double>[];
  final List<StreamSubscription<dynamic>> _streamSubscription =
      <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamSubscription.add(gyroscopeEvents!.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];
      });
      print(_gyroscopeValues);
      if (_gyroscopeValues[0] > 2.2) {
        Get.to(() => ProfilePage());
      } else if (_gyroscopeValues[1] > 0.9) {
        Get.to(() => ProfilePage());
      } else if (_gyroscopeValues[2] > 2.9) {
        Get.to(() => ProfilePage());
      }
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorite Page",
          style: TextStyle(
              fontSize: 30,
              fontFamily: "monospace",
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 150, 82, 18)),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 102, 218, 105),
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView.builder(
            itemCount: favCounterController.favList.length,
            itemBuilder: (context, index) {
              return _favoriteCard(
                  favCounterController.favList[index], context);
            }),
      )),
    );
  }

  Widget _favoriteCard(ProductCategory favlist, BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.blueAccent,
              image: DecorationImage(
                image: NetworkImage(
                  favlist.images![0].url!.replaceAll('localhost', '10.0.2.2'),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 8, right: 6),
          width: MediaQuery.of(context).size.width * 0.969,
          height: MediaQuery.of(context).size.height * 0.12,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              bottom: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name:${favlist.name!}",
                  style: const TextStyle(
                      fontSize: 15,
                      fontFamily: "serif",
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 10, 10, 10)),
                ),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.description_outlined,
                          color: Colors.deepPurple,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Description:${favlist.description}",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 108, 90, 65),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Price:${favlist.price.toString()}",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 205, 89, 163),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 8.0,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.production_quantity_limits,
                          color: Colors.deepPurple,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Product_ID:${favlist.id}",
                          style: const TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
