// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptbee/Config/api_integration.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/auth_heading.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/form_errors.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/log_in_button.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/name_text_area.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/pan_text_area.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:cryptbee/Config/api_functions.dart';
import 'package:cryptbee/Screens/Utilities/static_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';

class ProfilePan extends ConsumerWidget {
  ProfilePan({super.key});
  final nameArea = NameTextArea(
    labelText: "Full Name",
    hintText: "Enter Full Name",
    nameErrorNotifier: profilePanNameErrorNotifier,
    defaultControllerText: User.name,
  );

  final nameErrorLines = ErrorLines(
    errorProvider: profilePanNameErrorProvider,
  );

  final panArea = PanTextArea(
    labelText: "Pan Card Number",
    hintText: "Enter Pan Card Number",
    panErrorNotifier: profilePanPanErrorNotifier,
    defaultControllerText: User.pan,
  );

  final panErrorLines = ErrorLines(
    errorProvider: profilePanPanErrorProvider,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameErrorMsg = ref.watch(profilePanNameErrorProvider);
    final panErrorMsg = ref.watch(profilePanPanErrorProvider);

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
                          authTitleLargeText("Personal Details"),
                          const SizedBox(height: 27),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 58,
                            backgroundImage: CachedNetworkImageProvider(
                              ref.watch(profilePhotoProvider) ?? User.photo,
                            ),
                          ),
                          const SizedBox(height: 29),
                          authlabelMedium(
                            "We get your personal information from the verification process"),
                          const SizedBox(height: 44),
                          nameArea,
                          nameErrorLines,
                          const SizedBox(height: 16),
                          panArea,
                          panErrorLines,
                          const SizedBox(height: 12),
                          Center(
                            child: SizedBox(
                              height: 48,
                              child: LogInButton(
                                text: "Save",
                                function: () async {
                                  ToastContext().init(context);
                                  if (!(nameErrorMsg == "" &&
                                      panErrorMsg == "")) {
                                    if (nameErrorMsg != "Enter Valid Name") {
                                      if (panErrorMsg != "Invalid Pan Number") {
                                        final response =
                                            await ApiCalls.panVerify(
                                                email: User.email,
                                                pan: panArea.controller.text,
                                                name: nameArea.controller.text);

                                        if (response == noInternet) {
                                          internetHandler(context);
                                        } else if (response['statusCode'] ==
                                            200) {
                                          Toast.show(
                                              "Successfully Updated Details",
                                              duration: 5,
                                              gravity: Toast.bottom);
                                          context.pop();
                                        } else {
                                          Toast.show(
                                              response[response.keys.first][0],
                                              duration: 5,
                                              gravity: Toast.bottom);
                                        }
                                      }
                                    }
                                  } else {
                                    panNumberPanErrorNotifier.setVal(
                                        "Enter either Name or Pan to Proceed");
                                  }
                                },
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
