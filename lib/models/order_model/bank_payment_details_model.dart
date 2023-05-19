import 'package:json_annotation/json_annotation.dart';
part 'bank_payment_details_model.g.dart';

@JsonSerializable()
class BankPaymentDetails {
  String bankName;
  double bankAmount;
  String bankReceipt;

  BankPaymentDetails({
    required this.bankName,
    required this.bankAmount,
    required this.bankReceipt,
  });
  factory BankPaymentDetails.fromJson(Map<String, dynamic> json) =>
      _$BankPaymentDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$BankPaymentDetailsToJson(this);
}
