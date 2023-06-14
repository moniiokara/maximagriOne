import 'package:json_annotation/json_annotation.dart';
import 'package:maximagri/models/controller_classes/controller_class.dart';
import 'package:maximagri/models/order_model/bank_payment_details_model.dart';
import 'package:maximagri/models/order_model/dispatch_info_model.dart';
import 'package:maximagri/models/order_model/order_payment_model.dart';
import 'package:maximagri/models/order_model/order_product_item_model.dart';
import 'package:maximagri/models/order_model/order_status_enum.dart';
import 'package:maximagri/models/order_model/order_stops_model.dart';
import 'package:maximagri/models/user_profile_model/user_profile_model.dart';
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
          required UserProfile userProfile,
        }) =>
      SingleOrder(
        dealerUID: userProfile.userUID,
        dealerName: userProfile.userName,
        orderSerial: DateTime.now().toString(),
        orderTotal:
            double.parse(singleOrderController.calculateOrderTotals().text),
        orderQuantity:
            int.parse(singleOrderController.calculateOrderQuantitys().text),
        dateTime: DateTime.now(),
        orderStatus: OrderStatus.pending,
        orderStops: List.generate(
          singleOrderController.stops.length,
              (index) => OrderStops(
            stopName: singleOrderController.stops[index].stopNameController.text,
            stopContact: singleOrderController.stops[index].stopContactController.text,
            stopQuantity: int.parse(singleOrderController.stops[index].calculateStopQuantity().text),
            stopTotal: double.parse(singleOrderController.stops[index].calculateStopTotal().text),
            itemList: singleOrderController.stops[index].products.map((product) => OrderProductItem(
              productName: product.productName.text.trim(),
              productPrice: double.parse(product.productPrice.text),
              productQuantity: int.parse(product.productQuantity.text),
              productTotal: double.parse(product.productTotal().text),
            )).toList(),
          ),
        ),
        orderPayment: OrderPayment(
            bankPaymentDetails: BankPaymentDetails(
                bankName: "${singleOrderController.bankNameController.text}/${singleOrderController.ibanNoController.text}",
                bankAmount: double.parse(singleOrderController.creditAmountController.text),
                bankReceipt: singleOrderController.bankReciptController.text,
            ),
            bankPayment: double.parse(singleOrderController.bankAmountController.text),
            creditPayment: double.parse(singleOrderController.creditAmountController.text),
            rentAdjustment: double.parse(singleOrderController.rentAmountController.text)),
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
