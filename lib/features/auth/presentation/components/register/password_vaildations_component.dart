import 'package:flutter/material.dart';
import 'package:mart_app/core/utils/app_colors.dart';

import '../../../../../core/utils/app_styles.dart';

class PasswordValidationsComponent extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidationsComponent({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        passwordValidationItem('At least 1 lowercase letter', hasLowerCase),
        const SizedBox(
          height: 2,
        ),
        passwordValidationItem('At least 1 uppercase letter', hasUpperCase),
        const SizedBox(
          height: 2,
        ),
        passwordValidationItem(
            'At least 1 special character', hasSpecialCharacters),
        const SizedBox(
          height: 2,
        ),
        passwordValidationItem('At least 1 number', hasNumber),
        const SizedBox(
          height: 2,
        ),
        passwordValidationItem('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget passwordValidationItem(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: AppColors.softGrey,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: AppStyles.mediumBlack16.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: AppColors.orange,
            decorationThickness: 2,
            color: AppColors.softGrey,
          ),
        )
      ],
    );
  }
}
