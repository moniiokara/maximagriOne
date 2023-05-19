import 'package:flutter/material.dart';

class TermsAndConditionsTabletPage extends StatelessWidget {
  final Widget pageDrawer;
  final Widget pageNavigation;
  const TermsAndConditionsTabletPage(
      {Key? key, required this.pageDrawer, required this.pageNavigation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TermsAndConditionsTabletPage'),
      ),
      drawer: pageDrawer,
      bottomNavigationBar: pageNavigation,
      body: const Center(
        child: Text('TermsAndConditionsTabletPages'),
      ),
    );
  }
}
