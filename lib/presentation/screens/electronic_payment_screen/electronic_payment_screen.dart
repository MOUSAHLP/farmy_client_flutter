import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/my_account_screen/widgets/card_my_account.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/translations.dart';

class ElectronicPaymentScreen extends StatelessWidget {
  const ElectronicPaymentScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.electronic_Payment),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.available_Electronic_Payment_Methods,style: getBoldStyle(color: ColorManager.grayForMessage,fontSize: 13),),
                  ],
                ),
                CardMyAccount(title:AppLocalizations.of(context)!.payment_via_Banks , details: AppLocalizations.of(context)!.available_Banks_for_Use, onTap: (){}),
                CardMyAccount(title:AppLocalizations.of(context)!.electronic_Payment_Companies, details: AppLocalizations.of(context)!.available_for_use_companies, onTap: (){}),
                CardMyAccount(title:AppLocalizations.of(context)!.farmy_Portfolio, details: AppLocalizations.of(context)!.farmy_electronic_portfolio, onTap: (){}),


              ],),
            )

          ],
        ),
      ),
    );
  }
}
