import 'package:cryptbee/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Utilities/Widgets/logoWithName.dart';
import 'package:cryptbee/Utilities/Widgets/otpBox.dart';

import 'package:flutter/material.dart';

class TwoFactorPage extends StatefulWidget {
  const TwoFactorPage({super.key});

  @override
  State<TwoFactorPage> createState() => _TwoFactorPageState();
}

class _TwoFactorPageState extends State<TwoFactorPage> {
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
                SizedBox(height: 38),
                CenterLogo(),
                SizedBox(height: 93),
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
