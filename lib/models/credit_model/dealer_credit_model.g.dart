// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dealer_credit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealerCredit _$DealerCreditFromJson(Map<String, dynamic> json) => DealerCredit(
      dealerUID: json['dealerUID'] as String,
      creditLimit: (json['creditLimit'] as num).toDouble(),
      availableCredit: (json['availableCredit'] as num).toDouble(),
    );

Map<String, dynamic> _$DealerCreditToJson(DealerCredit instance) =>
    <String, dynamic>{
      'dealerUID': instance.dealerUID,
      'creditLimit': instance.creditLimit,
      'availableCredit': instance.availableCredit,
    };
