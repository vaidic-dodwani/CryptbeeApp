import 'package:cryptbee/Utilities/Riverpod/riverpod_classes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
