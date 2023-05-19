// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPayment _$OrderPaymentFromJson(Map<String, dynamic> json) => OrderPayment(
      bankPaymentDetails: BankPaymentDetails.fromJson(
          json['bankPaymentDetails'] as Map<String, dynamic>),
      bankPayment: (json['bankPayment'] as num).toDouble(),
      creditPayment: (json['creditPayment'] as num).toDouble(),
      rentAdjustment: (json['rentAdjustment'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderPaymentToJson(OrderPayment instance) =>
    <String, dynamic>{
      'bankPaymentDetails': instance.bankPaymentDetails.toJson(),
      'bankPayment': instance.bankPayment,
      'creditPayment': instance.creditPayment,
      'rentAdjustment': instance.rentAdjustment,
    };
