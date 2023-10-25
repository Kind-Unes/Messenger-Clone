import 'package:riverpod/riverpod.dart';

//Information Providers
final emailProvider = StateProvider<String>((ref) {
  return "";
});

final passwordProvider = StateProvider<String>((ref) {
  return "";
});

final profileURLProvider = StateProvider<String>((ref) {
  return "assets/images/default_picture.jpg";
});

final genderProvider = StateProvider<String>((ref) {
  return "Male";
});

// Full name Providers
final firstNameProvider = StateProvider<String>((ref) {
  return "";
});

final lastNameProvider = StateProvider<String>((ref) {
  return "";
});

final showFirstNameErrorMessageProvider =
    StateProvider.autoDispose<bool>((ref) {
  return false;
});

final showLastNameErrorMessageProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

//ErrorMessage Providers
//*  I'll  try using autoDispose if it didn't work somehow  i'll switch to the other Soution
final errorMessageProvider = StateProvider.autoDispose<String>((ref) {
  return "";
});

final showErrorMessageProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

// Login Providers

final loginEmailProvider = StateProvider<String>((ref) {
  return "";
});

final loginPasswordProvider = StateProvider<String>((ref) {
  return "";
});
