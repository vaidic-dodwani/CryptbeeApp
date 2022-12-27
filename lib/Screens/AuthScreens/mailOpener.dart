
import 'package:cryptbee/Utilities/authHeading.dart';
import 'package:cryptbee/Utilities/logInButton.dart';
import 'package:cryptbee/Utilities/logoWithName.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

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
              function: () async {
                final url = Uri.parse('mailto:');
                if (!await launchUrl(url)) {
                  throw 'Could not launch $url';
                }
              },
            )
          ],
        ),
      ]),
    );
  }
}
