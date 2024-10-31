import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'You have already registered. Please log in.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'Make sure you are connected to the internet.');
      } else {
        throw CustomException(
            message: 'Something went wrong. Please try again.');
      }
    } catch (e) {
      throw CustomException(message: 'Something went wrong. Please try again.');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'The password or email is incorrect.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'The password or email is incorrect.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(message: 'The password or email is incorrect.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'Make sure you are connected to the internet.');
      } else {
        throw CustomException(
            message: 'Something went wrong. Please try again.');
      }
    } catch (e) {
      throw CustomException(message: 'Something went wrong. Please try again.');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
