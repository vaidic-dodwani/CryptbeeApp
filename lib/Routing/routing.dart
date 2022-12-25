import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/ForgetPasswordPage.dart';
import 'package:cryptbee/Screens/MobileNumberPage.dart';
import 'package:cryptbee/Screens/SetPasswordPage.dart';
import 'package:cryptbee/Screens/SignUpPage.dart';
import 'package:cryptbee/Screens/home.dart';
import 'package:cryptbee/Screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Screens/SignInPage.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: MobileNumberPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.onBoarding,
        path: '/onboarding',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: OnboardingPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.signIn,
        path: '/signin',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SignInPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.signUp,
        path: '/signup',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SignUpPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.setPassword,
        path: '/setpassword',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SetPasswordPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.forgetPassword,
        path: '/forgetpassword',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: ForgetPasswordPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.mobileNumber,
        path: '/mobilenumber',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: MobileNumberPage(),
          );
        },
      ),
    ],
  );
}
