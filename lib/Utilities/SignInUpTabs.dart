import 'package:cryptbee/Utilities/utilities.dart';
import 'package:flutter/material.dart';

class SignInUpTabs extends StatelessWidget {
  const SignInUpTabs({super.key, required this.choice});
  final int choice;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 44,
          width: 156,
          decoration: BoxDecoration(
              color: choice == 0 ? Palette.neutralBlack : Colors.transparent,
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(
              "Sign In",
              style: titleSmall(fontColor: Palette.secondaryOffWhiteColor),
            ),
          ),
        ),
        Container(
          height: 44,
          width: 156,
          decoration: BoxDecoration(
              color: choice == 1 ? Palette.neutralBlack : Colors.transparent,
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(
              "Sign Up",
              style: titleSmall(fontColor: Palette.secondaryOffWhiteColor),
            ),
          ),
        )
      ],
    );
  }
}
