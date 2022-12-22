import 'package:cryptbee/Utilities/SignInUpTabs.dart';
import 'package:flutter/material.dart';

import '../Utilities/logo_with_name.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            CenterLogo(),
            SizedBox(height: 40),
            SignInUpTabs(
              choice: 1,
            )
          ],
        ),
      ),
    );
  }
}
