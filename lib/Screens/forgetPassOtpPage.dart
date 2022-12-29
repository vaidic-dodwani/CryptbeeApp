import 'package:cryptbee/Config/apiIntegration.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Utilities/Widgets/logoWithName.dart';
import 'package:cryptbee/Utilities/Widgets/otpBox.dart';
import 'package:cryptbee/Utilities/apiFunctions.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetPassOtpPage extends StatefulWidget {
  final String email;

  const ForgetPassOtpPage({super.key, required this.email});

  @override
  State<ForgetPassOtpPage> createState() => _ForgetPassOtpPageState();
}

class _ForgetPassOtpPageState extends State<ForgetPassOtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assests/background.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Column(
              children: [
                const SizedBox(height: 38),
                const CenterLogo(),
                const SizedBox(height: 93),
                OtpBox(
                  loaderProvider: forgetPassOtpButtonLoaderProvider,
                  timerNotifier: forgetPassOtpTimerNotifer,
                  timerProvider: forgetPassOtpTimerProvider,
                  sentAt: 'email address',
                  function: (pin) async {
                    forgetPassOtpButtonLoaderNotifier.toggle();
                    final response = await ApiCalls.verifyEmailOTP(
                        email: widget.email, otp: pin);
                    forgetPassOtpButtonLoaderNotifier.toggle();
                    if (response == noInternet) {
                      internetHandler(context);
                    } else {
                      if (response['statusCode'] == 200) {
                        context.goNamed(RouteNames.setPassword, params: {
                          'email': widget.email,
                          'otp': pin.toString()
                        });
                      }
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
