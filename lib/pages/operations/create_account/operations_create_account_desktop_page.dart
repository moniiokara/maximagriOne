import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';

class OperationsCreateAccountDesktopPage extends StatefulWidget {
  const OperationsCreateAccountDesktopPage({Key? key}) : super(key: key);

  @override
  State<OperationsCreateAccountDesktopPage> createState() =>
      _OperationsCreateAccountDesktopPageState();
}

class _OperationsCreateAccountDesktopPageState
    extends State<OperationsCreateAccountDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OperationsCreateAccountDesktopPage'),
      ),
      body: Row(
        children: const [
          OperationsDrawer(),
          Text('OperationsCreateAccountDesktopPage'),
        ],
      ),
    );
  }
}
