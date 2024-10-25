import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.orange),
          fixedSize: WidgetStateProperty.all(
            const Size(
              double.maxFinite,
              60,
            ),
          ),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  12,
                ),
              ),
            ),
          ),
        ),
        child: Text(
          text,
          style: AppStyles.boldWhite16,
        ));
  }
}
