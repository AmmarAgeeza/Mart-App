import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../errors/exceptions.dart';
import 'app_exceptions_strings.dart';

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
        throw CustomException(message: AppExceptionsStrings.weekPassword);
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: AppExceptionsStrings.emailAlreadyInUse);
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: AppExceptionsStrings.networkRequestFailed);
      } else {
        throw CustomException(message: AppExceptionsStrings.somethingWentWrong);
      }
    } catch (e) {
      throw CustomException(message: AppExceptionsStrings.somethingWentWrong);
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(message: AppExceptionsStrings.userNotFound);
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: AppExceptionsStrings.wrongPassword);
      } else if (e.code == 'invalid-credential') {
        throw CustomException(message: AppExceptionsStrings.invalidCredential);
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: AppExceptionsStrings.networkRequestFailed);
      } else {
        log('ss');
        throw CustomException(message: AppExceptionsStrings.somethingWentWrong);
      }
    } catch (e) {
      log('ss');
      throw CustomException(message: AppExceptionsStrings.somethingWentWrong);
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
