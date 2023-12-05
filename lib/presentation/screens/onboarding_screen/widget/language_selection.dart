
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/language_bloc/language_bloc.dart';
import 'package:pharma/bloc/language_bloc/language_event.dart';
import 'package:pharma/bloc/language_bloc/language_state.dart';
import 'package:pharma/bloc/onboarding_bloc/onboarding_bloc.dart';
import 'package:pharma/bloc/onboarding_bloc/onboarding_event.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';

class LanguageSelection extends StatelessWidget {
  const LanguageSelection({super.key,});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                const SizedBox(
                  height: 50,
                ),
                Image.asset(ImageManager.onBoarding1,fit: BoxFit.fill, width: 1.sw,),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: 1.sw,
            height: 1.sh ,
            child:Image.asset(ImageManager.slide1,  width: 1.sw,
              height: 1.sh ,
            fit: BoxFit.fill,)
          ),
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: 1.sw,
            height: 1.sh / 2.5
            ,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "اختر اللغة",
                    style: getBoldStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    "Choose Language",
                    style: getBoldStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<LanguageBloc, LanguageState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: Container(
                          width: 1.sw,
                          height: 47,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (context.read<LanguageBloc>().lang == "ar") {
                                        context.read<LanguageBloc>().add(
                                          NewLanguageChange("en"),
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: context.read<LanguageBloc>().lang == "en"
                                            ? ColorManager.primaryGreen
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "English",
                                          style: getBoldStyle(
                                            color: context.read<LanguageBloc>().lang == "en"
                                                ? Colors.white
                                                : ColorManager.primaryGreen,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (context.read<LanguageBloc>().lang == "en") {
                                        context.read<LanguageBloc>().add(
                                          NewLanguageChange("ar"),
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: context.read<LanguageBloc>().lang == "ar"
                                            ? ColorManager.primaryGreen
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "عربي",
                                          style: getBoldStyle(
                                            color: context.read<LanguageBloc>().lang == "ar"
                                                ? Colors.white
                                                : ColorManager.primaryGreen,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 47,
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: CustomButton(
                      label: AppLocalizations.of(context)!.next,
                      isFilled: true,
                      fillColor: Colors.white,
                      labelColor: ColorManager.primaryGreen,
                      onTap: (){
                        context.read<OnBoardingBloc>().add(
                            ChangeIndex(context
                                .read<OnBoardingBloc>()
                                .currentPage + 2));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
