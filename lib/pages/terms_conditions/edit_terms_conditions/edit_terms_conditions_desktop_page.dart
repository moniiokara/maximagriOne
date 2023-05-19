import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';

class TermsAndConditionsDesktopPage extends StatelessWidget {
  const TermsAndConditionsDesktopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TermsAndConditionsDesktopPage'),
      ),
      //    drawer: pageDrawer,
      body: Row(
        children: const [
          OperationsDrawer(),
          Text('TermsAndConditionsDesktopPage'),
        ],
      ),
    );
  }
}
