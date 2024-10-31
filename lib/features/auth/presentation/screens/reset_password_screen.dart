import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mart_app/core/utils/commons.dart';

import '/core/widgets/custom_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/custom_validations.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/loading_component.dart';
import '../components/auth_header_component.dart';
import '../cubit/reset_password/reset_password_cubit.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordError) {
          context.showToastMsg(msg: state.error, toastState: ToastStates.error);
        }
        if (state is ResetPasswordSuccess) {
          context.showToastMsg(
              msg: state.message, toastState: ToastStates.success);
          context.pop();
        }
      },
      builder: (context, state) {
        return state is ResetPasswordLoading
            ? const LoadingScreen()
            : SingleChildScrollView(
                child: Form(
                  key: context.read<ResetPasswordCubit>().formKey,
                  child: Column(
                    children: [
                      //header => background image and logo
                      const AuthHeaderComponent(),
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              AppStrings.resetYourPassword,
                              style: AppStyles.boldBlack22,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            CustomTextFormField(
                              controller: context
                                  .read<ResetPasswordCubit>()
                                  .emailController,
                              type: TextInputType.emailAddress,
                              fillColor: AppColors.grey,
                              filled: true,
                              prefix: Icons.mail,
                              hint: AppStrings.emailHint,
                              hintColor: AppColors.black,
                              validate: (value) {
                                if (value == null ||
                                    !CustomValidationHandler.isValidEmail(
                                        value)) {
                                  return AppStrings.enterValidEmail;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            //reset password button
                            CustomButton(
                              onPressed: () {
                                if (context
                                    .read<ResetPasswordCubit>()
                                    .formKey
                                    .currentState!
                                    .validate()) {
                                  context
                                      .read<ResetPasswordCubit>()
                                      .resetPassword();
                                }
                              },
                              text: AppStrings.resetPassword,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
      },
    )));
  }
}
