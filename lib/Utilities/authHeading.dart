import 'package:cryptbee/Utilities/utilities.dart';
import 'package:flutter/material.dart';

Align authHeading(String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        text,
        style: headlineLarge(),
      ),
    ),
  );
}

Align authCenterText(String text) {
  return Align(
    alignment: Alignment.center,
    child: Text(
      text,
      style: bodyMedium(),
    ),
  );
}
