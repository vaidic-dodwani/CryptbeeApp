import 'package:cryptbee/Utilities/utilities.dart';
import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Forget Password?",
            style: labelLarge(fontColor: Palette.primaryColor),
          ),
        ),
      ),
    );
  }
}
