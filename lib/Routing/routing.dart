import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/AuthScreens/forget_pass_otp_page.dart';
import 'package:cryptbee/Screens/AuthScreens/forget_password_page.dart';
import 'package:cryptbee/Screens/AuthScreens/mobile_number_page.dart';
import 'package:cryptbee/Screens/AuthScreens/pan_number_page.dart';
import 'package:cryptbee/Screens/AuthScreens/set_password.dart';
import 'package:cryptbee/Screens/AuthScreens/sign_in_page.dart';
import 'package:cryptbee/Screens/AuthScreens/sign_up_page.dart';
import 'package:cryptbee/Screens/AuthScreens/two_factor_page.dart';
import 'package:cryptbee/Screens/AuthScreens/mail_opener.dart';
import 'package:cryptbee/Screens/AuthScreens/verification_checker.dart';
import 'package:cryptbee/Screens/Homepage/home_page.dart';
import 'package:cryptbee/Utilities/Dynamic%20Link/dynamic_link.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: App.navigatorKey,
    routes: [
      GoRoute(
        name: RouteNames.root,
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(
              child: App.isLoggedIn ? const HomePage() : const SignInPage());
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
                    routes: [
                      GoRoute(
                        name: RouteNames.forgetpassOTP,
                        path: 'forgetpassotp/:email',
                        pageBuilder: (context, state) {
                          return MaterialPage(
                            child: ForgetPassOtpPage(
                              email: state.params['email']!,
                            ),
                          );
                        },
                      ),
                      GoRoute(
                        name: RouteNames.setPassword,
                        path: 'setpassword/:email/:otp',
                        pageBuilder: (context, state) {
                          return MaterialPage(
                            child: SetPasswordPage(
                              email: state.params['email']!,
                              otp: state.params['otp']!,
                            ),
                          );
                        },
                      )
                    ]),
                GoRoute(
                  name: RouteNames.twoFactor,
                  path: 'twofactor',
                  pageBuilder: (context, state) {
                    return const MaterialPage(
                      child: TwoFactorPage(),
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
                path: 'mailopener/:email',
                pageBuilder: (context, state) {
                  return MaterialPage(
                    child: MailOpener(
                      email: state.params['email']!,
                    ),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            name: RouteNames.mobileNumber,
            path: 'mobilenumber',
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: MobileNumberPage(),
              );
            },
          ),
          GoRoute(
            name: RouteNames.panNumber,
            path: 'pannumber',
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: PanNumberPage(),
              );
            },
          ),
          GoRoute(
            name: RouteNames.verifier,
            path: 'verifier/:email/:token',
            pageBuilder: (context, state) {
              return MaterialPage(
                child: VerificationChecker(
                    email: state.params['email']!,
                    token: state.params['token']!),
              );
            },
          ),
          GoRoute(
            name: RouteNames.homePage,
            path: 'homepage',
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: HomePage(),
              );
            },
          ),
        ],
      ),
    ],
  );
}
