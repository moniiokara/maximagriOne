import 'package:json_annotation/json_annotation.dart';
import 'package:maximagri/models/order_model/bank_payment_details_model.dart';
import 'package:maximagri/models/order_model/dispatch_info_model.dart';
import 'package:maximagri/models/order_model/order_payment_model.dart';
import 'package:maximagri/models/order_model/order_product_item_model.dart';
import 'package:maximagri/models/order_model/order_status_enum.dart';
import 'package:maximagri/models/order_model/order_stops_model.dart';
import 'package:maximagri/models/user_profile_model/user_profile_model.dart';
import 'package:maximagri/place_order.dart';
part 'single_order_model.g.dart';

@JsonSerializable()
class SingleOrder {
  String dealerUID;
  String dealerName;
  String orderSerial;
  double orderTotal;
  int orderQuantity;
  DateTime dateTime;
  OrderStatus orderStatus;
  DispatchInfo dispatchInfo;
  OrderPayment orderPayment;
  //AccountUID accountUID;
  String operationsUID;
  String zonalManagerUID;
  String salesManagerUID;
  String salesOfficerUID;
  List<OrderStops> orderStops;

  SingleOrder({
    required this.dealerUID,
    required this.dealerName,
    required this.orderSerial,
    required this.orderTotal,
    required this.orderQuantity,
    // required this.accountUID,
    required this.dateTime,
    required this.orderStatus,
    required this.orderStops,
    required this.orderPayment,
    required this.dispatchInfo,
    required this.operationsUID,
    required this.zonalManagerUID,
    required this.salesManagerUID,
    required this.salesOfficerUID,
  });

  factory SingleOrder.fromControllers(
          {required SingleOrderController singleOrderController,
          required StopController stopController,
          required UserProfile userProfile}) =>
      SingleOrder(
        dealerUID: userProfile.userUID,
        dealerName: userProfile.userName,
        orderSerial: DateTime.now().toString(),
        orderTotal:
            double.parse(singleOrderController.calculateOrderTotal().text),
        orderQuantity:
            int.parse(singleOrderController.calculateOrderQuantity().text),
        dateTime: DateTime.now(),
        orderStatus: OrderStatus.pending,
        orderStops: [
          OrderStops(
              stopName: stopController.stopNameController.text,
              stopContact: stopController.stopContactController.text,
              stopQuantity: int.parse(stopController.calculateStopQuantity().text),
              stopTotal: double.parse(stopController.calculateStopTotal().text),
              itemList: [
                OrderProductItem(
                    productName: stopController.products[0].productName.text,
                    productQuantity: int.parse(
                        stopController.products[0].calculateProductQuantity().text),
                    productPrice: double.parse(
                        stopController.products[0].productPrice.text),
                    productTotal: double.parse(
                        stopController.products[0].productTotal().text)),
              ]),
        ],
        orderPayment: OrderPayment(
            bankPaymentDetails: BankPaymentDetails(
                bankName: "bankName", bankAmount: 0.0, bankReceipt: ""),
            bankPayment: 0.0,
            creditPayment: 0.0,
            rentAdjustment: 0.0),
        dispatchInfo: DispatchInfo(
          driverContact: "",
          vehicleNo: "",
          dispatchTime: DateTime.now(),
        ),
        operationsUID: userProfile.operationsUID,
        zonalManagerUID: userProfile.zonalManagerUID,
        salesManagerUID: userProfile.salesManagerUID,
        salesOfficerUID: userProfile.salesOfficerUID,
      );

  updateOrderStatus(OrderStatus newOrderStatus) {
    orderStatus = newOrderStatus;
  }

  updateDispatchInfo(DispatchInfo newDispatchInfo) {
    dispatchInfo = newDispatchInfo;
  }

  factory SingleOrder.fromJson(Map<String, dynamic> json) =>
      _$SingleOrderFromJson(json);
  Map<String, dynamic> toJson() => _$SingleOrderToJson(this);
}
