import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/sales_officer_drawer.dart';

class SalesOfficerPlaceOrderDesktopPage extends StatefulWidget {
  const SalesOfficerPlaceOrderDesktopPage({Key? key}) : super(key: key);

  @override
  State<SalesOfficerPlaceOrderDesktopPage> createState() =>
      _SalesOfficerPlaceOrderDesktopPageState();
}

class _SalesOfficerPlaceOrderDesktopPageState
    extends State<SalesOfficerPlaceOrderDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SalesOfficerPlaceOrderDesktopPage'),
      ),
      body: Row(
        children: const [
          SalesOfficerDrawer(),
          Text('SalesOfficerPlaceOrderDesktopPage'),
        ],
      ),
    );
  }
}
