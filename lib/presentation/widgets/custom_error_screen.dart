

import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';

class CustomErrorScreen extends StatelessWidget {
  final Function()? onTap;
final  String? titleError;
  const CustomErrorScreen({super.key, required this.onTap,this.titleError});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(ImageManager.logoAboutApp,color: ColorManager.lightGray,height: 170,width: 170,fit: BoxFit.contain),
         const Padding(
           padding: EdgeInsets.only(top: 25),
           child: Icon(Icons.error_sharp,color: Colors.yellow,size: 60,),
         )
          ],
        ),
          const SizedBox(height: 100),
          Text(titleError??"لا يوجد اتصال الرجاء\n التحقق من إعدادات الانترنت لديك",style: getBoldStyle(color: ColorManager.grayForMessage,fontSize: 17),textAlign: TextAlign.center),
          const SizedBox(height: 100),
          CustomButton(label: AppLocalizations.of(context)!.try_load,onTap: (){
            onTap!();
          },)
        ],
      ),
    );
  }
}
