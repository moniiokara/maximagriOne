import 'package:flutter/material.dart';
import 'package:maximagri/utilities/responsiveness.dart';
import 'package:maximagri/utilities/user_authentication.dart';

final Map<String, WidgetBuilder> customRoutes = <String, WidgetBuilder>{
  UserAuthentication.routeName: (context) => const UserAuthentication(),
};
