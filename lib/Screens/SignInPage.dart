import 'package:cryptbee/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Utilities/SignInUpTabs.dart';
import 'package:cryptbee/Utilities/forgetPasswordButton.dart';
import 'package:cryptbee/Utilities/formErrors.dart';
import 'package:cryptbee/Utilities/logInButton.dart';
import 'package:cryptbee/Utilities/oAuthButton.dart';
import 'package:cryptbee/Utilities/emailTextArea.dart';
import 'package:cryptbee/Utilities/authHeading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Utilities/logoWithName.dart';
import '../Utilities/passwordTextArea.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  EmailTextArea emailField = EmailTextArea(
      labelText: "Email Address",
      hintText: "  Enter Email",
      emailErrorNotifier: signInEmailErrorNotifer);

  PasswordTextArea passwordField = PasswordTextArea(
    labelText: "Password",
    hintText: "  At least 8 characters.",
    passErrorNotifier: signInPasswordErrorNotifer,
  );
  ErrorLines emailError = ErrorLines(
    errorProvider: signInEmailErrorProvider,
  );
  ErrorLines passError = ErrorLines(
    errorProvider: signInPasswordErrorProvider,
    height: 32,
  );

  @override
  Widget build(BuildContext context) {
    final emailErrorMsg = ref.watch(signInEmailErrorProvider);
    final passErrorMsg = ref.watch(signInPasswordErrorProvider);
    final size = MediaQuery.of(context).size;
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
                logInButton(
                  text: "Login",
                  loaderProvider: signInButtonLoaderProvider,
                  function: () async {
                    if (emailErrorMsg == " " && passErrorMsg == " ") {
                      signInButtonLoaderNotifier.toggle();
                      Future.delayed(const Duration(milliseconds: 500), () {
                        signInButtonLoaderNotifier.toggle();
                      });
                    }
                  },
                ),
                const SizedBox(height: 20),
                authCenterText("Or Login With"),
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
