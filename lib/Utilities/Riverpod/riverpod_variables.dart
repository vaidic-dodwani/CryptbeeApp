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

final signInButtonLoaderNotifier = buttonLoaderNotifier();

final signInButtonLoaderProvider =
    StateNotifierProvider<buttonLoaderNotifier, bool>((ref) {
  return signInButtonLoaderNotifier;
});

// SIGN UP

final signUpEmailErrorNotifer = EmailErrorNotifier();

final signUpEmailErrorProvider =
    StateNotifierProvider<EmailErrorNotifier, String>(
        (ref) => signUpEmailErrorNotifer);

final signUpEmailButtonLoaderNotifier = buttonLoaderNotifier();

final signUpEmailButtonLoaderProvider =
    StateNotifierProvider<buttonLoaderNotifier, bool>((ref) {
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

//MOBILENUMBER

final mobileNumberMobileErrorNotifier = MobileNumberErrorNotifier();

final mobileNumberMobileErrorProvider =
    StateNotifierProvider<MobileNumberErrorNotifier, String>(
        (ref) => mobileNumberMobileErrorNotifier);
