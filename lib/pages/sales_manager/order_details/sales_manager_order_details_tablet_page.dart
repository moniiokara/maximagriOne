import 'package:flutter/material.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';
import 'package:maximagri/widgets/drawer/sales_manager_drawer.dart';
import 'package:maximagri/widgets/navigation/sales_manager_navigation.dart';
import 'package:maximagri/widgets/perform_status_update.dart';
import 'package:maximagri/widgets/display_order_details.dart';

class SalesManagerOrderDetailsTabletPage extends StatefulWidget {
  final SingleOrder orderDetails;

  const SalesManagerOrderDetailsTabletPage(
      {Key? key, required this.orderDetails})
      : super(key: key);

  @override
  State<SalesManagerOrderDetailsTabletPage> createState() =>
      _SalesManagerOrderDetailsTabletPageState();
}

class _SalesManagerOrderDetailsTabletPageState
    extends State<SalesManagerOrderDetailsTabletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SalesManagerOrderDetailsTabletPage'),
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
