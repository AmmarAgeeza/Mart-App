import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class TitleSeeMoreComponent extends StatelessWidget {
  const TitleSeeMoreComponent({
    super.key,
    required this.title,
    required this.onTab,
  });
  final String title;
  final VoidCallback onTab;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            title,
            style: AppStyles.boldBlack22,
          ),
          const Spacer(),
          InkWell(
            onTap: onTab,
            child: const Row(
              children: [
                Text(
                  'See More',
                  style: AppStyles.semiBoldOrang16,
                ),
                Icon(Icons.arrow_forward_ios_sharp, color: AppColors.orange)
              ],
            ),
          )
        ],
      ),
    );
  }
}
