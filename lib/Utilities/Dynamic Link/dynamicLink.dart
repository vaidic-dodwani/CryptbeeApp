import 'dart:developer';

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

    App.navigatorKey.currentContext!
        .goNamed(RouteNames.verifier, params: {'id': "opened"});
  });
  if (data != null) {
    log(data!.link.query);
    App.navigatorKey.currentContext!
        .goNamed(RouteNames.verifier, params: {'id': "dead"});
  }
}
