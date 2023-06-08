import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maximagri/place_order.dart';

class ProductWidget extends StatefulWidget {
  final int a;

  const ProductWidget({Key? key, required this.a}) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
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
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: singleOrderController.stops[0].products.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: singleOrderController
                            .stops[widget.a].products[index].productName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter product name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Product",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        onChanged: (value){
                          setState(() {});
                        },
                        controller: singleOrderController
                            .stops[widget.a].products[index].productPrice,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {

                          setState(() {});
                        },
                        controller: singleOrderController
                            .stops[widget.a].products[index]
                            .productQuantity,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter quantity";
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        enabled: false,
                        onChanged: (value) {
                          setState(() {

                          });
                        },
                        controller: singleOrderController
                            .stops[widget.a].products[index]
                            .productTotal(),
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.digitsOnly,
                        // ],
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //    crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text("Total Stop:"))),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextFormField(
                        enabled: false,
                        onChanged: (value) {

                          setState(() {});
                        },
                        textAlign: TextAlign.center,
                        controller: singleOrderController
                            .stops[widget.a]
                            .calculateStopTotal(),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          // hintText: "0",
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
                            child: Text("Stop Quantity:"))),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextFormField(
                        enabled: false,

                        onChanged: (value) {
                          setState(() {});
                        },
                        textAlign: TextAlign.center,
                        controller: singleOrderController
                            .stops[widget.a].products[index]
                            .productQuantity,
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
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      singleOrderController.stops[widget.a].products.add(
                        ProductController(
                          productName: TextEditingController(),
                          productPrice: TextEditingController(),
                          productQuantity: TextEditingController(),
                        ),
                      );
                    });
                  },
                  child: const Text("Add Product"),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed:
                  singleOrderController.stops[widget.a].products.length > 1
                      ? () {
                    setState(() {
                      singleOrderController.stops[widget.a].products
                          .removeLast();
                    });
                  }
                      : null,
                  child: const Text("Remove Product"),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}