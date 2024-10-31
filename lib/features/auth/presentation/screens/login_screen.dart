import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mart_app/core/utils/commons.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/widgets/loading_component.dart';
import '/core/widgets/custom_button.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../components/auth_header_component.dart';
import '../components/login/dont_have_account_text.dart';
import '../components/login/forget_password_component.dart';
import '../components/login/login_form_component.dart';
import '../components/or_divider_component.dart';
import '../components/login/social_media_login_component.dart';
import '../cubit/login/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            context.showToastMsg(
                msg: state.errorMessage, toastState: ToastStates.error);
          }
          if (state is LoginSucessState) {
            context.showToastMsg(
                msg: state.message, toastState: ToastStates.success);
            context.navigateAndFinish(screenRoute: Routes.homeRoute);
          }
        },
        builder: (context, state) {
          return state is LoginLoadingState
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
                            //login form
                            const Text(
                              AppStrings.welcomeBack,
                              style: AppStyles.boldBlack22,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const LoginFormComponent(),
                            //forget password
                            const ForgetPasswordComponent(),
                            //login button
                            CustomButton(
                              onPressed: () {
                                if (context
                                    .read<LoginCubit>()
                                    .loginFormKey
                                    .currentState!
                                    .validate()) {
                                  context
                                      .read<LoginCubit>()
                                      .singUserWithEmailAndPassword();
                                }
                              },
                              text: AppStrings.signIn,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            //divider => ----or----
                            const OrDividerComponent(),
                            const SizedBox(
                              height: 24,
                            ),
                            //social auth
                            const SocialMediaLoginComponent(),
                            const SizedBox(
                              height: 24,
                            ),
                            // don't have an account
                            const Center(child: DontHaveAccountText()),
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
