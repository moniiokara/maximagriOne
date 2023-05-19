// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Province _$ProvinceFromJson(Map<String, dynamic> json) => Province(
      provinceName: json['provinceName'] as String,
      districtsList: (json['districtsList'] as List<dynamic>)
          .map((e) => District.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'provinceName': instance.provinceName,
      'districtsList': instance.districtsList.map((e) => e.toJson()),
    };
