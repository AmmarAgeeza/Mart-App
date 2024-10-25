import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';

class ForgetPasswordComponent extends StatelessWidget {
  const ForgetPasswordComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
          onPressed: () {},
          child: Text(
            AppStrings.forgotPassword,
            style: AppStyles.semiBoldOrang16.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: AppColors.orange,
            ),
          )),
    );
  }
}
