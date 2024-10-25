import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  bool visibale=false;
  IconData suffixIcon = Icons.visibility_outlined;
  void changeVisibale(){
    emit(RegisterInitial());
    visibale = !visibale;
    suffixIcon = visibale ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeVisibaleState());
  }
}
