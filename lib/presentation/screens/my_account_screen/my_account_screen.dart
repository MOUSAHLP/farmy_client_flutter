import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/my_account_screen/widgets/card_my_account.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/translations.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "مرحبا قمر",
                          style: getBoldStyle(
                              color: ColorManager.primaryGreen, fontSize: 15),
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
                          color: ColorManager.primaryGreen, fontSize: 15),
                    ),
                    CardMyAccount(title: AppLocalizations.of(context)!.personal_Details, details: AppLocalizations.of(context)!.name_number, ontap: (){}),
                    CardMyAccount(title: AppLocalizations.of(context)!.delivery_Addresses, details: AppLocalizations.of(context)!.edit_Addresses, ontap: (){}),
                    CardMyAccount(title: AppLocalizations.of(context)!.electronic_Payment, details: AppLocalizations.of(context)!.payment_Methods, ontap: (){}),
                    CardMyAccount(title: AppLocalizations.of(context)!.rewards_Program, details: AppLocalizations.of(context)!.redeem_Points_for_Discounts, ontap: (){}),
                    CardMyAccount(title: AppLocalizations.of(context)!.my_Reviews, details: AppLocalizations.of(context)!.all_Reviews, ontap: (){}),

                  ],
                ),
              ),
            ),
            CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.my_Account),
          ],
        ),
      ),
    );
  }
}
