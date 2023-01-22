import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_classes.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';

import 'package:flutter/material.dart';

class NameTextArea extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? defaultControllerText;
  final TextEditingController controller = TextEditingController();
  final Color fontColor = Colors.black;
  final NameErrorNotifier? nameErrorNotifier;

  NameTextArea(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.nameErrorNotifier,
      this.defaultControllerText});

  @override
  Widget build(BuildContext context) {
    if (defaultControllerText != null) {
      controller.text = defaultControllerText!;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
          onChanged: (text) {
            if (nameErrorNotifier != null) {
              nameErrorNotifier!.isValid(text);
            }
          },
          maxLength: 15,
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          style: bodyMedium(),
          decoration: InputDecoration(
            counterText: "",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: bodyMedium(),
            labelText: labelText,
            hintText: hintText,
            labelStyle: labelMedium(),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: Palette.secondaryOffWhiteColor, width: 2)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: Palette.secondaryOffWhiteColor, width: 2)),
            disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: Palette.secondaryOffWhiteColor, width: 2)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: Palette.secondaryOffWhiteColor, width: 2)),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: Palette.secondaryOffWhiteColor, width: 2)),
          )),
    );
  }
}
