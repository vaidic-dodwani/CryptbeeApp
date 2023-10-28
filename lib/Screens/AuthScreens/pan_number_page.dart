// ignore_for_file: use_build_context_synchronously

import 'package:cryptbee/Config/api_integration.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/auth_heading.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/form_errors.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/log_in_button.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/logo_with_name.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/name_text_area.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/pan_text_area.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:cryptbee/Config/api_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';

class PanNumberPage extends ConsumerWidget {
  final String email;
  PanNumberPage({super.key, required this.email});
  final nameArea = NameTextArea(
    labelText: "Full Name",
    hintText: "Enter Full Name",
    nameErrorNotifier: panNumberNameErrorNotifier,
  );

  final nameErrorLines = ErrorLines(
    errorProvider: panNumberNameErrorProvider,
  );

  final panArea = PanTextArea(
    labelText: "Pan Card Number",
    hintText: "Enter Pan Card Number",
    panErrorNotifier: panNumberPanErrorNotifier,
  );

  final panErrorLines = ErrorLines(
    errorProvider: panNumberPanErrorProvider,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameErrorMsg = ref.watch(panNumberNameErrorProvider);
    final panErrorMsg = ref.watch(panNumberPanErrorProvider);
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
                const SizedBox(height: 84),
                authTitleLargeText("Enter Personal Details"),
                const SizedBox(height: 19),
                authCenterText("Verify Pan Number To Trade"),
                const SizedBox(height: 44),
                nameArea,
                nameErrorLines,
                const SizedBox(height: 16),
                panArea,
                panErrorLines,
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LogInButton(
                      text: "Continue",
                      width: 157,
                      function: () async {
                        ToastContext().init(context);
                        if (!(nameErrorMsg == "" && panErrorMsg == "")) {
                          if (nameErrorMsg != "Enter Valid Name") {
                            if (panErrorMsg != "Invalid Pan Number") {
                              final response = await ApiCalls.panVerify(
                                  email: email,
                                  pan: panArea.controller.text,
                                  name: nameArea.controller.text);

                              if (response == noInternet) {
                                internetHandler(context);
                              } else if (response['statusCode'] == 200) {
                                Toast.show("Successfully Updated Details",
                                    duration: 5, gravity: Toast.bottom);
                                await ApiCalls.getUserDetails();
                                await appInstanceInit();
                                context.goNamed(RouteNames.root);
                              } else {
                                Toast.show(response[response.keys.first][0],
                                    duration: 5, gravity: Toast.bottom);
                              }
                            }
                          }
                        } else {
                          panNumberPanErrorNotifier
                              .setVal("Enter either Name or Pan to Proceed");
                        }
                      },
                    ),
                    SizedBox(
                      width: 157,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            context.goNamed(RouteNames.root);
                          },
                          child: Text(
                            "Skip",
                            style: titleMedium(),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
