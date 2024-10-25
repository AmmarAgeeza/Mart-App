import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool visibale=false;
  IconData suffixIcon = Icons.visibility_outlined;
  void changeVisibale(){
    emit(LoginInitial());
    visibale = !visibale;
    suffixIcon = visibale ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeVisibaleState());
  }
}
