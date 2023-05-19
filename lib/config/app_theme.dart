import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.green,
    drawerTheme: const DrawerThemeData(
      //   backgroundColor: Colors.white,
      //   elevation: 1,
      //   scrimColor: Colors.green,
      shadowColor: Colors.green,
      //   surfaceTintColor: Colors.green,
      //   width: 100,
      //   shape: ShapeBorder(),
      //   endShape: ShapeBorder()
    ),
  );
}
