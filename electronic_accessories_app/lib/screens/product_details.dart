// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'package:all_sensors2/all_sensors2.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:electronic_accessories_app/controller/Add_to_cart.dart';
import 'package:electronic_accessories_app/controller/Favourite_controller.dart';
import 'package:electronic_accessories_app/response/product_response.dart';
import 'package:electronic_accessories_app/screens/add_to_cart_screen.dart';
import 'package:electronic_accessories_app/screens/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductCategory product;

  ProductDetailPage({required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState(product);
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  final ProductCategory product;

  _ProductDetailPageState(this.product);
  AddtocartCounterController addtocartCounterController =
      Get.put(AddtocartCounterController());
  FavCounterController favCounterController = Get.put(FavCounterController());
  List<double> _accelerometerValues = <double>[];
  final List<StreamSubscription<dynamic>> _streamSubscription =
      <StreamSubscription<dynamic>>[];

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

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _streamSubscription
  //       .add(accelerometerEvents!.listen((AccelerometerEvent event) async {
  //     setState(() {
  //       _accelerometerValues = <double>[event.x, event.y, event.z];
  //     });
  //     // print(_accelerometerValues[0]);
  //     if (_accelerometerValues[0] > 10) {
  //       SharedPreferences pref = await SharedPreferences.getInstance();
  //       String? val = pref.getString("name");
  //       AwesomeNotifications().createNotification(
  //           content: NotificationContent(
  //               id: counter,
  //               channelKey: 'basic_channel',
  //               title: '$val',
  //               body: 'Welcome to Cart Page by $val'));
  //       Get.to(() => const CartScreen());
  //     }
  //   }));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 40.0,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "PRODUCT DETAILS",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: _buildProductDetailsPage(context),
      bottomNavigationBar: _buildBottomNavigationBar(product),
    );
  }

  _buildProductDetailsPage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return ListView(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildProductImagesWidgets(),
                _buildProductTitleWidget(),
                const SizedBox(height: 12.0),
                _buildPriceWidgets(),
                const SizedBox(height: 12.0),
                _buildReviews(),
                const SizedBox(height: 12.0),
                _buildDivider(screenSize),
                const SizedBox(height: 12.0),
                _buildFurtherInfoWidget(),
                const SizedBox(height: 12.0),
                _buildDivider(screenSize),
                const SizedBox(height: 12.0),
                _buildSizeChartWidgets(),
                const SizedBox(height: 12.0),
                _buildDetailsAndMaterialWidgets(),
                const SizedBox(height: 12.0),
                // _buildStyleNoteHeader(),
                const SizedBox(height: 6.0),
                _buildDivider(screenSize),
                const SizedBox(height: 4.0),
                // _buildStyleNoteData(),
                const SizedBox(height: 20.0),
                _buildMoreInfoHeader(),
                const SizedBox(height: 6.0),
                _buildDivider(screenSize),
                const SizedBox(height: 4.0),
                _buildMoreInfoData(),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _buildDivider(Size screenSize) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey[600],
          width: screenSize.width,
          height: 0.25,
        ),
      ],
    );
  }

  _buildProductImagesWidgets() {
    TabController imagesController =
        TabController(length: product.images!.length, vsync: this);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 250.0,
        child: Center(
          child: DefaultTabController(
            length: product.images!.length,
            child: Stack(
              children: <Widget>[
                TabBarView(
                  controller: imagesController,
                  children: product.images!.map(
                    (image) {
                      return Image.network(
                        product.images![0].url!
                            .replaceAll('localhost', '10.0.2.2'),
                      );
                    },
                  ).toList(),
                ),
                Container(
                  alignment: const FractionalOffset(0.5, 0.95),
                  child: TabPageSelector(
                    controller: imagesController,
                    selectedColor: Colors.grey,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildProductTitleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Center(
        child: Text(
          //name,
          product.name.toString(),
          style: const TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }

  _buildPriceWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            "RS-${product.price}",
            style: const TextStyle(fontSize: 20.0, color: Colors.black),
          ),
          const SizedBox(
            width: 50.0,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            "Discount 25%",
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.blue[700],
            ),
          ),
        ],
      ),
    );
  }

  _buildReviews() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          size: 16,
          color: Color(0xfffebf50),
        ),
        const Icon(
          Icons.star,
          size: 16,
          color: Color(0xfffebf50),
        ),
        const Icon(
          Icons.star,
          size: 16,
          color: Color(0xfffebf50),
        ),
        const Icon(
          Icons.star,
          size: 16,
          color: Color(0xfffebf50),
        ),
        const Icon(
          Icons.star,
          size: 16,
          color: Color(0xFFebf9c3),
        ),
        const Text(
          "Reviews-",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        Text(
          product.ratings.toString(),
          style: const TextStyle(color: Color(0xfffebf50)),
        ),
      ],
    );
  }

  _buildFurtherInfoWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.local_offer,
            color: Colors.grey[500],
          ),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            "Category:${product.category}",
            style: const TextStyle(
                color: Color.fromARGB(255, 25, 23, 23),
                fontSize: 40,
                fontFamily: "Cursive"),
          ),
        ],
      ),
    );
  }

  _buildSizeChartWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.straighten,
                color: Colors.grey[600],
              ),
              const SizedBox(
                width: 12.0,
              ),
              Text(
                "Added By:${product.reviews![0].name.toString()}",
                style: const TextStyle(
                    color: Color.fromARGB(255, 140, 21, 21), fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildDetailsAndMaterialWidgets() {
    TabController tabController = new TabController(length: 2, vsync: this);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TabBar(
            controller: tabController,
            tabs: const <Widget>[
              Tab(
                child: Text(
                  "DETAILS",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Comments of User",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            height: 60.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                Text(
                  product.description!,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  product.reviews![0].comment.toString(),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // _buildStyleNoteHeader() {
  //   return Padding(
  //     padding: const EdgeInsets.only(
  //       left: 12.0,
  //     ),
  //     child: Text(
  //       "STYLE NOTE",
  //       style: TextStyle(
  //         color: Colors.grey[800],
  //       ),
  //     ),
  //   );
  // }

  // _buildStyleNoteData() {
  //   return Padding(
  //     padding: const EdgeInsets.only(
  //       left: 12.0,
  //     ),
  //     child: Text(
  //       product.description ?? "Details unavailable",
  //       style: TextStyle(
  //         color: Colors.grey[600],
  //       ),
  //     ),
  //   );
  // }

  _buildMoreInfoHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        "MORE INFO",
        style: TextStyle(
          color: Colors.grey[800],
        ),
      ),
    );
  }

  _buildMoreInfoData() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        "Product Code: ${product.id}\nTax info: Applicable GST will be charged at the time of chekout",
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
    );
  }

  _buildBottomNavigationBar(
    ProductCategory lstProductCategory,
  ) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              onPressed: () {
                Future.delayed(Duration.zero, () => favourite(context));
                favCounterController.addFavItemYoList(lstProductCategory);
              },
              color: Color.fromARGB(255, 165, 63, 63),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Color.fromARGB(255, 199, 156, 137),
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "Favourite",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: RaisedButton(
              onPressed: () {
                addtocartCounterController.addFavItemYoList(lstProductCategory);
                Future.delayed(Duration.zero, () => showAlert(context));
                setState(() {
                  Fluttertoast.showToast(
                      msg: "Product Added to cart",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: const Color.fromARGB(255, 152, 34, 34),
                      textColor: const Color.fromARGB(255, 173, 25, 25),
                      fontSize: 16.0);
                });
              },
              color: Colors.greenAccent,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.card_travel,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "ADD TO Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Item Added To Cart SUcesfully'),
              actions: [
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon:
                        const Icon(Icons.check), //icon data for elevated button
                    label: const Text("DOne")),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const CartScreen());
                  },
                  child: const Icon(Icons.shopping_cart,
                      size: 22, color: Colors.red),
                  //label text
                ),
              ],
            ));
  }

  void favourite(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Items AddedTO Favourite'),
              actions: [
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon:
                        const Icon(Icons.check), //icon data for elevated button
                    label: const Text("DOne")),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => FavoriteScreen());
                  },
                  child: const Icon(Icons.favorite_border,
                      size: 22, color: Colors.red),
                  //label text
                ),
              ],
            ));
  }
}
