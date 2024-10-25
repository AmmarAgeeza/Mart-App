import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mart_app/core/utils/commons.dart';
import 'package:mart_app/features/onboarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/models/on_boarding_model.dart';

class OnBoadringItem extends StatelessWidget {
  const OnBoadringItem({
    super.key,
    required this.model,
    required this.controller,
    required this.index,
  });
  final OnBoardingModel model;
  final PageController controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Stack(
            children: [
              SvgPicture.asset(
                AppImages.onBoardingBackground,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Center(
                child: SvgPicture.asset(
                  model.image,
                  // width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 28,
        ),
        Text(
          model.title,
          style: AppStyles.boldBlack22,
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            model.subTitle,
            style: AppStyles.mediumBlack16,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 28,
        ),
        //dots
        SmoothPageIndicator(
          controller: controller, // PageController
          count: 3,
          effect: const ExpandingDotsEffect(
            dotWidth: 18,
            activeDotColor: AppColors.orange,
          ),
          onDotClicked: (index) {},
        ),
        const SizedBox(
          height: 28,
        ),
        //button
        Container(
          height: 60,
          width: double.infinity,
          margin: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [
                Color(0xffFF8B38),
                Color(0xffF3664B),
              ],
            ),
          ),
          child: BlocListener<OnBoardingCubit, OnBoardingState>(
            listener: (context, state) {
              if (state is OnBoardingSucess) {
                context.navigateTo(screenRoute: Routes.loginRoute);
              }
            },
            child: InkWell(
              onTap: () {
                index == 2
                    ? context.read<OnBoardingCubit>().saveCacheVisition()
                    : controller.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.bounceIn,
                      );
              },
              child: Center(
                child: Text(
                  index == 2
                      ? AppStrings.getStarted.toUpperCase()
                      : AppStrings.next.toUpperCase(),
                  style: AppStyles.boldWhite16,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
