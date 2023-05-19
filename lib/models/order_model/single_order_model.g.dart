// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleOrder _$SingleOrderFromJson(Map<String, dynamic> json) => SingleOrder(
      dealerUID: json['dealerUID'] as String,
      dealerName: json['dealerName'] as String,
      orderSerial: json['orderSerial'] as String,
      orderTotal: (json['orderTotal'] as num).toDouble(),
      orderQuantity: json['orderQuantity'] as int,
      // accountUID:
      //     AccountUID.fromJson(json['accountUID'] as Map<String, dynamic>),
      dateTime: DateTime.parse(json['dateTime'] as String),
      orderStatus: $enumDecode(_$OrderStatusEnumMap, json['orderStatus']),
      orderStops: (json['orderStops'] as List<dynamic>)
          .map((e) => OrderStops.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderPayment:
          OrderPayment.fromJson(json['orderPayment'] as Map<String, dynamic>),
      dispatchInfo:
          DispatchInfo.fromJson(json['dispatchInfo'] as Map<String, dynamic>),
      operationsUID: json['operationsUID'] as String,
      zonalManagerUID: json['zonalManagerUID'] as String,
      salesManagerUID: json['salesManagerUID'] as String,
      salesOfficerUID: json['salesOfficerUID'] as String,
    );

Map<String, dynamic> _$SingleOrderToJson(SingleOrder instance) =>
    <String, dynamic>{
      'dealerUID': instance.dealerUID,
      'dealerName': instance.dealerName,
      'orderSerial': instance.orderSerial,
      'orderTotal': instance.orderTotal,
      'orderQuantity': instance.orderQuantity,
      'dateTime': instance.dateTime.toIso8601String(),
      'orderStatus': _$OrderStatusEnumMap[instance.orderStatus]!,
      'dispatchInfo': instance.dispatchInfo.toJson(),
      'orderPayment': instance.orderPayment.toJson(),
      // 'accountUID': instance.accountUID.toJson(),
      'orderStops': instance.orderStops.map((e) => e.toJson()),
      'operationsUID': instance.operationsUID,
      'zonalManagerUID': instance.zonalManagerUID,
      'salesManagerUID': instance.salesManagerUID,
      'salesOfficerUID': instance.salesOfficerUID,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.cancel: 'cancel',
  OrderStatus.rejected: 'rejected',
  OrderStatus.confirmed: 'confirmed',
  OrderStatus.forwarded: 'forwarded',
  OrderStatus.approved: 'approved',
  OrderStatus.processing: 'processing',
  OrderStatus.dispatched: 'dispatched',
  OrderStatus.delivered: 'delivered',
};
