import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/zonal_manager_drawer.dart';
import 'package:maximagri/widgets/navigation/zonal_manager_navigation.dart';

class ZonalManagerCreditCenterMobilePage extends StatefulWidget {
  const ZonalManagerCreditCenterMobilePage({Key? key}) : super(key: key);

  @override
  State<ZonalManagerCreditCenterMobilePage> createState() =>
      _ZonalManagerCreditCenterMobilePageState();
}

class _ZonalManagerCreditCenterMobilePageState
    extends State<ZonalManagerCreditCenterMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZonalManagerCreditCenterMobilePage'),
      ),
      drawer: const ZonalManagerDrawer(),
      bottomNavigationBar: const ZonalManagerNavigation(selectedIndex: 2),
      body: const Center(
        child: Text('ZonalManagerCreditCenterMobilePage'),
      ),
    );
  }
}
