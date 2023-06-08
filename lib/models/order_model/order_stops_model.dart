import 'package:json_annotation/json_annotation.dart';
import 'package:maximagri/models/order_model/order_product_item_model.dart';
import 'package:maximagri/place_order.dart';
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

  factory OrderStops.fromControllers({required StopController stopController}) =>
   OrderStops(
       stopName: stopController.stopNameController.text,
       stopContact: stopController.stopContactController.text,
       stopQuantity: int.parse(stopController.calculateStopQuantity().text),
       stopTotal: double.parse(stopController.calculateStopTotal().text),
       itemList: [
         OrderProductItem(
             productName: stopController.products[0].productName.text,
             productQuantity: int.parse(stopController.products[0].calculateProductQuantity().text),
             productPrice: double.parse(stopController.products[0].productPrice.text),
             productTotal: double.parse(stopController.products[0].productTotal().text)),
       ]);

  factory OrderStops.fromJson(Map<String, dynamic> json) =>
      _$OrderStopsFromJson(json);
  Map<String, dynamic> toJson() => _$OrderStopsToJson(this);
}
