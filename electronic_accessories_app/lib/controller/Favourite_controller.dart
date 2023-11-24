import 'package:electronic_accessories_app/model/product.dart';
import 'package:electronic_accessories_app/response/product_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavCounterController extends GetxController {
  var numOfItems = 0.obs;
  var favList = <ProductCategory>[].obs;
  void addFavItemYoList(ProductCategory product) {
    // ignore: iterable_contains_unrelated_type
    if (!favList.contains(product)) {
      favList.add(product);
      numOfItems++;
    } else {
      Get.snackbar("Product", "already aliked by you",
          backgroundColor: Color.fromARGB(255, 159, 59, 59),
          snackPosition: SnackPosition.TOP,
          borderColor: Color.fromARGB(255, 28, 174, 69),
          borderRadius: 0,
          borderWidth: 2,
          barBlur: 0);
    }
  }
}
