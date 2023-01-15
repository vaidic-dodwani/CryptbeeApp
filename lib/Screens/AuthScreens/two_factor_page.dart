import 'package:cryptbee/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Utilities/Widgets/logo_with_name.dart';
import 'package:cryptbee/Utilities/Widgets/otp_box.dart';

import 'package:flutter/material.dart';

class TwoFactorPage extends StatelessWidget {
  const TwoFactorPage({super.key});

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
                  timerNotifier: twoFactorTimerNotifer,
                  timerProvider: twoFactorTimerProvider,
                  buttonFunction: (pin) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
