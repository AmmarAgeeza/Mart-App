import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mart_app/core/utils/app_enums.dart';
import 'package:mart_app/core/utils/commons.dart';

import '/core/widgets/custom_button.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/loading_component.dart';
import '../components/auth_header_component.dart';
import '../components/register/already_have_account.dart';
import '../components/register/register_form_component.dart';
import '../components/register/terms_conditions.dart';
import '../cubit/register/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            context.showToastMsg(
                msg: state.errorMessage, toastState: ToastStates.error);
          }
          if (state is RegisterSucessState) {
            context.showToastMsg(
                msg: state.message, toastState: ToastStates.success);
            context.navigateAndFinish(screenRoute: Routes.loginRoute);
          }
        },
        builder: (context, state) {
          return state is RegisterLoadingState
              ? const LoadingScreen()
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //header => background image and logo
                      const AuthHeaderComponent(),
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //register form
                            const Text(
                              AppStrings.createYourAccount,
                              style: AppStyles.boldBlack22,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const RegisterFormComponent(),
                            const SizedBox(
                              height: 24,
                            ),
                            //register button
                            CustomButton(
                              onPressed: () {
                                if (context
                                    .read<RegisterCubit>()
                                    .registerFormKey
                                    .currentState!
                                    .validate()) {
                                  context
                                      .read<RegisterCubit>()
                                      .createUserWithEmailAndPassword();
                                }
                              },
                              text: AppStrings.signUp,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            const TermsConditionsText(),
                            const SizedBox(
                              height: 24,
                            ),
                            /*
                            //divider => ----or----
                            const OrDividerComponent(),
                            const SizedBox(
                              height: 24,
                            ),
                            //social auth
                            const SocialMediaRegisterComponent(),
                            const SizedBox(
                              height: 24,
                            ),
                            */
                            // already have an account
                            const Center(child: AlreadyHaveAccountText()),
                          ],
                        ),
                      )
                    ],
                  ),
                );
        },
      ),
    ));
  }
}
