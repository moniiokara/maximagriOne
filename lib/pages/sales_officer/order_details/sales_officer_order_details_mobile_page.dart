import 'package:flutter/material.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';
import 'package:maximagri/widgets/drawer/sales_officer_drawer.dart';
import 'package:maximagri/widgets/navigation/sales_officer_navigation.dart';
import 'package:maximagri/widgets/perform_status_update.dart';
import 'package:maximagri/widgets/display_order_details.dart';

class SalesOfficerOrderDetailsMobilePage extends StatefulWidget {
  final SingleOrder orderDetails;

  const SalesOfficerOrderDetailsMobilePage(
      {Key? key, required this.orderDetails})
      : super(key: key);

  @override
  State<SalesOfficerOrderDetailsMobilePage> createState() =>
      _SalesOfficerOrderDetailsMobilePageState();
}

class _SalesOfficerOrderDetailsMobilePageState
    extends State<SalesOfficerOrderDetailsMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SalesOfficerOrderDetailsMobilePage'),
      ),
      drawer: const SalesOfficerDrawer(),
      bottomNavigationBar: const SalesOfficerNavigation(selectedIndex: 2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DisplayOrderDetails(orderDetails: widget.orderDetails),
              PerformStatusUpdate(orderDetails: widget.orderDetails),
            ],
          ),
        ),
      ),
    );
  }
}
