import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mart_app/core/utils/app_strings.dart';

import '../../cubit/login/login_cubit.dart';
import '../social_media_auth_item.dart';

class SocialMediaLoginComponent extends StatelessWidget {
  const SocialMediaLoginComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocailMediaAuthItem(
          onPressed: () {
            context.read<LoginCubit>().signinWithGoogle();
          },
          title: AppStrings.signInWithGoogle,
          iconName: Brands.google,
        ),
        const SizedBox(
          height: 16,
        ),
        SocailMediaAuthItem(
          onPressed: () {},
          title: AppStrings.signInWithFacebook,
          iconName: Brands.facebook,
        ),
      ],
    );
  }
}
