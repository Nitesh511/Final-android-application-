import 'package:electronic_accessories_app/utils/url.dart';
import 'package:dio/dio.dart';

// state management
class HttpServices {
  static final HttpServices _instance = HttpServices._internal();
  factory HttpServices() => _instance;
  HttpServices._internal();

  Dio? _dio;
  Dio getDioInstance() {
    if (_dio == null) {
      return Dio(BaseOptions(baseUrl: baseUrl, connectTimeout: 5000));
    } else {
      return _dio!;
    }
  }
}
