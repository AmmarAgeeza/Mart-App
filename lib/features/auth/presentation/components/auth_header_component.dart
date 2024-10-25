import 'package:flutter/material.dart';

import 'package:svg_flutter/svg_flutter.dart';

import '/core/utils/app_images.dart';
class AuthHeaderComponent extends StatelessWidget {
  const AuthHeaderComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      width: double.infinity,
      height: 350,
      AppImages.headerBackgroundWithLogo,
      fit: BoxFit.fill,
    );
  }
}
