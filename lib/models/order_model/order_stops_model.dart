import 'package:json_annotation/json_annotation.dart';
import 'package:maximagri/models/order_model/order_product_item_model.dart';
part 'order_stops_model.g.dart';

@JsonSerializable()
class OrderStops {
  String stopName;
  String stopContact;
  int stopQuantity;
  double stopTotal;
  List<OrderProductItem> itemList;
  OrderStops({
    required this.stopName,
    required this.stopContact,
    required this.stopQuantity,
    required this.stopTotal,
    required this.itemList,
  });
  factory OrderStops.fromJson(Map<String, dynamic> json) =>
      _$OrderStopsFromJson(json);
  Map<String, dynamic> toJson() => _$OrderStopsToJson(this);
}
