import 'package:dartz/dartz.dart';
import 'package:mart_app/core/database/firebase/firebase_auth_service.dart';
import 'package:mart_app/core/errors/exceptions.dart';

import '../../../../core/errors/failures.dart';

class ResetPasswordRepo {
  final FirebaseAuthService firebaseAuthService;

  ResetPasswordRepo({required this.firebaseAuthService});
  Future<Either<Failure, String>> forgetPassword(
      {required String email}) async {
    try {
      await firebaseAuthService.sendResetEmail(email: email);
      return right('Email sent successfully');
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
