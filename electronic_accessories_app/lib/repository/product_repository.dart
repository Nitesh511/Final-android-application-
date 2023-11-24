import 'package:electronic_accessories_app/api/product_api.dart';
import 'package:electronic_accessories_app/response/get_product_response.dart';

class ProductRepository {
  Future<ProductResponse?> getProducts() async {
    return ProductAPI().getProducts();
  }
}
