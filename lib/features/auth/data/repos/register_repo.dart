import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mart_app/features/auth/data/models/user_model.dart';

import '../../../../core/database/firebase/data_service.dart';
import '../../../../core/database/firebase/end_points.dart';
import '../../../../core/database/firebase/firebase_auth_service.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../models/register_data.dart';

class RegisterRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  RegisterRepo({
    required this.firebaseAuthService,
    required this.databaseService,
  });
  Future<Either<Failure, String>> createUserWithEmailAndPassword(
  RegisterData registerData,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: registerData.email,
        password: registerData.password,
      );
      //add user to database after crete account successfully.
      await addUserData(
          user: UserModel(
        name: registerData.name,
        email: registerData.email,
        uId: user.uid,
      ));
      return right('User created successfully');
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      return left(
        ServerFailure(
          'Something went wrong. Please try again.',
        ),
      );
    }
  }
//add user to firestore
  Future addUserData({required UserModel user}) async {
    await databaseService.addData(
      path: DatabaseEndpoint.addUserData,
      data: user.toMap(),
      documentId: user.uId,
    );
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }
}
