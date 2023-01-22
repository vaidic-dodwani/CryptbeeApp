import 'package:flutter/material.dart';

class App {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static bool isLoggedIn = false;
  static String? acesss;
  static String? refresh;
  static bool? twoFactor;
  static bool? panVerify;
}

class User {
  static String photo = "";
  static String name = "";
  static String email = "";
}
