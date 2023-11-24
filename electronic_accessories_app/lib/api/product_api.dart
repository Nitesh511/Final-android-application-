import 'dart:io';

import 'package:dio/dio.dart';
import 'package:electronic_accessories_app/api/httpservice.dart';
import 'package:electronic_accessories_app/main.dart';
import 'package:electronic_accessories_app/model/product.dart';
import 'package:electronic_accessories_app/response/get_product_response.dart';
import 'package:electronic_accessories_app/response/product_response.dart';
import 'package:electronic_accessories_app/utils/url.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:mime/mime.dart';

import '../utils/url.dart';

class ProductAPI {
  Future<ProductResponse?> getProducts() async {
    ProductResponse? productResponse;
    String url = baseUrl + getProductsUrl;
    try {
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        productResponse = ProductResponse.fromJson(response.data);
        Hive.box(API_BOX).put("posts", response.data);
      } else {
        productResponse = null;
      }
    } catch (e) {
      print("No internet connection");
    }
    final posts = Hive.box(API_BOX).get('posts');
    if (posts.isNotEmpty) {
      productResponse = ProductResponse.fromJson(posts);
      return productResponse;
    }
    return productResponse;
  }

  Future<List<ProductCategory>?> getproducts({String? query}) async {
    List<ProductCategory>? results = [];
    ProductResponse res;
    Future.delayed(const Duration(seconds: 2), () {});
    try {
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(getProductsUrl);
      if (response.statusCode == 200) {
        res = ProductResponse.fromJson(response.data);
        results = res.products;
        if (query != null) {
          results = results!
              .where((element) =>
                  element.name!.toLowerCase().contains((query.toLowerCase())))
              .toList();
        }
      }
    } catch (e) {
      throw Exception(e);
    }
    return results;
  }
}
