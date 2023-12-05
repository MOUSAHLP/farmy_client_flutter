import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/core/app_router/app_router.dart';
import '../../../translations.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_app.dart';
import '../../resources/style_app.dart';
import '../../widgets/custom_button.dart';
import '../location_screen/select_location_from_map.dart';

class LocationFirstScreen extends StatelessWidget {
  const LocationFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 1.sw,
              color: ColorManager.primaryGreen,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Text(
                        AppLocalizations.of(context)!.skip,
                        style:
                            getRegularStyle(color: Colors.white, fontSize: 16),
                      ),
                      onTap: () {},
                    ),
                    Row(
                      children: [
                        Text(
                          "فارمي",
                          style: getBoldStyle(
                              color: Colors.white, fontSize: FontSizeApp.s24),
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
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          ImageManager.backgroundLocation,
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                SizedBox(
                  width: 1.sw,
                  height: 1.sh,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 67),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 33,
                          ),
                          Text(
                            AppLocalizations.of(context)!.welcome_to_Farmy,
                            style: getBoldStyle(
                                color: ColorManager.primaryGreen, fontSize: 26),
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .please_choose_delivery_location,
                            style: getRegularStyle(
                                color: ColorManager.primaryGreen, fontSize: 22),
                          ),
                          Image.asset(ImageManager.locationFirst,
                              width: 145, height: 161),
                          const SizedBox(
                            height: 183,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomButton(
                                    label: AppLocalizations.of(context)!
                                        .select_delivery_location,
                                    onTap: () {
                                      AppRouter.push(
                                          context, SelectLocationFromMap());
                                    }),
                                const SizedBox(
                                  height: 16,
                                ),
                                CustomButton(
                                    label: AppLocalizations.of(context)!
                                        .skip_stage_now,
                                    isFilled: true,
                                    labelColor: ColorManager.primaryGreen,
                                    fillColor: Colors.white,
                                    borderColor: ColorManager.primaryGreen),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
