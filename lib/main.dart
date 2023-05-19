import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maximagri/Notification%20Services/home_screen.dart';
import 'package:maximagri/config/app_theme.dart';
import 'package:maximagri/utilities/user_authentication.dart';
import 'package:maximagri/config/app_dark_theme.dart';
import 'package:maximagri/config/routes.dart';
import 'package:maximagri/widgets/order_test.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  // firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaximAgri());
}



class MaximAgri extends StatelessWidget {
  const MaximAgri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maxim Agri',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      darkTheme: appDarkTheme(),
      routes: customRoutes,
      home: const UserAuthentication(),
   //   home: HomeScreenNotification(),

      //home: OrderTest(),
    );
  }
}
