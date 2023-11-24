// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategory _$ProductCategoryFromJson(Map<String, dynamic> json) =>
    ProductCategory(
      name: json['name'] as String?,
      description: json['description'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Reviews.fromJson(e as Map<String, dynamic>))
          .toList(),
      stock: json['stock'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      category: json['category'] as String?,
      ratings: json['ratings'] as int?,
      numReviews: json['numReviews'] as int?,
    )..id = json['_id'] as String?;

Map<String, dynamic> _$ProductCategoryToJson(ProductCategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
      'reviews': instance.reviews,
      'stock': instance.stock,
      'price': instance.price,
      'category': instance.category,
      'ratings': instance.ratings,
      'numReviews': instance.numReviews,
    };
