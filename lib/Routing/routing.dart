import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/ForgetPasswordPage.dart';
import 'package:cryptbee/Screens/MobileNumberPage.dart';
import 'package:cryptbee/Screens/SignUpPage.dart';
import 'package:cryptbee/Screens/onboarding.dart';
import 'package:cryptbee/Utilities/Dynamic%20Link/dynamicLink.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Screens/SignInPage.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: App.navigatorKey,
    routes: [
      GoRoute(
          name: RouteNames.onBoarding,
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: OnboardingPage(),
            );
          },
          routes: [
            GoRoute(
                name: RouteNames.signIn,
                path: 'signin',
                pageBuilder: (context, state) {
                  return const MaterialPage(
                    child: SignInPage(),
                  );
                },
                routes: [
                  GoRoute(
                    name: RouteNames.forgetPassword,
                    path: 'forgetpassword',
                    pageBuilder: (context, state) {
                      return const MaterialPage(
                        child: ForgetPasswordPage(),
                      );
                    },
                  ),
                ]),
            GoRoute(
              name: RouteNames.signUp,
              path: 'signup',
              pageBuilder: (context, state) {
                return const MaterialPage(
                  child: SignUpPage(),
                );
              },
            ),
          ]),
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
