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

  dynamicLinks.onLink.listen((dynamicLinkData) {
    data = dynamicLinkData;
    App.navigatorKey.currentContext!.goNamed(RouteNames.verifier);
    // final success = true;
    // if (success) {
    //   final prefs = await SharedPreferences.getInstance();
    //   await prefs.setBool('openedLink', true);
    //   if (await prefs.setBool('verified', true)) log("set");
    // } else {}
  });
  if (data != null) {
    App.navigatorKey.currentContext!.goNamed(RouteNames.verifier);
  }
}
