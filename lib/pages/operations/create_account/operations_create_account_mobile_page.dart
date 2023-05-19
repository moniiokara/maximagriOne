import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';
import 'package:maximagri/widgets/navigation/operations_navigation.dart';

class OperationsCreateAccountMobilePage extends StatefulWidget {
  const OperationsCreateAccountMobilePage({Key? key}) : super(key: key);

  @override
  State<OperationsCreateAccountMobilePage> createState() =>
      _OperationsCreateAccountMobilePageState();
}

class _OperationsCreateAccountMobilePageState
    extends State<OperationsCreateAccountMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OperationsCreateAccountMobilePage'),
      ),
      drawer: const OperationsDrawer(),
      bottomNavigationBar: const OperationsNavigation(selectedIndex: 3),
      body: const Center(
        child: Text('OperationsCreateAccountMobilePage'),
      ),
    );
  }
}
