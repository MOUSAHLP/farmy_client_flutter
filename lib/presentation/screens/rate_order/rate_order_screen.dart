import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/rate_bloc/rate_bloc.dart';
import '../../../bloc/rate_bloc/rate_event.dart';
import '../../../bloc/rate_bloc/rate_state.dart';
import '../../../core/services/services_locator.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_app.dart';
import '../../resources/style_app.dart';
import '../../widgets/custom_rating.dart';

class RateOrderScreen extends StatelessWidget {
  const RateOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BlocProvider<RateBloc>(
        create: (BuildContext context) => sl<RateBloc>(),
        child: SizedBox(
          width: 1.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 8,
                child: Center(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 12.w),
                    child: Image.asset(
                      ImageManager.rate,
                      fit: BoxFit.cover,
                      width: 0.5.sw,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!. your_order_has_been_delivered,
                          textAlign: TextAlign.center,
                          style: getBoldStyle(
                              fontSize: 28.sp,
                              color: ColorManager.grayForMessage),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "(:  ",
                              textAlign: TextAlign.center,
                              style: getBoldStyle(
                                  fontSize: 28.sp,
                                  color: ColorManager.grayForMessage),
                            ),
                            Text(
                              AppLocalizations.of(context)!.thank_you_for_shopping_from_farmy,
                              textAlign: TextAlign.center,
                              style: getBoldStyle(
                                  fontSize: 28.sp,
                                  color: ColorManager.grayForMessage),
                            ),
                          ],
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Text(
                      AppLocalizations.of(context)!.rate_the_order_now_and_get_extra_points,
                      textAlign: TextAlign.center,
                      style: getSemiBoldStyle(
                          fontSize: 18.sp, color: ColorManager.primaryGreen),
                    ),
                    BlocBuilder<RateBloc, RateState>(builder: (context, state) {
                      return CustomRating(
                        rate: 2,
                        itemSize: 40.w,
                        padding: const EdgeInsetsDirectional.only(
                            end: 20, top: 20, bottom: 20),
                        onRatingUpdate: (double value) {
                          context.read<RateBloc>().add(SubmitRate(rate: value));
                        },
                      );
                    }),
                    25.verticalSpace,
                    InkWell(
                        onTap: () => Navigator.pop(context),
                        customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        child: SvgPicture.asset(IconsManager.close)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(130.h),
      child: Container(
        width: 1.sw,
        height: 130.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              ColorManager.blackGreen,
              ColorManager.primaryGreen,
              ColorManager.darkGreen
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "فارمي",
                          style: getBoldStyle(
                              color: Colors.white, fontSize: FontSizeApp.s24),
                        ),
                        const SizedBox(width: 6),
                        SvgPicture.asset(
                          IconsManager.logoApp,
                          height: 31,
                          width: 31,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
