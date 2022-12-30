import 'package:cryptbee/Utilities/Riverpod/riverpod_classes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//  SIGN IN PAGE
final signInEmailErrorNotifer = EmailErrorNotifier();

final signInEmailErrorProvider =
    StateNotifierProvider<EmailErrorNotifier, String>(
        (ref) => signInEmailErrorNotifer);

final signInPasswordErrorNotifer = PassErrorNotifier();

final signInPasswordErrorProvider =
    StateNotifierProvider<PassErrorNotifier, String>(
        (ref) => signInPasswordErrorNotifer);

final signInButtonLoaderNotifier = ButtonLoaderNotifier();

final signInButtonLoaderProvider =
    StateNotifierProvider<ButtonLoaderNotifier, bool>((ref) {
  return signInButtonLoaderNotifier;
});

// SIGN UP

final signUpEmailErrorNotifer = EmailErrorNotifier();

final signUpEmailErrorProvider =
    StateNotifierProvider<EmailErrorNotifier, String>(
        (ref) => signUpEmailErrorNotifer);

final signUpEmailButtonLoaderNotifier = ButtonLoaderNotifier();

final signUpEmailButtonLoaderProvider =
    StateNotifierProvider<ButtonLoaderNotifier, bool>((ref) {
  return signUpEmailButtonLoaderNotifier;
});

final signUpPasswordErrorNotifer = PassErrorNotifier();

final signUpPasswordErrorProvider =
    StateNotifierProvider<PassErrorNotifier, String>(
        (ref) => signUpPasswordErrorNotifer);

final signUpConfirmPasswordErrorNotifer = PassErrorNotifier();

final signUpConfirmPasswordErrorProvider =
    StateNotifierProvider<PassErrorNotifier, String>(
        (ref) => signUpConfirmPasswordErrorNotifer);

//FORGET PASSWORD

final forgetPassSignUpEmailErrorNotifer = EmailErrorNotifier();

final forgetPassSignUpEmailErrorProvider =
    StateNotifierProvider<EmailErrorNotifier, String>(
        (ref) => forgetPassSignUpEmailErrorNotifer);

final forgetPassButtonLoaderNotifier = ButtonLoaderNotifier();

final forgetPassButtonLoaderProvider =
    StateNotifierProvider<ButtonLoaderNotifier, bool>((ref) {
  return forgetPassButtonLoaderNotifier;
});

//FORGET PASS OTP PAGE

final forgetPassOtpTimerNotifer = TimerNotifier();

final forgetPassOtpTimerProvider =
    StateNotifierProvider<TimerNotifier, int?>((ref) {
  return forgetPassOtpTimerNotifer;
});

final forgetPassOtpButtonLoaderNotifier = ButtonLoaderNotifier();

final forgetPassOtpButtonLoaderProvider =
    StateNotifierProvider<ButtonLoaderNotifier, bool>((ref) {
  return forgetPassOtpButtonLoaderNotifier;
});

// SET PASSWORD

final setPassPasswordErrorNotifer = PassErrorNotifier();

final setPassPasswordErrorProvider =
    StateNotifierProvider<PassErrorNotifier, String>(
        (ref) => setPassPasswordErrorNotifer);

final setPassConfirmPasswordErrorNotifer = PassErrorNotifier();

final setPassConfirmPasswordErrorProvider =
    StateNotifierProvider<PassErrorNotifier, String>(
        (ref) => setPassConfirmPasswordErrorNotifer);

final setPassButtonLoaderNotifier = ButtonLoaderNotifier();

final setPassButtonLoaderProvider =
    StateNotifierProvider<ButtonLoaderNotifier, bool>((ref) {
  return setPassButtonLoaderNotifier;
});

//MOBILENUMBER

final mobileNumberMobileErrorNotifier = MobileNumberErrorNotifier();

final mobileNumberMobileErrorProvider =
    StateNotifierProvider<MobileNumberErrorNotifier, String>(
        (ref) => mobileNumberMobileErrorNotifier);

//OTP BOX

final twoFactorTimerNotifer = TimerNotifier();

final twoFactorTimerProvider =
    StateNotifierProvider<TimerNotifier, int?>((ref) {
  return twoFactorTimerNotifer;
});

// PanNumberPage

final panNumberPanErrorNotifier = PanErrorNotifier();

final panNumberPanErrorProvider =
    StateNotifierProvider<PanErrorNotifier, String>((ref) {
  return panNumberPanErrorNotifier;
});

final panNumberNameErrorNotifier = NameErrorNotifier();

final panNumberNameErrorProvider =
    StateNotifierProvider<NameErrorNotifier, String>((ref) {
  return panNumberNameErrorNotifier;
});
