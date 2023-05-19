// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dispatch_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DispatchInfo _$DispatchInfoFromJson(Map<String, dynamic> json) => DispatchInfo(
      driverContact: json['driverContact'] as String,
      vehicleNo: json['vehicleNo'] as String,
      dispatchTime: DateTime.parse(json['dispatchTime'] as String),
    );

Map<String, dynamic> _$DispatchInfoToJson(DispatchInfo instance) =>
    <String, dynamic>{
      'driverContact': instance.driverContact,
      'vehicleNo': instance.vehicleNo,
      'dispatchTime': instance.dispatchTime.toIso8601String(),
    };
