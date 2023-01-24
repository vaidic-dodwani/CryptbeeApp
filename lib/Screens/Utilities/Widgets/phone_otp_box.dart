import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_classes.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/log_in_button.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

class PhoneOtpBox extends ConsumerWidget {
  final pinController = TextEditingController();
  final void Function(int)? buttonFunction;
  final AutoDisposeStateNotifierProvider<ButtonLoaderNotifier, bool>?
      loaderProvider;

  final String sentAt;
  PhoneOtpBox(
      {super.key,
      this.buttonFunction,
      this.loaderProvider,
      this.sentAt = 'mobile number'});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        height: 440,
        decoration: BoxDecoration(
            color: Palette.neutralBlack,
            border: Border.all(
              color: Palette.primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 96),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Check For OTP",
                  style: titleLarge(),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter The OTP",
                  style: titleSmall(),
                ),
              ),
              const SizedBox(height: 24),
              Pinput(
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                onCompleted: (value) {
                  if (buttonFunction != null) {
                    buttonFunction!(int.parse(value));
                  }
                },
                length: 4,
                controller: pinController,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                followingPinTheme: followingPinTheme,
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 24),
              LogInButton(
                  loaderProvider: loaderProvider,
                  text: "Verify",
                  function: () {
                    if (pinController.text.length >= 4) {
                      if (buttonFunction != null) {
                        buttonFunction!(int.parse(pinController.text));
                      }
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

final defaultPinTheme = PinTheme(
  height: 56,
  width: 56,
  textStyle: titleMedium(),
  decoration: const BoxDecoration(
    border: Border(bottom: BorderSide(width: 1.0, color: Colors.transparent)),
  ),
);

final focusedPinTheme = PinTheme(
  height: 56,
  width: 56,
  textStyle: titleMedium(),
  decoration: const BoxDecoration(
    border: Border(bottom: BorderSide(width: 1.0, color: Palette.primaryColor)),
  ),
);

final followingPinTheme = PinTheme(
  height: 56,
  width: 56,
  textStyle: titleMedium(),
  decoration: const BoxDecoration(
    border: Border(
        bottom: BorderSide(width: 1.0, color: Palette.secondaryOffWhiteColor)),
  ),
);
