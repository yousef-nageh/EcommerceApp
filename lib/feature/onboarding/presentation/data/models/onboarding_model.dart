import 'package:shop_app/core/util/app_image.dart';
import 'package:shop_app/core/util/app_string.dart';

class OnboardingModel {
  final String title;
  final String subTitle;
  final String imagePass;

  OnboardingModel(
      {required this.title, required this.subTitle, required this.imagePass});
}

List<OnboardingModel> onboardingList = [
  OnboardingModel(
      title: AppString.onboardingTitle1,
      subTitle: AppString.onboardingSubTitle1,
      imagePass: AppImage.onboardingImage1),
  OnboardingModel(
      title: AppString.onboardingTitle2,
      subTitle: AppString.onboardingSubTitle2,
      imagePass: AppImage.onboardingImage2),
  OnboardingModel(
      title: AppString.onboardingTitle3,
      subTitle: AppString.onboardingSubTitle3,
      imagePass: AppImage.onboardingImage3),
];
