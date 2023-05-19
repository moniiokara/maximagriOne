import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';

class EditAboutUsDesktopPage extends StatelessWidget {
  const EditAboutUsDesktopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditAboutUsDesktopPage'),
      ),
      //    drawer: pageDrawer,
      body: Row(
        children: const [
          OperationsDrawer(),
          Text('EditAboutUsDesktopPage'),
        ],
      ),
    );
  }
}
