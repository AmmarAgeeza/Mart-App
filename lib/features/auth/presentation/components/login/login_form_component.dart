import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mart_app/features/auth/presentation/cubit/login/login_cubit.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/custom_validations.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class LoginFormComponent extends StatelessWidget {
  const LoginFormComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      // autovalidateMode: AutovalidateMode.onUnfocus,
      key: context.read<LoginCubit>().loginFormKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<LoginCubit>().loginEmailController,
            type: TextInputType.emailAddress,
            fillColor: AppColors.grey,
            filled: true,
            prefix: Icons.mail,
            hint: AppStrings.emailHint,
            hintColor: AppColors.black,
            validate: (value) {
              if (value == null ||
                  !CustomValidationHandler.isValidEmail(value)) {
                return AppStrings.enterValidEmail;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 18,
          ),
          CustomTextFormField(
            controller: context.read<LoginCubit>().loginPasswordController,
            type: TextInputType.visiblePassword,
            fillColor: AppColors.grey,
            filled: true,
            prefix: Icons.lock,
            hint: AppStrings.passwordHint,
            hintColor: AppColors.black,
            suffix: context.watch<LoginCubit>().suffixIcon,
            isPassword: context.watch<LoginCubit>().visibale,
            suffixPressed: () {
              context.read<LoginCubit>().changeVisibale();
            },
            validate: (value) {
              if (value == null ||
                  !CustomValidationHandler.passwordHasMinLength(value)) {
                return AppStrings.enterValidPassword;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
