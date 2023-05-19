// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_payment_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankPaymentDetails _$BankPaymentDetailsFromJson(Map<String, dynamic> json) =>
    BankPaymentDetails(
      bankName: json['bankName'] as String,
      bankAmount: (json['bankAmount'] as num).toDouble(),
      bankReceipt: json['bankReceipt'] as String,
    );

Map<String, dynamic> _$BankPaymentDetailsToJson(BankPaymentDetails instance) =>
    <String, dynamic>{
      'bankName': instance.bankName,
      'bankAmount': instance.bankAmount,
      'bankReceipt': instance.bankReceipt,
    };
