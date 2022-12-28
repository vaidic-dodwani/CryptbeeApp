import 'package:cryptbee/Utilities/Riverpod/riverpod_classes.dart';
import 'package:cryptbee/Utilities/Widgets/utilities.dart';

import 'package:flutter/material.dart';

class EmailTextArea extends StatefulWidget {
  final String labelText;
  final String hintText;
  TextEditingController controller = TextEditingController();
  final Color fontColor = Colors.black;
  EmailErrorNotifier? emailErrorNotifier;

  EmailTextArea(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.emailErrorNotifier});

  @override
  State<EmailTextArea> createState() => _EmailTextAreaState();
}

class _EmailTextAreaState extends State<EmailTextArea> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
          onChanged: (text) {
            if (widget.emailErrorNotifier != null) {
              widget.emailErrorNotifier!.isValid(text);
            }
          },
          controller: widget.controller,
          keyboardType: TextInputType.emailAddress,
          style: bodyMedium(),
          decoration: InputDecoration(
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
