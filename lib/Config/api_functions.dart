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
  if (response.containsKey("email")) {
    prefs.setString('email', response['email']);
    User.email = response['email'];
    log("saving name of ${response['email']} ");
  }
  if (response.containsKey("name")) {
    prefs.setString('name', response['name']);
    User.name = response['name'];
    log("saving name of ${response['name']} ");
  }
  if (response.containsKey("profile_picture")) {
    prefs.setString('profile_picture', response['profile_picture']);
    User.photo = response['profile_picture'];
    log("saving photo of ${response['profile_picture']} ");
  }
  if (response.containsKey('two_factor_verification')) {
    prefs.setBool(
        'two_factor_verification', response['two_factor_verification']);
    User.twoFactor = response['two_factor_verification'];
    log("saving two_factor of ${response['two_factor_verification']} ");
  }
  if (response.containsKey('pan_verification')) {
    prefs.setBool('pan_verification', response['pan_verification']);
    User.panVerify = response['pan_verification'];
    log("saving pan_verification of ${response['pan_verification']} ");
  }
  if (response.containsKey("pan_number")) {
    prefs.setString('pan_number', response['pan_number']);
    User.pan = response['pan_number'];
    log("saving pan_number of ${response['pan_number']} ");
  }
  if (response.containsKey("walltet")) {
    prefs.setDouble('wallet', response['walltet']);
    User.wallet = response['walltet'];
    log("saving walltet of ${response['walltet']} ");
  }
}

Future initAuth() async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('access')) {
    String access = prefs.getString('access')!;
    if (JwtDecoder.isExpired(access)) {
      await ApiCalls.renewToken();
    }
    await ApiCalls.getUserDetails();
    await appInstanceInit();
    App.isLoggedIn = true;
  } else {
    App.isLoggedIn = false;
  }
}

Future appInstanceInit() async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.containsKey('access')) {
    App.acesss = prefs.getString('access');

    log("initialised access ${prefs.getString('access')}");
  }
  if (prefs.containsKey('refresh')) {
    App.refresh = prefs.getString('refresh');
    log("initialised refresh ${prefs.getString('refresh')}");
  }
  if (prefs.containsKey('email')) {
    User.email = prefs.getString('email') ?? 'email@email.com';
    log("initialised email ${prefs.getString('email')}");
  }
  if (prefs.containsKey('name')) {
    User.name = prefs.getString('name') ?? 'user';
    log("initialised name ${prefs.getString('name')}");
  }
  if (prefs.containsKey('profile_picture')) {
    User.photo = prefs.getString('profile_picture') ??
        '"https://crypt-bee.centralindia.cloudapp.azure.com/media/profile.jpg"';
    log("initialised photo ${prefs.getString('profile_picture')}");
  }
  if (prefs.containsKey('two_factor_verification')) {
    User.twoFactor = prefs.getBool('two_factor_verification');
    log("initialised 2fa ${prefs.getBool('two_factor_verification')}");
  }
  if (prefs.containsKey('pan_verification')) {
    User.panVerify = prefs.getBool('pan_verification');

    log("initialised pan_verification ${prefs.getBool('pan_verification')}");
  } else {
    User.panVerify = false;
    log("initialised pan_verification false");
  }

  if (prefs.containsKey('pan_number')) {
    User.pan = prefs.getString('pan_number') ?? 'pan';
    log("initialised pan_number ${prefs.getString('pan_number')}");
  }
  if (prefs.containsKey('wallet')) {
    User.wallet = prefs.getDouble('wallet') ?? 0;
    log("initialised wallet ${prefs.getDouble('wallet')}");
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
