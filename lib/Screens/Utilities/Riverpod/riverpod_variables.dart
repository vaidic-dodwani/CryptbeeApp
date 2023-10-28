import 'package:cryptbee/Config/api_integration.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_classes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//  SIGN IN PAGE
EmailErrorNotifier signInEmailErrorNotifer = EmailErrorNotifier();

final signInEmailErrorProvider =
    StateNotifierProvider.autoDispose<EmailErrorNotifier, String>((ref) {
  ref.onDispose(() {
    signInEmailErrorNotifer = EmailErrorNotifier();
  });

  return signInEmailErrorNotifer;
});

PassErrorNotifier signInPasswordErrorNotifer = PassErrorNotifier();

final signInPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>((ref) {
  ref.onDispose(() {
    signInPasswordErrorNotifer = PassErrorNotifier();
  });
  return signInPasswordErrorNotifer;
});

ButtonLoaderNotifier signInButtonLoaderNotifier = ButtonLoaderNotifier();

final signInButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  ref.onDispose(() {
    signInButtonLoaderNotifier = ButtonLoaderNotifier();
  });
  return signInButtonLoaderNotifier;
});

// SIGN UP

EmailErrorNotifier signUpEmailErrorNotifer = EmailErrorNotifier();

final signUpEmailErrorProvider =
    StateNotifierProvider.autoDispose<EmailErrorNotifier, String>((ref) {
  ref.onDispose(() {
    signUpEmailErrorNotifer = EmailErrorNotifier();
  });
  return signUpEmailErrorNotifer;
});

ButtonLoaderNotifier signUpEmailButtonLoaderNotifier = ButtonLoaderNotifier();

final signUpEmailButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  ref.onDispose(() {
    signUpEmailButtonLoaderNotifier = ButtonLoaderNotifier();
  });
  return signUpEmailButtonLoaderNotifier;
});

PassErrorNotifier signUpPasswordErrorNotifer = PassErrorNotifier();

final signUpPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>((ref) {
  ref.onDispose(() {
    signUpPasswordErrorNotifer = PassErrorNotifier();
  });

  return signUpPasswordErrorNotifer;
});

PassErrorNotifier signUpConfirmPasswordErrorNotifer = PassErrorNotifier();

final signUpConfirmPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>((ref) {
  ref.onDispose(() {
    signUpConfirmPasswordErrorNotifer = PassErrorNotifier();
  });
  return signUpConfirmPasswordErrorNotifer;
});

//FORGET PASSWORD

EmailErrorNotifier forgetPassSignUpEmailErrorNotifer = EmailErrorNotifier();

final forgetPassSignUpEmailErrorProvider =
    StateNotifierProvider.autoDispose<EmailErrorNotifier, String>((ref) {
  ref.onDispose(() {
    forgetPassSignUpEmailErrorNotifer = EmailErrorNotifier();
  });

  return forgetPassSignUpEmailErrorNotifer;
});

ButtonLoaderNotifier forgetPassButtonLoaderNotifier = ButtonLoaderNotifier();

final forgetPassButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  ref.onDispose(() {
    forgetPassButtonLoaderNotifier = ButtonLoaderNotifier();
  });

  return forgetPassButtonLoaderNotifier;
});

//FORGET PASS OTP PAGE

TimerNotifier forgetPassOtpTimerNotifer = TimerNotifier();

final forgetPassOtpTimerProvider =
    StateNotifierProvider.autoDispose<TimerNotifier, int?>((ref) {
  ref.onDispose(() {
    forgetPassOtpTimerNotifer = TimerNotifier();
  });

  return forgetPassOtpTimerNotifer;
});

ButtonLoaderNotifier forgetPassOtpButtonLoaderNotifier = ButtonLoaderNotifier();

final forgetPassOtpButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  ref.onDispose(() {
    forgetPassOtpButtonLoaderNotifier = ButtonLoaderNotifier();
  });

  return forgetPassOtpButtonLoaderNotifier;
});

// SET PASSWORD

PassErrorNotifier setPassPasswordErrorNotifer = PassErrorNotifier();

final setPassPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>((ref) {
  ref.onDispose(() {
    setPassPasswordErrorNotifer = PassErrorNotifier();
  });
  return setPassPasswordErrorNotifer;
});

PassErrorNotifier setPassConfirmPasswordErrorNotifer = PassErrorNotifier();

final setPassConfirmPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>((ref) {
  ref.onDispose(() {
    setPassConfirmPasswordErrorNotifer = PassErrorNotifier();
  });
  return setPassConfirmPasswordErrorNotifer;
});

ButtonLoaderNotifier setPassButtonLoaderNotifier = ButtonLoaderNotifier();

final setPassButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  ref.onDispose(() {
    setPassButtonLoaderNotifier = ButtonLoaderNotifier();
  });
  return setPassButtonLoaderNotifier;
});

//phoneNUMBER

PhoneNumberErrorNotifier phoneNumberphoneErrorNotifier =
    PhoneNumberErrorNotifier();

final phoneNumberphoneErrorProvider =
    StateNotifierProvider.autoDispose<PhoneNumberErrorNotifier, String>((ref) {
  ref.onDispose(() {
    phoneNumberphoneErrorNotifier = PhoneNumberErrorNotifier();
  });
  return phoneNumberphoneErrorNotifier;
});

ButtonLoaderNotifier phoneNumberButtonLoaderNotifier = ButtonLoaderNotifier();

final phoneNumberButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  ref.onDispose(() {
    phoneNumberButtonLoaderNotifier = ButtonLoaderNotifier();
  });
  return phoneNumberButtonLoaderNotifier;
});

//OTP BOX

TimerNotifier twoFactorTimerNotifer = TimerNotifier();

final twoFactorTimerProvider =
    StateNotifierProvider.autoDispose<TimerNotifier, int?>((ref) {
  ref.onDispose(() {
    twoFactorTimerNotifer = TimerNotifier();
  });
  return twoFactorTimerNotifer;
});

ButtonLoaderNotifier twoFactorButtonLoaderNotifier = ButtonLoaderNotifier();

final twoFactorButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  ref.onDispose(() {
    twoFactorButtonLoaderNotifier = ButtonLoaderNotifier();
  });
  return twoFactorButtonLoaderNotifier;
});

// PanNumberPage

PanErrorNotifier panNumberPanErrorNotifier = PanErrorNotifier();

final panNumberPanErrorProvider =
    StateNotifierProvider.autoDispose<PanErrorNotifier, String>((ref) {
  ref.onDispose(() {
    panNumberPanErrorNotifier = PanErrorNotifier();
  });
  return panNumberPanErrorNotifier;
});

NameErrorNotifier panNumberNameErrorNotifier = NameErrorNotifier();

final panNumberNameErrorProvider =
    StateNotifierProvider.autoDispose<NameErrorNotifier, String>((ref) {
  ref.onDispose(() {
    panNumberNameErrorNotifier = NameErrorNotifier();
  });
  return panNumberNameErrorNotifier;
});

// HomePage

HomeBottomNavNotifier homeBottomNavNotifier = HomeBottomNavNotifier();

final homeBottomNavProvider =
    StateNotifierProvider.autoDispose<HomeBottomNavNotifier, int>(
        (ref) {

          ref.onDispose(() {
            homeBottomNavNotifier = HomeBottomNavNotifier();
          });

          return homeBottomNavNotifier;
        });

//INVEST TAB

InvestTopNavNotifier investTopNavNotifier = InvestTopNavNotifier();

final investTopNavProvider = StateNotifierProvider<InvestTopNavNotifier, int>(
    (ref) => investTopNavNotifier);

//HOME

final getNewsProvider = FutureProvider<dynamic>((ref) async {
  return ApiCalls.getNews();
});

final getHoldingsProvider = FutureProvider<dynamic>((ref) async {
  return ApiCalls.getHoldings();
});

//Profile Pan

PanErrorNotifier profilePanPanErrorNotifier = PanErrorNotifier();

final profilePanPanErrorProvider =
    StateNotifierProvider.autoDispose<PanErrorNotifier, String>((ref) {
  ref.onDispose(() {
    profilePanPanErrorNotifier = PanErrorNotifier();
  });
  return profilePanPanErrorNotifier;
});

NameErrorNotifier profilePanNameErrorNotifier = NameErrorNotifier();

final profilePanNameErrorProvider =
    StateNotifierProvider.autoDispose<NameErrorNotifier, String>((ref) {
  ref.onDispose(() {
    profilePanNameErrorNotifier = NameErrorNotifier();
  });
  return profilePanNameErrorNotifier;
});

//CHANGE PASSWORD

ButtonLoaderNotifier changePasswordEmailButtonLoaderNotifier =
    ButtonLoaderNotifier();

final changePasswordEmailButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  ref.onDispose(() {
    changePasswordEmailButtonLoaderNotifier = ButtonLoaderNotifier();
  });
  return changePasswordEmailButtonLoaderNotifier;
});

PassErrorNotifier changePasswordPasswordErrorNotifer = PassErrorNotifier();

final changePasswordPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>((ref) {
  ref.onDispose(() {
    changePasswordPasswordErrorNotifer = PassErrorNotifier();
  });

  return changePasswordPasswordErrorNotifer;
});

PassErrorNotifier changePasswordConfirmPasswordErrorNotifer =
    PassErrorNotifier();

final changePasswordConfirmPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>((ref) {
  ref.onDispose(() {
    changePasswordConfirmPasswordErrorNotifer = PassErrorNotifier();
  });
  return changePasswordConfirmPasswordErrorNotifer;
});

// ProfilePhoto

ProfilePhotoNotifier profilePhoto = ProfilePhotoNotifier();

final profilePhotoProvider =
    StateNotifierProvider<ProfilePhotoNotifier, String?>((ref) {
  return profilePhoto;
});

BlurLoaderNotifier profileTabBlurLoaderNotifier = BlurLoaderNotifier();

final profileTabBlurLoaderProvider =
    StateNotifierProvider.autoDispose<BlurLoaderNotifier, bool>((ref) {
  ref.onDispose(() {
    profileTabBlurLoaderNotifier = BlurLoaderNotifier();
  });
  return profileTabBlurLoaderNotifier;
});

//COIN PAGE

WatchListBool inWatchListBoolNotifier = WatchListBool();

final inWatchlistBoolProvider =
    StateNotifierProvider<WatchListBool, bool>((ref) {
  return inWatchListBoolNotifier;
});

CoinDescNotifier coinPageCoinDescNotifier = CoinDescNotifier();

final coinPageCoinDescProvider =
    StateNotifierProvider<CoinDescNotifier, String?>((ref) {
  return coinPageCoinDescNotifier;
});

CoinControllerNotifier coinPageCoinControllerNotifier =
    CoinControllerNotifier();

final coinPageCoinControllerProvider =
    StateNotifierProvider<CoinControllerNotifier, int?>((ref) {
  return coinPageCoinControllerNotifier;
});

PopupNotifier coinPagePopupNotifier = PopupNotifier();

final coinPagePopUpProvider =
    StateNotifierProvider.autoDispose<PopupNotifier, bool>((ref) {
  ref.onDispose(() {
    coinPagePopupNotifier = PopupNotifier();
  });
  return coinPagePopupNotifier;
});

ButtonLoaderNotifier coinPageButtonLoaderNotifier = ButtonLoaderNotifier();

final coinPageButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  ref.onDispose(() {
    coinPageButtonLoaderNotifier = ButtonLoaderNotifier();
  });
  return coinPageButtonLoaderNotifier;
});

// PHONE OTP PAGE

ButtonLoaderNotifier phoneOtpButtonLoaderNotifier = ButtonLoaderNotifier();

final phoneOtpButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  ref.onDispose(() {
    phoneOtpButtonLoaderNotifier = ButtonLoaderNotifier();
  });

  return phoneOtpButtonLoaderNotifier;
});

//SECUTIRY

SecuritySwitch securitySwitch = SecuritySwitch();

final securitySwitchProvider =
    StateNotifierProvider<SecuritySwitch, bool>((ref) {
  return securitySwitch;
});

//WALLET

final transactionsProvider = FutureProvider<dynamic>((ref) async {
  return ApiCalls.getTransactions();
});

//HOLDING TAB

HoldingCoinControllerNotifier holdingTabCoinControllerNotifier =
    HoldingCoinControllerNotifier();

final holdingTabCoinControllerProvider =
    StateNotifierProvider<HoldingCoinControllerNotifier, double?>((ref) {
  return holdingTabCoinControllerNotifier;
});

PopupNotifier holdingTabPopupNotifier = PopupNotifier();

final holdingTabPopUpProvider =
    StateNotifierProvider.autoDispose<PopupNotifier, bool>((ref) {
  ref.onDispose(() {
    holdingTabPopupNotifier = PopupNotifier();
  });
  return holdingTabPopupNotifier;
});

ButtonLoaderNotifier holdingTabButtonLoaderNotifier = ButtonLoaderNotifier();

final holdingTabButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  ref.onDispose(() {
    holdingTabButtonLoaderNotifier = ButtonLoaderNotifier();
  });
  return holdingTabButtonLoaderNotifier;
});

//WATCHLIST

CoinControllerNotifier watchlistCoinControllerNotifier =
    CoinControllerNotifier();

final watchlistCoinControllerProvider =
    StateNotifierProvider<CoinControllerNotifier, int?>((ref) {
  return watchlistCoinControllerNotifier;
});

PopupNotifier watchlistPopupNotifier = PopupNotifier();

final watchlistPopUpProvider =
    StateNotifierProvider.autoDispose<PopupNotifier, bool>((ref) {
  ref.onDispose(() {
    watchlistPopupNotifier = PopupNotifier();
  });
  return watchlistPopupNotifier;
});

ButtonLoaderNotifier watchlistButtonLoaderNotifier = ButtonLoaderNotifier();

final watchlistButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  ref.onDispose(() {
    watchlistButtonLoaderNotifier = ButtonLoaderNotifier();
  });
  return watchlistButtonLoaderNotifier;
});
