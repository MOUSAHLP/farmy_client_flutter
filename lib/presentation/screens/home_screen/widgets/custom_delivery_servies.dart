import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/setting_bloc/setting_bloc.dart';
import 'package:pharma/bloc/setting_bloc/setting_event.dart';
import 'package:pharma/bloc/setting_bloc/setting_state.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/account_screen.dart';
import 'package:pharma/presentation/widgets/dialogs/loading_dialog.dart';

import '../../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../translations.dart';
import '../../../widgets/custom_button.dart';

class CustomDeliveryService extends StatelessWidget {
  const CustomDeliveryService({super.key});

  @override
  Widget build(BuildContext context) {
    return sl<AuthenticationBloc>().loggedIn
        ? Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                alignment: Alignment.center,
                width: 1.sw,
                height: 61,
                color: ColorManager.lightGray,
                child: Text(
                  "خدمة التوصيل متوفرة من الساعة ${context.read<SettingBloc>().settingModel!.data!.openingTimes!.startTime} صباحاً حتى الساعة ${context.read<SettingBloc>().settingModel!.data!.openingTimes!.startTime} مساءً, من الممكن اختيار الطلب الآن والتوصيل صباحاً",
                  textAlign: TextAlign.center,
                  style: getBoldStyle(
                    color: ColorManager.grayForMessage,
                  ),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 1.sw,
                //height: 61,
                color: ColorManager.lightGray,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 6,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.welcome_to,
                        style: getBoldStyle(
                          color: ColorManager.primaryGreen,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.sign_now_or_create,
                        style: getBoldStyle(
                          color: ColorManager.grayForMessage,
                        ),
                      ),
                      CustomButton(
                        label: AppLocalizations.of(context)!.sign_in,
                        width: 1.sw / 2,
                        onTap: () {
                          AppRouter.push(
                            context,
                            const AccountScreen(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
