import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maximagri/utilities/responsiveness.dart';
import 'package:maximagri/widgets/drawer/sales_officer_drawer.dart';
import 'package:maximagri/widgets/navigation/sales_officer_navigation.dart';
import 'package:maximagri/widgets/order_display_card.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';

import 'package:maximagri/pages/auth/splash_screen/progress_indicator_desktop_page.dart';
import 'package:maximagri/pages/auth/splash_screen/progress_indicator_mobile_page.dart';
import 'package:maximagri/pages/auth/splash_screen/progress_indicator_tablet_page.dart';

import 'package:maximagri/pages/sales_officer/order_details/sales_officer_order_details_desktop_page.dart';
import 'package:maximagri/pages/sales_officer/order_details/sales_officer_order_details_mobile_page.dart';
import 'package:maximagri/pages/sales_officer/order_details/sales_officer_order_details_tablet_page.dart';

class SalesOfficerOrdersListTabletPage extends StatefulWidget {
  const SalesOfficerOrdersListTabletPage({Key? key}) : super(key: key);

  @override
  State<SalesOfficerOrdersListTabletPage> createState() =>
      _SalesOfficerOrdersListTabletPageState();
}

class _SalesOfficerOrdersListTabletPageState
    extends State<SalesOfficerOrdersListTabletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SalesOfficerOrdersListTabletPage'),
      ),
      drawer: const SalesOfficerDrawer(),
      bottomNavigationBar: const SalesOfficerNavigation(selectedIndex: 2),
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('ordersList')
                .where('salesOfficerUID',
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
                              mobilePage: SalesOfficerOrderDetailsMobilePage(
                                  orderDetails: orderInfo),
                              tabletPage: SalesOfficerOrderDetailsTabletPage(
                                  orderDetails: orderInfo),
                              desktopPage: SalesOfficerOrderDetailsDesktopPage(
                                  orderDetails: orderInfo),
                            ),
                          ),
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}
