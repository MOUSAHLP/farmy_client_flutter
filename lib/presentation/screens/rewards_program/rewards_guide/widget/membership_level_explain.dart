import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/models/reward/reward_membership_guide_model.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/screens/rewards_program/rewards_guide/widget/membership_level_feature.dart';
import 'package:pharma/translations.dart';

class MembershipLevelExplain extends StatelessWidget {
  final String level;
  final Color crownColor;
  final String explain;
  final List<Feature> features;

  const MembershipLevelExplain({
    super.key,
    required this.level,
    this.crownColor = ColorManager.bronze,
    required this.explain,
    this.features = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p5),
      decoration: BoxDecoration(
        color: ColorManager.white,
        boxShadow: [
          ColorManager.shadowGaryDown,
        ],
        borderRadius: BorderRadius.circular(RadiusApp.r5),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: PaddingApp.p10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IconsManager.crown,
                        width: 50.w,
                        height: 40.h,
                        colorFilter: ColorFilter.mode(
                          crownColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text(
                        level,
                        style: getUnderBoldStyle(
                          color: ColorManager.grayForMessage,
                          fontSize: FontSizeApp.s14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: PaddingApp.p10,
                    horizontal: PaddingApp.p18,
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: ColorManager.grayForSearch,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: PaddingApp.p10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      explain,
                      style: getUnderBoldStyle(
                        color: ColorManager.grayForMessage,
                        fontSize: FontSizeApp.s13,
                        height: 1.6,
                      ),
                    ),
                    if (features.isNotEmpty)
                      SizedBox(
                        height: 5.h,
                      ),
                    if (features.isNotEmpty)
                      Text(
                        AppLocalizations.of(context)!.rank_features,
                        style: getUnderBoldStyle(
                          color: ColorManager.primaryGreen,
                          fontSize: FontSizeApp.s13,
                        ),
                      ),
                    ...List.generate(
                      features.length,
                      (index) => Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          MembershipLevelFeature(
                            feature: features[index].description,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
