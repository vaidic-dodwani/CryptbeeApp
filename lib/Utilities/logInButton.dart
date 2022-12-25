import 'package:cryptbee/Utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Riverpod/riverpod_classes.dart';

class logInButton extends ConsumerWidget {
  void Function()? function;
  StateNotifierProvider<buttonLoaderNotifier, bool>? loaderProvider;
  bool isloading = false;

  logInButton({super.key, this.function, this.loaderProvider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    isloading = loaderProvider != null ? ref.watch(loaderProvider!) : false;
    return !isloading
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
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
                    "Login",
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
