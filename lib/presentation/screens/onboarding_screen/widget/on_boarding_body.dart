import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/onboarding_bloc/onboarding_event.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/translations.dart';
import '../../../../bloc/onboarding_bloc/onboarding_bloc.dart';
import '../../../../bloc/onboarding_bloc/onboarding_state.dart';
import '../../../widgets/custom_button.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody(
      {super.key,
      required this.image,
      required this.imageSlide,
      required this.text,
      required this.index});

  final String image;
  final String imageSlide;
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      builder: (context, state) => Stack(
        children: [
          Container(
            height: 1.sh,
            width: 1.sw,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Image.asset(
                    image,
                    fit: BoxFit.fill,
                    width: 1.sw,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
                width: 1.sw,
                height: 1.sh,
                child: Image.asset(
                  imageSlide,
                  width: 1.sw,
                  height: 1.sh,
                  fit: BoxFit.fill,
                )),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: 1.sw,
              height: 1.sh / 2.5,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: SizedBox(
                      height: 10.h,
                      width: 1.sw,
                      child: Text(
                        text,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: getBoldStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 1; i < 4; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: i == index
                                  ? ColorManager.yellow
                                  : ColorManager.grayForSearch,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 47),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: CustomButton(
                      label: AppLocalizations.of(context)!.next,
                      isFilled: true,
                      fillColor: Colors.white,
                      labelColor: ColorManager.primaryGreen,
                      onTap: () {
                        if (context.read<OnBoardingBloc>().currentPage == 3) {
                          context.read<OnBoardingBloc>().add(OnPressedSkip());
                        } else {
                          context.read<OnBoardingBloc>().add(ChangeIndex(
                              context.read<OnBoardingBloc>().currentPage + 1));
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
