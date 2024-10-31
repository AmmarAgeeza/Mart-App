import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '/core/utils/app_images.dart';

class AuthHeaderComponent extends StatelessWidget {
  const AuthHeaderComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: SvgPicture.asset(
        // width: double.maxFinite,
        AppImages.headerBackgroundWithLogo,
        fit: BoxFit.fill,
      ),
    );
  }
}
