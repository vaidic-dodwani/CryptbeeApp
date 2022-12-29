// if (response == 'App_Error:No Internet') {
//                       ToastContext().init(context);
//                       Toast.show("No Internet Connection Found!!",
//                           duration: 5, gravity: Toast.bottom);
//                     } else {}

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cryptbee/Config/apiLinks.dart';
import 'package:cryptbee/Utilities/apiFunctions.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiCalls {
  static Future<dynamic> signIn(
      {required String email, required String password}) async {
    try {
      log("Began Login Process For $email $password");
      final response = await post(
        Uri.parse(Links.prefixLink + Links.signInLink),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{"email": email.toLowerCase(), "password": password},
        ),
      );

      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;
      return output;
    } on SocketException {
      log("NO Internet Error");
      return noInternet;
    }
  }

  static Future<dynamic> signUp(
      {required String email, required String password}) async {
    try {
      log("Began Sign Up Process For $email $password");
      final response = await post(
        Uri.parse(Links.prefixLink + Links.signUpLink),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{"email": email, "password": password},
        ),
      );
      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;
      log(output.toString());
      return output;
    } on SocketException {
      log("NO Internet Error");
      return noInternet;
    }
  }

  static Future<dynamic> verifier(
      {required String email, required String token}) async {
    try {
      log("Began Verification Check Up Process For $email $token");
      final response = await post(
        Uri.parse(Links.prefixLink + Links.verificationCheckerLink),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{"email": email, "token": token, 'onapp': true},
        ),
      );
      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;

      if (response.statusCode == 200) {
        await saveData(output);
      }
      log(output.toString());
      return output;
    } on SocketException {
      log("NO Internet Error");
      return noInternet;
    }
  }

  static Future<dynamic> sendEmailOTP({required String email}) async {
    try {
      log("Began Otp Send Process For $email ");
      final response = await post(
        Uri.parse(Links.prefixLink + Links.sendEmailOtpLink),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{"email": email},
        ),
      );
      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;

      log(output.toString());
      return output;
    } on SocketException {
      log("NO Internet Error");
      return noInternet;
    }
  }
}
