import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mart_app/core/utils/commons.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/app_styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: AppStyles.mediumBlack16.copyWith(color: AppColors.softGrey),
          ),
          TextSpan(
            text: ' Sign Up',
            style: AppStyles.semiBoldOrang16,
            recognizer: TapGestureRecognizer()..onTap = () {
               context.navigateTo(screenRoute: Routes.register);
            },
          ),
        ],
      ),
    );
  }
}
