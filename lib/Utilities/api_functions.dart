import 'dart:developer';

import 'package:cryptbee/Utilities/static_classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

const String noInternet = "App_Error:No_Internet";

Future<void> saveData(Map response) async {
  log("saving response of $response ");
  final prefs = await SharedPreferences.getInstance();
  if (response.containsKey('access')) {
    prefs.setString('access', response['access']);
    log("saving access of ${response['access']} ");
  }
  if (response.containsKey('refresh')) {
    prefs.setString('refresh', response['refresh']);
    log("saving refresh of ${response['refresh']} ");
  }
  if (response.containsKey('two_factor')) {
    prefs.setBool('2fa', response['two_factor']);
    log("saving two_factor of ${response['two_factor']} ");
  }
  if (response.containsKey('pan_verify')) {
    prefs.setBool('pan_verify', response['pan_verify']);
    log("saving pan_verify of ${response['pan_verify']} ");
  }
  if (response.containsKey('is_verified')) {
    prefs.setBool('is_verified', response['is_verified']);
    log("saving is_verified of ${response['is_verified']} ");
  }
  if (response.containsKey("name")) {
    prefs.setString('name', response['name']);
    log("saving name of ${response['name']} ");
  }
}

Future<void> getData(Map response) async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('name')) {
    User.name = prefs.getString('name') ?? '';
    log("saving name of ${response['name']} ");
  }
}

Future<void> clearData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

void internetHandler(BuildContext context) {
  ToastContext().init(context);
  Toast.show("No Internet Connection Found!!",
      duration: 5, gravity: Toast.bottom);
}
