// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:ui';

import 'package:cryptbee/Config/api_integration.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/log_in_button.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toast/toast.dart';

import '../Riverpod/riverpod_variables.dart';

class BuyCoinPopup extends ConsumerWidget {
  dynamic data;
  BuyCoinPopup({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.05)),
          child: Center(
            child: Container(
              color: Palette.secondaryBlackColor,
              width: 264,
              height: 362,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          icon: const Icon(
                            Icons.close_sharp,
                            color: Palette.secondaryOffWhiteColor,
                          ),
                          onPressed: () {
                            coinPagePopupNotifier.toggle();
                          }),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      "Do You Want To Buy",
                      style: titleMedium(),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Current Price     ₹${data['Price'].toStringAsFixed(4)}",
                      style: bodyLarge(),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      onChanged: (text) {
                        coinPageCoinControllerNotifier.setVal(text);
                      },
                      keyboardType: TextInputType.number,
                      style: bodyMedium(),
                      decoration: InputDecoration(
                        counterText: "",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintStyle: bodyMedium(),
                        labelText: "Amount",
                        hintText: "Enter the amount",
                        labelStyle: labelMedium(),
                        errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                                color: Palette.secondaryOffWhiteColor,
                                width: 2)),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                                color: Palette.secondaryOffWhiteColor,
                                width: 2)),
                        disabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                                color: Palette.secondaryOffWhiteColor,
                                width: 2)),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                                color: Palette.secondaryOffWhiteColor,
                                width: 2)),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                                color: Palette.secondaryOffWhiteColor,
                                width: 2)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Total Coins   ${((ref.watch(coinPageCoinControllerProvider) ?? 1) / (data['Price'])).toStringAsFixed(6)}",
                      style: bodyLarge(),
                    ),
                    const SizedBox(height: 20),
                    LogInButton(
                      loaderProvider: coinPageButtonLoaderProvider,
                      text: "Buy",
                      function: () async {
                        coinPageButtonLoaderNotifier.toggle();
                        final output = await ApiCalls.buyCoin(
                            ref.watch(coinPageCoinControllerProvider) ?? 1);

                        log(output.toString());

                        if (output['statusCode'] == 202) {
                          coinPagePopupNotifier.toggle();
                          ToastContext().init(context);
                          Toast.show(output[output.keys.first][0],
                              duration: 5, gravity: Toast.bottom);
                        } else {
                          ToastContext().init(context);
                          Toast.show(output[output.keys.first][0],
                              duration: 5, gravity: Toast.bottom);
                        }
                        coinPageButtonLoaderNotifier.toggle();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
