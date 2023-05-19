import 'package:flutter/material.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';
import 'package:maximagri/widgets/display_order_details.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';
import 'package:maximagri/widgets/perform_status_update.dart';

class OperationsOrderDetailsDesktopPage extends StatefulWidget {
  final SingleOrder orderDetails;

  const OperationsOrderDetailsDesktopPage(
      {Key? key, required this.orderDetails})
      : super(key: key);

  @override
  State<OperationsOrderDetailsDesktopPage> createState() =>
      _OperationsOrderDetailsDesktopPageState();
}

class _OperationsOrderDetailsDesktopPageState
    extends State<OperationsOrderDetailsDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OperationsOrderDetailsDesktopPage'),
      ),
      body: Row(
        children: [
          const OperationsDrawer(),
          DisplayOrderDetails(orderDetails: widget.orderDetails),
          PerformStatusUpdate(orderDetails: widget.orderDetails),
        ],
      ),
    );
  }
}
