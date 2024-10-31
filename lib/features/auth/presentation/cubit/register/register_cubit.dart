import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mart_app/features/auth/data/repos/register_repo.dart';

import '../../../data/models/register_data.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  bool visibale = false;
  IconData suffixIcon = Icons.visibility_outlined;
  void changeVisibale() {
    emit(RegisterInitial());
    visibale = !visibale;
    suffixIcon =
        visibale ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeVisibaleState());
  }

  Future createUserWithEmailAndPassword() async {
    emit(RegisterLoadingState());
    final result = await registerRepo.createUserWithEmailAndPassword(
      RegisterData(
        email: registerEmailController.text,
        password: registerPasswordController.text,
        name: registerNameController.text,
      ),
    );
    result.fold(
      (l) => emit(RegisterErrorState(errorMessage: l.message)),
      (r) => emit(
        RegisterSucessState(message: r),
      ),
    );
  }
}
