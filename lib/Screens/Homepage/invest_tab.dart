import 'dart:ffi';

import 'package:cryptbee/Screens/Homepage/Invest%20Pages/invest_tab_all.dart';
import 'package:cryptbee/Screens/Homepage/Invest%20Pages/invest_tab_my_holding.dart';
import 'package:cryptbee/Screens/Homepage/Invest%20Pages/invest_tab_watchlist.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/invest_tab_top_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InvestTab extends ConsumerWidget {
  const InvestTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final investTabIndex = ref.watch(investTopNavProvider);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        height: size.height,
        child: Column(
          children: [
            const InvestTabTopNav(),
            Expanded(child: investTabWidgets[investTabIndex]),
          ],
        ),
      ),
    );
  }
}

List<Widget> investTabWidgets = [
  const InvestTabAll(),
  InvestTabMyHoldings(),
  InvestTabWatchlist()
];
