import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';

class OperationsCreditCenterDesktopPage extends StatefulWidget {
  const OperationsCreditCenterDesktopPage({Key? key}) : super(key: key);

  @override
  State<OperationsCreditCenterDesktopPage> createState() =>
      _OperationsCreditCenterDesktopPageState();
}

class _OperationsCreditCenterDesktopPageState
    extends State<OperationsCreditCenterDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OperationsCreditCenterDesktopPage'),
      ),
      body: Row(
        children: const [
          OperationsDrawer(),
          Text('OperationsCreditCenterDesktopPage'),
        ],
      ),
    );
  }
}
