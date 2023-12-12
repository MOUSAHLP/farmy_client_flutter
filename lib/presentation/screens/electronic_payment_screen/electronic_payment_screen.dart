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
                    Text("أساليب الدفع الالكترونية المتوفرة",style: getBoldStyle(color: ColorManager.grayForMessage,fontSize: 13),),
                  ],
                ),
                CardMyAccount(title: "الدفع عبر البنوك (قريبا)", details: "البنوك المتاح استخدامها", ontap: (){}),
                CardMyAccount(title:"شركات الدفع الالكتروني (قريبا)", details: "الشركات المتاح استخدامها", ontap: (){}),
                CardMyAccount(title: "محفظة فارمي (قريبا)", details: "محفظة الكترونية خاصة بفارمي", ontap: (){}),


              ],),
            )

          ],
        ),
      ),
    );
  }
}
