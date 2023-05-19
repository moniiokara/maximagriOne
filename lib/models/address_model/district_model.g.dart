// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

District _$DistrictFromJson(Map<String, dynamic> json) => District(
      districtName: json['districtName'] as String,
      tehsilsList: (json['tehsilsList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'districtName': instance.districtName,
      'tehsilsList': instance.tehsilsList,
    };
