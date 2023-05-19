import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';
import 'package:maximagri/widgets/navigation/operations_navigation.dart';

class EditAboutUsTabletPage extends StatelessWidget {
  const EditAboutUsTabletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditAboutUsTabletPage'),
      ),
      drawer: const OperationsDrawer(),
      bottomNavigationBar: const OperationsNavigation(selectedIndex: 2),
      body: Row(
        children: const [
          Text('EditAboutUsTabletPage'),
        ],
      ),
    );
  }
}
