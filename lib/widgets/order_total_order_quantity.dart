

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maximagri/place_order.dart';

class OrderTotalOrderQuantity extends StatefulWidget {

  final int outerIndex;

  const OrderTotalOrderQuantity({Key? key, required this.outerIndex}) : super(key: key);

  @override
  State<OrderTotalOrderQuantity> createState() => _OrderTotalOrderQuantityState();
}

class _OrderTotalOrderQuantityState extends State<OrderTotalOrderQuantity> {

  SingleOrderController singleOrderController = SingleOrderController(
    stops: [
      StopController(
          stopNameController: TextEditingController(),
          stopContactController: TextEditingController(),
          products: [
            ProductController(
              productName: TextEditingController(),
              productPrice: TextEditingController(),
              productQuantity: TextEditingController(),
            )
          ])
    ],
  );

  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          //    crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text("Order Total:"))),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: TextFormField(
                onChanged: (value){
                  setState(() {

                  });
                },
                textAlign: TextAlign.center,
                controller: singleOrderController
                    .stops[widget.outerIndex]
                    .calculateStopTotal(),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  hintText: "0",
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          //    crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text("Order Quantity:"))),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: TextFormField(
                onChanged: (value){
                  setState(() {
                  });
                },
                textAlign: TextAlign.center,
                controller: singleOrderController
                    .stops[widget.outerIndex].calculateStopQuantity(),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  hintText: "0",
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
