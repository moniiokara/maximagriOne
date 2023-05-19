// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => UserAddress(
      province: json['province'] as String,
      district: json['district'] as String,
      tehsil: json['tehsil'] as String,
    );

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      'province': instance.province,
      'district': instance.district,
      'tehsil': instance.tehsil,
    };
