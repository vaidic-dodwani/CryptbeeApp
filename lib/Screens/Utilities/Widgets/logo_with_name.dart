import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CenterLogo extends StatelessWidget {
  const CenterLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SvgPicture.asset(
            "assests/logo/logo.svg",
            width: 24,
            height: 24,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text("CryptBee",
              style: titleMedium(fontColor: Palette.primaryColor)),
        )
      ],
    );
  }
}
