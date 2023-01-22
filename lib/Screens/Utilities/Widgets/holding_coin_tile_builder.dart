import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptbee/Models/coin_model.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';

Widget holdingCoinTileBuilder(Coin coin) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
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
                        "₹ ${coin.holding!.toStringAsFixed(2)}",
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
                            const Icon(Icons.money,
                                color: Palette.secondaryOffWhiteColor),
                            Text(
                              "${coin.price.toStringAsFixed(2)} %",
                              style: bodyMedium(
                                  fontColor: coin.price > 0
                                      ? Palette.secondaryCorrectColor
                                      : Palette.secondaryErrorColor),
                            ),
                          ],
                        ),
                        Row(children: [
                          Text(
                            "View More",
                            style: bodySmall(),
                          ),
                          const Icon(
                            Icons.chevron_right_sharp,
                            color: Colors.white,
                          )
                        ])
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
  );
}
