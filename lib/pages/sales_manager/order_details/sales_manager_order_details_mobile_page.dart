import 'package:flutter/material.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';
import 'package:maximagri/widgets/drawer/sales_manager_drawer.dart';
import 'package:maximagri/widgets/navigation/sales_manager_navigation.dart';
import 'package:maximagri/widgets/perform_status_update.dart';
import 'package:maximagri/widgets/display_order_details.dart';

class SalesManagerOrderDetailsMobilePage extends StatefulWidget {
  final SingleOrder orderDetails;

  const SalesManagerOrderDetailsMobilePage(
      {Key? key, required this.orderDetails})
      : super(key: key);

  @override
  State<SalesManagerOrderDetailsMobilePage> createState() =>
      _SalesManagerOrderDetailsMobilePageState();
}

class _SalesManagerOrderDetailsMobilePageState
    extends State<SalesManagerOrderDetailsMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SalesManagerOrderDetailsMobilePage'),
      ),
      drawer: const SalesManagerDrawer(),
      bottomNavigationBar: const SalesManagerNavigation(selectedIndex: 2),
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
