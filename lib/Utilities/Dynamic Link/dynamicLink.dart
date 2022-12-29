import 'package:cryptbee/Routing/route_names.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class App {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

Future<void> initDynamicLink() async {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  PendingDynamicLinkData? data = await dynamicLinks.getInitialLink();
  String email;
  String token;
  dynamicLinks.onLink.listen((dynamicLinkData) async {
    data = dynamicLinkData;

    // log("on listen ${data!.link}");
    // log("on listen${data!.link.queryParameters['email']}");
    // log("on listen${data!.link.queryParameters['token']!}");

    email = data!.link.queryParameters['email'] ?? 'somthing';
    token = data!.link.queryParameters['token'] ?? 'sample token';

    App.navigatorKey.currentContext!.goNamed(RouteNames.verifier, params: {
      'email': email.toString().toLowerCase(),
      'token': token.toString().toLowerCase()
    });
  });
  if (data != null) {
    email = data!.link.queryParameters['email'] ?? 'somthing';
    token = data!.link.queryParameters['token'] ?? 'sample token';
    App.navigatorKey.currentContext!.goNamed(RouteNames.verifier,
        params: {'email': email.toString(), 'token': token.toString()});
  }
}
