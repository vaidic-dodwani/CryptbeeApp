import 'dart:developer';

import 'package:cryptbee/Config/apiIntegration.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Utilities/Widgets/utilities.dart';
import 'package:cryptbee/Utilities/apiFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class verificationChecker extends ConsumerStatefulWidget {
  final String email;
  final String pass;
  const verificationChecker(
      {super.key, required this.email, required this.pass});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _verificationCheckerState();
}

class _verificationCheckerState extends ConsumerState<verificationChecker> {
  @override
  Widget build(BuildContext context) {
    log("${widget.email} ${widget.pass}");
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "assests/background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Center(
          child: FutureBuilder(
            future: ApiCalls.verificationChecker(widget.email, widget.pass),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(
                  color: Palette.primaryColor,
                );
              } else if (snapshot.data == noInternet) {
                return Text(
                  "No Internet Detected",
                  style: titleLarge(),
                );
              } else if (snapshot.data['statusCode'] == 200) {
                context.goNamed(RouteNames.homePage);
                return Text(
                  "You Have Been Verified",
                  style: titleLarge(),
                );
              } else {
                return Text(
                  "Some Error Occured",
                  style: titleLarge(),
                );
              }
            },
          ),
        )
      ],
    ));
  }
}
