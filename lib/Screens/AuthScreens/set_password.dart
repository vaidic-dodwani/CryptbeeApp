// ignore_for_file: use_build_context_synchronously

import 'package:cryptbee/Config/api_integration.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/auth_heading.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/form_errors.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/log_in_button.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/logo_with_name.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/password_text_area.dart';
import 'package:cryptbee/Config/api_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';

class SetPasswordPage extends ConsumerWidget {
  SetPasswordPage({super.key, required this.email, required this.otp});

  final String email;
  final String otp;
  final passArea = PasswordTextArea(
    labelText: "Password",
    hintText: "Atleast 8 characters",
    passErrorNotifier: setPassPasswordErrorNotifer,
  );

  final ErrorLines passErrorLines = ErrorLines(
    errorProvider: setPassPasswordErrorProvider,
    height: 35,
  );

  final confirmPassArea = PasswordTextArea(
    labelText: "Password",
    hintText: "Atleast 8 characters",
    passErrorNotifier: setPassConfirmPasswordErrorNotifer,
  );

  final ErrorLines confirmPassErrorLines = ErrorLines(
    errorProvider: setPassConfirmPasswordErrorProvider,
    height: 35,
  );
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assests/background.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Column(
              children: [
                const SizedBox(height: 38),
                const CenterLogo(),
                const SizedBox(height: 112),
                authHeading("Set Password"),
                const SizedBox(height: 44),
                passArea,
                const SizedBox(height: 4),
                passErrorLines,
                const SizedBox(height: 16),
                confirmPassArea,
                const SizedBox(height: 4),
                confirmPassErrorLines,
                const SizedBox(height: 12),
                LogInButton(
                  loaderProvider: setPassButtonLoaderProvider,
                  text: "Continue",
                  function: () async {
                    if (passArea.controller.text ==
                        confirmPassArea.controller.text) {
                      if (setPassPasswordErrorNotifer.valid) {
                        setPassButtonLoaderNotifier.toggle();
                        final response = await ApiCalls.resetPass(
                            email: email,
                            otp: otp,
                            password: passArea.controller.text);
                        setPassButtonLoaderNotifier.toggle();
                        if (response == noInternet) {
                          internetHandler(context);
                        } else if (response['statusCode'] == 200) {
                          ToastContext().init(context);
                          Toast.show("Password has been reset",
                              duration: 5, gravity: Toast.bottom);
                          context.goNamed(RouteNames.signIn);
                        } else {
                          setPassConfirmPasswordErrorNotifer
                              .setVal(response[response.keys.first][0]);
                        }
                      }
                    } else {
                      setPassConfirmPasswordErrorNotifer
                          .setVal("Passwords Dont Match");
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
