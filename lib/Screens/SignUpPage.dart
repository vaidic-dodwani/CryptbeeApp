import 'package:cryptbee/Utilities/passwordTextArea.dart';
import 'package:cryptbee/Utilities/emailTextArea.dart';
import 'package:flutter/material.dart';
import '../Utilities/SignInUpTabs.dart';
import '../Utilities/authHeading.dart';
import '../Utilities/forgetPasswordButton.dart';
import '../Utilities/logInButton.dart';
import '../Utilities/logoWithName.dart';
import '../Utilities/oAuthButton.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  EmailTextArea emailField = EmailTextArea(
    labelText: "Email Address",
    hintText: "  Enter Email",
  );
  PasswordTextArea passwordField = PasswordTextArea(
    labelText: "Password",
    hintText: "  At least 8 characters.",
  );
  PasswordTextArea confirmPasswordField = PasswordTextArea(
    labelText: "Password",
    hintText: "  At least 8 characters.",
  );
  @override
  Widget build(BuildContext context) {
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
                const SignInUpTabs(
                  choice: 1,
                ),
                const SizedBox(height: 36),
                authHeading("Register Now"),
                const SizedBox(height: 24),
                emailField,
                const SizedBox(height: 32),
                passwordField,
                const SizedBox(height: 32),
                confirmPasswordField,
                const SizedBox(height: 20),
                const ForgetPasswordButton(),
                const SizedBox(height: 16),
                logInButton(),
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
