import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '/core/utils/app_images.dart';
import '/core/widgets/custom_button.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../components/dont_have_account_text.dart';
import '../components/forget_password_component.dart';
import '../components/login_form_component.dart';
import '../components/or_divider_component.dart';
import '../components/social_media_auth_component.dart';
import '../cubit/login_cubit.dart';

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
            SvgPicture.asset(
              width: double.infinity,
              height: 350,
              AppImages.headerBackgroundWithLogo,
              fit: BoxFit.fill,
            ),

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
                  const SocialMediaAuthComponent(),
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
