import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/dealer_drawer.dart';
import 'package:maximagri/widgets/navigation/dealer_navigation.dart';

class DealerPlaceOrderTabletPage extends StatefulWidget {
  const DealerPlaceOrderTabletPage({Key? key}) : super(key: key);

  @override
  State<DealerPlaceOrderTabletPage> createState() =>
      _DealerPlaceOrderTabletPageState();
}

class _DealerPlaceOrderTabletPageState
    extends State<DealerPlaceOrderTabletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DealerPlaceOrderTabletPage'),
      ),
      drawer: DealerDrawer(),
      bottomNavigationBar: const DealerNavigation(selectedIndex: 1),
      body: const Center(
        child: Text('DealerPlaceOrderTabletPage'),
      ),
    );
  }
}
