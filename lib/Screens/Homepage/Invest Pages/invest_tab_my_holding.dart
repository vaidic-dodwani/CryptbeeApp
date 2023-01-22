import 'dart:developer';

import 'package:cryptbee/Config/websocket_integration.dart';
import 'package:cryptbee/Models/coin_model.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/holding_coin_tile_builder.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/invest_coin_tile_builder.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InvestTabMyHoldings extends ConsumerWidget {
  const InvestTabMyHoldings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allCoinsAsyncValue = ref.watch(allCoinsSocketProvider);
    return allCoinsAsyncValue.when(
      data: (data) {
        data = data['holdings'];
        log(data.toString());
        return ListView.builder(
          itemCount: data.length + 1,
          itemBuilder: (context, index) {
            log("index $index           data length ${data.length}");
            return ((index) == (data.length))
                ? Container(
                    height: 84,
                  )
                : holdingCoinTileBuilder(
                    Coin(
                      fullName: data[index]['FullName'],
                      shortForm: data[index]['Name'],
                      image: "https://www.${data[index]['ImageURL']}",
                      price: double.parse(data[index]['Price']),
                      holding: double.parse(data[index]['Coins']),
                    ),
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
    );
  }
}
