import 'package:cryptbee/Config/apiIntegration.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Utilities/Widgets/authHeading.dart';
import 'package:cryptbee/Utilities/Widgets/formErrors.dart';
import 'package:cryptbee/Utilities/Widgets/logInButton.dart';
import 'package:cryptbee/Utilities/Widgets/logoWithName.dart';
import 'package:cryptbee/Utilities/Widgets/passwordTextArea.dart';
import 'package:cryptbee/Utilities/apiFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';

class SetPasswordPage extends ConsumerStatefulWidget {
  final String email;
  final String otp;
  const SetPasswordPage({super.key, required this.email, required this.otp});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SetPasswordPageState();
}

class _SetPasswordPageState extends ConsumerState<SetPasswordPage> {
  final passArea = PasswordTextArea(
    labelText: "Password",
    hintText: "Atleast 8 characters",
    passErrorNotifier: setPassPasswordErrorNotifer,
  );

  ErrorLines passErrorLines = ErrorLines(
    errorProvider: setPassPasswordErrorProvider,
    height: 35,
  );

  final confirmPassArea = PasswordTextArea(
    labelText: "Password",
    hintText: "Atleast 8 characters",
    passErrorNotifier: setPassConfirmPasswordErrorNotifer,
  );
  ErrorLines confirmPassErrorLines = ErrorLines(
    errorProvider: setPassConfirmPasswordErrorProvider,
    height: 35,
  );
  @override
  Widget build(BuildContext context) {
    final confirmPassErrorMsg = ref.watch(setPassConfirmPasswordErrorProvider);

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
                logInButton(
                  loaderProvider: setPassButtonLoaderProvider,
                  text: "Continue",
                  function: () async {
                    if (passArea.controller.text ==
                        confirmPassArea.controller.text) {
                      if (confirmPassErrorMsg
                              .toLowerCase()
                              .contains('password') ||
                          confirmPassErrorMsg == " ") {
                        setPassButtonLoaderNotifier.toggle();
                        final response = await ApiCalls.resetPass(
                            email: widget.email,
                            otp: widget.otp,
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
