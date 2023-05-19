import 'package:flutter/material.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';
import 'package:maximagri/widgets/drawer/zonal_manager_drawer.dart';
import 'package:maximagri/widgets/perform_status_update.dart';
import 'package:maximagri/widgets/display_order_details.dart';

class ZonalManagerOrderDetailsDesktopPage extends StatefulWidget {
  final SingleOrder orderDetails;

  const ZonalManagerOrderDetailsDesktopPage(
      {Key? key, required this.orderDetails})
      : super(key: key);

  @override
  State<ZonalManagerOrderDetailsDesktopPage> createState() =>
      _ZonalManagerOrderDetailsDesktopPageState();
}

class _ZonalManagerOrderDetailsDesktopPageState
    extends State<ZonalManagerOrderDetailsDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZonalManagerOrderDetailsDesktopPage'),
      ),
      body: Row(
        children: [
          const ZonalManagerDrawer(),
          DisplayOrderDetails(orderDetails: widget.orderDetails),
          PerformStatusUpdate(orderDetails: widget.orderDetails),
        ],
      ),
    );
  }
}
