// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cryptbee/Config/api_links.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Config/api_functions.dart';
import 'package:http_parser/http_parser.dart';
import 'package:cryptbee/Screens/Utilities/static_classes.dart';
import 'package:go_router/go_router.dart';
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
        await saveData(output, false);
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
      {required String email,
      required String pan,
      required String name}) async {
    try {
      log("Began Pan Connecting Process For $email with pan $pan and name $name");
      final Response response;
      if (pan.isNotEmpty && name.isNotEmpty) {
        response = await post(
          Uri.parse(Links.prefixLink + Links.panLink),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${App.acesss}'
          },
          body: jsonEncode(
            <String, dynamic>{"email": email, 'pan_number': pan, 'name': name},
          ),
        );
        if (response.statusCode == 200) {
          User.panVerify = true;
          User.name = name;
        }
      } else if (pan.isEmpty && name.isNotEmpty) {
        response = await post(
          Uri.parse(Links.prefixLink + Links.panLink),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${App.acesss}'
          },
          body: jsonEncode(
            <String, dynamic>{"email": email, 'name': name},
          ),
        );
        if (response.statusCode == 200) {
          User.name = name;
        }
      } else {
        response = await post(
          Uri.parse(Links.prefixLink + Links.panLink),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${App.acesss}'
          },
          body: jsonEncode(
            <String, dynamic>{"email": email, 'pan_number': pan},
          ),
        );
        if (response.statusCode == 200) {
          User.panVerify = true;
        }
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
      if (response.statusCode == 401) {
        prefs.clear();
        App.isLoggedIn = false;
        App.navigatorKey.currentContext!.goNamed(RouteNames.root);
      }

      final output = jsonDecode(response.body);

      log(output.toString());
      prefs.setString('access', output['access']);
      App.acesss = output['access'];
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> getNews() async {
    try {
      Response response = await get(
        Uri.parse(Links.prefixLink + Links.newsLink),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${App.acesss}'
        },
      );
      if (response.statusCode == 401) {
        await renewToken();
        response = await get(
          Uri.parse(Links.prefixLink + Links.newsLink),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${App.acesss}'
          },
        );
      }
      final output = jsonDecode(response.body);
      return output;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> changePassword(String oldPass, String newPass) async {
    try {
      Response response = await put(
        Uri.parse(Links.prefixLink + Links.changePasswordLink),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${App.acesss}'
        },
        body: jsonEncode(
          <String, dynamic>{"password": oldPass, 'newpassword': newPass},
        ),
      );
      if (response.statusCode == 401) {
        await renewToken();
        response = await put(
          Uri.parse(Links.prefixLink + Links.changePasswordLink),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${App.acesss}'
          },
          body: jsonEncode(
            <String, dynamic>{"password": oldPass, 'newpassword': newPass},
          ),
        );
      }

      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;
      return output;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> sendProfilePhoto(File photo) async {
    try {
      Map<String, String> headers = {
        'Authorization': 'Bearer ${App.acesss}',
        'Content-Type': 'multipart/form-data'
      };
      MultipartRequest request = MultipartRequest(
          'PUT', Uri.parse(Links.prefixLink + Links.updateProfilePhoto));

      request.headers.addAll(headers);

      request.files.add(
        MultipartFile('profile_picture', photo.readAsBytes().asStream(),
            photo.lengthSync(),
            filename: "${User.name}.jpg",
            contentType: MediaType('image', 'jpg')),
      );

      var result = await request.send();

      String response = await result.stream.bytesToString();

      if (result.statusCode == 401) {
        await renewToken();
        headers = {'Authorization': 'Bearer ${App.acesss}'};
        var result = await request.send();
        response = await result.stream.bytesToString();
      }

      final output = jsonDecode(response);

      output['statusCode'] = result.statusCode;

      log(output.toString());

      return output;
    } catch (e) {
      log(" error $e");
    }
  }

  static Future<dynamic> getHoldings() async {
    try {
      Response response = await get(
        Uri.parse(Links.prefixLink + Links.holdingApiLink),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${App.acesss}'
        },
      );
      if (response.statusCode == 401) {
        await renewToken();
        response = await get(
          Uri.parse(Links.prefixLink + Links.holdingApiLink),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${App.acesss}'
          },
        );
      }
      final output = jsonDecode(response.body);
      return output;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> getUserDetails() async {
    try {
      Response response = await get(
        Uri.parse(Links.prefixLink + Links.userDetails),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${App.acesss}'
        },
      );
      if (response.statusCode == 401) {
        await renewToken();
        response = await get(
          Uri.parse(Links.prefixLink + Links.userDetails),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${App.acesss}'
          },
        );
      }
      final output = jsonDecode(response.body);
      await saveData(output, true);
      return output;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> newTwoFactor(String phoneNumber) async {
    try {
      log("Began New Two factor for $phoneNumber");
      Response response = await post(
        Uri.parse(Links.prefixLink + Links.newTwoFactor),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${App.acesss}'
        },
        body: jsonEncode(
          <String, dynamic>{"phone_number": phoneNumber},
        ),
      );
      if (response.statusCode == 401) {
        ApiCalls.renewToken();

        response = await post(
          Uri.parse(Links.prefixLink + Links.newTwoFactor),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${App.acesss}'
          },
          body: jsonEncode(
            <String, dynamic>{"phone_number": phoneNumber},
          ),
        );
      }

      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;
      log(output.toString());
      return output;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> verifyTwoFactor(int pin) async {
    try {
      log("Began New Two factor for $pin");
      Response response = await put(
        Uri.parse(Links.prefixLink + Links.verifyTwoFactor),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${App.acesss}'
        },
        body: jsonEncode(
          <String, dynamic>{"otp": pin},
        ),
      );
      if (response.statusCode == 401) {
        ApiCalls.renewToken();

        response = await post(
          Uri.parse(Links.prefixLink + Links.verifyTwoFactor),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${App.acesss}'
          },
          body: jsonEncode(
            <String, dynamic>{"otp": pin},
          ),
        );
      }

      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;
      log(output.toString());
      return output;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> enableTwoFactor() async {
    try {
      log("Enabling 2fa");
      Response response = await put(
        Uri.parse(Links.prefixLink + Links.enableTwoFactor),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${App.acesss}'
        },
      );
      if (response.statusCode == 401) {
        ApiCalls.renewToken();

        response = await put(
          Uri.parse(Links.prefixLink + Links.enableTwoFactor),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${App.acesss}'
          },
        );
      }

      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;
      log(output.toString());
      return output;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> disableTwoFactor() async {
    try {
      log("Disabling 2fa");
      Response response = await put(
        Uri.parse(Links.prefixLink + Links.disableTwoFactor),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${App.acesss}'
        },
      );
      if (response.statusCode == 401) {
        ApiCalls.renewToken();

        response = await put(
          Uri.parse(Links.prefixLink + Links.disableTwoFactor),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${App.acesss}'
          },
        );
      }

      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;
      log(output.toString());
      return output;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> loginVerifyTwoFactor(int pin) async {
    try {
      log("Began New Two factor for ${User.email} with $pin");
      Response response = await post(
        Uri.parse(Links.prefixLink + Links.loginTwoFactorVerify),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{"otp": pin, "email": User.email},
        ),
      );

      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;
      log(output.toString());
      return output;
    } catch (e) {
      log("$e");
    }
  }

  static Future<bool> inWatchlist(String coinSmallName) async {
    try {
      log("modify watchlist for $coinSmallName");
      Response response = await get(
        Uri.parse(Links.prefixLink + Links.inWatchlist + coinSmallName),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${App.acesss}'
        },
      );
      if (response.statusCode == 401) {
        await renewToken();
        response = await get(
          Uri.parse(Links.prefixLink + Links.inWatchlist + coinSmallName),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${App.acesss}'
          },
        );
      }
      final output = jsonDecode(response.body);
      log(output.toString());
      return output['present'] ?? false;
    } catch (e) {
      log("$e");
      return false;
    }
  }

  static Future<dynamic> modifyWatchlist(String choice) async {
    try {
      log("modifing watchlist of ${App.currentCoin} by $choice");
      if (choice == "add") {
        Response response = await put(
          Uri.parse(Links.prefixLink + Links.modifyWatchlist),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${App.acesss}'
          },
          body: jsonEncode(
            <String, dynamic>{
              "add": true,
              "watchlist": [App.currentCoin]
            },
          ),
        );
        if (response.statusCode == 401) {
          await renewToken();
          response = await put(
            Uri.parse(Links.prefixLink + Links.modifyWatchlist),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer ${App.acesss}'
            },
            body: jsonEncode(
              <String, dynamic>{
                "add": true,
                "watchlist": [App.currentCoin]
              },
            ),
          );
        }

        final output = jsonDecode(response.body);
        output['statusCode'] = response.statusCode;
        log(output.toString());
        return output;
      } else {
        Response response = await put(
          Uri.parse(Links.prefixLink + Links.modifyWatchlist),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${App.acesss}'
          },
          body: jsonEncode(
            <String, dynamic>{
              "remove": true,
              "watchlist": [App.currentCoin]
            },
          ),
        );
        if (response.statusCode == 401) {
          await renewToken();
          response = await put(
            Uri.parse(Links.prefixLink + Links.modifyWatchlist),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer ${App.acesss}'
            },
            body: jsonEncode(
              <String, dynamic>{
                "remove": true,
                "watchlist": [App.currentCoin]
              },
            ),
          );
        }

        final output = jsonDecode(response.body);
        output['statusCode'] = response.statusCode;
        log(output.toString());
        return output;
      }
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> getCoinDetails() async {
    try {
      log("getting coin details for ${App.currentCoin}");
      Response response = await get(
        Uri.parse(Links.prefixLink + Links.coinDetailsLink + App.currentCoin!),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${App.acesss}'
        },
      );
      if (response.statusCode == 401) {
        await renewToken();
        response = await get(
          Uri.parse(
              Links.prefixLink + Links.coinDetailsLink + App.currentCoin!),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${App.acesss}'
          },
        );
      }
      final output = jsonDecode(response.body);
      return output;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> getTransactions() async {
    try {
      log("getting transaction details}");
      Response response = await get(
        Uri.parse(Links.prefixLink + Links.transactionLink),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${App.acesss}'
        },
      );
      if (response.statusCode == 401) {
        await renewToken();
        response = await get(
          Uri.parse(Links.prefixLink + Links.transactionLink),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${App.acesss}'
          },
        );
      }
      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;
      return output;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> buyCoin(int buyAmount) async {
    try {
      log("Began Coin Buy For ${App.currentCoin} + $buyAmount");
      Response response = await post(
        Uri.parse(Links.prefixLink + Links.buyCoinLink),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${App.acesss}'
        },
        body: jsonEncode(
          <String, dynamic>{
            "coin_name": App.currentCoin,
            "buy_amount": buyAmount
          },
        ),
      );

      if (response.statusCode == 401) {
        await ApiCalls.renewToken();
        response = await post(
          Uri.parse(Links.prefixLink + Links.buyCoinLink),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${App.acesss}'
          },
          body: jsonEncode(
            <String, dynamic>{
              "coin_name": App.currentCoin,
              "buy_amount": buyAmount
            },
          ),
        );
      }

      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;
      log(output.toString());
      return output;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> sellCoin(double sellQuantity, double price) async {
    try {
      log("Began Coin Sell For ${App.currentCoin} + $sellQuantity +$price");
      Response response = await patch(
        Uri.parse(Links.prefixLink + Links.sellCoinLink),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${App.acesss}'
        },
        body: jsonEncode(
          <String, dynamic>{
            "coin_name": App.currentCoin,
            "sell_quantity": sellQuantity,
            "price": price
          },
        ),
      );

      if (response.statusCode == 401) {
        await ApiCalls.renewToken();
        response = await patch(
          Uri.parse(Links.prefixLink + Links.sellCoinLink),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${App.acesss}'
          },
          body: jsonEncode(
            <String, dynamic>{
              "coin_name": App.currentCoin,
              "sell_quantity": sellQuantity,
              "price": price
            },
          ),
        );
      }

      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;
      log(response.statusCode.toString());

      log(output.toString());
      return output;
    } catch (e) {
      log("$e");
    }
  }
}
