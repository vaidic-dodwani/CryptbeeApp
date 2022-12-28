import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

const String noInternet = "App_Error:No_Internet";

Future<void> saveData(Map response) async {
  final prefs = await SharedPreferences.getInstance();
  if (response['access'] != null) {
    prefs.setString('access', response['access']);
  }
  if (response['refresh'] != null) {
    prefs.setString('refresh', response['refresh']);
  }
  if (response['2fa'] != null) {
    prefs.setBool('2fa', response['two_factor']);
  }
  if (response['pan_verify'] != null) {
    prefs.setBool('pan_verify', response['pan_verify']);
  }
  if (response['is_verified'] != null) {
    prefs.setBool('is_verified', response['is_verified']);
  }
}

void internetHandler(BuildContext context) {
  ToastContext().init(context);
  Toast.show("No Internet Connection Found!!",
      duration: 5, gravity: Toast.bottom);
}
