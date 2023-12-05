
import 'package:flutter/material.dart';
import 'package:pharma/presentation/screens/onboarding_screen/widget/language_selection.dart';
import 'package:pharma/translations.dart';
import '../../../resources/assets_manager.dart';
import 'on_boarding_body.dart';

class SlideItem extends StatelessWidget {
  const SlideItem(this.index, {super.key});
  final int index;
  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return const LanguageSelection();
      case 1:
        return OnBoardingBody(
          image:ImageManager.onBoarding1,
         imageSlide: ImageManager.slide1,
         text:  AppLocalizations.of(context)!.onBoarding1,
        index: index,
        );
      case 2:
        return OnBoardingBody(
          image:   ImageManager.onBoarding2,
          imageSlide: ImageManager.slide2,
          text:  AppLocalizations.of(context)!.onBoarding2,
          index: index,
        );
      case 3:
        return OnBoardingBody(
          image:  ImageManager.onBoarding3,
          imageSlide: ImageManager.slide3,
          text:    AppLocalizations.of(context)!.onBoarding3,
          index: index,
        );
      default:
        return Container(); // Default case, empty container
    }
  }
}
