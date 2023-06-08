import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';
import 'package:maximagri/models/user_profile_model/user_profile_model.dart';
import 'package:maximagri/widgets/order_services.dart';

class DisplayOrderDetails extends StatefulWidget {
  final SingleOrder orderDetails;

  const DisplayOrderDetails({Key? key, required this.orderDetails})
      : super(key: key);

  @override
  State<DisplayOrderDetails> createState() => _DisplayOrderDetailsState();
}

class _DisplayOrderDetailsState extends State<DisplayOrderDetails> {

 // OrderServices orderServices = OrderServices();

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      AssetImage('lib/assets/images/maxim_logo.png'),
                  backgroundColor: Colors.white12,
                ),
                Text(
                  "Invoice",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Text(
                  "Bill Form",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Maxim Agri (PVT) LTD"),
                Text(
                  widget.orderDetails.dateTime.toIso8601String(),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "7B Aziz Gulberg",
                ),
                Container(
                  height: 30,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: const Center(
                    child: Text(
                      "Order Status",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bill To",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  "Dispatch Info",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.orderDetails.dealerName),
                Text(
                  widget.orderDetails.dispatchInfo.driverContact,
                ),
              ],
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            // StreamBuilder(
            //  stream: FirebaseFirestore.instance.collection("userProfile")
            //     .where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
            //     .snapshots(),
            //     builder: (context, snapshot) {
            //       final filteredDocs = snapshot.data!.docs
            //           .where((doc) => doc.get('userType') == 'dealer')
            //           .toList();
            //       if(snapshot.connectionState == ConnectionState.active){
            //         return SingleChildScrollView(
            //
            //           child: ListView.builder(
            //               shrinkWrap: true,
            //               itemCount: filteredDocs.length,
            //               itemBuilder: (context, index) {
            //                 final json = filteredDocs[index].data();
            //                 final userProfile = UserProfile.fromJson(json);
            //                 final String address =
            //                     '${userProfile.userAddress.province}, ${userProfile.userAddress.district}, '
            //                     '${userProfile.userAddress.tehsil}';
            //                 return Column(
            //                   mainAxisAlignment: MainAxisAlignment.start,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Row(
            //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                       children: [
            //                         Text(address),
            //                         Text(
            //                           widget.orderDetails.dispatchInfo.vehicleNo,
            //                         ),
            //                       ],
            //                     ),
            //                     Row(
            //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                       children: [
            //                         Text(userProfile.userMobile),
            //                         Text(
            //                           widget.orderDetails.dispatchInfo.dispatchTime.toString(),
            //                         ),
            //                       ],
            //                     ),
            //                   // Text(userProfile.userMobile)
            //                   ],
            //                 );
            //               }),
            //         );
            //       } else {
            //         return const CircularProgressIndicator();
            //       }
            //     }
            // ),

            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: widget.orderDetails.orderStops.length,
              separatorBuilder: (_, __) => Container(),
              itemBuilder: (context, int index) {
                final orderStop = widget.orderDetails.orderStops[index];
                final stopTotal = widget.orderDetails.orderStops[index];

                return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        orderStop.stopName,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(stopTotal.stopName),
                          const SizedBox(
                            width: 80,
                          ),
                          Text(stopTotal.stopContact),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Product Name",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                "Price",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                "Qty",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                "Total",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(orderStop.itemList[index].productName),
                          Text(orderStop.itemList[index].productPrice
                              .toString()),
                          Text(orderStop.itemList[index].productQuantity
                              .toString()),
                          Text(orderStop.itemList[index].productTotal
                              .toString()),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.black,
                        indent: 110,
                        endIndent: 5,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          children: [
                            Text('Stop Quantity: ${stopTotal.stopQuantity}'),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Total Stop: ${stopTotal.stopTotal}'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          dashColor: Colors.black26,
                          dashRadius: 0.0,
                          dashLength: 7,
                          lineThickness: 3,
                          dashGapLength: 3.0,
                          dashGapColor: Colors.transparent,
                          dashGapRadius: 0.0,
                        ),
                      ),
                    ]);
              },
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                    'Order Total: ${widget.orderDetails.orderTotal.toString()}'),
                const SizedBox(height: 10),
                Text(
                    'Order Quantity: ${widget.orderDetails.orderQuantity.toString()}'),
                const SizedBox(height: 20),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40,
                          width: 150,
                          decoration:  BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Center(child: Text("Rejected",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Georgia',
                            ),)),
                        ),
                        Container(
                          height: 40,
                          width: 150,
                          decoration:  BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Center(child: Text("Accepted",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Georgia',
                            ),)),
                        ),
                      ],
                    ),


              ],
            ),

          ],
        ),
      ),
    );
  }
}
