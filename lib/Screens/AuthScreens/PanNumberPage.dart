import 'package:cryptbee/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Utilities/Widgets/authHeading.dart';
import 'package:cryptbee/Utilities/Widgets/formErrors.dart';
import 'package:cryptbee/Utilities/Widgets/logInButton.dart';
import 'package:cryptbee/Utilities/Widgets/logoWithName.dart';
import 'package:cryptbee/Utilities/Widgets/nameTextArea.dart';
import 'package:cryptbee/Utilities/Widgets/panTextArea.dart';
import 'package:cryptbee/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PanNumberPage extends ConsumerStatefulWidget {
  const PanNumberPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PanNumberPageState();
}

class _PanNumberPageState extends ConsumerState<PanNumberPage> {
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
  Widget build(BuildContext context) {
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
                    logInButton(
                      text: "Continue",
                      width: 157,
                      function: () {
                        if (nameErrorMsg == " ") {
                          if (panErrorMsg == " ") {
                          } else if (panErrorMsg == "") {}
                        }
                      },
                    ),
                    Container(
                      width: 157,
                      child: Center(
                        child: Text(
                          "Skip",
                          style: titleMedium(),
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
