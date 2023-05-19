import 'package:flutter/material.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';

class DisplayOrderDetails extends StatelessWidget {
  final SingleOrder orderDetails;
  const DisplayOrderDetails({Key? key, required this.orderDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Order No:',
                  style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              Text(orderDetails.orderSerial),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Dealer Name:',
                  style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              Text(orderDetails.dealerName),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('DateTime:',
                  style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              Text(orderDetails.dateTime.toIso8601String()),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total Price:',
                  style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              Text('${orderDetails.orderTotal}'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total Quantity:',
                  style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              Text(orderDetails.orderQuantity.toString()),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Status:',
                  style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              Text(orderDetails.orderStatus.name),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Bank Name:',
                  style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              Text(orderDetails.orderPayment.bankPaymentDetails.bankName),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Stops:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              ...orderDetails.orderStops.map((stop) => Text(stop.stopName)).toList(),
            ],
          ),
          const SizedBox(height: 30),

          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Accepted'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  primary: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text(
                  'Reject',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
         const SizedBox(height: 20),
        ],
      ),
    );
  }
}
