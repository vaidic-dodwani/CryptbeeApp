import 'package:cryptbee/Models/coin_model.dart';
import 'package:cryptbee/Utilities/Widgets/invest_coin_tile_builder.dart';
import 'package:cryptbee/Utilities/Widgets/invest_tab_top_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InvestTab extends ConsumerWidget {
  const InvestTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(children: [
        const InvestTabTopNav(),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return index + 1 != 10
                  ? investCoinTileBuilder(
                      Coin(
                          fullName: "Bitcoin",
                          shortForm: "Btx",
                          image:
                              "https://www.cryptocompare.com/media/37746235/ada.png",
                          price: 10.0205554,
                          changePercent: -1.51611651),
                    )
                  : Container(
                      height: 84,
                    );
            },
          ),
        )
      ]),
    );
  }
}
