import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';
import '../../presentation/resources/assets_manager.dart';
import '../../presentation/screens/onboarding_screen/widget/slide_item.dart';
import '../../translations.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class BoardingBody {
  final String image;
  final String imageSlide;
  final String? text;

  BoardingBody({required this.image, required this.imageSlide, this.text});
}

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  int currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);
  final List<SlideItem> slides = [
    const SlideItem(0),
    const SlideItem(1),
    const SlideItem(2),
    const SlideItem(3),
  ];

  OnBoardingBloc() : super(OnBoardingNavState()) {
    on<OnBoardingEvent>((event, emit) async {
      if (event is OnPressedSkip) {
        DataStore.instance.setShowOnBoarding(true);
        emit(ExitState());
      }
      if (event is ChangeIndex) {
        currentPage = event.index;
        // if (event.index != slides.length) {
        //   pageController.animateToPage(
        //     event.index,
        //     duration: const Duration(milliseconds: 300),
        //     curve: Curves.easeInOut,
        //   );
        // }
        emit(ChangeIndexSuccess());
      }
    });
  }
}
