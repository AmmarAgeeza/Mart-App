import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class LoginFormComponent extends StatelessWidget {
  const LoginFormComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: TextEditingController(),
          type: TextInputType.emailAddress,
          fillColor: AppColors.grey,
          filled: true,
          prefix: Icons.mail,
          hint: AppStrings.emailHint,
          hintColor: AppColors.black,
        ),
        const SizedBox(
          height: 18,
        ),
        CustomTextFormField(
          controller: TextEditingController(),
          type: TextInputType.visiblePassword,
          fillColor: AppColors.grey,
          filled: true,
          prefix: Icons.lock,
          hint: AppStrings.passwordHint,
          hintColor: AppColors.black,
          suffix: Icons.remove_red_eye,
          suffixPressed: () {},
        ),
      ],
    );
  }
}
