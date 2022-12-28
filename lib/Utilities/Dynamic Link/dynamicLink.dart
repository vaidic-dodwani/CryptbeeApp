import 'dart:developer';

import 'package:cryptbee/Routing/route_names.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

Future<void> initDynamicLink() async {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  PendingDynamicLinkData? data = await dynamicLinks.getInitialLink();
  String? email;
  String? pass;
  dynamicLinks.onLink.listen((dynamicLinkData) async {
    data = dynamicLinkData;
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    pass = prefs.getString('password');

    log(data!.link.toString());
    log(data!.link.queryParameters['id']!);
    log(data!.link.queryParameters['token']!);

    App.navigatorKey.currentContext!.goNamed(RouteNames.verifier,
        params: {'email': email.toString(), 'pass': pass.toString()});
  });
  if (data != null) {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    pass = prefs.getString('password');
    App.navigatorKey.currentContext!.goNamed(RouteNames.verifier,
        params: {'email': email.toString(), 'pass': pass.toString()});
  }
}
