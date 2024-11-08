import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mart_app/core/database/firebase/database_service.dart';
import 'package:mart_app/features/auth/data/repos/register_repo.dart';

import '../../../../core/database/cache/cache_consumer.dart';
import '../../../../core/database/cache/cache_keys.dart';
import '../../../../core/database/firebase/app_exceptions_strings.dart';
import '../../../../core/database/firebase/end_points.dart';
import '../../../../core/database/firebase/firebase_auth_service.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/service_locator.dart';
import '../models/user_model.dart';

class LoginRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  final RegisterRepo registerRepo;
  LoginRepo(
      {required this.firebaseAuthService,
      required this.databaseService,
      required this.registerRepo});
  Future<Either<Failure, String>> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userModel = await getUserData(uid: user.uid);
      await saveUserData(uId: userModel.uId);
      return right(
        'Logged in successfully',
      );
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(
        ServerFailure(
          AppExceptionsStrings.somethingWentWrong,
        ),
      );
    }
  }

//get user data from firestore
  Future<UserModel> getUserData({required String uid}) async {
    var userData = await databaseService.getData(
        path: Endpoints.getUsersData, docuementId: uid);
    return UserModel.fromJson(userData);
  }

  Future saveUserData({required String uId}) async {
    await sl<CacheConsumer>().saveData(key: CacheKeys.userUid, value: uId);
  }

  Future<Either<Failure, String>> signinWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userModel = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseService.checkIfDataExists(
          path: Endpoints.isUserExists, docuementId: user.uid);
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await registerRepo.addUserData(user: userModel);
      }

      await saveUserData(uId: userModel.uId);
      return right('Logged in successfully');
    } catch (e) {
      await registerRepo.deleteUser(user);

        log('$e');
      return left(
        ServerFailure(
          AppExceptionsStrings.somethingWentWrong,
        ),
      );
    }
  }
}
