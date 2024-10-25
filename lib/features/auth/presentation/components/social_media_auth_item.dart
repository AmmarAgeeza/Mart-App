import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class SocailMediaAuthItem extends StatelessWidget {
  const SocailMediaAuthItem({
    super.key,
    required this.onPressed,
    required this.title,
    required this.iconName,
  });
  final VoidCallback onPressed;
  final String title;
  final String iconName;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: AppColors.orange,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Brand(iconName),
          const SizedBox(
            width: 12,
          ),
          Text(
            title,
            style: AppStyles.mediumBlack16,
          ),
        ],
      ),
    );
  }
}