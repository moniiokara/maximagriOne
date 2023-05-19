import 'package:flutter/material.dart';

class ContactUsDesktopPage extends StatelessWidget {
  final Widget pageDrawer;
  const ContactUsDesktopPage({Key? key, required this.pageDrawer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContactUsDesktopPage'),
      ),
      drawer: pageDrawer,
      body: Row(
        children: [
          pageDrawer,
          const Text(
            'ContactUsDesktopPage',
          )
        ],
      ),
    );
  }
}
