// ignore: depend_on_referenced_packages
import 'package:electronic_accessories_app/model/product.dart';
import 'package:electronic_accessories_app/response/product_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  bool? success;
  List<ProductCategory>? products;

  ProductResponse({this.success, this.products});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
