import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CardNotification extends StatelessWidget {
  const CardNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [ColorManager.shadowGaryDown]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            Text("تم إضافة 10 نقاط إلى رصيد نقاطك في فارمي,شكرا للتسوق معنا.",
              style: getBoldStyle(color: ColorManager.grayForMessage,fontSize: 14),
              textAlign: TextAlign.end,),
            Row(

              children: [
                Text("05:30 pm 11/11/2023",style: getLightStyle(color:ColorManager.grayForMessage ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
