import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mart_app/features/auth/presentation/cubit/register/register_cubit.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/custom_validations.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class RegisterFormComponent extends StatelessWidget {
  const RegisterFormComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().registerFormKey,
      child: Column(
        children: [
          //username
          CustomTextFormField(
            controller: context.read<RegisterCubit>().registerNameController,
            type: TextInputType.name,
            fillColor: AppColors.grey,
            filled: true,
            prefix: Icons.person,
            hint: AppStrings.nameHint,
            hintColor: AppColors.black,
            validate: (value) {
              if (value == null ||
                  !CustomValidationHandler.isValidName(value)) {
                return AppStrings.enterValidName;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 18,
          ),
          //email
          CustomTextFormField(
            controller: context.read<RegisterCubit>().registerEmailController,
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
          //password
          CustomTextFormField(
            controller:
                context.read<RegisterCubit>().registerPasswordController,
            type: TextInputType.visiblePassword,
            fillColor: AppColors.grey,
            filled: true,
            prefix: Icons.lock,
            hint: AppStrings.passwordHint,
            hintColor: AppColors.black,
            suffix: context.watch<RegisterCubit>().suffixIcon,
            isPassword: context.watch<RegisterCubit>().visibale,
            suffixPressed: () {
              context.read<RegisterCubit>().changeVisibale();
            },
            validate: (value) {
              if (value == null ||
                  !CustomValidationHandler.isValidPassword(value)) {
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
