import 'package:json_annotation/json_annotation.dart';
import 'package:maximagri/models/controller_classes/controller_class.dart';
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

  factory OrderStops.fromControllers({
    required StopController stopController,
    required ProductController productController,
    required List<OrderProductItem> itemList,
  }) =>
      OrderStops(
        stopName: stopController.stopNameController.text,
        stopContact: stopController.stopContactController.text,
        stopQuantity: int.parse(stopController.calculateStopQuantity().text),
        stopTotal: double.parse(stopController.calculateStopTotal().text),
        itemList: List.generate(
          itemList.length,
          (index) => OrderProductItem.fromControllers(
            productController: productController,
          ),
        ),
      );

  factory OrderStops.fromJson(Map<String, dynamic> json) =>
      _$OrderStopsFromJson(json);
  Map<String, dynamic> toJson() => _$OrderStopsToJson(this);
}
