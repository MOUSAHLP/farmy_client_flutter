import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/bloc/setting_bloc/setting_bloc.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/core/launcher.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/presentation/screens/notification_screen/notification_screen.dart';
import 'package:pharma/translations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../bloc/home_bloc/home_bloc.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.only(top: 40.h),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        InkWell(
                          child: Image.asset(
                            ImageManager.menuImage,
                            height: 21,
                            width: 21,
                          ),
                          onTap: () {
                                 scaffoldKey?.currentState?.openDrawer();
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: InkWell(
                            onTap: () {
                              AppRouter.push(
                                  context, const NotificationScreen());
                            },
                            child: Image.asset(
                              ImageManager.notificationImage,
                              height: 17,
                              width: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          IconsManager.logoApp,
                          height: 31,
                          width: 31,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "فارمي",
                          style: getBoldStyle(
                              color: Colors.white, fontSize: FontSizeApp.s24),
                        ),
                      ],
                    ),
                  ),
                   Expanded(
                    flex: 1,
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            var settingModel =
                                context.read<SettingBloc>().settingModel;
                            if (settingModel != null) {
                              openWhatsApp(settingModel.data!.phone??"", context);
                            }
                          },
                          child: Image.asset(
                            ImageManager.contactUs,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            InputFieldAuth(
              maxLines: 2,
              textStyle: getBoldStyle(color: ColorManager.grayForSearchProduct),
              hintText: AppLocalizations.of(context)!.searchForProduct,
              hintStyle: getBoldStyle(
                color: ColorManager.grayForSearchProduct,
                fontSize: FontSizeApp.s14,
              ),
              prefixIcon: const Icon(Icons.search),
              height: 44.h,
              width: 1.sw - 25,
              color: ColorManager.grayForSearch,
              borderColor: ColorManager.grayForSearchProduct,
            )
          ],
        ),
      ),
    );
  }
}
