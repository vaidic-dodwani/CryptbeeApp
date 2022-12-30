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
      log(output.toString());

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
      log("Began Verification Process For $email $token");
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

  static Future<dynamic> verifyEmailOTP(
      {required String email, required int otp}) async {
    try {
      log("Began Otp Verification Process For $email with pin $otp");
      final response = await post(
        Uri.parse(Links.prefixLink + Links.verifyEmailOtpLink),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{"email": email, 'otp': otp},
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

  static Future<dynamic> resetPass(
      {required String email,
      required String otp,
      required String password}) async {
    try {
      log("Began Reset Password Process For $email with otp $otp and password $password");
      final response = await patch(
        Uri.parse(Links.prefixLink + Links.resetPassLink),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{"email": email, 'otp': otp, 'password': password},
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

  static Future<dynamic> panVerify(
      {required String pan, required String name}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('email');

      log("Began Pan Connecting Process For $email with pan $pan and name $name");
      final Response response;
      if (pan.isNotEmpty && name.isNotEmpty) {
        response = await post(
          Uri.parse(Links.prefixLink + Links.resetPassLink),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, dynamic>{"email": email, 'pan_number': pan, 'name': name},
          ),
        );
      } else if (pan.isEmpty && name.isNotEmpty) {
        response = await post(
          Uri.parse(Links.prefixLink + Links.resetPassLink),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, dynamic>{"email": email, 'name': name},
          ),
        );
      } else {
        response = await post(
          Uri.parse(Links.prefixLink + Links.resetPassLink),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, dynamic>{"email": email, 'pan_number': pan},
          ),
        );
      }
      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;

      log(output.toString());
      return output;
    } on SocketException {
      log("NO Internet Error");
      return noInternet;
    }
  }

  static Future<void> renewToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final refresh = prefs.getString('refresh');

      log("Began Token Renew for $refresh");
      final response = await post(
        Uri.parse(Links.prefixLink + Links.renewTokenLink),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{"refresh": refresh},
        ),
      );
      final output = jsonDecode(response.body);
      log(output.toString());
      prefs.setString('access', output['access']);
    } catch (e) {
      log("$e");
    }
  }
}
