import 'dart:async';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:electronic_accessories_app/controller/Add_to_cart.dart';
import 'package:electronic_accessories_app/controller/Favourite_controller.dart';
import 'package:electronic_accessories_app/repository/product_repository.dart';
import 'package:electronic_accessories_app/response/product_response.dart';
import 'package:electronic_accessories_app/screens/bottomNavagationScreen.dart';
import 'package:electronic_accessories_app/screens/favourite_screen.dart';
import 'package:electronic_accessories_app/screens/search_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../response/get_product_response.dart';
import 'package:electronic_accessories_app/screens/product_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FavCounterController favCounterController = Get.put(FavCounterController());
  AddtocartCounterController addtocartCounterController =
      Get.put(AddtocartCounterController());

  int counter = 1;
  _checkNotificationEnabled() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
        AwesomeNotifications()
            .actionStream
            .listen((ReceivedNotification receivedNotification) {});
      }
    });
  }

  // double _proximityValue = 0;
  // final List<StreamSubscription<dynamic>> _streamSubscription =
  //     <StreamSubscription<dynamic>>[];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _streamSubscription
  //       .add(proximityEvents!.listen((ProximityEvent event) async {
  //     setState(() {
  //       _proximityValue = event.proximity;
  //     });

  //     if (_proximityValue < 2) {
  //       SharedPreferences pref = await SharedPreferences.getInstance();
  //       String? val = pref.getString("name");
  //       Get.to(() => const MyApp());
  //       AwesomeNotifications().createNotification(
  //           content: NotificationContent(
  //               id: counter,
  //               channelKey: 'basic_channel',
  //               title: '$val',
  //               body: 'Back To Login Page $val'));
  //     }
  //   }));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Products",
          style: TextStyle(
              fontSize: 36,
              fontFamily: "monospace",
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 34, 94, 150)),
        ),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 40.0,
            color: Colors.black,
          ),
          onPressed: () {
            Get.to(() => const MyApp());
          },
        ),
        backgroundColor: Colors.green[100],
      ),
      body: SafeArea(
        child: FutureBuilder<ProductResponse?>(
          future: ProductRepository().getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<ProductCategory> lstProductCategory =
                    snapshot.data!.products!;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 350,
                      childAspectRatio: 1,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 20),
                  itemCount: snapshot.data!.products!.length,
                  itemBuilder: (context, index) {
                    return _ProductCard(lstProductCategory[index], context);
                  },
                );
              } else {
                return const Center(
                  child: Text("No data"),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _ProductCard(
    ProductCategory lstProductCategory,
    BuildContext context,
  ) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 0.99,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
              image: DecorationImage(
                image: NetworkImage(
                  lstProductCategory.images![0].url!
                      .replaceAll('localhost', '10.0.2.2'),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Get.to(() => ProductDetailPage(
                product: lstProductCategory,
              )),
        ),
        Container(
          margin: const EdgeInsets.only(left: 8, right: 2),
          width: MediaQuery.of(context).size.width * 0.99,
          height: MediaQuery.of(context).size.height * 0.09,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 119, 124, 156),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 37.0,
              bottom: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name:${lstProductCategory.name!}",
                  style: const TextStyle(
                      fontSize: 17,
                      fontFamily: "monospace",
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 26, 4, 82)),
                ),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Rs:${lstProductCategory.price!}",
                        style: const TextStyle(
                            fontSize: 15,
                            fontFamily: "monospace",
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 77, 226, 87)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 8.0,
                      ),
                      child: InkWell(
                        onTap: () {
                          favCounterController
                              .addFavItemYoList(lstProductCategory);
                        },
                        child: const Icon(Icons.favorite,
                            size: 22, color: Colors.red),
                      ),
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
