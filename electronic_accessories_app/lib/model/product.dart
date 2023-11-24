import 'package:electronic_accessories_app/model/images.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? description;
  List<Images>? images;
  String? stock;
  double? price;
  String? category;
  int? ratings;
  int? numReviews;
  // List<String>? reviews;

  Product({
    this.name,
    this.description,
    this.images,
    this.stock,
    this.price,
    this.category,
    this.ratings,
    this.numReviews,
    // this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
