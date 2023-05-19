// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_stops_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStops _$OrderStopsFromJson(Map<String, dynamic> json) => OrderStops(
      stopName: json['stopName'] as String,
      stopContact: json['stopContact'] as String,
      stopQuantity: json['stopQuantity'] as int,
      stopTotal: (json['stopTotal'] as num).toDouble(),
      itemList: (json['itemList'] as List<dynamic>)
          .map((e) => OrderProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderStopsToJson(OrderStops instance) =>
    <String, dynamic>{
      'stopName': instance.stopName,
      'stopContact': instance.stopContact,
      'stopQuantity': instance.stopQuantity,
      'stopTotal': instance.stopTotal,
      'itemList': instance.itemList.map((e) => e.toJson()),
    };
