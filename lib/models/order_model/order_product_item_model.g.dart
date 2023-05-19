// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProductItem _$OrderProductItemFromJson(Map<String, dynamic> json) =>
    OrderProductItem(
      productName: json['productName'] as String,
      productQuantity: json['productQuantity'] as int,
      productPrice: (json['productPrice'] as num).toDouble(),
      productTotal: (json['productTotal'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderProductItemToJson(OrderProductItem instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'productQuantity': instance.productQuantity,
      'productPrice': instance.productPrice,
      'productTotal': instance.productTotal,
    };
