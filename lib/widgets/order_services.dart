import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maximagri/models/order_model/bank_payment_details_model.dart';
import 'package:maximagri/models/order_model/dispatch_info_model.dart';
import 'package:maximagri/models/order_model/order_payment_model.dart';
import 'package:maximagri/models/order_model/order_product_item_model.dart';
import 'package:maximagri/models/order_model/order_status_enum.dart';
import 'package:maximagri/models/order_model/order_stops_model.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';
import 'package:maximagri/models/products_model/product_profile_model.dart';


class FormCol {
  TextEditingController shopController;
  TextEditingController stopController;
  TextEditingController stopTotal;
  String? dropdownValue;
  ProductProfile? selectedProduct;
  double productQuantity = 0;
  double productPlus = 0;
  int stopIndex;
  TextEditingController moqController;
  ValueChanged<int>? onMoqChanged;
  int moqUsed = 0;

  FormCol({
    required this.shopController,
    required this.stopController,
    required this.stopTotal,
    required this.moqController,
    this.dropdownValue,
    this.selectedProduct,
    required this.stopIndex,
    this.onMoqChanged,
  });
  void updateProduct(ProductProfile product, double quantity) {
    selectedProduct = product;
    productQuantity = quantity;
  }
}

class OrderServices {
  static TextEditingController bankNameController = TextEditingController();
  static TextEditingController bankAmountController = TextEditingController();

  static double totalOrderPrice = 0;
  static int totalMoqUsed = 0;

  static List<OrderStops> orderStop = [];

  static List<FormCol> formRows = [
    FormCol(
      shopController: TextEditingController(),
      stopController: TextEditingController(),
      stopTotal: TextEditingController(),
      dropdownValue: 'Product A',
      stopIndex: 1,
      moqController: TextEditingController(),
    ),
  ];

  static void addFormRow(BuildContext context, State state) {
    if (totalMoqUsed < 50 && formRows.length < 4) {
      int stopIndex = formRows.isEmpty ? 1 : formRows.last.stopIndex + 1;

      state.setState(() {
        formRows.add(
          FormCol(
            shopController: TextEditingController(),
            stopController: TextEditingController(),
            stopTotal: TextEditingController(),
            dropdownValue: 'Product A',
            stopIndex: stopIndex,
            moqController: TextEditingController(),
            onMoqChanged: (newValue) {
              state.setState(() {
                totalMoqUsed += newValue;
              });
            },
          ),
        );
      });
    } else if (totalMoqUsed >= 50) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Maximum MOQ of 50 reached. Cannot add more products.'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Maximum limit of 4 stops reached.'),
      ));
    }
  }

  static List<ProductProfile> products = [
    ProductProfile(
        productName: "Product 1",
        productSKU: "SKU 1",
        productDescription: "Description 1",
        productCategory: "Category 1",
        productGroup: "Group 1",
        productWeight: 20,
        productPrice: 300,
        productMOQ: 10,
       ),
    ProductProfile(
        productName: "Product 2",
        productSKU: "SKU 1",
        productDescription: "Description 1",
        productCategory: "Category 1",
        productGroup: "Group 1",
        productWeight: 20,
        productPrice: 400,
        productMOQ: 10,
        ),
  ];

   static Future<void> placeOrder(BuildContext context) async {

     CollectionReference ordersCollection = FirebaseFirestore.instance.collection('placeOrders');


     for (var i = 0; i < formRows.length; i++) {
      if (formRows[i].selectedProduct != null) {
        orderStop.add(OrderStops(
          stopName: formRows[i].shopController.text,
          stopContact: formRows[i].stopController.text,
          stopTotal: double.tryParse(formRows[i].stopTotal.text) ?? 0.0,
          stopQuantity: int.tryParse(formRows[i].moqController.text) ?? 0,
          //  stopTotal: double.tryParse(formRows[i].stopController.text) ?? 0.0,
          //  stopQuantity: int.tryParse(_stopQuantityController.text) ?? 0,
          itemList: [
            OrderProductItem(
              productName: formRows[i].selectedProduct!.productName,
              productPrice: formRows[i].selectedProduct!.productPrice,
              productQuantity: formRows[i].moqUsed,
              productTotal: formRows[i].productQuantity,
              // productTotal: totalOrderPrice,
            ),
          ],
        ));
      }
    }

    final order = SingleOrder(
      dealerUID: '',
      dealerName: '',
      orderSerial: '',
      orderTotal: totalOrderPrice,
      orderQuantity: totalMoqUsed,
        operationsUID: '',
        zonalManagerUID: '',
        salesManagerUID: '',
        salesOfficerUID: '',

      dateTime: DateTime.now(),
      orderStatus: OrderStatus.pending,
      orderStops: orderStop,
      orderPayment: OrderPayment(
        bankPaymentDetails: BankPaymentDetails(
          bankName: bankNameController.text,
          bankAmount: double.tryParse(bankAmountController.text) ?? 0.0,
          bankReceipt: '',
        ),
        bankPayment: 20.2,
        creditPayment: 2,
        rentAdjustment: 10,
      ),
      dispatchInfo: DispatchInfo(
        driverContact: '',
        vehicleNo: '',
        dispatchTime: DateTime.now(),
      ),
    );
     await ordersCollection.add(order.toJson()).then((value) {
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sent Data")));
     });



   }
}
