import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';

import 'package:flutter/material.dart';

class OAuthButton extends StatelessWidget {
  const OAuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 48,
      child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor:
                const MaterialStatePropertyAll(Palette.neutralBlack),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assests/logo/google logo.png",
                height: 20,
                width: 20,
              ),
              Text(
                "Continue With Google",
                style: titleMedium(),
              ),
            ],
          )),
    );
  }
}
