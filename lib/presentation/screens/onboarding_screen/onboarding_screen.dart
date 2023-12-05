import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/account_screen.dart';
import 'package:pharma/translations.dart';
import '../../../bloc/onboarding_bloc/onboarding_bloc.dart';
import '../../../bloc/onboarding_bloc/onboarding_event.dart';
import '../../../bloc/onboarding_bloc/onboarding_state.dart';
import '../../widgets/over_scroll_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingBloc, OnBoardingState>(
        listener: (context, state) {
      if (state is ExitState) {
        AppRouter.pushReplacement(context, const AccountScreen());
      }
    }, buildWhen: (previous, current) {
      return true;
    }, builder: (context, state) {
      return CustomOverscrollIndicator(
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                PageView(
                  controller: context.read<OnBoardingBloc>().pageController,
                  onPageChanged: (index) {

                    context.read<OnBoardingBloc>().add(ChangeIndex(index));
                  },

                  children: context.read<OnBoardingBloc>().slides,
                ),
                Container(
                  width: 1.sw,
                  color: ColorManager.primaryGreen,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Text(
                            AppLocalizations.of(context)!.skip,
                            style: getRegularStyle(color: Colors.white,fontSize: 16),
                          ),
                          onTap: (){
                            context.read<OnBoardingBloc>().add(OnPressedSkip());
                          },
                        ),
                        Row(
                          children: [
                            Text(
                              "فارمي",
                              style: getBoldStyle(
                                  color: Colors.white,
                                  fontSize: FontSizeApp.s24),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            SvgPicture.asset(
                              IconsManager.logoApp,
                              height: 31,
                              width: 31,
                            ),
                          ],
                        ),
                        context.read<OnBoardingBloc>().currentPage == 0
                            ?  const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.transparent,
                        )
                            : InkWell(
                                onTap: () {
                                  context.read<OnBoardingBloc>().add(
                                      ChangeIndex(context
                                              .read<OnBoardingBloc>()
                                              .currentPage -1));
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.yellow,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
