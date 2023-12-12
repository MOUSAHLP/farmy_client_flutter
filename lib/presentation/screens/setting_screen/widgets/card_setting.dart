import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CardSetting extends StatelessWidget {
  const CardSetting({super.key,required this.title,required this.onTap});
final String title;
  final Function ()onTap;

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: onTap,
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [ColorManager.shadowGaryDown]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: getBoldStyle(color: Colors.black,fontSize: 14),),
              const Icon(Icons.arrow_forward_ios,
                size: 20,
                color: ColorManager.grayForMessage,),

            ],
          ),
        ),
      ),
    )
    ;
  }
}
