import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/AuthScreens/ForgetPasswordPage.dart';
import 'package:cryptbee/Screens/AuthScreens/MobileNumberPage.dart';
import 'package:cryptbee/Screens/AuthScreens/PanNumberPage.dart';
import 'package:cryptbee/Screens/AuthScreens/SignInPage.dart';
import 'package:cryptbee/Screens/AuthScreens/SignUpPage.dart';
import 'package:cryptbee/Screens/AuthScreens/TwoFactorPage.dart';
import 'package:cryptbee/Screens/AuthScreens/mailOpener.dart';
import 'package:cryptbee/Screens/AuthScreens/onboarding.dart';
import 'package:cryptbee/Screens/AuthScreens/verificationChecker.dart';
import 'package:cryptbee/Screens/Homepage/homePage.dart';
import 'package:cryptbee/Screens/setPassword.dart';
import 'package:cryptbee/Screens/tester.dart';

import 'package:cryptbee/Utilities/Dynamic%20Link/dynamicLink.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: App.navigatorKey,
    routes: [
      GoRoute(
        name: RouteNames.tester,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: tester(),
          );
        },
        routes: [
          GoRoute(
              name: RouteNames.onBoarding,
              path: 'onboarding',
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
                          routes: [
                            GoRoute(
                              name: RouteNames.setPassword,
                              path: 'setpassword',
                              pageBuilder: (context, state) {
                                return const MaterialPage(
                                  child: SetPasswordPage(),
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
                      path: 'mailopener',
                      pageBuilder: (context, state) {
                        return const MaterialPage(
                          child: MailOpener(),
                        );
                      },
                    ),
                  ],
                ),
              ]),
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
                child: verificationChecker(
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

      // GoRoute(
      //     name: RouteNames.onBoarding,
      //     path: '/',
      //     pageBuilder: (context, state) {
      //       return const MaterialPage(
      //         child: OnboardingPage(),
      //       );
      //     },
      //     routes: [
      //       GoRoute(
      //           name: RouteNames.signIn,
      //           path: 'signin',
      //           pageBuilder: (context, state) {
      //             return const MaterialPage(
      //               child: SignInPage(),
      //             );
      //           },
      //           routes: [
      //             GoRoute(
      //               name: RouteNames.forgetPassword,
      //               path: 'forgetpassword',
      //               pageBuilder: (context, state) {
      //                 return const MaterialPage(
      //                   child: ForgetPasswordPage(),
      //                 );
      //               },
      //             ),
      //             GoRoute(
      //               name: RouteNames.twoFactor,
      //               path: 'twofactor',
      //               pageBuilder: (context, state) {
      //                 return const MaterialPage(
      //                   child: TwoFactorPage(),
      //                 );
      //               },
      //             ),
      //           ]),
      //       GoRoute(
      //         name: RouteNames.signUp,
      //         path: 'signup',
      //         pageBuilder: (context, state) {
      //           return const MaterialPage(
      //             child: SignUpPage(),
      //           );
      //         },
      //         routes: [
      //           GoRoute(
      //             name: RouteNames.mailOpener,
      //             path: 'mailopener',
      //             pageBuilder: (context, state) {
      //               return const MaterialPage(
      //                 child: MailOpener(),
      //               );
      //             },
      //           ),
      //         ],
      //       ),
      //     ]),
      // GoRoute(
      //   name: RouteNames.mobileNumber,
      //   path: '/mobilenumber',
      //   pageBuilder: (context, state) {
      //     return const MaterialPage(
      //       child: MobileNumberPage(),
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RouteNames.panNumber,
      //   path: '/pannumber',
      //   pageBuilder: (context, state) {
      //     return const MaterialPage(
      //       child: PanNumberPage(),
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RouteNames.verifier,
      //   path: '/verifier/:id',
      //   pageBuilder: (context, state) {
      //     return MaterialPage(
      //       child: verificationChecker(id: state.params['id']!),
      //     );
      //   },
      // ),