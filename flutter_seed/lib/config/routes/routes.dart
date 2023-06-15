import 'package:flutter/material.dart';
import 'package:flutter_seed/views/authentication/screens/login_screen.dart';
import 'package:flutter_seed/views/dashboard/screens/home_screen.dart';

class RoutePath {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home_screen';
}

class Routes {
  // Routes
  static final routes = <String, WidgetBuilder>{
    RoutePath.login: (BuildContext context) => const LoginScreen(),
    RoutePath.home: (BuildContext context) => const HomeScreen(),
  };

  //push
  static void push(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }

  //pop
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  //popAndPush
  static void popAndPush(BuildContext context, String routeName) {
    Navigator.popAndPushNamed(context, routeName);
  }

  //pushReplace
  static void pushReplace(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }
}
