// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String firstName;
  final String lastName;
  final String pictureURL;
  final String uid;
  final String email;
  final String password;
  final String gender;
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.pictureURL,
    required this.uid,
    required this.email,
    required this.password,
    required this.gender,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? pictureURL,
    String? uid,
    String? email,
    String? password,
    String? gender,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      pictureURL: pictureURL ?? this.pictureURL,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'pictureURL': pictureURL,
      'uid': uid,
      'email': email,
      'password': password,
      'gender': gender,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      pictureURL: map['pictureURL'] as String,
      uid: map['uid'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      gender: map['gender'] as String,
    );
  }

  // Add a toJson method to convert the UserModel to a Map.
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'password': password,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'pictureURL': pictureURL,
      'gender': gender,
    };
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, pictureURL: $pictureURL, uid: $uid, email: $email, password: $password, gender: $gender)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.pictureURL == pictureURL &&
        other.uid == uid &&
        other.email == email &&
        other.password == password &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        pictureURL.hashCode ^
        uid.hashCode ^
        email.hashCode ^
        password.hashCode ^
        gender.hashCode;
  }
}
