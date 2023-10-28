// ignore_for_file: use_build_context_synchronously

import 'package:cryptbee/Config/api_integration.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/auth_heading.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/form_errors.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/log_in_button.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/password_text_area.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';

class ChangePassword extends ConsumerWidget {
  ChangePassword({super.key});

  final passArea = PasswordTextArea(
    labelText: "Old Password",
    hintText: "Atleast 8 characters",
    passErrorNotifier: changePasswordPasswordErrorNotifer,
  );

  final ErrorLines passErrorLines = ErrorLines(
    errorProvider: changePasswordPasswordErrorProvider,
    height: 35,
  );

  final confirmPassArea = PasswordTextArea(
    labelText: "New Password",
    hintText: "Atleast 8 characters",
    passErrorNotifier: changePasswordConfirmPasswordErrorNotifer,
  );

  final ErrorLines confirmPassErrorLines = ErrorLines(
    errorProvider: changePasswordConfirmPasswordErrorProvider,
    height: 35,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Palette.secondaryBlackColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 38),
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Row(
                        children: [
                          const SizedBox(
                            height: 28,
                            width: 28,
                            child: Icon(
                              Icons.chevron_left_sharp,
                              color: Palette.secondaryOffWhiteColor,
                            ),
                          ),
                          authTitleMediumText("Back")
                        ],
                      ),
                    ),
                    const SizedBox(height: 26),
                    Container(
                      width: MediaQuery.of(context).size.width - 32,
                      height: MediaQuery.of(context).size.height - 92,
                      decoration: const BoxDecoration(
                        color: Palette.neutralBlack,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 63),
                          authTitleLargeText("Change Password"),
                          const SizedBox(height: 32),
                          passArea,
                          passErrorLines,
                          const SizedBox(height: 16),
                          confirmPassArea,
                          confirmPassErrorLines,
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 48,
                                    child: LogInButton(
                                      loaderProvider:
                                          changePasswordEmailButtonLoaderProvider,
                                      text: "Save",
                                      function: () async {
                                        if (changePasswordPasswordErrorNotifer
                                                .valid &&
                                            changePasswordConfirmPasswordErrorNotifer
                                                .valid) {
                                          changePasswordEmailButtonLoaderNotifier
                                              .toggle();
                                          final output =
                                              await ApiCalls.changePassword(
                                                  passArea.controller.text,
                                                  confirmPassArea
                                                      .controller.text);
                                          changePasswordEmailButtonLoaderNotifier
                                              .toggle();

                                          if (output['statusCode'] == 200) {
                                            ToastContext().init(context);
                                            Toast.show("Changed Password",
                                                duration: 5,
                                                gravity: Toast.bottom);
                                            context.pop();
                                          } else {
                                            changePasswordConfirmPasswordErrorNotifer
                                                .setVal(
                                                    output[output.keys.first]
                                                        [0]);
                                          }
                                        } else {
                                          changePasswordConfirmPasswordErrorNotifer
                                              .setVal("Passwords Dont Match");
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 38,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
