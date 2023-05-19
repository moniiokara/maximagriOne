import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/sales_officer_drawer.dart';
import 'package:maximagri/widgets/navigation/sales_officer_navigation.dart';

class SalesOfficerCreateDealerTabletPage extends StatefulWidget {
  const SalesOfficerCreateDealerTabletPage({Key? key}) : super(key: key);

  @override
  State<SalesOfficerCreateDealerTabletPage> createState() =>
      _SalesOfficerCreateDealerTabletPageState();
}

class _SalesOfficerCreateDealerTabletPageState
    extends State<SalesOfficerCreateDealerTabletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SalesOfficerCreateDealerTabletPage'),
      ),
      drawer: const SalesOfficerDrawer(),
      bottomNavigationBar: const SalesOfficerNavigation(selectedIndex: 3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Text('SalesOfficerCreateDealerTabletPage'),
            ],
          ),
        ),
      ),
    );
  }
}
