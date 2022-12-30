import 'package:cryptbee/Utilities/Riverpod/riverpod_classes.dart';
import 'package:cryptbee/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';

class PanTextArea extends StatefulWidget {
  final String labelText;
  final String hintText;
  TextEditingController controller = TextEditingController();
  final Color fontColor = Colors.black;
  PanErrorNotifier? panErrorNotifier;

  PanTextArea(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.panErrorNotifier});

  @override
  State<PanTextArea> createState() => _PanTextAreaState();
}

class _PanTextAreaState extends State<PanTextArea> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
          onChanged: (text) {
            if (widget.panErrorNotifier != null) {
              widget.panErrorNotifier!.isValid(text);
            }
          },
          controller: widget.controller,
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
