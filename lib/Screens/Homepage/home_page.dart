// ignore_for_file: use_build_context_synchronously

import 'package:cryptbee/Screens/Homepage/Home%20Tabs/home_tab_no_pan.dart';
import 'package:cryptbee/Screens/Homepage/Home%20Tabs/home_tab_pan.dart';
import 'package:cryptbee/Screens/Homepage/Profile/profile_tab.dart';
import 'package:cryptbee/Screens/Homepage/wallet_tab.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/home_app_bar.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/home_bottom_nav.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:cryptbee/Screens/Utilities/static_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'invest_tab.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.secondaryBlackColor,
      appBar: homeAppBar(),
      body: Stack(
        children: [
          homePageWidgets[ref.watch(homeBottomNavProvider)],
          const HomeBottomNavBar(),
        ],
      ),
    );
  }
}

List<Widget> homePageWidgets = [
  if (User.panVerify ?? false) const HomeTabPan() else const HomeTabNoPan(),
  const InvestTab(),
  const WalletTab(),
  ProfileTab()
];
