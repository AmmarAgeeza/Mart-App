import 'package:flutter/material.dart';
import 'package:mart_app/core/utils/commons.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';

class ForgetPasswordComponent extends StatelessWidget {
  const ForgetPasswordComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
          onPressed: () {
            context.navigateTo(screenRoute: Routes.resetPassword);
          },
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
