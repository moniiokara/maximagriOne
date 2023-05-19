import 'package:flutter/material.dart';
import 'package:maximagri/pages/operations/order_details/operations_order_details_desktop_page.dart';
import 'package:maximagri/pages/operations/order_details/operations_order_details_mobile_page.dart';
import 'package:maximagri/pages/operations/order_details/operations_order_details_tablet_page.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:maximagri/utilities/responsiveness.dart';
import 'package:maximagri/widgets/order_display_card.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';

import 'package:maximagri/pages/auth/splash_screen/progress_indicator_desktop_page.dart';
import 'package:maximagri/pages/auth/splash_screen/progress_indicator_mobile_page.dart';
import 'package:maximagri/pages/auth/splash_screen/progress_indicator_tablet_page.dart';
import 'package:maximagri/pages/zonal_manager/order_details/zonal_manager_order_details_desktop_page.dart';
import 'package:maximagri/pages/zonal_manager/order_details/zonal_manager_order_details_mobile_page.dart';
import 'package:maximagri/pages/zonal_manager/order_details/zonal_manager_order_details_tablet_page.dart';

class OperationsOrdersListDesktopPage extends StatefulWidget {
  const OperationsOrdersListDesktopPage({Key? key}) : super(key: key);

  @override
  State<OperationsOrdersListDesktopPage> createState() =>
      _OperationsOrdersListDesktopPageState();
}

class _OperationsOrdersListDesktopPageState
    extends State<OperationsOrdersListDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OperationsOrdersListDesktopPage'),
      ),
      body: Row(
        children: [
          const OperationsDrawer(),
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('ordersList')
                    .where('operationsUID',
                        isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.active) {
                    return const Responsiveness(
                      mobilePage: ProgressIndicatorMobilePage(),
                      tabletPage: ProgressIndicatorTabletPage(),
                      desktopPage: ProgressIndicatorDesktopPage(),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Responsiveness(
                      mobilePage: ProgressIndicatorMobilePage(),
                      tabletPage: ProgressIndicatorTabletPage(),
                      desktopPage: ProgressIndicatorDesktopPage(),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          final json = snapshot.data!.docs[index].data();
                          final orderInfo = SingleOrder.fromJson(json);
                          return OrderDisplayCard(
                            orderInfo: orderInfo,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Responsiveness(
                                  mobilePage: OperationsOrderDetailsMobilePage(
                                      orderDetails: orderInfo),
                                  tabletPage: OperationsOrderDetailsTabletPage(
                                      orderDetails: orderInfo),
                                  desktopPage:
                                      OperationsOrderDetailsDesktopPage(
                                          orderDetails: orderInfo),
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
