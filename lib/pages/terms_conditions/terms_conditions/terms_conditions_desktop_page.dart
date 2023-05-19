import 'package:flutter/material.dart';

class TermsAndConditionsDesktopPage extends StatelessWidget {
  final Widget pageDrawer;
  const TermsAndConditionsDesktopPage({Key? key, required this.pageDrawer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TermsAndConditionsDesktopPage'),
      ),
      body: Row(
        children: [
          pageDrawer,
          const Text('TermsAndConditionsDesktopPage'),
        ],
      ),
    );
  }
}
