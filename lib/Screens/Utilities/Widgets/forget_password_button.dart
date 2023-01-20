import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(RouteNames.forgetPassword);
      },
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
