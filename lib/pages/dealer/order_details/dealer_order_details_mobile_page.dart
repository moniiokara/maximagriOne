import 'package:flutter/material.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';
import 'package:maximagri/widgets/drawer/dealer_drawer.dart';
import 'package:maximagri/widgets/perform_status_update.dart';
import 'package:maximagri/widgets/display_order_details.dart';

class DealerOrderDetailsMobilePage extends StatefulWidget {
  final SingleOrder orderDetails;
  const DealerOrderDetailsMobilePage({
    Key? key,
    required this.orderDetails,
  }) : super(key: key);

  @override
  State<DealerOrderDetailsMobilePage> createState() =>
      _DealerOrderDetailsMobilePageState();
}

class _DealerOrderDetailsMobilePageState
    extends State<DealerOrderDetailsMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DealerOrderDetailsMobilePage'),
      ),
      drawer: const DealerDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            DisplayOrderDetails(orderDetails: widget.orderDetails),
            PerformStatusUpdate(orderDetails: widget.orderDetails),
          ],
        ),
      ),
    );
  }
}
