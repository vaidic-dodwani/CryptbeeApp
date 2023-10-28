// ignore_for_file: use_build_context_synchronously

import 'package:cryptbee/Config/api_integration.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/auth_heading.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/email_text_area.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/forget_password_button.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/form_errors.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/log_in_button.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/logo_with_name.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/password_text_area.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/sign_in_up_tabs.dart';
import 'package:cryptbee/Config/api_functions.dart';
import 'package:cryptbee/Screens/Utilities/static_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends ConsumerWidget {
  SignInPage({super.key});

  final EmailTextArea emailField = EmailTextArea(
      labelText: "Email Address",
      hintText: "Enter Email",
      emailErrorNotifier: signInEmailErrorNotifer);

  final PasswordTextArea passwordField = PasswordTextArea(
    labelText: "Password",
    hintText: "  At least 8 characters.",
    passErrorNotifier: signInPasswordErrorNotifer,
  );
  final ErrorLines emailError = ErrorLines(
    errorProvider: signInEmailErrorProvider,
  );
  final ErrorLines passError = ErrorLines(
    errorProvider: signInPasswordErrorProvider,
    height: 32,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(children: [
          Image.asset(
            "assests/background.png",
            height: size.height,
            width: size.width,
          ),
          Column(
            children: [
              const SizedBox(height: 38),
              const CenterLogo(),
              const SizedBox(height: 40),
              const SignInUpTabs(choice: 0),
              const SizedBox(height: 36),
              authHeading("Welcome, Back"),
              const SizedBox(height: 24),
              emailField,
              const SizedBox(height: 4),
              emailError,
              const SizedBox(height: 12),
              passwordField,
              const SizedBox(height: 4),
              passError,
              const ForgetPasswordButton(),
              const SizedBox(height: 16),
              LogInButton(
                text: "Login",
                loaderProvider: signInButtonLoaderProvider,
                function: () async {
                  if (signInEmailErrorNotifer.valid &&
                      signInPasswordErrorNotifer.valid) {
                    signInButtonLoaderNotifier.toggle();
                    final response = await ApiCalls.signIn(
                        email: emailField.controller.text,
                        password: passwordField.controller.text);
                    signInButtonLoaderNotifier.toggle();
                    if (response == noInternet) {
                      internetHandler(context);
                    } else {
                      if (response['statusCode'] == 200) {
                        User.email = emailField.controller.text.toLowerCase();
                        response['email'] =
                            emailField.controller.text.toLowerCase();
                        await saveData(response, false);

                        if (response['two_factor']) {
                          context.goNamed(RouteNames.twoFactor);
                        } else {
                          await ApiCalls.getUserDetails();

                          context.goNamed(RouteNames.homePage);
                        }
                      } else {
                        signInPasswordErrorNotifer
                            .setVal(response[response.keys.first][0]);
                      }
                    }
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ]),
      ),
    );
  }
}
