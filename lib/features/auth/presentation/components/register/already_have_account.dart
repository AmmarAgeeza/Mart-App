import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/core/utils/commons.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: AppStyles.mediumBlack16.copyWith(color: AppColors.softGrey),
          ),
          TextSpan(
            text: ' Sign In',
            style: AppStyles.semiBoldOrang16,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pop();
              },
          ),
        ],
      ),
    );
  }
}
