import 'package:flutter/material.dart';
import 'package:maximagri/models/products_model/product_profile_model.dart';
import 'package:maximagri/widgets/order_services.dart';

class OrderTest extends StatefulWidget {
  const OrderTest({Key? key}) : super(key: key);

  @override
  State<OrderTest> createState() => _OrderTestState();
}

class _OrderTestState extends State<OrderTest> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var i = 0; i < OrderServices.formRows.length; i++) {
      if (OrderServices.formRows[i].selectedProduct != null) {
        total += OrderServices.formRows[i].productQuantity;
        setState(() {
          OrderServices.totalOrderPrice = total;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Single Order"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: OrderServices.formRows.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        TextFormField(
                          controller:
                          OrderServices.formRows[index].stopController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: ' Enter Stop ${index + 1}',
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a valid stop name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a valid shop name';
                            }
                            return null;
                          },
                          controller:
                          OrderServices.formRows[index].shopController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Enter Shop ${index + 1}',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DropdownButtonFormField<ProductProfile>(
                          validator: (value) {
                            return value == null ? 'Select a product' : null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Select a product',
                          ),
                          value: OrderServices.formRows[index].selectedProduct,
                          onChanged: (value) {
                            setState(() {
                              OrderServices.formRows[index].updateProduct(
                                  value!,
                                  value.productPrice.toDouble() *
                                      value.productMOQ.toInt());
                            });
                          },
                          items: OrderServices.products
                              .map((e) => DropdownMenuItem(
                              value: e, child: Text(e.productName)))
                              .toList(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText:
                            'Price: ${OrderServices.formRows[index].selectedProduct?.productPrice ?? ""}',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller:
                          OrderServices.formRows[index].moqController,
                          validator: (value) {
                            int? moq = int.tryParse(value ?? "");
                            if (moq == null || moq < 5 || moq > 50) {
                              return 'Enter a valid MOQ between 5 and 50';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            int? moq = int.tryParse(value);
                            if (moq != null) {
                              setState(() {
                                OrderServices.totalMoqUsed =
                                    OrderServices.totalMoqUsed -
                                        OrderServices.formRows[index].moqUsed +
                                        moq; // Update the total MOQ used
                                OrderServices.formRows[index].moqUsed =
                                    moq; // Update the moqUsed value for this row
                                OrderServices.formRows[index].updateProduct(
                                  OrderServices
                                      .formRows[index].selectedProduct!,
                                  OrderServices.formRows[index].selectedProduct!
                                      .productPrice
                                      .toDouble() *
                                      moq,
                                );
                              });
                            }
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText:
                            'Enter MOQ: ${OrderServices.formRows[index].stopIndex}',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText:
                            'Total Price: ${OrderServices.formRows[index].productQuantity}',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (index < OrderServices.formRows.length - 1)
                          Center(
                            child: Text(
                              "Add New Stop ${OrderServices.formRows[index].stopIndex}",
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 22),
                            ),
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  },
                ),
              ),
              TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText:
                  'Total Order Price: ${OrderServices.totalOrderPrice}',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          OrderServices.addFormRow(context, this);
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Text(
                              "Add More Stop",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 1),
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          OrderServices.placeOrder(context);
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        // width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Payment Processed",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
