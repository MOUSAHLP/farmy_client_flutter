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

class RewardsActivityTicket extends StatelessWidget {
  final String text;
  final String code;
  final String codeValidity;
  final String imageText;
  final String
      imagePath; // not used yet -- need to use NetworkImage to use this field
  const RewardsActivityTicket(
      {super.key,
      required this.text,
      required this.code,
      required this.codeValidity,
      required this.imageText,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
          horizontal: PaddingApp.p20, vertical: PaddingApp.p5),
      decoration: BoxDecoration(
        color: ColorManager.white,
        boxShadow: [ColorManager.shadowGaryDownSoft],
        borderRadius: BorderRadius.circular(RadiusApp.r12),
        image: const DecorationImage(
          image: AssetImage(
            ImageManager.ticket,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                    left: BorderSide(
                  color: ColorManager.grayForSearch,
                  width: 1,
                )),
              ),
              padding: const EdgeInsets.fromLTRB(
                  PaddingApp.p10, PaddingApp.p5, PaddingApp.p5, PaddingApp.p5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageManager.discount,
                    width: 80.w,
                    height: 80.h,
                  ),
                  Text(
                    imageText,
                    style: getBoldStyle(color: ColorManager.primaryGreen),
                  )
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: PaddingApp.p8, horizontal: PaddingApp.p14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: getBoldStyle(
                      color: ColorManager.grayForMessage,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: code))
                              .then((value) {
                            var snackBar = SnackBar(
                              duration: const Duration(seconds: 1),
                              content: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    AppLocalizations.of(context)!.code_copied,
                                    style: getRegularStyle(
                                        color: ColorManager.white,
                                        fontSize: FontSizeApp.s14),
                                  )),
                              backgroundColor: ColorManager.primaryGreen,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: PaddingApp.p5,
                              horizontal: code.length < 9
                                  ? PaddingApp.p30
                                  : PaddingApp.p22),
                          decoration: BoxDecoration(
                              color: ColorManager.primaryGreen,
                              borderRadius:
                                  BorderRadius.circular(RadiusApp.r10)),
                          child: Text(
                            code,
                            style: getBoldStyle(
                              color: ColorManager.white,
                              fontSize: FontSizeApp.s14,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(PaddingApp.p5),
                          decoration: BoxDecoration(
                              color: ColorManager.white,
                              shape: BoxShape.circle,
                              boxShadow: [ColorManager.shadowGaryDown]),
                          child: SvgPicture.asset(
                            IconsManager.share,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.copy_code,
                    style: getLightStyle(
                        color: ColorManager.grayForMessage,
                        fontSize: FontSizeApp.s10),
                  ),
                  Text(
                    AppLocalizations.of(context)!.use_only_once,
                    style: getUnderBoldStyle(
                        color: ColorManager.grayForMessage,
                        fontSize: FontSizeApp.s10),
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
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
