import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/zonal_manager_drawer.dart';

class ZonalManagerCreditCenterDesktopPage extends StatefulWidget {
  const ZonalManagerCreditCenterDesktopPage({Key? key}) : super(key: key);

  @override
  State<ZonalManagerCreditCenterDesktopPage> createState() =>
      _ZonalManagerCreditCenterDesktopPageState();
}

class _ZonalManagerCreditCenterDesktopPageState
    extends State<ZonalManagerCreditCenterDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZonalManagerCreditCenterDesktopPage'),
      ),
      body: Row(
        children: const [
          ZonalManagerDrawer(),
          Text('ZonalManagerCreditCenterDesktopPage'),
        ],
      ),
    );
  }
}
