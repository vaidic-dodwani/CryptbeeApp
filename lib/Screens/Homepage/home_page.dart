// ignore_for_file: use_build_context_synchronously

import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Utilities/api_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("HomePage"),
          ElevatedButton(
              onPressed: () async {
                await clearData();
                context.goNamed(RouteNames.signIn);
              },
              child: const Text("logout"))
        ],
      )),
    );
  }
}
