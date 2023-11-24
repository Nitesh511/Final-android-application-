import 'dart:async';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:badges/badges.dart';
import 'package:electronic_accessories_app/controller/Add_to_cart.dart';
import 'package:electronic_accessories_app/controller/Favourite_controller.dart';
import 'package:electronic_accessories_app/screens/Allproducts.dart';
import 'package:electronic_accessories_app/screens/Home/category_json.dart';
import 'package:electronic_accessories_app/screens/Home/colors.dart';
import 'package:electronic_accessories_app/screens/Home/dish_card.dart';
import 'package:electronic_accessories_app/screens/Home/fontsizes.dart';
import 'package:electronic_accessories_app/screens/Home/helper.dart';
import 'package:electronic_accessories_app/screens/Home/padding.dart';
import 'package:electronic_accessories_app/screens/Home/store_card.dart';
import 'package:electronic_accessories_app/screens/Home/store_json.dart';
import 'package:electronic_accessories_app/screens/add_to_cart_screen.dart';
import 'package:electronic_accessories_app/screens/favourite_screen.dart';
import 'package:electronic_accessories_app/screens/login_scren.dart';
import 'package:electronic_accessories_app/screens/profile_screens/profile.dart';
import 'package:electronic_accessories_app/screens/search_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    FavCounterController favCounterController = Get.put(FavCounterController());
    AddtocartCounterController addtocartCounterController =
        Get.put(AddtocartCounterController());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 70, 71, 91),
          title: const Text(
            "Homepage",
            style: TextStyle(
                fontSize: 30,
                fontFamily: "monospace",
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 18, 150, 115)),
          ),
          elevation: 0,
          centerTitle: true,
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 3),
              child: Badge(
                  position: BadgePosition.topEnd(top: 0, end: 1),
                  badgeContent: Obx(
                    () => Text(
                      favCounterController.numOfItems.value.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      Get.to(() => FavoriteScreen());
                    },
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(left: 1),
              child: Badge(
                  position: BadgePosition.topEnd(top: 0, end: 1),
                  badgeContent: Obx(
                    () => Text(
                      addtocartCounterController.numOfItems.value.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      Get.to(() => const CartScreen());
                    },
                  )),
            ),
            IconButton(
              color: Colors.green,
              onPressed: () {
                showSearch(context: context, delegate: SearchUser());
              },
              icon: const Icon(Icons.search_sharp),
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: Color(0xff764abc),
                    image: DecorationImage(
                        image: AssetImage("assets/shopwisely.PNG"))),
                accountName: Text(
                  "Nitesh Karki",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  "Nitesh.karki31@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                ),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  // Get.to(() => ProfilePage());
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.train,
                ),
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout_outlined,
                ),
                title: const Text('Logout'),
                onTap: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  await pref.clear();
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (route) => false);
                },
              ),
              const AboutListTile(
                // <-- SEE HERE
                icon: Icon(
                  Icons.info,
                ),
                applicationIcon: Icon(
                  Icons.local_play,
                ),
                applicationName: 'ShopWisely',
                applicationVersion: '1.0.25',
                applicationLegalese: '© 2020 NK',
                aboutBoxChildren: [Text('Made By NK')],
                child: Text('About app'),
              ),
            ],
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Image.asset(
              "assets/ecommerce.jpg",
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 100),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(storeTypes.length, (index) {
                      return SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            getSvgIcon(storeTypes[index]['image']),
                            const SizedBox(
                              height: 0.01,
                            ),
                            Text(
                              storeTypes[index]['name'],
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontFamily: "monospace",
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 18, 150, 115)),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: light),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: topMainPadding, bottom: bottomMainPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                          left: leftMainPadding, right: rightMainPadding),
                      child: Text(
                        "Special Offers",
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(storeItems.length, (index) {
                          var store = storeItems[index];
                          if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: leftMainPadding,
                                  right: rightMainPadding),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  child: StoreCard(width: 280, store: store),
                                ),
                              ),
                            );
                          }
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: rightMainPadding),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                child: StoreCard(width: 280, store: store),
                              ),
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: light),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: topMainPadding, bottom: bottomMainPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                          left: leftMainPadding, right: rightMainPadding),
                      child: Text(
                        "Recommeded Product",
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            List.generate(recommendedDishes.length, (index) {
                          var dishes = recommendedDishes[index];
                          if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: leftMainPadding,
                                  right: rightMainPadding),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => const HomeScreen());
                                },
                                child: Container(
                                  child: DishCard(width: 180, dish: dishes),
                                ),
                              ),
                            );
                          }
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: rightMainPadding),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => StoreDetailPage(
                                //               image: dishes['image'],
                                //               name: dishes['name'],
                                //             )));
                              },
                              child: Container(
                                child: DishCard(width: 180, dish: dishes),
                              ),
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: light),
              child: Padding(
                padding: const EdgeInsets.all(mainPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: List.generate(storeList.length, (index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(bottom: bottomMainPadding),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => StoreDetailPage(
                              //               image: storeList[index]['image'],
                              //               name: storeList[index]['name'],
                              //             )));
                            },
                            child: Container(
                              child: StoreCard(
                                  width: size.width - (mainPadding * 2),
                                  store: storeList[index]),
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            )
          ],
        ))));
  }
}
