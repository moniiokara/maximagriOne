import 'package:flutter/material.dart';

class ContactUsTabletPage extends StatelessWidget {
  final Widget pageDrawer;
  final Widget pageNavigation;
  const ContactUsTabletPage(
      {Key? key, required this.pageDrawer, required this.pageNavigation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContactUsTabletPage'),
      ),
      drawer: pageDrawer,
      bottomNavigationBar: pageNavigation,
    );
  }
}
