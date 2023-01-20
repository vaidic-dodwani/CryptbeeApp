import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorLines extends ConsumerWidget {
  final AutoDisposeStateNotifierProvider<dynamic, String>? errorProvider;
  final double height;

  const ErrorLines({super.key, this.errorProvider, this.height = 16});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        height: height,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              errorProvider != null
                  ? ref.watch(errorProvider!).toString()
                  : "No Provider",
              maxLines: 2,
              style: labelMedium(
                fontColor: Palette.secondaryErrorColor,
              ),
            ),
          ),
        ));
  }
}
