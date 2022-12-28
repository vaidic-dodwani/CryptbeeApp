import 'dart:developer';
import 'dart:ffi';

import 'package:cryptbee/Config/apiIntegration.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Utilities/Widgets/SignInUpTabs.dart';
import 'package:cryptbee/Utilities/Widgets/authHeading.dart';
import 'package:cryptbee/Utilities/Widgets/emailTextArea.dart';
import 'package:cryptbee/Utilities/Widgets/formErrors.dart';
import 'package:cryptbee/Utilities/Widgets/logInButton.dart';
import 'package:cryptbee/Utilities/Widgets/logoWithName.dart';
import 'package:cryptbee/Utilities/Widgets/oAuthButton.dart';
import 'package:cryptbee/Utilities/Widgets/passwordTextArea.dart';
import 'package:cryptbee/Utilities/apiFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  EmailTextArea emailField = EmailTextArea(
    labelText: "Email Address",
    hintText: "  Enter Email",
    emailErrorNotifier: signUpEmailErrorNotifer,
  );
  ErrorLines emailError = ErrorLines(
    errorProvider: signUpEmailErrorProvider,
    height: 35,
  );
  final passArea = PasswordTextArea(
    labelText: "Password",
    hintText: "Atleast 8 characters",
    passErrorNotifier: signUpPasswordErrorNotifer,
  );

  ErrorLines passErrorLines = ErrorLines(
    errorProvider: signUpPasswordErrorProvider,
    height: 35,
  );

  final confirmPassArea = PasswordTextArea(
    labelText: "Password",
    hintText: "Atleast 8 characters",
    passErrorNotifier: signUpConfirmPasswordErrorNotifer,
  );
  ErrorLines confirmPassErrorLines = ErrorLines(
    errorProvider: signUpConfirmPasswordErrorProvider,
    height: 35,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final emailErrorMsg = ref.watch(signUpEmailErrorProvider);
    final confirmPassErrorMsg = ref.watch(signUpConfirmPasswordErrorProvider);

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
              const SignInUpTabs(
                choice: 1,
              ),
              const SizedBox(height: 36),
              authHeading("Register Now"),
              const SizedBox(height: 24),
              emailField,
              emailError,
              const SizedBox(height: 16),
              passArea,
              passErrorLines,
              const SizedBox(height: 16),
              confirmPassArea,
              confirmPassErrorLines,
              const SizedBox(height: 12),
              logInButton(
                text: "Sign Up",
                loaderProvider: signUpEmailButtonLoaderProvider,
                function: () async {
                  if (!emailErrorMsg.contains('Password')) {
                    if (confirmPassErrorMsg == " ") {
                      if (passArea.controller.text ==
                          confirmPassArea.controller.text) {
                        signUpEmailButtonLoaderNotifier.toggle();
                        final response = await ApiCalls.signUp(
                            emailField.controller.text,
                            passArea.controller.text);
                        signUpEmailButtonLoaderNotifier.toggle();
                        if (response == noInternet) {
                          internetHandler(context);
                        } else if (response['statusCode'] == 200) {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setString('email', emailField.controller.text);
                          prefs.setString(
                              'password', confirmPassArea.controller.text);
                          context.goNamed(RouteNames.mailOpener);
                        } else {
                          if (true) {
                            signUpConfirmPasswordErrorNotifer
                                .setVal(response['messsage'][0].toString());
                          }
                        }
                      } else {
                        signUpConfirmPasswordErrorNotifer
                            .setVal("Passwords Dont Match");
                      }
                    }
                  }
                },
              ),
              const SizedBox(height: 20),
              authCenterText("Or Sign Up With"),
              const SizedBox(height: 20),
              const OAuthButton(),
            ],
          ),
        ]),
      ),
    );
  }
}
