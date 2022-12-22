import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';

class Palette {
  static const primaryColor = Color(0xFFF89E31);
  static const secondaryBlackColor = Color(0xFF131313);
  static const secondaryOffWhiteColor = Color(0xFFF1F4F6);
  static const secondaryWhiteColor = Color(0xFFFFFFFF);
  static const secondaryErrorColor = Color(0xFFCF6679);
  static const secondaryCorrectColor = Color(0xFF66DF98);
  static const neutralBlack = Color(0xFF1D1C26);
  static const neutralDarkGrey = Color(0xFF2E2E2E);
  static const neutralGrey = Color(0xFF707070);

  static const headlineLarge = TextStyle(
      fontSize: 32,
      color: secondaryWhiteColor,
      fontFamily: "Poppins",
      fontVariations: <FontVariation>[FontVariation('wght', 700)]);

  static const headlineMedium = TextStyle(
      fontSize: 28,
      color: secondaryWhiteColor,
      fontFamily: "Poppins",
      fontVariations: <FontVariation>[FontVariation('wght', 400)]);

  static const headlineSmall = TextStyle(
      fontSize: 24,
      color: secondaryWhiteColor,
      fontFamily: "Poppins",
      fontVariations: <FontVariation>[FontVariation('wght', 400)]);

  static const titleLarge = TextStyle(
      fontSize: 22,
      color: secondaryWhiteColor,
      fontFamily: "Poppins",
      fontVariations: <FontVariation>[FontVariation('wght', 700)]);

  static const titleMedium = TextStyle(
      fontSize: 18,
      color: secondaryWhiteColor,
      fontFamily: "Poppins",
      fontVariations: <FontVariation>[FontVariation('wght', 700)]);

  static const titleSmall = TextStyle(
      fontSize: 14,
      color: secondaryWhiteColor,
      fontFamily: "Poppins",
      fontVariations: <FontVariation>[FontVariation('wght', 500)]);

  static const bodyLarge = TextStyle(
      fontSize: 16,
      color: secondaryWhiteColor,
      fontFamily: "Poppins",
      fontVariations: <FontVariation>[FontVariation('wght', 400)]);

  static const bodyMedium = TextStyle(
      fontSize: 14,
      color: secondaryWhiteColor,
      fontFamily: "Poppins",
      fontVariations: <FontVariation>[FontVariation('wght', 400)]);

  static const bodySmall = TextStyle(
      fontSize: 12,
      color: secondaryWhiteColor,
      fontFamily: "Poppins",
      fontVariations: <FontVariation>[FontVariation('wght', 400)]);

  static const labelLarge = TextStyle(
      fontSize: 14,
      color: secondaryWhiteColor,
      fontFamily: "Poppins",
      fontVariations: <FontVariation>[FontVariation('wght', 400)]);

  static const labelMedium = TextStyle(
      fontSize: 12,
      color: secondaryWhiteColor,
      fontFamily: "Poppins",
      fontVariations: <FontVariation>[FontVariation('wght', 400)]);

  static const labelSmall = TextStyle(
      fontSize: 10,
      color: secondaryWhiteColor,
      fontFamily: "Poppins",
      fontVariations: <FontVariation>[FontVariation('wght', 400)]);
}

class TextArea extends StatefulWidget {
  final String text;
  final TextEditingController controller = TextEditingController();

  TextArea({super.key, required this.text, controller});

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
          style: Palette.bodyMedium,
          decoration: InputDecoration(
              hintStyle: Palette.bodyMedium,
              prefixIcon: const Icon(Icons.person_outline_sharp),
              labelText: widget.text,
              labelStyle: Palette.labelMedium,
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
