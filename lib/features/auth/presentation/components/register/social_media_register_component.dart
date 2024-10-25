import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mart_app/core/utils/app_strings.dart';

import '../social_media_auth_item.dart';

class SocialMediaRegisterComponent extends StatelessWidget {
  const SocialMediaRegisterComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocailMediaAuthItem(
          onPressed: () {},
          title: AppStrings.signupWithGoogle,
          iconName: Brands.google,
        ),
        const SizedBox(
          height: 16,
        ),
        SocailMediaAuthItem(
          onPressed: () {},
          title: AppStrings.signupWithFacebook,
          iconName: Brands.facebook,
        ),
      ],
    );
  }
}
