import 'package:cryptbee/Routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class tester extends StatelessWidget {
  const tester({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.goNamed(RouteNames.onBoarding);
                },
                child: const Text("Go To Onboarding")),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(RouteNames.signIn);
                },
                child: const Text("Go To SignIN")),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(RouteNames.signUp);
                },
                child: const Text("Go To SignUp")),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(RouteNames.forgetPassword);
                },
                child: const Text("Go To forgetPass")),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(RouteNames.twoFactor);
                },
                child: const Text("Go To 2FA")),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(RouteNames.mobileNumber);
                },
                child: const Text("Go To mobile")),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(RouteNames.mailOpener);
                },
                child: const Text("Go To mailOpener")),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(RouteNames.panNumber);
                },
                child: const Text("Go To panNumber")),
          ],
        ),
      ),
    );
  }
}
