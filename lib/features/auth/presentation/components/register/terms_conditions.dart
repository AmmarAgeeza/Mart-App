import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class TermsConditionsText extends StatelessWidget {
  const TermsConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By tapping “Sign Up” you accept our ',
            style: AppStyles.mediumBlack16.copyWith(color: AppColors.softGrey),
          ),
          TextSpan(
            text: 'Terms',
            style: AppStyles.semiBoldOrang16,
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(
            text: ' and ',
            style: AppStyles.mediumBlack16.copyWith(color: AppColors.softGrey),
          ),
          TextSpan(
            text: 'Conditions',
            style: AppStyles.semiBoldOrang16,
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(
            text: '.',
            style: AppStyles.mediumBlack16.copyWith(color: AppColors.softGrey),
          ),
        ],
      ),
    );
  }
}
