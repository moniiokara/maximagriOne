import 'package:flutter/material.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';
import 'package:maximagri/widgets/drawer/zonal_manager_drawer.dart';
import 'package:maximagri/widgets/navigation/zonal_manager_navigation.dart';
import 'package:maximagri/widgets/perform_status_update.dart';
import 'package:maximagri/widgets/display_order_details.dart';

class ZonalManagerOrderDetailsTabletPage extends StatefulWidget {
  final SingleOrder orderDetails;
  const ZonalManagerOrderDetailsTabletPage(
      {Key? key, required this.orderDetails})
      : super(key: key);

  @override
  State<ZonalManagerOrderDetailsTabletPage> createState() =>
      _ZonalManagerOrderDetailsTabletPageState();
}

class _ZonalManagerOrderDetailsTabletPageState
    extends State<ZonalManagerOrderDetailsTabletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZonalManagerOrderDetailsTabletPage'),
      ),
      drawer: const ZonalManagerDrawer(),
      bottomNavigationBar: const ZonalManagerNavigation(selectedIndex: 2),
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
