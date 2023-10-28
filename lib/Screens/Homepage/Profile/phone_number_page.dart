// ignore_for_file: use_build_context_synchronously

import 'package:cryptbee/Config/api_integration.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/auth_heading.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/form_errors.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/log_in_button.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/logo_with_name.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/mobile_text_area.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class PhoneNumberPage extends ConsumerWidget {
  PhoneNumberPage({super.key});

  final PhoneTextArea mobileNumberArea = PhoneTextArea(
    labelText: "Phone Number",
    hintText: "Enter Mobile Number",
    phoneNumberErrorNotifier: phoneNumberphoneErrorNotifier,
  );

  final ErrorLines mobileNumberError =
      ErrorLines(errorProvider: phoneNumberphoneErrorProvider);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorLines = ref.watch(phoneNumberphoneErrorProvider);
    return Scaffold(
      backgroundColor: Palette.secondaryBlackColor,
      body: SingleChildScrollView(
          child: Column(
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
          const SizedBox(height: 32),
          mobileNumberArea,
          const SizedBox(height: 4),
          mobileNumberError,
          const SizedBox(height: 12),
          LogInButton(
            text: "Continue",
            loaderProvider: phoneNumberButtonLoaderProvider,
            function: () async {
              if (errorLines == ' ') {
                phoneNumberButtonLoaderNotifier.toggle();
                final output = await ApiCalls.newTwoFactor(
                    mobileNumberArea.controller.text);

                if (output['statusCode'] == 201) {
                  context.goNamed(RouteNames.phoneNumberOTP, pathParameters: {
                    'phone_number': mobileNumberArea.controller.text
                  });
                } else {
                  phoneNumberphoneErrorNotifier
                      .setVal(output[output.keys.first][0]);
                }

                phoneNumberButtonLoaderNotifier.toggle();
              }
            },
          )
        ],
      )),
    );
  }
}
