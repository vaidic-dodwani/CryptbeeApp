// ignore_for_file: use_build_context_synchronously

import 'package:cryptbee/Config/api_integration.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/phone_otp_box.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:cryptbee/Screens/Utilities/static_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class PhoneOtpPage extends ConsumerWidget {
  final String phoneNumber;
  const PhoneOtpPage({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Palette.secondaryBlackColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhoneOtpBox(
                  loaderProvider: phoneOtpButtonLoaderProvider,
                  buttonFunction: (pin) async {
                    phoneNumberButtonLoaderNotifier.toggle();
                    final output = await ApiCalls.verifyTwoFactor(pin);
                    if (output["statusCode"] == 200) {
                      User.phoneVerified = true;
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString('phone_number', phoneNumber);
                      User.twoFactor = true;
                      prefs.setBool('two_factor_verification', true);

                      context.goNamed(RouteNames.security);
                    } else {
                      ToastContext().init(context);
                      Toast.show(output[output.keys.first][0],
                          duration: 5, gravity: Toast.bottom);
                    }
                    phoneNumberButtonLoaderNotifier.toggle();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
