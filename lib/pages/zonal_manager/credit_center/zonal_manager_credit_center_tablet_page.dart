import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/zonal_manager_drawer.dart';
import 'package:maximagri/widgets/navigation/zonal_manager_navigation.dart';

class ZonalManagerCreditCenterTabletPage extends StatefulWidget {
  const ZonalManagerCreditCenterTabletPage({Key? key}) : super(key: key);

  @override
  State<ZonalManagerCreditCenterTabletPage> createState() =>
      _ZonalManagerCreditCenterTabletPageState();
}

class _ZonalManagerCreditCenterTabletPageState
    extends State<ZonalManagerCreditCenterTabletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZonalManagerCreditCenterTabletPage'),
      ),
      drawer: const ZonalManagerDrawer(),
      bottomNavigationBar: const ZonalManagerNavigation(selectedIndex: 2),
      body: const Center(
        child: Text('ZonalManagerCreditCenterTabletPage'),
      ),
    );
  }
}
