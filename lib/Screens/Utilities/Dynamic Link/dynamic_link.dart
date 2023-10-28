// ignore_for_file: use_build_context_synchronously

import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/Utilities/static_classes.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:go_router/go_router.dart';



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

    App.navigatorKey.currentContext!.goNamed(RouteNames.verifier, pathParameters: {
      'email': email.toString().toLowerCase(),
      'token': token.toString().toLowerCase()
    });
  });
  if (data != null) {
    email = data!.link.queryParameters['email'] ?? 'somthing';
    token = data!.link.queryParameters['token'] ?? 'sample token';
    App.navigatorKey.currentContext!.goNamed(RouteNames.verifier,
        pathParameters: {'email': email.toString(), 'token': token.toString()});
  }
}
