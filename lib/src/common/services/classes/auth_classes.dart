// Define AuthFailure class
class AuthFailure {
  final String message;

  AuthFailure(this.message);

  @override
  String toString() {
    return message;
  }
}

class AuthSucceed {
  final String message;

  AuthSucceed(this.message);

  @override
  String toString() {
    return message;
  }
}
