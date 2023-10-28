import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptbee/Models/coin_model.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/but_sell_button.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:cryptbee/Screens/Utilities/static_classes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WatchlistCoinTileBuilder extends StatelessWidget {
  final Coin coin;
  final int index;
  const WatchlistCoinTileBuilder(
      {super.key, required this.coin, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
      child: GestureDetector(
        onTap: () {
          App.currentCoin = coin.shortForm;
          context.goNamed(RouteNames.coinPage,
              pathParameters: {'shortName': coin.shortForm});
        },
        child: SizedBox(
          child: Container(
            height: 84,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Palette.secondaryBlackColor,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 32,
                  backgroundImage: CachedNetworkImageProvider(
                    coin.image,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  coin.fullName,
                                  style: TextStyle(
                                    fontSize: coin.fullName.length < 20
                                        ? coin.fullName.length < 15
                                            ? 18
                                            : 12
                                        : 10,
                                    color: Palette.secondaryOffWhiteColor,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  coin.shortForm,
                                  style: labelMedium(),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "₹ ${coin.price.toStringAsFixed(2)}",
                            style: bodyLarge(),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                coin.changePercent! > 0
                                    ? const Icon(Icons.arrow_upward_rounded,
                                        color: Palette.secondaryCorrectColor)
                                    : const Icon(Icons.arrow_downward_rounded,
                                        color: Palette.secondaryErrorColor),
                                Text(
                                  "${coin.changePercent!.toStringAsFixed(2)} %",
                                  style: bodyMedium(
                                      fontColor: coin.changePercent! > 0
                                          ? Palette.secondaryCorrectColor
                                          : Palette.secondaryErrorColor),
                                ),
                              ],
                            ),
                            User.panVerify ?? false
                                ? BuySellButton(
                                    text: "Buy",
                                    width: 112,
                                    function: () {
                                      App.watchlistIndex = index;
                                      App.currentCoin = coin.shortForm;
                                      watchlistPopupNotifier.toggle();
                                    },
                                  )
                                : Container(
                                    width: 112,
                                  )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
