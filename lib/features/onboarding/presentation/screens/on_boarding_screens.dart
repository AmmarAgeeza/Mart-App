import 'package:flutter/material.dart';
import 'package:mart_app/features/onboarding/data/models/on_boarding_model.dart';

import '../components/on_boarding_item.dart';

class OnBoardingScreens extends StatelessWidget {
  const OnBoardingScreens({super.key});
  static PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: OnBoardingModel.data.length,
        itemBuilder: (context, index) {
          return OnBoadringItem(
            model: OnBoardingModel.data[index],
            controller: pageController,
            index: index,
          );
        },
      ),
    );
  }
}
