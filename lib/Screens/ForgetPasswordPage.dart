import 'dart:developer';

import 'package:cryptbee/Utilities/Dynamic%20Link/dynamicLink.dart';
import 'package:cryptbee/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Utilities/authHeading.dart';
import 'package:cryptbee/Utilities/emailTextArea.dart';
import 'package:cryptbee/Utilities/formErrors.dart';
import 'package:cryptbee/Utilities/logInButton.dart';
import 'package:cryptbee/Utilities/logoWithName.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPasswordPage extends ConsumerStatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends ConsumerState<ForgetPasswordPage> {
  EmailTextArea emailTextArea = EmailTextArea(
    labelText: "Email Address",
    hintText: "Enter Email",
    emailErrorNotifier: forgetPassSignUpEmailErrorNotifer,
  );

  ErrorLines emailErrorLine = ErrorLines(
    errorProvider: forgetPassSignUpEmailErrorProvider,
  );

  @override
  Widget build(BuildContext context) {
    final emailErrorMsg = ref.watch(forgetPassSignUpEmailErrorProvider);
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        Image.asset(
          "assests/background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Column(
          children: [
            const SizedBox(height: 38),
            const CenterLogo(),
            const SizedBox(height: 55),
            SvgPicture.asset(
                "assests/illustrations/forget_pass_illustration.svg",
                height: 164,
                width: 164),
            authTitleLargeText("Forgot Password?"),
            const SizedBox(height: 12),
            authCenterText("Don’t worry, it happens to the best of us."),
            const SizedBox(height: 40),
            emailTextArea,
            const SizedBox(height: 4),
            emailErrorLine,
            const SizedBox(height: 12),
            logInButton(
              text: "Continue",
              function: () {
                if (emailErrorMsg == " ") {
                  log("forgot Password");
                }
              },
            )
          ],
        )
      ]),
    ));
  }
}
