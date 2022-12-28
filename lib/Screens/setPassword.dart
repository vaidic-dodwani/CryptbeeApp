import 'package:cryptbee/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Utilities/Widgets/authHeading.dart';
import 'package:cryptbee/Utilities/Widgets/formErrors.dart';
import 'package:cryptbee/Utilities/Widgets/logInButton.dart';
import 'package:cryptbee/Utilities/Widgets/logoWithName.dart';
import 'package:cryptbee/Utilities/Widgets/passwordTextArea.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetPasswordPage extends ConsumerStatefulWidget {
  const SetPasswordPage({super.key});

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
                  text: "Continue",
                  function: () {
                    if (confirmPassErrorMsg == " ") {
                      if (passArea.controller.text ==
                          confirmPassArea.controller.text) {
                      } else {
                        setPassConfirmPasswordErrorNotifer
                            .setVal("Passwords Dont Match");
                      }
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
