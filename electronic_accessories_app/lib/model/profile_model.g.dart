// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseUserProfile _$ResponseUserProfileFromJson(Map<String, dynamic> json) =>
    ResponseUserProfile(
      success: json['success'] as bool,
      q: (json['q'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseUserProfileToJson(
        ResponseUserProfile instance) =>
    <String, dynamic>{
      'success': instance.success,
      'q': instance.q,
    };
