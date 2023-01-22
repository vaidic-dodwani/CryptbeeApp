import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
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
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: bodyMedium(),
      ),
    ),
  );
}

Align authTitleLargeText(String text) {
  return Align(
    alignment: Alignment.center,
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: titleLarge(),
    ),
  );
}

Align authTitleMediumText(String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: titleMedium(),
    ),
  );
}

Align authLabelLargeText(String text) {
  return Align(
    alignment: Alignment.center,
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: labelLarge(),
    ),
  );
}

Align authTitleSmallText(String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: labelLarge(),
    ),
  );
}

Align authlabelMedium(String text) {
  return Align(
    alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: labelMedium(),
      ),
    ),
  );
}

Align authBodyLarge(String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: bodyLarge(),
      ),
    ),
  );
}
