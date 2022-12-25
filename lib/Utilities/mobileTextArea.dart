import 'package:cryptbee/Utilities/Riverpod/riverpod_classes.dart';
import 'package:cryptbee/Utilities/utilities.dart';
import 'package:flutter/material.dart';

class MobileTextArea extends StatefulWidget {
  final String labelText;
  final String hintText;
  TextEditingController controller = TextEditingController();
  final Color fontColor = Colors.black;
  MobileNumberErrorNotifier? mobileNumberErrorNotifier;

  MobileTextArea(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.mobileNumberErrorNotifier});

  @override
  State<MobileTextArea> createState() => _MobileTextAreaState();
}

class _MobileTextAreaState extends State<MobileTextArea> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
          onChanged: (text) {
            if (widget.mobileNumberErrorNotifier != null) {
              widget.mobileNumberErrorNotifier!.isValid(text);
            }
          },
          controller: widget.controller,
          keyboardType: TextInputType.number,
          maxLength: 10,
          style: bodyMedium(),
          decoration: InputDecoration(
            counterText: "",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: bodyMedium(),
            labelText: widget.labelText,
            hintText: widget.hintText,
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
