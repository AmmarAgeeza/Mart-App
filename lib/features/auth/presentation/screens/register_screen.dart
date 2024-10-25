import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/widgets/custom_button.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../components/auth_header_component.dart';
import '../components/or_divider_component.dart';
import '../components/register/already_have_account.dart';
import '../components/register/register_form_component.dart';
import '../components/register/social_media_register_component.dart';
import '../components/register/terms_conditions.dart';
import '../cubit/register/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                  //login button
                  CustomButton(
                    onPressed: () {
                      if (context
                          .read<RegisterCubit>()
                          .registerFormKey
                          .currentState!
                          .validate()) {}
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
                  // already have an account
                  const Center(child: AlreadyHaveAccountText()),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
