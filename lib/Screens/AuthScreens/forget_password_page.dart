// ignore_for_file: use_build_context_synchronously

import 'package:cryptbee/Config/api_integration.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/auth_heading.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/email_text_area.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/form_errors.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/log_in_button.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/logo_with_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordPage extends ConsumerWidget {
  ForgetPasswordPage({super.key});

  final EmailTextArea emailTextArea = EmailTextArea(
    labelText: "Email Address",
    hintText: "Enter Email",
    emailErrorNotifier: forgetPassSignUpEmailErrorNotifer,
  );

  final ErrorLines emailErrorLine = ErrorLines(
    errorProvider: forgetPassSignUpEmailErrorProvider,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            authCenterText("Don't worry, it happens to the best of us."),
            const SizedBox(height: 40),
            emailTextArea,
            const SizedBox(height: 4),
            emailErrorLine,
            const SizedBox(height: 12),
            LogInButton(
              loaderProvider: forgetPassButtonLoaderProvider,
              text: "Continue",
              function: () async {
                if (forgetPassSignUpEmailErrorNotifer.valid) {
                  forgetPassButtonLoaderNotifier.toggle();

                  final response = await ApiCalls.sendEmailOTP(
                      email: emailTextArea.controller.text);
                  forgetPassButtonLoaderNotifier.toggle();
                  if (response['statusCode'] == 200) {
                    context.goNamed(RouteNames.forgetpassOTP,
                        pathParameters: {'email': emailTextArea.controller.text});
                  } else {
                    forgetPassSignUpEmailErrorNotifer
                        .setVal(response[response.keys.first][0]);
                  }
                }
              },
            )
          ],
        )
      ]),
    ));
  }
}
