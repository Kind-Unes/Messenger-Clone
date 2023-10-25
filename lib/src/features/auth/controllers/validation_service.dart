import 'package:hooks_riverpod/hooks_riverpod.dart';

//Validation Service Provider
final validationServiceProvider = Provider<ValidationService>((ref) {
  return ValidationService();
});

class ValidationService {
  bool isEmailValid(String email) {
    if (email.isEmpty == true ||
        RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email) ==
            false) {
      return false;
    } else {
      return true;
    }
  }

  bool isPhoneNumberValid(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    final cleanPhoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Use a regular expression to check if the cleaned phone number matches a common format
    final phoneRegExp = RegExp(r'^\d{10}$');

    return phoneRegExp.hasMatch(cleanPhoneNumber);
  }

  bool isPasswordValid(String password) {
    // Implement your password validation logic here
    return password.length >= 6;
  }
}

class ValidationState {
  bool firstNameValidation = false;
  bool lastNameValidation = false;
  bool bothValidation = false;
}
