import 'package:cryptbee/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Utilities/Widgets/authHeading.dart';
import 'package:cryptbee/Utilities/Widgets/formErrors.dart';
import 'package:cryptbee/Utilities/Widgets/logInButton.dart';
import 'package:cryptbee/Utilities/Widgets/logoWithName.dart';
import 'package:cryptbee/Utilities/Widgets/mobileTextArea.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MobileNumberPage extends StatefulWidget {
  const MobileNumberPage({super.key});

  @override
  State<MobileNumberPage> createState() => _MobileNumberPageState();
}

class _MobileNumberPageState extends State<MobileNumberPage> {
  final MobileTextArea mobileNumberArea = MobileTextArea(
    labelText: "Mobile Number",
    hintText: "Enter Mobile Number",
    mobileNumberErrorNotifier: mobileNumberMobileErrorNotifier,
  );

  final ErrorLines mobileNumberError =
      ErrorLines(errorProvider: mobileNumberMobileErrorProvider);

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
              const SizedBox(height: 49),
              SvgPicture.asset(
                "assests/illustrations/mobile_page_illustration.svg",
                height: 246,
                width: 328,
              ),
              const SizedBox(height: 28),
              authHeading("Verify With Mobile Number"),
              SizedBox(height: 32),
              mobileNumberArea,
              SizedBox(height: 4),
              mobileNumberError,
              const SizedBox(height: 12),
              logInButton(text: "Continue")
            ],
          )
        ],
      )),
    );
  }
}
