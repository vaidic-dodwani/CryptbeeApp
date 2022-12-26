import 'package:android_intent_plus/android_intent.dart';
import 'package:cryptbee/Utilities/authHeading.dart';
import 'package:cryptbee/Utilities/logInButton.dart';
import 'package:cryptbee/Utilities/logoWithName.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MailOpener extends StatelessWidget {
  const MailOpener({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset("assests/background.png"),
        Column(
          children: [
            const SizedBox(height: 38),
            const CenterLogo(),
            const SizedBox(height: 80),
            SvgPicture.asset(
              "assests/illustrations/mailOpener.svg",
              height: 148,
              width: 148,
            ),
            const SizedBox(height: 64),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: authTitleLargeText("Almost there! Check your inbox"),
            ),
            const SizedBox(height: 20),
            authCenterText(
                "Confirm your identity by clicking the link I sent to Example@gmail.com"),
            const SizedBox(height: 16),
            logInButton(
              text: "Open Your Gmail",
              function: () {
                AndroidIntent intent = const AndroidIntent(
                    action: 'android.intent.action.MAIN',
                    category: 'android.intent.category.APP_EMAIL');
                intent.launch();
              },
            )
          ],
        ),
      ]),
    );
  }
}
