import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: SingleChildScrollView(
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
                          .validate()) {}
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
      ),
    ));
  }
}
