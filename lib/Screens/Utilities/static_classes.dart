import 'package:flutter/material.dart';

class App {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static bool isLoggedIn = false;
  static String? acesss;
  static String? refresh;
  static String? currentCoin;
  static int? holdingIndex;
  static int? watchlistIndex;
}

class User {
  static String photo =
      "https://crypt-bee.centralindia.cloudapp.azure.com/media/profile.jpg";
  static String name = "";
  static String email = "";
  static String pan = "";
  static String? phone;
  static bool? phoneVerified;
  static bool? twoFactor;
  static bool? panVerify;
  static double wallet = 0;
}
