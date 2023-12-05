import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

import '../../../translations.dart';
import '../../widgets/custom_app_bar_screen.dart';
import '../../widgets/custom_button.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
      child: Column(
        children: [
          CustomAppBarScreen(
              sectionName: AppLocalizations.of(context)!.track_Order),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 19,horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context)!.delivery_time,style: getBoldStyle(color: ColorManager.grayForMessage, fontSize: 14),),
                        Expanded(child: FittedBox(child: Text("15 إلى 20دقيقة",style: getRegularStyle(color: ColorManager.grayForMessage, fontSize: 14),maxLines: 4,overflow: TextOverflow.ellipsis,))),
                      ],
                    ),
                  ),
                  Container(decoration: BoxDecoration(
                    color: ColorManager.primaryGreen
                        ,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  height: 100,
                  width: 100,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(AppLocalizations.of(context)!.your_order_has_received,style: getBoldStyle(color: ColorManager.primaryGreen, fontSize: 17),),
                  ),
                  Container(decoration: BoxDecoration(
                      color: ColorManager.grayForMessage
                      ,
                      borderRadius: BorderRadius.circular(50)
                  ),
                    height: 100,
                    width: 100,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(AppLocalizations.of(context)!.your_order_is_being_processed,style: getBoldStyle(color: ColorManager.grayForMessage, fontSize: 17),),
                  ),
                  Container(decoration: BoxDecoration(
                      color: ColorManager.grayForMessage
                      ,
                      borderRadius: BorderRadius.circular(50)
                  ),
                    height: 100,
                    width: 100,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(AppLocalizations.of(context)!.your_order_is_out_for_delivery,style: getBoldStyle(color: ColorManager.grayForMessage, fontSize: 17),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 72,vertical: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomButton(label: AppLocalizations.of(context)!.track_your_order_on_the_map,onTap: (){

                          }),
                          const SizedBox(height: 16,),
                          CustomButton(label: AppLocalizations.of(context)!.contact_delivery_driver,isFilled: true,borderColor: ColorManager.primaryGreen,fillColor: Colors.white,labelColor: ColorManager.primaryGreen),
                        ],
                      ),
                    ),
                  ),
                   const SizedBox(height: 10,)

                ],
              ),
            ),
          )
        ],

      ),
    ),);
  }
}
