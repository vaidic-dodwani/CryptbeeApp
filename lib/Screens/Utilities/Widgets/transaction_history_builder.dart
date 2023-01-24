// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:developer';

import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionHistoryBuilder extends ConsumerWidget {
  final String history;
  String activity;
  String quantity;
  String shortName;
  String monthDate;
  String year;
  String price;
  TransactionHistoryBuilder({super.key, required this.history})
      : activity = history.split('_')[0],
        quantity = history.split('_')[1],
        shortName = history.split('_')[2],
        monthDate = history.split('_')[4].split('; ')[0],
        year = history.split('_')[4].split('; ')[1],
        price = history.split('_')[7];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log("${activity} ${quantity} ${shortName} ${monthDate} ${year} ${price}");
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 58,
        decoration: const BoxDecoration(
          color: Palette.neutralBlack,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset(
                activity == 'Bought'
                    ? "assests/illustrations/bought_icon.svg"
                    : "assests/illustrations/sold_icon.svg",
                height: 31,
                width: 31,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "₹ $price",
                    style:
                        bodyMedium(fontColor: Palette.secondaryOffWhiteColor),
                  ),
                  Text(
                    "$quantity $shortName",
                    style: bodyMedium(fontColor: Palette.neutralGrey),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  activity,
                  style: bodyMedium(fontColor: Palette.secondaryOffWhiteColor),
                ),
                Text("$monthDate, $year",
                    style: bodyMedium(
                      fontColor: Palette.neutralGrey,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
