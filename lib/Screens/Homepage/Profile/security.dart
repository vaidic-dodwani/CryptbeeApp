// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:cryptbee/Config/api_integration.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/auth_heading.dart';
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
                          const SizedBox(
                            height: 28,
                            width: 28,
                            child: Icon(
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
                                GestureDetector(
                                  onTap: () {
                                    log("sup");
                                    if (!(User.phoneVerified ?? false)) {
                                      context.goNamed(RouteNames.phoneNumber);
                                    }
                                  },
                                  child: SizedBox(
                                    height: 61,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 18.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              authTitleSmallText(
                                                  "Two Factor Authentication"),
                                              User.phoneVerified ?? false
                                                  ? SizedBox(
                                                      height: 12,
                                                      child: Switch(
                                                        activeTrackColor:
                                                            Palette
                                                                .primaryColor,
                                                        activeColor:
                                                            Colors.white,
                                                        inactiveTrackColor:
                                                            Palette.neutralGrey,
                                                        value: ref.watch(
                                                            securitySwitchProvider),
                                                        onChanged: (status) {
                                                          securitySwitch
                                                              .toggle();
                                                          if (status) {
                                                            ApiCalls
                                                                .enableTwoFactor();
                                                          } else {
                                                            ApiCalls
                                                                .disableTwoFactor();
                                                          }
                                                          User.twoFactor =
                                                              status;
                                                        },
                                                      ),
                                                    )
                                                  : const Icon(
                                                      Icons.chevron_right_sharp,
                                                      color: Palette
                                                          .secondaryOffWhiteColor,
                                                    )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          height: 1,
                                        )
                                      ],
                                    ),
                                  ),
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
