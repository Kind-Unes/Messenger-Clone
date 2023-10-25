import 'package:flutter/material.dart';
import 'package:messenger_clone_app/src/features/auth/controllers/validation_service.dart';

class InformationsProvider with ChangeNotifier {
  String _firstName = '';

  String get firstName => _firstName;

  void setFirstName(String newText) {
    _firstName = newText;
    notifyListeners();
  }

  String _lastName = '';

  String get lastName => _lastName;
  void setLastName(String newText) {
    _lastName = newText;
    notifyListeners();
  }

  bool _showFirst = false;

  bool get showFirst => _showFirst;

  void setFirstNameVerification(bool newShow) {
    _showFirst = newShow;
    notifyListeners();
  }

  bool _showLast = false;

  bool get showLast => _showLast;

  void setLastNameVerification(bool newShow) {
    _showLast = newShow;
    notifyListeners();
  }

  bool _showBoth = false;

  bool get showBoth => _showBoth;

  void setBothVerification(bool newShow) {
    _showBoth = newShow;
    notifyListeners();
  }

  String _email = "";
  bool _showMail = false;

  bool get showMail => _showMail;
  String get email => _email;

  final ValidationService _validationService = ValidationService();

  void setEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void isEmailValid() {
    _showMail = !_validationService.isEmailValid(_email);
    notifyListeners();
  }

  String _phoneNumber = "";
  bool _showPhoneNumber = false;

  get phoneNumber => _phoneNumber;
  get showPhoneNumber => _showPhoneNumber;

  void setPhoneNumber(String number) {
    _phoneNumber = number;
    notifyListeners();
  }

  void isPhoneValid() {
    _showPhoneNumber = !_validationService.isPhoneNumberValid(_phoneNumber);
    notifyListeners();
  }

  String _selectedGender = "Male";

  String get selectedGender => _selectedGender;

  void setGender(String gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  final ValidationService _passwordValidationService = ValidationService();
  bool _isPasswordValid = true;

  bool get isPasswordValid => _isPasswordValid;

  String _password = "";

  String get password => _password;

  void setPassword(String newPass) {
    _password = newPass;
    notifyListeners();
  }

  void validatePassword(String password) {
    _isPasswordValid = _passwordValidationService.isPasswordValid(password);
    notifyListeners();
  }
}
