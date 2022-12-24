import 'package:cryptbee/Utilities/SignInUpTabs.dart';
import 'package:cryptbee/Utilities/forgetPasswordButton.dart';
import 'package:cryptbee/Utilities/logInButton.dart';
import 'package:cryptbee/Utilities/oAuthButton.dart';
import 'package:cryptbee/Utilities/textArea.dart';
import 'package:cryptbee/Utilities/authHeading.dart';
import 'package:flutter/material.dart';

import '../Utilities/logoWithName.dart';
import '../Utilities/passwordTextArea.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextArea emailField = TextArea(
    labelText: "Email Address",
    hintText: "Enter Email",
  );
  PasswordTextArea passwordField = PasswordTextArea(
    labelText: "Password",
    hintText: "At least 8 characters.",
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
                  choice: 0,
                ),
                const SizedBox(height: 36),
                authHeading("Welcome, Back"),
                const SizedBox(height: 24),
                emailField,
                const SizedBox(height: 32),
                passwordField,
                const SizedBox(height: 20),
                const ForgetPasswordButton(),
                const SizedBox(height: 16),
                const logInButton(),
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
