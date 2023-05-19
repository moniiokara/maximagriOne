import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';
import 'package:maximagri/widgets/navigation/operations_navigation.dart';

class OperationsCreditCenterTabletPage extends StatefulWidget {
  const OperationsCreditCenterTabletPage({Key? key}) : super(key: key);

  @override
  State<OperationsCreditCenterTabletPage> createState() =>
      _OperationsCreditCenterTabletPageState();
}

class _OperationsCreditCenterTabletPageState
    extends State<OperationsCreditCenterTabletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OperationsCreditCenterTabletPage'),
      ),
      drawer: const OperationsDrawer(),
      bottomNavigationBar: const OperationsNavigation(selectedIndex: 2),
      body: const Center(
        child: Text('OperationsCreditCenterTabletPage'),
      ),
    );
  }
}
