import 'package:cryptbee/Utilities/utilities.dart';
import 'package:flutter/material.dart';

class logInButton extends StatelessWidget {
  const logInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 48,
      child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor:
                const MaterialStatePropertyAll(Palette.primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          child: Text(
            "Login",
            style: titleMedium(),
          )),
    );
  }
}
