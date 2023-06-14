import 'package:flutter/material.dart';

class SingleOrderController {
  List<StopController> stops;
  TextEditingController bankAmountController;
  TextEditingController creditAmountController;
  TextEditingController rentAmountController;
  TextEditingController bankNameController;
  TextEditingController bankReciptController;
  TextEditingController ibanNoController;


  SingleOrderController({
    required this.ibanNoController,
    required this.stops,
    required this.bankAmountController,
    required this.creditAmountController,
    required this.rentAmountController,
    required this.bankNameController,
    required this.bankReciptController,
  });

  TextEditingController calculateOrderTotals() {
    TextEditingController orderTotalController = TextEditingController();
    orderTotalController.text = "0";
    double total = 0.0;
    for (StopController stop in stops) {
      if (stop.calculateStopQuantity().text != '') {
        total += double.parse(stop.calculateStopTotal().text);
      }
    }
    orderTotalController.text = total.toString();
    return orderTotalController;
  }

  TextEditingController calculateOrderQuantitys() {
    TextEditingController orderQuantityController = TextEditingController();
    orderQuantityController.text = "0";
    int totalQuantity = 0;
    for (StopController stop in stops) {
      if (stop.calculateStopQuantity().text != '') {
        totalQuantity += int.parse(stop.calculateStopQuantity().text);
      }
    }
    orderQuantityController.text = totalQuantity.toString();
    return orderQuantityController;
  }
}

class StopController {
  TextEditingController stopNameController;
  TextEditingController stopContactController;

  List<ProductController> products;

  StopController(
      {required this.stopNameController,
        required this.stopContactController,
        required this.products});

  TextEditingController calculateStopTotal() {
    TextEditingController stopTotalController = TextEditingController();

    double total = 0.0;
    for (ProductController product in products) {
      if (product.productTotal().text != '') {
        total += double.parse(product.productTotal().text);
      }
    }
    stopTotalController.text = total.toString();

    return stopTotalController;
  }

  TextEditingController calculateStopQuantity() {
    TextEditingController stopQuantityController = TextEditingController();
    double totalQuantity = 0;
    for (ProductController product in products) {
      if (product.productQuantity.text != '') {
        totalQuantity += double.parse(product.productQuantity.text);
      }
    }
    stopQuantityController.text = totalQuantity.toString();
    return stopQuantityController;
  }
}

class ProductController {
  TextEditingController productName;
  TextEditingController productPrice;
  TextEditingController productQuantity;
  ProductController({
    required this.productName,
    required this.productPrice,
    required this.productQuantity
  });

  TextEditingController productTotal() {
    TextEditingController productTotalController = TextEditingController();
    productTotalController.text = '0';
    if (        productPrice.text.isNotEmpty &&
        productQuantity.text.isNotEmpty) {
      double price = double.parse(productPrice.text);
      int quantity = int.parse(productQuantity.text);
      double total = price * quantity;

      productTotalController.text = total.toString();
    }

    return productTotalController;
  }
}

class PlaceOrderController {
  TextEditingController stopController;
  TextEditingController contactController;
  TextEditingController stopTotalController;
  TextEditingController stopQuantityController;
  List<ProductController> products;
  List<StopController> stops;

  PlaceOrderController({
    required this.stopController,
    required this.contactController,
    required this.stopTotalController,
    required this.stopQuantityController,
    required this.products,
    required this.stops,
  });
}