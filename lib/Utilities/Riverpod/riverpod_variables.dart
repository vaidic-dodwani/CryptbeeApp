import 'package:cryptbee/Utilities/Riverpod/riverpod_classes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//  SIGN IN PAGE
EmailErrorNotifier signInEmailErrorNotifer = EmailErrorNotifier();

final signInEmailErrorProvider =
    StateNotifierProvider.autoDispose<EmailErrorNotifier, String>((ref) {
  signInEmailErrorNotifer = EmailErrorNotifier();
  return signInEmailErrorNotifer;
});

PassErrorNotifier signInPasswordErrorNotifer = PassErrorNotifier();

final signInPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>((ref) {
  signInPasswordErrorNotifer = PassErrorNotifier();
  return signInPasswordErrorNotifer;
});

ButtonLoaderNotifier signInButtonLoaderNotifier = ButtonLoaderNotifier();

final signInButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  signInButtonLoaderNotifier = ButtonLoaderNotifier();
  return signInButtonLoaderNotifier;
});

// SIGN UP

EmailErrorNotifier signUpEmailErrorNotifer = EmailErrorNotifier();

final signUpEmailErrorProvider =
    StateNotifierProvider.autoDispose<EmailErrorNotifier, String>((ref) {
  signUpEmailErrorNotifer = EmailErrorNotifier();
  return signUpEmailErrorNotifer;
});

ButtonLoaderNotifier signUpEmailButtonLoaderNotifier = ButtonLoaderNotifier();

final signUpEmailButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  signUpEmailButtonLoaderNotifier = ButtonLoaderNotifier();
  return signUpEmailButtonLoaderNotifier;
});

PassErrorNotifier signUpPasswordErrorNotifer = PassErrorNotifier();

final signUpPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>((ref) {
  signUpPasswordErrorNotifer = PassErrorNotifier();
  return signUpPasswordErrorNotifer;
});

PassErrorNotifier signUpConfirmPasswordErrorNotifer = PassErrorNotifier();

final signUpConfirmPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>((ref) {
  signUpConfirmPasswordErrorNotifer = PassErrorNotifier();
  return signUpConfirmPasswordErrorNotifer;
});

//FORGET PASSWORD

EmailErrorNotifier forgetPassSignUpEmailErrorNotifer = EmailErrorNotifier();

final forgetPassSignUpEmailErrorProvider =
    StateNotifierProvider.autoDispose<EmailErrorNotifier, String>((ref) {
  forgetPassSignUpEmailErrorNotifer = EmailErrorNotifier();
  return forgetPassSignUpEmailErrorNotifer;
});

ButtonLoaderNotifier forgetPassButtonLoaderNotifier = ButtonLoaderNotifier();

final forgetPassButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  forgetPassButtonLoaderNotifier = ButtonLoaderNotifier();
  return forgetPassButtonLoaderNotifier;
});

//FORGET PASS OTP PAGE

TimerNotifier forgetPassOtpTimerNotifer = TimerNotifier();

final forgetPassOtpTimerProvider =
    StateNotifierProvider.autoDispose<TimerNotifier, int?>((ref) {
  forgetPassOtpTimerNotifer = TimerNotifier();
  return forgetPassOtpTimerNotifer;
});

ButtonLoaderNotifier forgetPassOtpButtonLoaderNotifier = ButtonLoaderNotifier();

final forgetPassOtpButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  forgetPassOtpButtonLoaderNotifier = ButtonLoaderNotifier();
  return forgetPassOtpButtonLoaderNotifier;
});

// SET PASSWORD

PassErrorNotifier setPassPasswordErrorNotifer = PassErrorNotifier();

final setPassPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>((ref) {
  setPassPasswordErrorNotifer = PassErrorNotifier();
  return setPassPasswordErrorNotifer;
});

PassErrorNotifier setPassConfirmPasswordErrorNotifer = PassErrorNotifier();

final setPassConfirmPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>((ref) {
  setPassConfirmPasswordErrorNotifer = PassErrorNotifier();
  return setPassConfirmPasswordErrorNotifer;
});

ButtonLoaderNotifier setPassButtonLoaderNotifier = ButtonLoaderNotifier();

final setPassButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  setPassButtonLoaderNotifier = ButtonLoaderNotifier();
  return setPassButtonLoaderNotifier;
});

//MOBILENUMBER

MobileNumberErrorNotifier mobileNumberMobileErrorNotifier =
    MobileNumberErrorNotifier();

final mobileNumberMobileErrorProvider =
    StateNotifierProvider.autoDispose<MobileNumberErrorNotifier, String>((ref) {
  mobileNumberMobileErrorNotifier = MobileNumberErrorNotifier();
  return mobileNumberMobileErrorNotifier;
});

//OTP BOX

TimerNotifier twoFactorTimerNotifer = TimerNotifier();

final twoFactorTimerProvider =
    StateNotifierProvider.autoDispose<TimerNotifier, int?>((ref) {
  twoFactorTimerNotifer = TimerNotifier();
  return twoFactorTimerNotifer;
});

// PanNumberPage

PanErrorNotifier panNumberPanErrorNotifier = PanErrorNotifier();

final panNumberPanErrorProvider =
    StateNotifierProvider.autoDispose<PanErrorNotifier, String>((ref) {
  panNumberPanErrorNotifier = PanErrorNotifier();
  return panNumberPanErrorNotifier;
});

NameErrorNotifier panNumberNameErrorNotifier = NameErrorNotifier();

final panNumberNameErrorProvider =
    StateNotifierProvider.autoDispose<NameErrorNotifier, String>((ref) {
  panNumberNameErrorNotifier = NameErrorNotifier();
  return panNumberNameErrorNotifier;
});
