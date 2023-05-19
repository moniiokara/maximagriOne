import 'package:flutter/material.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';
import 'package:maximagri/widgets/drawer/zonal_manager_drawer.dart';
import 'package:maximagri/widgets/navigation/zonal_manager_navigation.dart';
import 'package:maximagri/widgets/perform_status_update.dart';
import 'package:maximagri/widgets/display_order_details.dart';

class ZonalManagerOrderDetailsMobilePage extends StatefulWidget {
  final SingleOrder orderDetails;

  const ZonalManagerOrderDetailsMobilePage(
      {Key? key, required this.orderDetails})
      : super(key: key);

  @override
  State<ZonalManagerOrderDetailsMobilePage> createState() =>
      _ZonalManagerOrderDetailsMobilePageState();
}

class _ZonalManagerOrderDetailsMobilePageState
    extends State<ZonalManagerOrderDetailsMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZonalManagerOrderDetailsMobilePage'),
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
