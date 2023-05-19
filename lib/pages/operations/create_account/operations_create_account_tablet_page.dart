import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';
import 'package:maximagri/widgets/navigation/operations_navigation.dart';

class OperationsCreateAccountTabletPage extends StatefulWidget {
  const OperationsCreateAccountTabletPage({Key? key}) : super(key: key);

  @override
  State<OperationsCreateAccountTabletPage> createState() =>
      _OperationsCreateAccountTabletPageState();
}

class _OperationsCreateAccountTabletPageState
    extends State<OperationsCreateAccountTabletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OperationsCreateAccountTabletPage'),
      ),
      drawer: const OperationsDrawer(),
      bottomNavigationBar: const OperationsNavigation(selectedIndex: 3),
      body: const Center(
        child: Text('OperationsCreateAccountTabletPage'),
      ),
    );
  }
}
