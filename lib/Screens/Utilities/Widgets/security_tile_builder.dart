import 'dart:developer';

import 'package:cryptbee/Screens/Utilities/Widgets/auth_heading.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecurityTileBuilder extends StatelessWidget {
  final String text;
  final String? route;
  final void Function()? function;
  const SecurityTileBuilder(
      {super.key, required this.text, this.route, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function ??
          () {
            log("sup");

            if (route != null) {
              context.goNamed(route!);
            }
          },
      child: SizedBox(
        height: 61,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  authTitleSmallText(text),
                  const Icon(
                    Icons.chevron_right_sharp,
                    color: Palette.secondaryOffWhiteColor,
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}
