// ignore_for_file: use_build_context_synchronously

import 'package:cryptbee/Screens/Homepage/profile_tab.dart';
import 'package:cryptbee/Screens/Homepage/wallet_tab.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/home_app_bar.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/home_bottom_nav.dart';
import 'package:cryptbee/Screens/Homepage/home_tab.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'invest_tab.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
  const HomeTab(),
  const InvestTab(),
  const WalletTab(),
  const ProfileTab()
];
