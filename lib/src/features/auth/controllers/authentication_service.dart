import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_clone_app/src/common/services/classes/auth_classes.dart';
import 'package:messenger_clone_app/src/common/services/type_def.dart';
import 'package:messenger_clone_app/src/models/user_model.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
      auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance);
});

class AuthService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthService(
      {required FirebaseAuth auth, required FirebaseFirestore firestore})
      : _auth = auth,
        _firestore = firestore;

  //Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  //Register New user
  Future<Either<void, UserModel>> createUserWithEmailAndPassword(
    String email,
    String password,
    String firstName,
    String lastName,
    String pictureURL,
    String gender,
  ) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel? userModel = UserModel(
          uid: userCredential.user!.uid,
          password: password,
          email: email,
          firstName: firstName,
          lastName: lastName,
          pictureURL: pictureURL,
          gender: gender);

      _firestore
          .collection("users")
          .doc(userCredential.user!.uid)
          .set(userModel.toJson());

      return right(userModel);
    } on FirebaseAuthException {
      return left("");
    }
  }

  //Sign in Using Email and password
  Future<AuthResult<UserCredential>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        return left(AuthFailure("Wrong password"));
      } else if (e.code == 'user-not-found') {
        return left(AuthFailure("User not found for that email"));
      } else if (e.code == 'user-disabled') {
        return left(AuthFailure("User account is disabled"));
      } else if (e.code == 'invalid-email') {
        return left(AuthFailure("Invalid email address"));
      } else {
        return left(AuthFailure("An error occurred: ${e.message}"));
      }
    } catch (e) {
      return left(AuthFailure("An unexpected error occurred: $e"));
    }
  }

  //Register New user and delete them immediately : used for Authentication validation purposes
  Future<AutheDelete<String>> validateAndCreateUser(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!.delete();

      return right("Registering Succesfully, User has been Deleted !");

      // If the user is valid, you can continue with further actions.
      // User registration was successful.
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(AuthFailure(
            "The provided email is already registered with another account"));
      } else if (e.code == 'invalid-email') {
        return left(AuthFailure("Invalid email address"));
      } else if (e.code == 'operation-not-allowed') {
        return left(AuthFailure(
            "Email/password accounts are not enabled in Firebase Authentication settings"));
      } else if (e.code == 'weak-password') {
        return left(AuthFailure("The provided password is too weak"));
      } else {
        return left(AuthFailure("An error occurred during registration"));
      }
    }
  }
}
