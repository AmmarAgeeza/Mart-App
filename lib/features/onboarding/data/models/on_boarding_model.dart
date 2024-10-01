import 'package:mart_app/core/utils/app_images.dart';
import 'package:mart_app/core/utils/app_strings.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String subTitle;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
  static List<OnBoardingModel> data = [
    OnBoardingModel(
      image: AppImages.on1,
      title: AppStrings.onBoardingTitle1,
      subTitle: AppStrings.onBoardingSubTitle1,
    ),
    OnBoardingModel(
      image: AppImages.on2,
      title: AppStrings.onBoardingTitle2,
      subTitle: AppStrings.onBoardingSubTitle2,
    ),
    OnBoardingModel(
      image: AppImages.on3,
      title: AppStrings.onBoardingTitle3,
      subTitle: AppStrings.onBoardingSubTitle3,
    ),
  ];
}
