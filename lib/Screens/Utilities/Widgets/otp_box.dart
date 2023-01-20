import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_classes.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/log_in_button.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

class OtpBox extends ConsumerWidget {
  final pinController = TextEditingController();
  final TimerNotifier timerNotifier;
  final AutoDisposeStateNotifierProvider<TimerNotifier, int?> timerProvider;
  final void Function(int)? buttonFunction;
  final AutoDisposeStateNotifierProvider<ButtonLoaderNotifier, bool>?
      loaderProvider;
  final void Function()? resendFunction;

  final String sentAt;
  OtpBox(
      {super.key,
      required this.timerNotifier,
      required this.timerProvider,
      this.buttonFunction,
      this.loaderProvider,
      this.resendFunction,
      this.sentAt = 'mobile number'});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int? endTime = ref.watch(timerProvider);
    timerNotifier.initTime();
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
                  "Enter The OTP sent at your $sentAt",
                  style: titleSmall(),
                ),
              ),
              const SizedBox(height: 24),
              Pinput(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didnt Get The Otp? ",
                    style: labelSmall(),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final nowTime = DateTime.now().millisecondsSinceEpoch;
                      if (nowTime >= endTime!) {
                        timerNotifier.increaseTime(60);
                        if (resendFunction != null) {
                          resendFunction!();
                        }
                      }
                    },
                    child: Text(
                      "RESEND OTP ",
                      style: labelSmall(fontColor: Palette.primaryColor),
                    ),
                  ),
                  CountdownTimer(
                    endTime: endTime,
                    widgetBuilder: (context, time) {
                      if (time != null) {
                        if (time.sec.toString().length == 2) {
                          return Text(
                            "0:${time.sec}",
                            style: labelSmall(),
                          );
                        } else {
                          return Text(
                            "0:0${time.sec}",
                            style: labelSmall(),
                          );
                        }
                      } else {
                        return const Text("");
                      }
                    },
                  ),
                ],
              ),
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
