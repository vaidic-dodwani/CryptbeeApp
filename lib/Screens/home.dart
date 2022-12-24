import 'dart:developer';

import 'package:cryptbee/Routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text("root"),
          ElevatedButton(
              onPressed: () {
                context.goNamed(RouteNames.signIn);
                log("sigin");
              },
              child: Text("Sign IN"))
        ],
      )),
    );
  }
}
