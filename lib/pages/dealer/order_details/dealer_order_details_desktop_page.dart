import 'package:flutter/material.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';
import 'package:maximagri/widgets/drawer/dealer_drawer.dart';
import 'package:maximagri/widgets/perform_status_update.dart';
import 'package:maximagri/widgets/display_order_details.dart';

class DealerOrderDetailsDesktopPage extends StatefulWidget {
  final SingleOrder orderDetails;

  const DealerOrderDetailsDesktopPage({Key? key, required this.orderDetails})
      : super(key: key);

  @override
  State<DealerOrderDetailsDesktopPage> createState() =>
      _DealerOrderDetailsDesktopPageState();
}

class _DealerOrderDetailsDesktopPageState
    extends State<DealerOrderDetailsDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DealerOrderDetailsDesktopPage'),
      ),
      body: Row(children: [
        const DealerDrawer(),
        DisplayOrderDetails(orderDetails: widget.orderDetails),
        PerformStatusUpdate(orderDetails: widget.orderDetails),
      ]),
    );
  }
}
