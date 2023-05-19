import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/sales_officer_drawer.dart';
import 'package:maximagri/widgets/navigation/sales_officer_navigation.dart';

class SalesOfficerCreateDealerMobilePage extends StatefulWidget {
  const SalesOfficerCreateDealerMobilePage({Key? key}) : super(key: key);

  @override
  State<SalesOfficerCreateDealerMobilePage> createState() =>
      _SalesOfficerCreateDealerMobilePageState();
}

class _SalesOfficerCreateDealerMobilePageState
    extends State<SalesOfficerCreateDealerMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SalesOfficerCreateDealerMobilePage'),
      ),
      drawer: const SalesOfficerDrawer(),
      bottomNavigationBar: const SalesOfficerNavigation(selectedIndex: 3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Text('SalesOfficerCreateDealerMobilePage'),
            ],
          ),
        ),
      ),
    );
  }
}
