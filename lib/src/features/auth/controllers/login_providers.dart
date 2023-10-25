import 'package:flutter/material.dart';

class LoginInProvider with ChangeNotifier {
  // Email

  String _email = '';

  String get email => _email;

  void setEmail(String newText) {
    _email = newText;
    notifyListeners();
  }
  // Password

  String _password = '';

  String get password => _password;

  void setPassword(String newText) {
    _password = newText;
    notifyListeners();
  }

  // Set Error Message

  String _error = '';

  String get error => _error;

  void setError(String newText) {
    _error = newText;
    notifyListeners();
  }

  // Show Error Message (boolean)

  bool _showError = false;

  bool get showError => _showError;

  void setShowError(bool newState) {
    _showError = newState;
    notifyListeners();
  }
}
