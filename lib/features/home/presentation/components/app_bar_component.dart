import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(AppImages.logoColor),
          IconButton(
            style: const ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(10),
              ))),
              backgroundColor: WidgetStatePropertyAll(AppColors.orange),
            ),
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_rounded),
          )
        ],
      ),
    );
  }
}
