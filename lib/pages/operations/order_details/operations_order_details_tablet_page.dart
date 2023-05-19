import 'package:flutter/material.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';
import 'package:maximagri/widgets/display_order_details.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';
import 'package:maximagri/widgets/navigation/operations_navigation.dart';
import 'package:maximagri/widgets/perform_status_update.dart';

class OperationsOrderDetailsTabletPage extends StatefulWidget {
  final SingleOrder orderDetails;

  const OperationsOrderDetailsTabletPage({Key? key, required this.orderDetails})
      : super(key: key);

  @override
  State<OperationsOrderDetailsTabletPage> createState() =>
      _OperationsOrderDetailsTabletPageState();
}

class _OperationsOrderDetailsTabletPageState
    extends State<OperationsOrderDetailsTabletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OperationsOrderDetailsTabletPage'),
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
