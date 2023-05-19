import 'package:json_annotation/json_annotation.dart';
import 'package:maximagri/models/order_model/bank_payment_details_model.dart';
part 'order_payment_model.g.dart';

@JsonSerializable()
class OrderPayment {
  BankPaymentDetails bankPaymentDetails;
  double bankPayment;
  double creditPayment;
  double rentAdjustment;
  OrderPayment({
    required this.bankPaymentDetails,
    required this.bankPayment,
    required this.creditPayment,
    required this.rentAdjustment,
  });
  factory OrderPayment.fromJson(Map<String, dynamic> json) =>
      _$OrderPaymentFromJson(json);
  Map<String, dynamic> toJson() => _$OrderPaymentToJson(this);
}
