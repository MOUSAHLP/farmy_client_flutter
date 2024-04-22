import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/bloc/setting_bloc/setting_bloc.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/about_the_app/about_the_app_screen.dart';
import 'package:pharma/presentation/screens/delete_account/delete_account_screen.dart';
import 'package:pharma/presentation/screens/delivery_addresses/delivery_addresses.dart';
import 'package:pharma/presentation/screens/electronic_payment_screen/electronic_payment_screen.dart';
import 'package:pharma/presentation/screens/guest_screen/guest_screen.dart';
import 'package:pharma/presentation/screens/my_account_screen/widgets/card_my_account.dart';
import 'package:pharma/presentation/screens/my_evaluation/my_evaluation_screen.dart';
import 'package:pharma/presentation/screens/personal_details_screen/personal_details_screen.dart';
import 'package:pharma/presentation/screens/rewards_program/rewards_program_screen.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../core/services/services_locator.dart';
import '../../../data/data_resource/local_resource/data_store.dart';
import '../base_screen/base_screen.dart';
import '../rate_order/rate_order_screen.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreenScaffold(
        backgroundColor: Colors.white,
        appbarTitle: AppLocalizations.of(context)!.my_Account,
        isComeBack: false,
        body: context.read<SettingBloc>().settingModel != null
            ? Column(
                children: [
                  // CustomAppBarScreen(
                  //     sectionName: AppLocalizations.of(context)!.my_Account,
                  //     isComeBack: false
                  // ),
                  Expanded(
                    child: sl<AuthenticationBloc>().loggedIn
                        ? SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${AppLocalizations.of(context)!.hi}, ",
                                        style: getBoldStyle(
                                          color: ColorManager.primaryGreen,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      Text(
                                        "${DataStore.instance.userInfo?.firstName}",
                                        style: getBoldStyle(
                                            color: ColorManager.primaryGreen,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 14.h),
                                  SvgPicture.asset(IconsManager.crown),
                                  SizedBox(height: 4.h),
                                  Container(
                                    height: 100.h,
                                    width: 100.w,
                                    decoration: const BoxDecoration(
                                      color: ColorManager.lightGray,
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          IconsManager.logoApp,
                                          width: 50,
                                          height: 50,
                                          colorFilter: const ColorFilter.mode(
                                            Color(0xff99B990),
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.edit_Picture,
                                    style: getBoldStyle(
                                      color: ColorManager.primaryGreen,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                  CardMyAccount(
                                      title: AppLocalizations.of(context)!
                                          .personal_Details,
                                      details: AppLocalizations.of(context)!
                                          .name_number,
                                      onTap: () {
                                        AppRouter.push(context,
                                            const PersonalDetailsScreen());
                                      }),
                                  CardMyAccount(
                                      title: AppLocalizations.of(context)!
                                          .delivery_Addresses,
                                      details: AppLocalizations.of(context)!
                                          .edit_Addresses,
                                      onTap: () {
                                        AppRouter.push(
                                            context, const DeliveryScreen());
                                      }),
                                  CardMyAccount(
                                    title: AppLocalizations.of(context)!
                                        .electronic_Payment,
                                    details: AppLocalizations.of(context)!
                                        .payment_Methods,
                                    onTap: () {
                                      AppRouter.push(context,
                                          const ElectronicPaymentScreen());
                                    },
                                  ),
                                  if (context
                                      .read<SettingBloc>()
                                      .settingModel!
                                      .data!
                                      .showRewardSystem!) ...[
                                    CardMyAccount(
                                      title: AppLocalizations.of(context)!
                                          .rewards_Program,
                                      details: AppLocalizations.of(context)!
                                          .redeem_Points_for_Discounts,
                                      onTap: () {
                                        AppRouter.push(context,
                                            const RewardsProgramScreen());
                                      },
                                    ),
                                  ],
                                  CardMyAccount(
                                      title: AppLocalizations.of(context)!
                                          .my_Reviews,
                                      details: AppLocalizations.of(context)!
                                          .all_Reviews,
                                      onTap: () {
                                        AppRouter.push(context,
                                            const MyEvaluationScreen());
                                      }),
                                  CardMyAccount(
                                      title: AppLocalizations.of(context)!
                                          .about_the_App,
                                      details: AppLocalizations.of(context)!
                                          .about_the_App,
                                      onTap: () {
                                        AppRouter.push(
                                            context, const AboutTheAppcreen());
                                      }),
                                  CardMyAccount(
                                      title: AppLocalizations.of(context)!
                                          .delete_account,
                                      details: AppLocalizations.of(context)!
                                          .delete_account,
                                      onTap: () {
                                        AppRouter.push(
                                            context, DeleteAccountScreen());
                                      }),
                                ],
                              ),
                            ),
                          )
                        : const GuestScreen(),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(
                color: ColorManager.primaryGreen,
              )));
  }
}
