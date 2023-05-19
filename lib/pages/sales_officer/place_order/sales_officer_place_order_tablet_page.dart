import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/sales_officer_drawer.dart';
import 'package:maximagri/widgets/navigation/sales_officer_navigation.dart';

class SalesOfficerPlaceOrderTabletPage extends StatefulWidget {
  const SalesOfficerPlaceOrderTabletPage({Key? key}) : super(key: key);

  @override
  State<SalesOfficerPlaceOrderTabletPage> createState() =>
      _SalesOfficerPlaceOrderTabletPageState();
}

class _SalesOfficerPlaceOrderTabletPageState
    extends State<SalesOfficerPlaceOrderTabletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SalesOfficerPlaceOrderTabletPage'),
      ),
      drawer: const SalesOfficerDrawer(),
      bottomNavigationBar: const SalesOfficerNavigation(selectedIndex: 1),
      body: const Center(
        child: Text('SalesOfficerPlaceOrderTabletPage'),
      ),
    );
  }
}
