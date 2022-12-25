import 'package:cryptbee/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Utilities/formErrors.dart';
import 'package:cryptbee/Utilities/passwordTextArea.dart';
import 'package:cryptbee/Utilities/emailTextArea.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Utilities/SignInUpTabs.dart';
import '../Utilities/authHeading.dart';
import '../Utilities/logInButton.dart';
import '../Utilities/logoWithName.dart';
import '../Utilities/oAuthButton.dart';

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
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final emailErrorMsg = ref.watch(signUpEmailErrorProvider);

    return SafeArea(
      child: Scaffold(
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
                const CenterLogo(),
                const SizedBox(height: 40),
                const SignInUpTabs(
                  choice: 1,
                ),
                const SizedBox(height: 36),
                authHeading("Register Now"),
                const SizedBox(height: 24),
                emailField,
                const SizedBox(height: 4),
                emailError,
                const SizedBox(height: 12),
                logInButton(
                  text: "Sign Up",
                  loaderProvider: signUpEmailButtonLoaderProvider,
                  function: () async {
                    if (emailErrorMsg == " ") {
                      signUpEmailButtonLoaderNotifier.toggle();
                      Future.delayed(const Duration(milliseconds: 500), () {
                        signUpEmailButtonLoaderNotifier.toggle();
                      });
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
      ),
    );
  }
}
