import 'package:cryptbee/Utilities/Riverpod/riverpod_classes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//  SIGN IN PAGE
final signInEmailErrorNotifer = EmailErrorNotifier();

final signInEmailErrorProvider =
    StateNotifierProvider.autoDispose<EmailErrorNotifier, String>(
        (ref) => signInEmailErrorNotifer);

final signInPasswordErrorNotifer = PassErrorNotifier();

final signInPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>(
        (ref) => signInPasswordErrorNotifer);

final signInButtonLoaderNotifier = ButtonLoaderNotifier();

final signInButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  return signInButtonLoaderNotifier;
});

// SIGN UP

final signUpEmailErrorNotifer = EmailErrorNotifier();

final signUpEmailErrorProvider =
    StateNotifierProvider.autoDispose<EmailErrorNotifier, String>(
        (ref) => signUpEmailErrorNotifer);

final signUpEmailButtonLoaderNotifier = ButtonLoaderNotifier();

final signUpEmailButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  return signUpEmailButtonLoaderNotifier;
});

final signUpPasswordErrorNotifer = PassErrorNotifier();

final signUpPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>(
        (ref) => signUpPasswordErrorNotifer);

final signUpConfirmPasswordErrorNotifer = PassErrorNotifier();

final signUpConfirmPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>(
        (ref) => signUpConfirmPasswordErrorNotifer);

//FORGET PASSWORD

final forgetPassSignUpEmailErrorNotifer = EmailErrorNotifier();

final forgetPassSignUpEmailErrorProvider =
    StateNotifierProvider.autoDispose<EmailErrorNotifier, String>(
        (ref) => forgetPassSignUpEmailErrorNotifer);

final forgetPassButtonLoaderNotifier = ButtonLoaderNotifier();

final forgetPassButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  return forgetPassButtonLoaderNotifier;
});

//FORGET PASS OTP PAGE

final forgetPassOtpTimerNotifer = TimerNotifier();

final forgetPassOtpTimerProvider =
    StateNotifierProvider.autoDispose<TimerNotifier, int?>((ref) {
  return forgetPassOtpTimerNotifer;
});

final forgetPassOtpButtonLoaderNotifier = ButtonLoaderNotifier();

final forgetPassOtpButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  return forgetPassOtpButtonLoaderNotifier;
});

// SET PASSWORD

final setPassPasswordErrorNotifer = PassErrorNotifier();

final setPassPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>(
        (ref) => setPassPasswordErrorNotifer);

final setPassConfirmPasswordErrorNotifer = PassErrorNotifier();

final setPassConfirmPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>(
        (ref) => setPassConfirmPasswordErrorNotifer);

final setPassButtonLoaderNotifier = ButtonLoaderNotifier();

final setPassButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  return setPassButtonLoaderNotifier;
});

//MOBILENUMBER

final mobileNumberMobileErrorNotifier = MobileNumberErrorNotifier();

final mobileNumberMobileErrorProvider =
    StateNotifierProvider.autoDispose<MobileNumberErrorNotifier, String>(
        (ref) => mobileNumberMobileErrorNotifier);

//OTP BOX

final twoFactorTimerNotifer = TimerNotifier();

final twoFactorTimerProvider =
    StateNotifierProvider.autoDispose<TimerNotifier, int?>((ref) {
  return twoFactorTimerNotifer;
});

// PanNumberPage

final panNumberPanErrorNotifier = PanErrorNotifier();

final panNumberPanErrorProvider =
    StateNotifierProvider.autoDispose<PanErrorNotifier, String>((ref) {
  return panNumberPanErrorNotifier;
});

final panNumberNameErrorNotifier = NameErrorNotifier();

final panNumberNameErrorProvider =
    StateNotifierProvider.autoDispose<NameErrorNotifier, String>((ref) {
  return panNumberNameErrorNotifier;
});
