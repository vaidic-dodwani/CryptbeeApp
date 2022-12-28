import 'package:cryptbee/Utilities/Riverpod/riverpod_classes.dart';
import 'package:cryptbee/Utilities/Widgets/utilities.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class logInButton extends ConsumerWidget {
  String text;
  void Function()? function;
  StateNotifierProvider<ButtonLoaderNotifier, bool>? loaderProvider;
  bool isloading = false;
  double? width;
  logInButton(
      {super.key,
      required this.text,
      this.function,
      this.loaderProvider,
      this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    isloading = loaderProvider != null ? ref.watch(loaderProvider!) : false;
    return !isloading
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: width ?? MediaQuery.of(context).size.width,
              height: 48,
              child: ElevatedButton(
                  onPressed: function,
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Palette.primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Text(
                    text,
                    style: titleMedium(),
                  )),
            ),
          )
        : const SizedBox(
            height: 44,
            child: Center(
              child: SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  color: Palette.primaryColor,
                ),
              ),
            ),
          );
  }
}
