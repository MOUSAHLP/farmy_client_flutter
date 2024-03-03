import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/translations.dart';

class RewardsActivityTicketContent extends StatelessWidget {
  final String code;
  final String codeValidity;
  const RewardsActivityTicketContent(
      {Key? key, required this.code, required this.codeValidity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: code)).then((value) {
              var snackBar = SnackBar(
                duration: const Duration(seconds: 1),
                content: Container(
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.code_copied,
                      style: getRegularStyle(
                          color: ColorManager.white, fontSize: FontSizeApp.s14),
                    )),
                backgroundColor: ColorManager.primaryGreen,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                vertical: PaddingApp.p3, horizontal: PaddingApp.p10),
            decoration: BoxDecoration(
                color: ColorManager.primaryGreen,
                borderRadius: BorderRadius.circular(RadiusApp.r10)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: SvgPicture.asset(
                    IconsManager.copy,
                    width: SizeApp.s14,
                    height: SizeApp.s14,
                    colorFilter: const ColorFilter.mode(
                        ColorManager.white, BlendMode.srcIn),
                  ),
                ),
                Text(
                  code,
                  style: getBoldStyle(
                    color: ColorManager.white,
                    fontSize: FontSizeApp.s14,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        Text(
          AppLocalizations.of(context)!.copy_code,
          style: getLightStyle(
              color: ColorManager.grayForMessage, fontSize: FontSizeApp.s10),
        ),
        Text(
          AppLocalizations.of(context)!.use_only_once,
          style: getUnderBoldStyle(
              color: ColorManager.grayForMessage, fontSize: FontSizeApp.s10),
        ),
        SizedBox(
          height: 7.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.code_validity,
              style: getRegularStyle(
                color: ColorManager.redForTicket,
              ),
            ),
            Text(codeValidity,
                style: getRegularStyle(
                  color: ColorManager.redForTicket,
                )),
          ],
        )
      ],
    );
  }
}
