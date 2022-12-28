import 'package:cryptbee/Utilities/Riverpod/riverpod_classes.dart';
import 'package:cryptbee/Utilities/Widgets/logInButton.dart';
import 'package:cryptbee/Utilities/Widgets/utilities.dart';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

class OtpBox extends ConsumerStatefulWidget {
  final TimerNotifier timerNotifier;
  final StateNotifierProvider<TimerNotifier, int?> timerProvider;
  void Function(String)? function;

  OtpBox(
      {super.key,
      required this.timerNotifier,
      required this.timerProvider,
      this.function});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OtpBoxState();
}

class _OtpBoxState extends ConsumerState<OtpBox> {
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int? endTime = ref.watch(widget.timerProvider);
    widget.timerNotifier.initTime();
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
                  "Enter The OTP sent at your mobile number",
                  style: titleSmall(),
                ),
              ),
              const SizedBox(height: 24),
              Pinput(
                onCompleted: (value) => {},
                keyboardType: TextInputType.number,
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
                    onTap: () {
                      final nowTime = DateTime.now().millisecondsSinceEpoch;
                      if (nowTime >= endTime!) {
                        widget.timerNotifier.increaseTime(60);
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
              logInButton(
                  text: "Log In",
                  function: () {
                    if (pinController.text.length >= 4) {
                      if (widget.function != null) {
                        widget.function!(pinController.text);
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
