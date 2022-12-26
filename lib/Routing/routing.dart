import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/ForgetPasswordPage.dart';
import 'package:cryptbee/Screens/MobileNumberPage.dart';
import 'package:cryptbee/Screens/SignUpPage.dart';
import 'package:cryptbee/Screens/mailOpener.dart';
import 'package:cryptbee/Screens/onboarding.dart';
import 'package:cryptbee/Screens/verificationChecker.dart';
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
                routes: [
                  GoRoute(
                    name: RouteNames.mailOpener,
                    path: '/mailopener',
                    pageBuilder: (context, state) {
                      return const MaterialPage(
                        child: MailOpener(),
                      );
                    },
                  ),
                ]),
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
      GoRoute(
        name: RouteNames.verifier,
        path: '/verifier/:id',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: verificationChecker(id: state.params['id']!),
          );
        },
      ),
    ],
  );
}
