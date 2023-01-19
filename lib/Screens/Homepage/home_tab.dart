// ignore_for_file: use_build_context_synchronously

import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Utilities/api_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Home"),
        ElevatedButton(
            onPressed: () async {
              await clearData();
              context.goNamed(RouteNames.signIn);
            },
            child: const Text("logout"))
      ],
    ));
  }
}
