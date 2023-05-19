import 'package:flutter/material.dart';

class Responsiveness extends StatelessWidget {
  static const String routeName = 'responsiveness';
  final Widget mobilePage;
  final Widget tabletPage;
  final Widget desktopPage;

  const Responsiveness({
    super.key,
    required this.mobilePage,
    required this.tabletPage,
    required this.desktopPage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 767) {
          return mobilePage;
        } else if (constraints.maxWidth <= 1023) {
          return tabletPage;
        } else {
          return desktopPage;
        }
      },
    );
  }
}
