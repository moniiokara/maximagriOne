import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/sales_officer_drawer.dart';
import 'package:maximagri/widgets/navigation/sales_officer_navigation.dart';

class SalesOfficerPlaceOrderMobilePage extends StatefulWidget {
  const SalesOfficerPlaceOrderMobilePage({Key? key}) : super(key: key);

  @override
  State<SalesOfficerPlaceOrderMobilePage> createState() =>
      _SalesOfficerPlaceOrderMobilePageState();
}

class _SalesOfficerPlaceOrderMobilePageState
    extends State<SalesOfficerPlaceOrderMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SalesOfficerPlaceOrderMobilePage'),
      ),
      drawer: const SalesOfficerDrawer(),
      bottomNavigationBar: const SalesOfficerNavigation(selectedIndex: 1),
      body: const Center(
        child: Text('SalesOfficerPlaceOrderMobilePage'),
      ),
    );
  }
}
