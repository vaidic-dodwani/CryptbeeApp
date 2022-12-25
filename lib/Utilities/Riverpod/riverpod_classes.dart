import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailErrorNotifier extends StateNotifier<String> {
  EmailErrorNotifier() : super(" ");

  void isValid(text) {
    if (text.length == 0)
      state = "";
    else if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text)) {
      state = " ";
    } else {
      state = "Invalid Email Id";
    }
  }
}

class PassErrorNotifier extends StateNotifier<String> {
  PassErrorNotifier() : super(" ");

  void isStrong(password) {
    if (password.length == 0) {
      state = "";
    } else {
      state = "Password must have ";
      if (!RegExp(r'^(?=.*?[a-z]).*').hasMatch(password)) {
        state = "${state}one small character, ";
      }
      if (!RegExp(r'^(?=.*?[A-Z]).*').hasMatch(password)) {
        state = "${state}one capital character, ";
      }
      if (!RegExp(r'^.*\W.*').hasMatch(password)) {
        state = "${state}one symbol, ";
      }
      if (!RegExp(r'^(?=.*?[0-9]).*').hasMatch(password)) {
        state = "${state}one digit, ";
      }
      if (password.length < 8) {
        state = "${state}8 characters, ";
      }
      if (state == "Password must have ") {
        state = " ";
      }
    }
  }

  void setVal(String text) {
    state = text;
  }
}

class buttonLoaderNotifier extends StateNotifier<bool> {
  buttonLoaderNotifier() : super(false);

  void toggle() {
    log("state.toString()");
    log("hello");

    state = !state;
  }
}
