import 'package:flutter/material.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';
import 'package:maximagri/widgets/display_order_details.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';
import 'package:maximagri/widgets/navigation/operations_navigation.dart';
import 'package:maximagri/widgets/perform_status_update.dart';

class OperationsOrderDetailsMobilePage extends StatefulWidget {
  final SingleOrder orderDetails;

  const OperationsOrderDetailsMobilePage({Key? key, required this.orderDetails})
      : super(key: key);

  @override
  State<OperationsOrderDetailsMobilePage> createState() =>
      _OperationsOrderDetailsMobilePageState();
}

class _OperationsOrderDetailsMobilePageState
    extends State<OperationsOrderDetailsMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OperationsOrderDetailsMobilePage'),
      ),
      drawer: const OperationsDrawer(),
      bottomNavigationBar: const OperationsNavigation(selectedIndex: 2),
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
