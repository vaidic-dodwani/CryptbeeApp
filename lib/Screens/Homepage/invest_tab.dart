import 'dart:developer';

import 'package:cryptbee/Config/api_integration.dart';
import 'package:cryptbee/Config/websocket_integration.dart';
import 'package:cryptbee/Models/coin_model.dart';
import 'package:cryptbee/Utilities/Widgets/invest_coin_tile_builder.dart';
import 'package:cryptbee/Utilities/Widgets/invest_tab_top_nav.dart';
import 'package:cryptbee/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InvestTab extends ConsumerWidget {
  const InvestTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allCoinsAsyncValue = ref.watch(allCoinsSocketProvider);
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(children: [
        const InvestTabTopNav(),
        Expanded(
          child: allCoinsAsyncValue.when(
            data: (data) {
              data = data['data'];
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ((index + 1) != (data.length))
                      ? investCoinTileBuilder(
                          Coin(
                              fullName: data[index]['FullName'],
                              shortForm: data[index]['Name'],
                              image: "https://www.${data[index]['ImageURL']}",
                              price: data[index]['Price'],
                              changePercent: data[index]['ChangePct']),
                        )
                      : Container(
                          height: 84,
                        );
                },
              );
            },
            error: (error, stackTrace) {
              return Center(
                  child: Text(
                error.toString(),
                style: headlineLarge(),
              ));
            },
            loading: () => const Center(
              child: CircularProgressIndicator(color: Palette.primaryColor),
            ),
          ),
        )
      ]),
    );
  }
}
