import 'package:flutter/material.dart';

class TermsAndConditionsMobilePage extends StatelessWidget {
  final Widget pageDrawer;
  final Widget pageNavigation;
  const TermsAndConditionsMobilePage(
      {Key? key, required this.pageDrawer, required this.pageNavigation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TermsAndConditionsMobilePage'),
      ),
      drawer: pageDrawer,
      bottomNavigationBar: pageNavigation,
      body: const Center(
        child: Text('TermsAndConditionsMobilePage'),
      ),
    );
  }
}
