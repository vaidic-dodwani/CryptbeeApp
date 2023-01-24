import 'package:cryptbee/Config/websocket_integration.dart';
import 'package:cryptbee/Models/coin_model.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/invest_coin_tile_builder.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InvestTabAll extends ConsumerWidget {
  const InvestTabAll({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allCoinsAsyncValue = ref.watch(allCoinsSocketProvider);
    return allCoinsAsyncValue.when(
      data: (data) {
        data = data['data'];
        return ListView.builder(
          itemCount: data.length + 1,
          itemBuilder: (context, index) {
            return ((index) != (data.length))
                ? InvestCoinTileBuilder(
                    coin: Coin(
                      fullName: data[index]['FullName'],
                      shortForm: data[index]['Name'],
                      image: "https://www.${data[index]['ImageURL']}",
                      price: data[index]['Price'],
                      changePercent: data[index]['ChangePct'],
                    ),
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
    );
  }
}
