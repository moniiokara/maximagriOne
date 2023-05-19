import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/dealer_drawer.dart';

class DealerPlaceOrderDesktopPage extends StatefulWidget {
  const DealerPlaceOrderDesktopPage({Key? key}) : super(key: key);

  @override
  State<DealerPlaceOrderDesktopPage> createState() =>
      _DealerPlaceOrderDesktopPageState();
}

class _DealerPlaceOrderDesktopPageState
    extends State<DealerPlaceOrderDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DealerPlaceOrderDesktopPage'),
      ),
      body: Row(
        children: [
          DealerDrawer(),
          const Text('DealerPlaceOrderDesktopPage'),
        ],
      ),
    );
  }
}
