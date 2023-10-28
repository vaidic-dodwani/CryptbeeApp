// ignore_for_file: use_build_context_synchronously

import 'package:cryptbee/Config/api_integration.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/logo_with_name.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/otp_box.dart';
import 'package:cryptbee/Config/api_functions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';

class ForgetPassOtpPage extends StatelessWidget {
  final String email;

  const ForgetPassOtpPage({super.key, required this.email});

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
                  buttonFunction: (pin) async {
                    ToastContext().init(context);

                    forgetPassOtpButtonLoaderNotifier.toggle();
                    final response =
                        await ApiCalls.verifyEmailOTP(email: email, otp: pin);
                    forgetPassOtpButtonLoaderNotifier.toggle();
                    if (response == noInternet) {
                      internetHandler(context);
                    } else {
                      if (response['statusCode'] == 200) {
                        Toast.show("Remember the password this time",
                            duration: 5, gravity: Toast.bottom);
                        context.goNamed(RouteNames.setPassword,
                            pathParameters: {'email': email, 'otp': pin.toString()});
                      } else {
                        Toast.show(response[response.keys.first][0],
                            duration: 5, gravity: Toast.bottom);
                      }
                    }
                  },
                  resendFunction: () async {
                    ToastContext().init(context);
                    forgetPassOtpButtonLoaderNotifier.toggle();

                    final response = await ApiCalls.sendEmailOTP(email: email);
                    forgetPassOtpButtonLoaderNotifier.toggle();

                    if (response == noInternet) {
                      internetHandler(context);
                    } else {
                      if (response['statusCode'] == 200) {
                        Toast.show("Resent The OTP",
                            duration: 5, gravity: Toast.bottom);
                      } else {
                        Toast.show(response[response.keys.first][0],
                            duration: 5, gravity: Toast.bottom);
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
