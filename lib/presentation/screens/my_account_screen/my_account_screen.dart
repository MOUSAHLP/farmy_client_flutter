import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/about_the_app/about_the_app_screen.dart';
import 'package:pharma/presentation/screens/delete_account/delete_account_screen.dart';
import 'package:pharma/presentation/screens/electronic_payment_screen/electronic_payment_screen.dart';
import 'package:pharma/presentation/screens/guest_screen/guest_screen.dart';
import 'package:pharma/presentation/screens/location_screen/location_screen.dart';
import 'package:pharma/presentation/screens/my_account_screen/widgets/card_my_account.dart';
import 'package:pharma/presentation/screens/my_evaluation/my_evaluation_screen.dart';
import 'package:pharma/presentation/screens/personal_details_screen/personal_details_screen.dart';
import 'package:pharma/presentation/screens/rewards_program/rewards_program_screen.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../core/services/services_locator.dart';
import '../../../data/data_resource/local_resource/data_store.dart';

class MyAccountScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const MyAccountScreen({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.my_Account,
                isComeBack: false),
            Expanded(
              child: sl<AuthenticationBloc>().loggedIn
                  ? SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${DataStore.instance.userInfo?.firstName}",
                                  style: getBoldStyle(
                                      color: ColorManager.primaryGreen,
                                      fontSize: 15),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            SvgPicture.asset(IconsManager.crown),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              height: 142,
                              width: 142,
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
                                        Color(0xff99B990), BlendMode.srcIn),
                                  ))),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              AppLocalizations.of(context)!.edit_Picture,
                              style: getBoldStyle(
                                  color: ColorManager.primaryGreen,
                                  fontSize: 15),
                            ),
                            CardMyAccount(
                                title: AppLocalizations.of(context)!
                                    .personal_Details,
                                details:
                                    AppLocalizations.of(context)!.name_number,
                                ontap: () {
                                  AppRouter.push(
                                      context, const PersonalDetailsScreen());
                                }),
                            CardMyAccount(
                                title: AppLocalizations.of(context)!
                                    .delivery_Addresses,
                                details: AppLocalizations.of(context)!
                                    .edit_Addresses,
                                ontap: () {
                                  AppRouter.push(
                                      context, const LocationScreen());
                                }),
                            CardMyAccount(
                                title: AppLocalizations.of(context)!
                                    .electronic_Payment,
                                details: AppLocalizations.of(context)!
                                    .payment_Methods,
                                ontap: () {
                                  AppRouter.push(
                                      context, const ElectronicPaymentScreen());
                                }),
                            CardMyAccount(
                                title: AppLocalizations.of(context)!
                                    .rewards_Program,
                                details: AppLocalizations.of(context)!
                                    .redeem_Points_for_Discounts,
                                ontap: () {
                                  AppRouter.push(
                                      context,
                                      RewardsProgramScreen(
                                        scaffoldKey: scaffoldKey,
                                      ));
                                }),
                            CardMyAccount(
                                title: AppLocalizations.of(context)!.my_Reviews,
                                details:
                                    AppLocalizations.of(context)!.all_Reviews,
                                ontap: () {
                                  AppRouter.push(
                                      context, const MyEvaluationScreen());
                                }),
                            CardMyAccount(
                                title:
                                    AppLocalizations.of(context)!.about_the_App,
                                details:
                                    AppLocalizations.of(context)!.about_the_App,
                                ontap: () {
                                  AppRouter.push(
                                      context, const AboutTheAppcreen());
                                }),
                            CardMyAccount(
                                title: AppLocalizations.of(context)!
                                    .delete_account,
                                details: AppLocalizations.of(context)!
                                    .delete_account,
                                ontap: () {
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
        ),
      ),
    );
  }
}
