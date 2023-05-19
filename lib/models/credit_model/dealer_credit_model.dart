import 'package:json_annotation/json_annotation.dart';
part 'dealer_credit_model.g.dart';

@JsonSerializable()
class DealerCredit {
  String dealerUID;
  double creditLimit;
  double availableCredit;
  DealerCredit({
    required this.dealerUID,
    required this.creditLimit,
    required this.availableCredit,
  });

  factory DealerCredit.fromJson(Map<String, dynamic> json) =>
      _$DealerCreditFromJson(json);
  Map<String, dynamic> toJson() => _$DealerCreditToJson(this);
}
