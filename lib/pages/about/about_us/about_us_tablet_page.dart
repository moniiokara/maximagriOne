import 'package:flutter/material.dart';

class AboutUsTabletPage extends StatelessWidget {
  final Widget pageDrawer;
  final Widget pageNavigation;
  const AboutUsTabletPage(
      {Key? key, required this.pageDrawer, required this.pageNavigation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AboutUsTabletPage'),
      ),
      drawer: pageDrawer,
      bottomNavigationBar: pageNavigation,
    );
  }
}
