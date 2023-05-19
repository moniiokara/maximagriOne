import 'package:flutter/material.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';
import 'package:maximagri/widgets/drawer/sales_manager_drawer.dart';
import 'package:maximagri/widgets/perform_status_update.dart';
import 'package:maximagri/widgets/display_order_details.dart';

class SalesManagerOrderDetailsDesktopPage extends StatefulWidget {
  final SingleOrder orderDetails;

  const SalesManagerOrderDetailsDesktopPage(
      {Key? key, required this.orderDetails})
      : super(key: key);

  @override
  State<SalesManagerOrderDetailsDesktopPage> createState() =>
      _SalesManagerOrderDetailsDesktopPageState();
}

class _SalesManagerOrderDetailsDesktopPageState
    extends State<SalesManagerOrderDetailsDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SalesManagerOrderDetailsDesktopPage'),
      ),
      body: Row(
        children: [
          const SalesManagerDrawer(),
          DisplayOrderDetails(orderDetails: widget.orderDetails),
          PerformStatusUpdate(orderDetails: widget.orderDetails),
        ],
      ),
    );
  }
}
