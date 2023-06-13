import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maximagri/models/controller_classes/controller_class.dart';

class ProductWidget extends StatefulWidget {
  final SingleOrderController singleOrderController;
  final Function() onUpdate;
  final int a;

  ProductWidget({
    Key? key,
    required this.a,
    required this.singleOrderController,
    required this.onUpdate,
  }) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late Future<List<Map<String, dynamic>>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = fetchProducts();
  }

  Future<List<Map<String, dynamic>>> fetchProducts() async {
    final querySnapshot = await _firestore.collection('productsList').get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount:
              widget.singleOrderController.stops[widget.a].products.length + 1,
          itemBuilder: (context, index) {
            if (index <
                widget.singleOrderController.stops[widget.a].products.length) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: FutureBuilder<List<Map<String, dynamic>>>(
                          future: _productsFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              final products = snapshot.data!;
                              final selectedProduct = widget.singleOrderController.stops[widget.a].products[index].productName.text;
                              return DropdownButtonFormField<String>(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'select a product';
                                  }
                                },
                                itemHeight: 50,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                isExpanded: true,
                                value: selectedProduct.isNotEmpty ? selectedProduct : null,
                                hint: const Text("Select a product"),
                                items: products.map((product) {
                                  final itemName = product['itemName'] as String;
                                  return DropdownMenuItem<String>(
                                    value: itemName,
                                    child: Text(itemName),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    widget.singleOrderController.stops[widget.a].products[index].productName.text = newValue ?? '';
                                    final selectedProductData = products.firstWhere(
                                          (product) => product['itemName'] == newValue,
                                      orElse: () => {},
                                    );
                                    final selectedProductPrice = selectedProductData != null ? selectedProductData['itemPrice'].toString() : '';
                                    widget.singleOrderController.stops[widget.a].products[index].productPrice.text = selectedProductPrice;
                                  });
                                },
                              );
                            }
                          },
                        ),
                      ),

                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter price';
                            }
                          },
                          onChanged: (value) {
                            setState(() {});
                          },
                          controller: widget.singleOrderController
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
                            widget.onUpdate();
                          },
                          controller: widget.singleOrderController
                              .stops[widget.a].products[index].productQuantity,
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
                            setState(() {});
                          },
                          controller: widget.singleOrderController
                              .stops[widget.a].products[index]
                              .productTotal(),
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
                  if (widget.singleOrderController.stops[widget.a].products
                          .length ==
                      index + 1) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          onPressed: widget.singleOrderController
                                      .stops[widget.a].products.length >
                                  1
                              ? () {
                                  setState(() {
                                    widget.singleOrderController.stops[widget.a]
                                        .products
                                        .removeLast();
                                  });
                                }
                              : null,
                          child: const Text("Remove Product"),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.singleOrderController.stops[widget.a]
                                  .products
                                  .add(
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
                      ],
                    ),
                  ],
                  //  const SizedBox(height: 20),
                ],
              );
            } else {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("Order Total:"),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {});
                              },
                              textAlign: TextAlign.center,
                              controller: widget.singleOrderController
                                  .calculateOrderTotals(),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
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
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("Order Quantity:"),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: TextFormField(
                              onChanged: (value) {
                                widget.onUpdate();
                                setState(() {});
                              },
                              textAlign: TextAlign.center,
                              controller: widget.singleOrderController
                                  .calculateOrderQuantitys(),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
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
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
