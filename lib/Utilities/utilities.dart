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
}

TextStyle headlineLarge({Color fontColor = Colors.white}) => TextStyle(
      fontSize: 32,
      color: fontColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
    );

TextStyle headlineMedium({Color fontColor = Colors.white}) => TextStyle(
      fontSize: 28,
      color: fontColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    );

TextStyle headlineSmall({Color fontColor = Colors.white}) => TextStyle(
      fontSize: 24,
      color: fontColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    );

TextStyle titleLarge({Color fontColor = Colors.white}) => TextStyle(
      fontSize: 22,
      color: fontColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    );

TextStyle titleMedium({Color fontColor = Colors.white}) => TextStyle(
      fontSize: 18,
      color: fontColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
    );

TextStyle titleSmall({Color fontColor = Colors.white}) => TextStyle(
      fontSize: 14,
      color: fontColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
    );

TextStyle bodyLarge({Color fontColor = Colors.white}) => TextStyle(
      fontSize: 16,
      color: fontColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    );

TextStyle bodyMedium({Color fontColor = Colors.white}) => TextStyle(
      fontSize: 14,
      color: fontColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    );

TextStyle bodySmall({Color fontColor = Colors.white}) => TextStyle(
      fontSize: 12,
      color: fontColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    );

TextStyle labelLarge({Color fontColor = Colors.white}) => TextStyle(
      fontSize: 14,
      color: fontColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    );

TextStyle labelMedium({Color fontColor = Colors.white}) => TextStyle(
      fontSize: 12,
      color: fontColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    );

TextStyle labelSmall({Color fontColor = Colors.white}) => TextStyle(
      fontSize: 10,
      color: fontColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    );
