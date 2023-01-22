import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/auth_heading.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/log_in_button.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CoinPage extends ConsumerWidget {
  final String shortName;
  const CoinPage({super.key, required this.shortName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Palette.secondaryBlackColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
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
              )),
          const SizedBox(height: 29),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 19,
                backgroundImage: CachedNetworkImageProvider(
                  "https://www." "cryptocompare.com/media/37746251/btc.png",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  shortName,
                  style: titleLarge(),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 325,
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Prices", style: titleMedium()),
                Text("25.64", style: bodyLarge()),
                Row(
                  children: [
                    true
                        ? const Icon(Icons.arrow_upward_rounded,
                            color: Palette.secondaryCorrectColor)
                        : const Icon(Icons.arrow_downward_rounded,
                            color: Palette.secondaryErrorColor),
                    Text(
                      "per",
                      style: bodyLarge(
                          fontColor: true
                              ? Palette.secondaryCorrectColor
                              : Palette.secondaryErrorColor),
                    ),
                  ],
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(
                      true ? Icons.bookmark_border_sharp : Icons.bookmark_sharp,
                      color: Palette.secondaryOffWhiteColor,
                    ))
              ],
            ),
          ),
          const SizedBox(height: 16),
          authBodyLarge("About"),
          SizedBox(
            height: 148,
            child: SingleChildScrollView(
              child: Text(
                "LOREM Lomomad ada  asd a da da d w  wa adasasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdawda qqqdSD dsa  asdasda dadsasda dasdadwadasd adasdadwaddsdawdasd LOREM Lomomad ada  asd a da da d w  wa dsa  asdasda dadsasda dasdadwadasd adasdadwaddsdawdasd LOREM Lomomad ada  asd a da da d w  wa dsa  asdasda dadsasda dasdadwadasd adasdadwaddsdawdasd LOREM Lomomad ada  asd a da da d w  wa dsa  asdasda dadsasda dasdadwadasd adasdadwaddsdawdasd ",
                style: bodyLarge(),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: LogInButton(
                  text: "Buy Now",
                  function: () {
                    log("buying it huh?");
                  }),
            ),
          )
        ]),
      ),
    );
  }
}
