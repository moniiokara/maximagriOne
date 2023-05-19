import 'package:json_annotation/json_annotation.dart';
part 'order_product_item_model.g.dart';

@JsonSerializable()
class OrderProductItem {
  String productName;
  int productQuantity;
  double productPrice;
  double productTotal;
  OrderProductItem({
    required this.productName,
    required this.productQuantity,
    required this.productPrice,
    required this.productTotal,
  });
  factory OrderProductItem.fromJson(Map<String, dynamic> json) =>
      _$OrderProductItemFromJson(json);
  Map<String, dynamic> toJson() => _$OrderProductItemToJson(this);
}
