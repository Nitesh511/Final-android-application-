import 'package:dio/dio.dart';
import 'package:electronic_accessories_app/api/httpservice.dart';
import 'package:electronic_accessories_app/model/profile_model.dart';
import 'package:electronic_accessories_app/model/user.dart';
import 'package:electronic_accessories_app/response/loginresponse.dart';
import 'package:electronic_accessories_app/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAPI {
  Future<bool> registerUser(User user) async {
    bool isLogin = false;
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(
        url,
        data: user.toJson(),
      );
      if (response.statusCode == 202) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  Future<bool> login(String email, String password) async {
    bool isLogin = false;
    try {
      var url = baseUrl + loginUrl;
      var dio = HttpServices().getDioInstance();
      var response =
          await dio.post(url, data: {"email": email, "password": password});
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        token = loginResponse.token;
        isLogin = true;
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("login", response.data['token']);
        await pref.setString("user_id", response.data['user']["_id"]);
        print(response.data['user']["_id"]);

        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  Future<ResponseUserProfile?> getUserProfile() async {
    Future.delayed(const Duration(seconds: 2), () {});

    ResponseUserProfile? productResponse;

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? user_id = "";
      user_id = pref.getString("user_id");

      var dio = HttpServices().getDioInstance();

      Response response = await dio.get("me/$user_id");

      if (response.statusCode == 200) {
        productResponse = ResponseUserProfile.fromJson(response.data);
      } else {
        productResponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }

    return productResponse;
  }

  Future<bool> updateUserProfile(String datatype, String data) async {
    bool isLogin = false;

    Future.delayed(const Duration(seconds: 2), () {});

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? user_id = "";
      user_id = pref.getString("user_id");
      var dio = HttpServices().getDioInstance();

      Response response =
          await dio.put("me/update/$user_id", data: {datatype: data});

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      throw Exception(e);
    }

    return isLogin;
  }
}
