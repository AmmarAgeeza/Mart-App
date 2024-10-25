import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class OrDividerComponent extends StatelessWidget {
  const OrDividerComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.grey,
            thickness: 2,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Or',
            style: AppStyles.mediumBlack16,
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColors.grey,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
