import 'dart:developer';

import 'package:cryptbee/Config/api_integration.dart';
import 'package:cryptbee/Screens/Utilities/static_classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

const String noInternet = "App_Error:No_Internet";

Future<void> saveData(Map response) async {
  log("saving response of $response ");
  final prefs = await SharedPreferences.getInstance();
  if (response.containsKey('access')) {
    prefs.setString('access', response['access']);
    App.acesss = response['access'];
    log("saving access of ${response['access']} ");
  }
  if (response.containsKey('refresh')) {
    prefs.setString('refresh', response['refresh']);
    App.refresh = response['refresh'];
    log("saving refresh of ${response['refresh']} ");
  }
  if (response.containsKey('two_factor')) {
    prefs.setBool('2fa', response['two_factor']);
    User.twoFactor = response['two_factor'];
    log("saving two_factor of ${response['two_factor']} ");
  }
  if (response.containsKey('pan_verify')) {
    prefs.setBool('pan_verify', response['pan_verify']);
    User.panVerify = response['pan_verify'];
    log("saving pan_verify of ${response['pan_verify']} ");
  }
  if (response.containsKey('is_verified')) {
    prefs.setBool('is_verified', response['is_verified']);
    log("saving is_verified of ${response['is_verified']} ");
  }
  if (response.containsKey("name")) {
    prefs.setString('name', response['name']);
    User.name = response['name'];
    log("saving name of ${response['name']} ");
  }
  if (response.containsKey("email")) {
    prefs.setString('email', response['email']);
    User.email = response['email'];
    log("saving name of ${response['email']} ");
  }
  if (response.containsKey("pan")) {
    prefs.setString('pan', response['pan']);
    User.pan = response['pan'];
    log("saving pan of ${response['pan']} ");
  }
}

Future initAuth() async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('access')) {
    String access = prefs.getString('access')!;
    if (JwtDecoder.isExpired(access)) {
      await ApiCalls.renewToken();
    }
    await appInstanceInit();
    App.isLoggedIn = true;
  } else {
    App.isLoggedIn = false;
    // it doesnt exist
  }
}

Future appInstanceInit() async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.containsKey('access')) {
    App.acesss = prefs.getString('access');
  }
  if (prefs.containsKey('refresh')) {
    App.refresh = prefs.getString('refresh');
  }
  if (prefs.containsKey('two_factor')) {
    User.twoFactor = prefs.getBool('2fa');
  }
  if (prefs.containsKey('pan_verify')) {
    User.panVerify = prefs.getBool('pan_verify');
  }
  if (prefs.containsKey('name')) {
    User.name = prefs.getString('name') ?? 'user';
  }
  if (prefs.containsKey('email')) {
    User.email = prefs.getString('email') ?? 'email@email.com';
  }
  if (prefs.containsKey('pan')) {
    User.pan = prefs.getString('pan') ?? 'pan';
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
