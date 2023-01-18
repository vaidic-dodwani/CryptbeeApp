// ignore_for_file: use_build_context_synchronously

import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Utilities/Widgets/home_app_bar.dart';
import 'package:cryptbee/Utilities/Widgets/home_bottom_nav.dart';
import 'package:cryptbee/Utilities/Widgets/utilities.dart';
import 'package:cryptbee/Utilities/api_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Palette.secondaryBlackColor,
      appBar: homeAppBar(),
      body: Stack(
        children: [
          Center(
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
          const HomeBottomNavBar(),
        ],
      ),
    );
  }
}
