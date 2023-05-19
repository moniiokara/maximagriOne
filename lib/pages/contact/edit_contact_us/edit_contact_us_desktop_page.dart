import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';

class EditContactUsDesktopPage extends StatelessWidget {
  const EditContactUsDesktopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditContactUsDesktopPage'),
      ),
      //    drawer: pageDrawer,
      body: Row(
        children: const [
          OperationsDrawer(),
          Text('EditContactUsDesktopPage'),
        ],
      ),
    );
  }
}
