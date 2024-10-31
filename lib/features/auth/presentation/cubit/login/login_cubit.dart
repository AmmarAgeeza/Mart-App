import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mart_app/features/auth/data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool visibale = false;
  IconData suffixIcon = Icons.visibility_outlined;
  void changeVisibale() {
    emit(LoginInitial());
    visibale = !visibale;
    suffixIcon =
        visibale ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeVisibaleState());
  }

  Future singUserWithEmailAndPassword() async {
    emit(LoginLoadingState());
    final result = await loginRepo.signinWithEmailAndPassword(
      loginEmailController.text,
      loginPasswordController.text,
    );
    result.fold(
      (l) => emit(LoginErrorState(errorMessage: l.message)),
      (r) => emit(
        LoginSucessState(message: r),
      ),
    );
  }
    Future signinWithGoogle() async {
      emit(LoginLoadingState());

    var result = await  loginRepo.signinWithGoogle();
   result.fold(
      (l) => emit(LoginErrorState(errorMessage: l.message)),
      (r) => emit(
        LoginSucessState(message: r),
      ),
    );
  }
}
