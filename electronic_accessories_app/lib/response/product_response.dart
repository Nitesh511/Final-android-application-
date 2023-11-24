import 'package:electronic_accessories_app/model/images.dart';
import 'package:electronic_accessories_app/model/reviews.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_response.g.dart';

//flutter pub run build_runner build
@JsonSerializable()
class ProductCategory {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? description;
  List<Images>? images;
  List<Reviews>? reviews;
  String? stock;
  double? price;
  String? category;
  int? ratings;
  int? numReviews;

  ProductCategory({
    this.name,
    this.description,
    this.images,
    this.reviews,
    this.stock,
    this.price,
    this.category,
    this.ratings,
    this.numReviews,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);

  fold(int i, Function(dynamic a, dynamic b) param1) {}
}
