import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maximagri/models/controller_classes/controller_class.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';
import 'package:maximagri/models/user_profile_model/user_profile_model.dart';
import 'package:maximagri/widgets/drawer/dealer_drawer.dart';
import 'package:maximagri/widgets/navigation/dealer_navigation.dart';
import 'package:maximagri/widgets/navigation/product_widget.dart';
import 'package:maximagri/widgets/product_header_widget.dart';

class Bank {
  String bankName;
  String iban;
  Bank({required this.bankName, required this.iban});
}

class DealerPlaceOrderMobilePage extends StatefulWidget {
  const DealerPlaceOrderMobilePage({Key? key}) : super(key: key);

  @override
  State<DealerPlaceOrderMobilePage> createState() =>
      _DealerPlaceOrderMobilePageState();
}

class _DealerPlaceOrderMobilePageState
    extends State<DealerPlaceOrderMobilePage> {
  SingleOrderController singleOrderController = SingleOrderController(
    ibanNoController: TextEditingController(),
    bankReciptController: TextEditingController(),
    bankNameController: TextEditingController(),
    bankAmountController: TextEditingController(),
    creditAmountController: TextEditingController(),
    rentAmountController: TextEditingController(),
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
  void dispose() {
    singleOrderController.bankReciptController.dispose();
    singleOrderController.bankNameController.dispose();
    singleOrderController.rentAmountController.dispose();
    singleOrderController.stops.forEach((element) {
      element.stopContactController.dispose();
      element.stopNameController.dispose();
      element.products.forEach((element) {
        element.productQuantity.dispose();
        element.productPrice.dispose();
        element.productName.dispose();
        element.productTotal().dispose();
      });
    });
    super.dispose();
    singleOrderController.bankReciptController.clear();
    singleOrderController.bankNameController.clear();
    singleOrderController.rentAmountController.clear();
    singleOrderController.stops.forEach((element) {
      element.stopContactController.clear();
      element.stopNameController.clear();
      element.products.forEach((element) {
        element.productQuantity.clear();
        element.productPrice.clear();
        element.productName.clear();
        element.productTotal().clear();
      });
    });
  }

  String bankReceipt = '';

  void paymentAdjust() {
    double totalPayments =
        double.parse(singleOrderController.bankAmountController.text) +
            double.parse(singleOrderController.creditAmountController.text) +
            double.parse(singleOrderController.rentAmountController.text);
    double orderTotal =
        double.parse(singleOrderController.calculateOrderTotals().text);
    if (totalPayments > orderTotal) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Total payments cannot exceed the order total")));
    }
  }

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      Uint8List? selectedFileBytes = result.files.single.bytes;
      final String dateTimeNow = DateTime.now().toString();
      String name = result.files.single.name;
      await FirebaseStorage.instance
          .ref()
          .child('receipts/$dateTimeNow$name')
          .putData(selectedFileBytes!);

      bankReceipt = dateTimeNow + name;
      singleOrderController.bankReciptController.text = bankReceipt;
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Image upload successful')));
    }
  }

  final _formKey = GlobalKey<FormState>();

  int address = 1;
  // int product = 1;

  orderTotalUpdate() {
    setState(() {});
  }

  final firebaseref = FirebaseFirestore.instance;

  placeOrder() async {
    if (_formKey.currentState!.validate()) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userUid = user.uid;
        final userProfile = await FirebaseFirestore.instance
            .collection("userProfile")
            .where('userUID', isEqualTo: userUid)
            .get();
        if (userProfile.docs.isNotEmpty) {
          final profile = UserProfile.fromJson(userProfile.docs.first.data());

          SingleOrder singleOrder = SingleOrder.fromControllers(
            singleOrderController: singleOrderController,
            userProfile: profile,
          );
          try {
            await FirebaseFirestore.instance
                .collection('ordersFirst')
                .doc()
                .set(singleOrder.toJson());

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Order placed successfully")),
            );
          } catch (e) {
            print("Error placing order: $e");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Error placing order")),
            );
          }
        } else {
          print("User profile not found");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User profile not found")),
          );
        }
      } else {
        print("User is not authenticated");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User is not authenticated")),
        );
      }
    }
  }

  // Bank Account Name List
  Bank? selectedBank;

  final ibanController = TextEditingController();

  List<Bank> bank = [
    Bank(bankName: 'Habib Bank Limited', iban: 'PK24 HABB 0012 4279 4794 5203'),
    Bank(
        bankName: 'United Bank Limited', iban: 'PK33 UNIL 0109 0002 0151 4494'),
    Bank(bankName: 'MCB Bank Limited', iban: 'PK24 MUCB 0484 8209 4100 0264'),
    Bank(
        bankName: 'Bank Alfalah Limited',
        iban: 'PK05 ALFH 0047 0010 0541 2385'),
    Bank(
        bankName: 'Bank Alfalah Limited',
        iban: 'PK59 ALFH 0364 0010 0512 4545'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DealerPlaceOrderMobilePage'),
      ),
      drawer: const DealerDrawer(),
      bottomNavigationBar: const DealerNavigation(selectedIndex: 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "PLACE ORDER",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: singleOrderController.stops.length,
                    itemBuilder: (context, outerIndex) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Stop: ${outerIndex + 1}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 22),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter stop name";
                                    }
                                    return null;
                                  },
                                  controller: singleOrderController
                                      .stops[outerIndex].stopNameController,
                                  decoration: InputDecoration(
                                    hintText: "Enter Stop",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter contact number";
                                    }
                                    return null;
                                  },
                                  controller: singleOrderController
                                      .stops[outerIndex].stopContactController,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: InputDecoration(
                                    hintText: "Enter Contact",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          const ProductHeaderWidget(),
                          const SizedBox(height: 20.0),
                          ProductWidget(
                            onUpdate: orderTotalUpdate,
                            a: outerIndex,
                            singleOrderController: singleOrderController,
                          ),
                          const SizedBox(height: 20.0),
                          Column(
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
                                          child: Text("Stop Total:"))),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                      textAlign: TextAlign.center,
                                      controller: singleOrderController
                                          .stops[outerIndex]
                                          .calculateStopTotal(),
                                      enabled: false,
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
                                          child: Text("Stop Quantity:"))),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      onChanged: (value) {
                                        setState(() {
                                          singleOrderController
                                              .stops[outerIndex]
                                              .calculateStopQuantity();
                                        });
                                      },
                                      textAlign: TextAlign.center,
                                      controller: singleOrderController
                                          .stops[outerIndex]
                                          .calculateStopQuantity(),
                                      enabled: false,
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
                              if (outerIndex ==
                                  singleOrderController.stops.length - 1)
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                      onPressed: address < 4
                                          ? () {
                                              if (singleOrderController
                                                  .stops.isNotEmpty) {
                                                setState(() {
                                                  singleOrderController.stops
                                                      .add(StopController(
                                                    stopNameController:
                                                        TextEditingController(),
                                                    stopContactController:
                                                        TextEditingController(),
                                                    products: [
                                                      ProductController(
                                                        productName:
                                                            TextEditingController(),
                                                        productPrice:
                                                            TextEditingController(),
                                                        productQuantity:
                                                            TextEditingController(),
                                                      ),
                                                    ],
                                                  ));
                                                  address++;
                                                });
                                              }
                                            }
                                          : null,
                                      child: const Text("Add More Stop"),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    if (address > 1)
                                      OutlinedButton(
                                        onPressed: () {
                                          setState(() {
                                            singleOrderController.stops
                                                .removeLast();
                                            address--;
                                          });
                                        },
                                        child: const Text("Remove Last Stop"),
                                      ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Divider(
                                color: Colors.black,
                                height: 10,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              if (outerIndex ==
                                  singleOrderController.stops.length - 1)
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "Payment Process",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 22),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    DropdownButtonFormField(
                                        validator: (value) {
                                          if (value == null) {
                                            return "Please select payment method";
                                          }
                                        },
                                        value: selectedBank,
                                        decoration: const InputDecoration(
                                            hintText: 'Select Payment Method',
                                            border: OutlineInputBorder()),
                                        items: bank.map((Bank bank) {
                                          return DropdownMenuItem<Bank>(
                                            value: bank,
                                            child: Text(bank.bankName),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedBank = value;
                                          });
                                          singleOrderController.ibanNoController
                                              .text = selectedBank?.iban ?? '';
                                          singleOrderController
                                                  .bankNameController.text =
                                              selectedBank?.bankName ?? '';
                                        }),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: singleOrderController
                                          .ibanNoController,
                                      enabled: false,
                                      decoration: const InputDecoration(
                                          hintText: 'IBAN No',
                                          border: OutlineInputBorder()),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: singleOrderController
                                          .bankAmountController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'enter bank amount';
                                        }
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      decoration: const InputDecoration(
                                          hintText: 'Enter Bank Amount',
                                          border: OutlineInputBorder()),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Select image';
                                        }
                                      },
                                      controller: singleOrderController
                                          .bankReciptController,
                                      readOnly: true,
                                    ),
                                    OutlinedButton(
                                        onPressed: () {
                                          _pickImage();
                                        },
                                        child: const Text("Add Slip")),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: singleOrderController
                                          .creditAmountController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'enter credit amount';
                                        }
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      decoration: const InputDecoration(
                                          hintText: 'Enter Credit Amount',
                                          border: OutlineInputBorder()),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: singleOrderController
                                          .rentAmountController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'enter rent amount';
                                        }
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      decoration: const InputDecoration(
                                          hintText: 'Enter Rent Amount',
                                          border: OutlineInputBorder()),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          if (outerIndex ==
                              singleOrderController.stops.length - 1)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        placeOrder();
                                      }
                                    },
                                    child: const Text("Place Order")),
                              ],
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
