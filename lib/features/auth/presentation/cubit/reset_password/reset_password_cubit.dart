import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/reset_password_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRepo resetPasswordRepo;
  ResetPasswordCubit(this.resetPasswordRepo) : super(ResetPasswordInitial());
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> resetPassword() async {
    emit(ResetPasswordLoading());
    final result = await resetPasswordRepo
        .forgetPassword(email: emailController.text.trim());
    result.fold((failure) {
      emit(ResetPasswordError(failure.message));
    }, (message) {
      emit(ResetPasswordSuccess(message));
    });
  }
}
