import 'package:cryptbee/Utilities/utilities.dart';
import 'package:flutter/material.dart';

class TextArea extends StatefulWidget {
  final String text;
  TextEditingController controller = TextEditingController();
  final Color fontColor = Colors.black;

  TextArea({
    super.key,
    required this.text,
  });

  @override
  State<TextArea> createState() => _TextAreaState();
}

class _TextAreaState extends State<TextArea> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.85 * MediaQuery.of(context).size.width,
      child: TextFormField(
          controller: widget.controller,
          style: bodyMedium(),
          decoration: InputDecoration(
              hintStyle: bodyMedium(),
              prefixIcon: const Icon(Icons.person_outline_sharp),
              labelText: widget.text,
              labelStyle: labelMedium(),
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                      color: Palette.secondaryOffWhiteColor, width: 2)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Palette.secondaryOffWhiteColor, width: 2)),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Palette.secondaryOffWhiteColor, width: 2)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Palette.secondaryOffWhiteColor, width: 2)),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Palette.secondaryOffWhiteColor, width: 2)),
              prefixIconColor: Palette.secondaryOffWhiteColor,
              suffixIconColor: Palette.secondaryOffWhiteColor,
              suffixIcon: IconButton(
                icon: const Icon(Icons.cancel_sharp),
                onPressed: () {},
              ))),
    );
  }
}
