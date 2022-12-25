import 'package:cryptbee/Utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorLines extends ConsumerWidget {
  StateNotifierProvider<dynamic, String>? errorProvider;
  double height;

  ErrorLines({super.key, this.errorProvider, this.height = 16});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        height: height,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              ref.watch(errorProvider!).toString(),
              maxLines: 2,
              style: labelMedium(
                fontColor: Palette.secondaryErrorColor,
              ),
            ),
          ),
        ));
  }
}
