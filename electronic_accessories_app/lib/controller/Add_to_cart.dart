import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:electronic_accessories_app/model/product.dart';
import 'package:electronic_accessories_app/response/product_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddtocartCounterController extends GetxController {
  var numOfItems = 0.obs;
  var cartList = <ProductCategory>[].obs;

  var subtotal = 0.0.obs;
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

  Future<void> addFavItemYoList(ProductCategory product) async {
    // ignore: iterable_contains_unrelated_type
    if (!cartList.contains(product)) {
      cartList.add(product);
      numOfItems++;
      subtotal(subtotal.value + product.price!);
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? val = pref.getString("name");
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: counter,
              channelKey: 'basic_channel',
              title: '$val',
              body: 'Added To Cart by $val'));
    } else {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? val = pref.getString("name");
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: counter,
              channelKey: 'basic_channel',
              title: '$val',
              body: 'Already Added by $val'));
    }
  }

  removeFromCart(product) {
    if (cartList.contains(product)) {
      cartList.remove(product);
    }
  }
}
