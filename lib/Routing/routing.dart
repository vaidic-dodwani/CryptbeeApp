import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/SignUpPage.dart';
import 'package:cryptbee/Screens/home.dart';
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
            child: home(),
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
      )
    ],
  );
}
