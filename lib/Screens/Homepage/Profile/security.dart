// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/auth_heading.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/log_in_button.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/security_tile_builder.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:cryptbee/Screens/Utilities/static_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Security extends ConsumerWidget {
  const Security({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Palette.secondaryBlackColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 38),
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 28,
                            width: 28,
                            child: const Icon(
                              Icons.chevron_left_sharp,
                              color: Palette.secondaryOffWhiteColor,
                            ),
                          ),
                          authTitleMediumText("Back")
                        ],
                      ),
                    ),
                    const SizedBox(height: 26),
                    Container(
                      width: MediaQuery.of(context).size.width - 32,
                      height: MediaQuery.of(context).size.height - 92,
                      decoration: const BoxDecoration(
                        color: Palette.neutralBlack,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 63),
                          authTitleLargeText("Security"),
                          const SizedBox(height: 34),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 24, horizontal: 16),
                            child: Column(
                              children: [
                                const SecurityTileBuilder(
                                  text: "Enable 2-factor authentication",
                                  route: RouteNames.personalDetails,
                                ),
                                const SecurityTileBuilder(
                                  text: "Change Password",
                                  route: RouteNames.changePassword,
                                ),
                                SecurityTileBuilder(
                                  text: "Logout",
                                  function: () async {
                                    log("asdad");
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.clear();
                                    App.isLoggedIn = false;
                                    context.goNamed(RouteNames.root);
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
