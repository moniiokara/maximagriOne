import 'package:flutter/material.dart';

class AboutUsDesktopPage extends StatelessWidget {
  final Widget pageDrawer;
  const AboutUsDesktopPage({Key? key, required this.pageDrawer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AboutUsDesktopPage'),
      ),
      //    drawer: pageDrawer,
      body: Row(
        children: [pageDrawer, const Text('AboutUsDesktopPage')],
      ),
    );
  }
}
