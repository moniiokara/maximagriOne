import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:maximagri/utilities/responsiveness.dart';
import 'package:maximagri/utilities/user_redirection.dart';

import 'package:maximagri/pages/auth/sign_in/sign_in_mobile_page.dart';
import 'package:maximagri/pages/auth/sign_in/sign_in_tablet_page.dart';
import 'package:maximagri/pages/auth/sign_in/sign_in_desktop_page.dart';

import 'package:maximagri/pages/auth/splash_screen/progress_indicator_mobile_page.dart';
import 'package:maximagri/pages/auth/splash_screen/progress_indicator_tablet_page.dart';
import 'package:maximagri/pages/auth/splash_screen/progress_indicator_desktop_page.dart';

class UserAuthentication extends StatefulWidget {
  static const String routeName = 'userAuthentication';
  const UserAuthentication({Key? key}) : super(key: key);

  @override
  State<UserAuthentication> createState() => _UserAuthenticationState();
}

class _UserAuthenticationState extends State<UserAuthentication> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return const Responsiveness(
              mobilePage: ProgressIndicatorMobilePage(),
              tabletPage: ProgressIndicatorTabletPage(),
              desktopPage: ProgressIndicatorDesktopPage(),
            );
          }
          if (snapshot.hasData) {
            return const UserRedirection();
          } else {
            return const Responsiveness(
              mobilePage: SignInMobilePage(),
              tabletPage: SignInTabletPage(),
              desktopPage: SignInDesktopPage(),
            );
          }
        });
  }
}
